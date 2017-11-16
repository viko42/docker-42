FROM debian

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y git sudo wget nginx

RUN sudo adduser --disabled-login --gecos 'Gogs' git
RUN sudo su - git
RUN mkdir $HOME/local
RUN cd $_

RUN wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
RUN mkdir -p /home/git/local
RUN tar -C /home/git/local -xvzf go1.7.linux-amd64.tar.gz

RUN echo 'export GOROOT=$HOME/local/go' >> $HOME/.bashrc
RUN echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
RUN echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
RUN /bin/bash -c "source $HOME/.bashrc"

EXPOSE 3000
EXPOSE 22
