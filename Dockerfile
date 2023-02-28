FROM jenkins/jenkins:alpine

USER root

# Install the latest Docker and docker-compose binaries
RUN apk --update-cache --no-cache \
	--allow-untrusted add \
    docker docker-compose
