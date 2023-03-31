FROM ubuntu:20.04

COPY . .

ENV	TZ=Asia/Pakistan
RUN	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN	apt-get update &&\
	apt-get install -y tzdata &&\
	apt-get install -y curl git &&\
	apt-get install -y gcc g++ make &&\
	curl -sL https://deb.nodesource.com/setup_14.x | bash - &&\
	cat /etc/apt/sources.list.d/nodesource.list &&\
	apt-get update &&\
	apt install -y nodejs
RUN	cd dropbox_clone/ && npm install
