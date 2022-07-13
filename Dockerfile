FROM ubuntu:latest

WORKDIR /usr/src/app

ENV TZ UTC

RUN chmod 777 /usr/src/app

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata curl git python3 python3-pip \
    locales python3-lxml python3-venv unzip && curl https://rclone.org/install.sh | bash

RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get -y install nodejs

COPY . .

RUN chmod +x ./build.sh ./start.sh

RUN ./build.sh
