FROM jenkins/jenkins:alpine

USER root

# Update apk repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install the latest Docker and docker-compose binaries
RUN apk --update-cache --no-cache \
	--allow-untrusted add \
    docker \
    py3-pip py3-docopt py3-yaml py3-texttable py3-websocket-client py3-distro py3-dockerpty py3-jsonschema py3-dotenv py3-paramiko \
    && pip install docker-compose
