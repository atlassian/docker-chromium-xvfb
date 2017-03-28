FROM markadams/chromium-xvfb

WORKDIR /usr/src/app
ENV NODE_VERSION=7.7.4

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs=${NODE_VERSION}-1nodesource1~jessie1 \
    && rm -rf /var/lib/apt/lists

CMD npm test

ONBUILD COPY package.json /usr/src/app/package.json
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app
