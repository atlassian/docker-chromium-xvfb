# Copied and modified from ../js/Dockerfile-8.x
FROM clyphub/js-env:chromium

WORKDIR /usr/src/app
ENV NODE_VERSION=8.10.0-1

# build-essential and git are required to build some of our module dependencies
RUN apt-get install -y \
	build-essential \
	git \
	gpg \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs=${NODE_VERSION}nodesource1 gpg \
    && rm -rf /var/lib/apt/lists
