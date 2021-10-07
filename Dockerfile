#
# lightning-terminal Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV LT_VERSION v0.5.2-alpha

# Update & install packages for go-callisto dep
RUN apt-get update && \
    apt-get install -y wget

WORKDIR /opt/lt

# Get lnd from github
RUN wget https://github.com/lightninglabs/lightning-terminal/releases/download/${LT_VERSION}/lightning-terminal-linux-amd64-${LT_VERSION}.tar.gz && \
    tar --strip-components=1 -xf lightning-terminal-linux-amd64-${LT_VERSION}.tar.gz && \
    rm lightning-terminal-linux-amd64-${LT_VERSION}.tar.gz

CMD ./litd $OPTIONS
