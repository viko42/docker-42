FROM debian

RUN  apt-get update && apt-get upgrade -y \
		&& apt-get install -y curl sudo build-essential git \
		&& curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
		&& apt-get install -y nodejs \
		&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
		&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
		&& apt-get update && apt-get install -y yarn \
		&& cd /home/ \
		&& yarn init -y ; yarn add react ; yarn add express \
		&& git clone https://github.com/christiannwamba/scotch-react-todo.git

ENTRYPOINT ["node", "/home/scotch-react-todo/index.js"]

EXPOSE 3000
