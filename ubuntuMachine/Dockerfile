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
	vim \
 && rm -rf /var/lib/apt/lists/*


# add a whatever volume 
VOLUME ["qt5pi_builder"]
# WORKDIR used to change the working directory
WORKDIR /tmp/qt5pi_builder

ENV name velo  
RUN ls -lah

CMD ["/bin/sh", "-c", "echo Hello, $name"]


