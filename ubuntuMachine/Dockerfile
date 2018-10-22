# download the image from docker
FROM ubuntu:18.04

# Author / Maintainer
MAINTAINER Giovanni Perez

# Install usefull packages for project
RUN apt-get update && apt-get install -y \
	build-essential \
	wget \
	git \
	cmake \
	python \
	vim

# add a whatever volume 
#VOLUME ["/opt"]
WORKDIR /opt/qt5pi_builder

ENV name John Dow
ENTRYPOINT ["/bin/bash", "-c", "echo Hello, $name"]
RUN ls -lah


