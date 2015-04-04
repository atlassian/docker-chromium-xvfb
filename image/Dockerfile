FROM debian:jessie

RUN apt-get update && apt-get -y install nodejs-legacy npm xvfb chromium

ENV CHROME_BIN=/usr/bin/xvfb-chromium
ADD xvfb-chromium /usr/bin/xvfb-chromium

WORKDIR /app

ONBUILD ADD . /app
ONBUILD RUN npm install

CMD npm test
