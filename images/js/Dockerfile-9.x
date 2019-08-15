FROM markadams/chromium-xvfb

WORKDIR /usr/src/app

RUN apt-get install -y gpg \
    && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get install -y nodejs gpg \
    && rm -rf /var/lib/apt/lists

CMD npm test
