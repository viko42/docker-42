FROM debian


RUN apt-get update && apt-get upgrade \
	&& apt-get install -y wget \
	&& apt-get install -y procps \
	&& apt-get install -y sysvinit-utils \
	&& useradd serveur \
	&& su serveur \ 
	&& cd /home/serveur \
	&& wget http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz \
	&& tar -zxvf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz \
	&& rm teamspeak3-server_linux-amd64-3.0.11.2.tar.gz \
	&& cd teamspeak3-server_linux-amd64i 

ENTRYPOINT ["/home/serveur/home/serveur/teamspeak3-server_linux-amd64/ts3server_startscript.sh"]
CMD ["start"]


# Expose the Standard TS3 port, for files, for serverquery
EXPOSE 9987/udp 30033 10011
