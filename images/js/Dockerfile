FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs && npm install -g npm@latest

WORKDIR /usr/src/app

CMD npm test
