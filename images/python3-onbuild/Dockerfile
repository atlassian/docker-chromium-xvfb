FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y \
    python3 python3-pip curl unzip libgconf-2-4

RUN pip3 install pytest selenium

ENV CHROMEDRIVER_VERSION 2.28
ENV CHROMEDRIVER_SHA256 8f5b0ab727c326a2f7887f08e4f577cb4452a9e5783d1938728946a8557a37bc

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && echo "$CHROMEDRIVER_SHA256  chromedriver_linux64.zip" | sha256sum -c - \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

WORKDIR /usr/src/app

CMD py.test

ONBUILD COPY requirements.txt /usr/src/app/requirements.txt
ONBUILD RUN pip3 install -r requirements.txt
ONBUILD COPY . /usr/src/app
