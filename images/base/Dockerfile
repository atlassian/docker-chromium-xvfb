FROM debian:stable

RUN apt-get update && apt-get install -y curl xvfb chromium
COPY pin_nodesource /etc/apt/preferences.d/nodesource

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser
