FROM alpine:edge

WORKDIR /usr/src/app

ENV TZ UTC

RUN chmod 777 /usr/src/app

RUN apk update && apk upgrade && \
    apk add --upgrade --no-cache \
    tzdata wget curl nodejs git alpine-sdk libffi libffi-dev python3 py3-pip \
    musl-locales py3-lxml npm py3-virtualenv zip bash unzip && \
    curl https://rclone.org/install.sh | bash

COPY . .

RUN chmod +x ./build.sh ./start.sh

RUN ./build.sh
