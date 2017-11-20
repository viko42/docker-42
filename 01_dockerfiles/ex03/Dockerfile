FROM debian

RUN 		apt-get -y update && apt-get -y upgrade \
			&& apt-get install -y git sudo wget nginx mysql-server \
			&& useradd git \
			&& passwd -d git ; echo "root:root" | chpasswd \
			&& usermod -a -G sudo git \
			&& mkdir -p /home/git/local \
			&& cd $_ \
			&& wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz \
			&& mkdir -p /home/git/local \
			&& tar -C /home/git/local -xvzf go1.7.linux-amd64.tar.gz \
			&& mkdir -p /home/git/go/src/github.com/gogits \
			&& chmod 777 /home/git/go/src/github.com/gogits \
			&& export GOROOT=/home/git/local/go \
			&& export GOPATH=/home/git/go \
			&& export PATH=$PATH:/home/git/local/go/bin:/home/git/go/bin \
			&& cd /home/git/go/src/github.com/gogits \
			&& git clone --depth=1 -b develop https://github.com/gogits/gogs \
			&& cd gogs \
			&& go build \
			&& /etc/init.d/mysql start \
			&& echo 'CREATE USER "git"@"localhost" IDENTIFIED BY "1234";' > sql \
 			&& echo 'GRANT ALL PRIVILEGES ON *.* TO "git"@"localhost" WITH GRANT OPTION;' >> sql \
 			&& echo 'CREATE DATABASE IF NOT EXISTS gogs;' >> sql \
 			&& echo 'exit' >> sql \
			&& mysql mysql < sql \
			&& mkdir -p /home/git/go/src/github.com/gogits/gogs/custom/conf \
			&& echo 'APP_NAME = Gogs\n \
RUN_USER = root\n \
RUN_MODE = prod\n \
[database]\n \
DB_TYPE  = mysql\n \
HOST     = 127.0.0.1:3306\n \
NAME     = gogs\n \
USER     = git\n \
PASSWD   = 1234\n \
SSL_MODE = disable\n \
PATH     = data/gogs.db\n \
[repository]\n \
ROOT = /home/git/gogs-repositories\n \
[server]\n \
DOMAIN           = 192.168.99.100\n \
HTTP_PORT        = 3000\n \
ROOT_URL         = http://192.168.99.100:3000/\n \
DISABLE_SSH      = false\n \
SSH_PORT         = 22\n \
START_SSH_SERVER = true\n \
OFFLINE_MODE     = false\n \
SSH_LISTEN_PORT  = 22\n \
[mailer]\n \
ENABLED = false\n \
[service]\n \
REGISTER_EMAIL_CONFIRM = false\n \
ENABLE_NOTIFY_MAIL     = false\n \
DISABLE_REGISTRATION   = false\n \
ENABLE_CAPTCHA         = true\n \
REQUIRE_SIGNIN_VIEW    = false\n \
[picture]\n \
DISABLE_GRAVATAR        = false\n \
ENABLE_FEDERATED_AVATAR = true\n \
[session]\n \
PROVIDER = file\n \
[log]\n \
MODE      = file\n \
LEVEL     = Info\n \
ROOT_PATH = /home/git/go/src/github.com/gogits/gogs/log\n \
[security]\n \
INSTALL_LOCK = true\n \
SECRET_KEY = Hp4IzpEkB2Cemp0\n' > "/home/git/go/src/github.com/gogits/gogs/custom/conf/app.ini"

WORKDIR /home/git/go/src/github.com/gogits/gogs/

RUN		echo "service mysql start ; sudo ./gogs web" > launch.sh \
		&& chmod 777 launch.sh

ENTRYPOINT ["/bin/bash", "launch.sh"]
CMD ["bash"]

EXPOSE 3000
EXPOSE 22

#to run --> docker run -it --rm --name [youcontainername] -p 3000:3000 -p 2222:22 [image]
#to ssh --> git git clone ssh://root@192.168.99.100:2222/[user]/[repo].git
