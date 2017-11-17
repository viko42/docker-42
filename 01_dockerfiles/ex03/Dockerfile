FROM debian

RUN /bin/bash -c "apt-get -y update && apt-get -y upgrade \
			 && apt-get install -y git sudo wget nginx \
			 && sudo adduser --disabled-login --gecos 'Gogs' git \
			 && sudo usermod -a -G sudo git \
			 && apt-get install -y mysql-server \
			 && /etc/init.d/mysql start"
RUN su git -c " mkdir /home/git/local \
			 && cd $_ \
			 && wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz \
			 && mkdir -p /home/git/local \
			 && tar -C /home/git/local -xvzf go1.7.linux-amd64.tar.gz \
			 && echo 'export GOROOT=/home/git/local/go' >> /home/git/.bashrc \
			 && echo 'export GOPATH=/home/git/go' >> /home/git/.bashrc \
			 && echo 'export PATH=$PATH:/home/git/local/go/bin:/home/git/go/bin' >> /home/git/.bashrc \
			 &&  source /home/git/.bashrc" \
			 && mkdir -p $GOPATH/src/github.com/gogits"
			 #&& cd $GOPATH/src/github.com/gogits \
			 #&& git clone --depth=1 -b develop https://github.com/gogits/gogs \
			 #&& cd gogs \
			 #&& echo "______________________________________________" \
			 #&& env \
			 #&& echo "______________________________________________" \
			 #&& go build "
			 #CREATE USER 'git'@'localhost' IDENTIFIED BY '1234';
			 #GRANT ALL PRIVILEGES ON *.* TO 'git'@'localhost' WITH GRANT OPTION;
			 #exit
			 #mysql -u git -p 1234
			 #CREATE DATABASE gogs;
EXPOSE 3000
EXPOSE 22
