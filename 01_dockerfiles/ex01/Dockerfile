FROM debian

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget \
	#procps sysvinit-utils
	&& useradd serveur \
    && wget http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz \
    && tar -zxvf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz \
    && rm teamspeak3-server_linux-amd64-3.0.11.2.tar.gz \
    && cd teamspeak3-server_linux-amd64

CMD ["/teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh"]

# Expose the Standard TS3 port, for files, for serverquery
EXPOSE 9987/udp 30033 10011
