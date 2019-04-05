FROM jenkins/jenkins:alpine

USER root

# Update apk repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install the latest Docker and docker-compose binaries
RUN apk -U --no-cache \
	--allow-untrusted add \
    gcc \
    docker \
    py-pip python-dev libffi-dev openssl-dev libc-dev make \
    && pip install docker-compose \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk
