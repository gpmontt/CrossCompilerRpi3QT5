# download the image from docker
FROM ubuntu:18.04

# Author / Maintainer
MAINTAINER Giovanni Perez

# Install usefull packages for project
#
COPY sources.list /etc/apt/ 

RUN apt update -q -yy && \
    apt upgrade -q -yy && \
    apt install -q -yy aptitude curl

RUN dpkg --add-architecture armhf

RUN apt-get install -q -yy --allow-downgrades \
	build-essential \
	wget \
	curl \
	gdb-multiarch \
	xz-utils \
	git \
	unzip \
	zip \
	multistrap \
	cmake \
	python \
	vim \
	pkg-config \
	libgles2-mesa-dev:armhf \
 && rm -rf /var/lib/apt/lists/*
# add a whatever volume 

COPY ["qt5pibuilder"]
RUN mkdir -p /opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf &&\
		mkdir -p /opt/qt5pibuilder	&& \
		mkdir -p /mnt/rasp-pi-root	
# WORKDIR used to change the working directory
WORKDIR /opt
 
ENV name velo  


