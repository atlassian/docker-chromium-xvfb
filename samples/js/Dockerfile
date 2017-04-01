FROM markadams/chromium-xvfb-js:7

COPY package.json /usr/src/app/package.json
COPY npm-shrinkwrap.json /usr/src/app/npm-shrinkwrap.json
RUN npm install
COPY . /usr/src/app
