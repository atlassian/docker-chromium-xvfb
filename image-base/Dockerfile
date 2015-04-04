FROM debian:jessie

RUN apt-get update && apt-get -y install xvfb chromium

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome

WORKDIR /app
