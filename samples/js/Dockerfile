FROM markadams/chromium-xvfb-js:7

COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm install
COPY . /usr/src/app
