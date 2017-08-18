FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y \
    python3 python3-pip curl unzip libgconf-2-4

RUN pip3 install pytest selenium

ENV CHROMEDRIVER_VERSION 2.29
ENV CHROMEDRIVER_SHA256 bb2cf08f2c213f061d6fbca9658fc44a367c1ba7e40b3ee1e3ae437be0f901c2

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && echo "$CHROMEDRIVER_SHA256  chromedriver_linux64.zip" | sha256sum -c - \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

WORKDIR /usr/src/app

CMD py.test

ONBUILD COPY requirements.txt /usr/src/app/requirements.txt
ONBUILD RUN pip3 install -r requirements.txt
ONBUILD COPY . /usr/src/app
