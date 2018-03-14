FROM markadams/chromium-xvfb

WORKDIR /usr/src/app
ENV NODE_VERSION=9.8.0-1

RUN apt-get install -y gpg \
    && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get install -y nodejs=${NODE_VERSION}nodesource1 gpg \
    && rm -rf /var/lib/apt/lists

CMD npm test

ONBUILD COPY package.json /usr/src/app/package.json
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app
