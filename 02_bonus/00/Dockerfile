FROM debian

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install sudo -y && \
	apt-get install curl -y && \
	apt-get install gnupg -y && \
	apt-get install wget && \
	curl -sL https://deb.nodesource.com/setup_6.x | bash && \
	sudo apt-get install nodejs -y && \
	wget https://npmjs.org/install.sh | sh && \
	apt-get install git -y && \
	apt-get install vim -y && \
	apt-get install build-essential -y && \
	apt-get install mongodb -y

RUN cd /home && git clone https://github.com/viko42/matcha
RUN cd /home/matcha/app && npm i
RUN cd /home/matcha/api && npm i

EXPOSE 27017
EXPOSE 80
EXPOSE 3000
