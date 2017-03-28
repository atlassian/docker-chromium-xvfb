FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y \
    python python-pip curl unzip libgconf-2-4

RUN pip install pytest selenium

ENV CHROMEDRIVER_VERSION 2.28
ENV CHROMEDRIVER_HASH 8f5b0ab727c326a2f7887f08e4f577cb4452a9e5783d1938728946a8557a37bc

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \

  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

WORKDIR /usr/src/app

CMD py.test
