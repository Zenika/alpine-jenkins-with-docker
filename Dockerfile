FROM jenkins/jenkins:alpine

USER root

# Install the latest Docker CE binaries
RUN apk update \
	&& apk add docker \
	&& apk add py-pip \
	&& pip install docker-compose
