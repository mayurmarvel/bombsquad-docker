FROM ubuntu:22.04

LABEL maintainer="https://github.com/mayurmarvel"

ARG BOMBSQUAD_VERSION="1.7.37"

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Add deadsnakes PPA for Python 3.12 and install packages
RUN apt-get -y update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get -y update && \
    apt-get install -y wget python3.12 libpython3.12 locales libsdl2-2.0-0 && \
    rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

WORKDIR /app

ENV TAR_FILE=BombSquad_Server_Linux_x86_64_${BOMBSQUAD_VERSION}

RUN wget https://files.ballistica.net/bombsquad/builds/$TAR_FILE.tar.gz -O bombsquad.tar.gz && \
    tar -xzf bombsquad.tar.gz --strip-components 1 && \
    rm -f config.yaml # removing default config file in order to put ourselves

COPY config.yaml .

EXPOSE 43210/udp

CMD ["/app/bombsquad_server"]