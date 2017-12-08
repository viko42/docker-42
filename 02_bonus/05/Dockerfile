FROM debian

RUN			apt-get update && apt-get upgrade -y \
		&&  apt-get -y install build-essential git \
		&& git clone https://github.com/dsebban42/shell-docker.git \
		&& cd shell-docker \
		&& make

WORKDIR ./shell-docker

CMD ["./minishell"]
