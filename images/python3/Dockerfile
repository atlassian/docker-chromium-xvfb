FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y \
    python3 python3-pip curl unzip libgconf-2-4

RUN pip3 install pytest selenium

ENV CHROMEDRIVER_VERSION 2.14

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

WORKDIR /app

ONBUILD COPY requirements.txt /app/requirements.txt
ONBUILD RUN pip3 install -r requirements.txt
ONBUILD COPY . /app

CMD py.test
