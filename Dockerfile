FROM alpine:edge

WORKDIR /usr/src/app

ENV TZ UTC

RUN chmod 777 /usr/src/app

RUN apk update && apk upgrade && \
    apk add --upgrade --no-cache \
    tzdata wget curl nodejs git alpine-sdk python3 py3-pip \
    musl-locales py3-lxml npm py3-virtualenv zip unzip && \
    curl https://rclone.org/install.sh | bash

RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get -y install nodejs

COPY . .

RUN chmod +x ./build.sh ./start.sh

RUN ./build.sh
