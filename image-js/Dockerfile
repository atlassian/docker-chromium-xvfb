FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install nodejs-legacy npm

ONBUILD ADD . /app
ONBUILD RUN npm install

CMD npm install && npm test
