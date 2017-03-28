FROM markadams/chromium-xvfb

WORKDIR /usr/src/app
ENV NODE_VERSION=6.10.1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs=${NODE_VERSION}-1nodesource1~jessie1 \
    && rm -rf /var/lib/apt/lists

CMD npm test
