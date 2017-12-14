FROM jenkins/jenkins:alpine

USER root

# Update apk repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install the latest Docker CE binaries
RUN apk -U --no-cache \
	--allow-untrusted add \
    docker \
    py-pip \
    && pip install docker-compose

# Minimize size
RUN rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*
