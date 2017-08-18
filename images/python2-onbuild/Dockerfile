FROM markadams/chromium-xvfb

RUN apt-get update && apt-get install -y \
    python python-pip curl unzip libgconf-2-4

RUN pip install pytest selenium

ENV CHROMEDRIVER_VERSION 2.31
ENV CHROMEDRIVER_SHA256 3E372EF676BEB3A03ABA72089EC0624BB9D3B52597635F907D4C23390FB485A0

RUN curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" \
  && echo "$CHROMEDRIVER_SHA256  chromedriver_linux64.zip" | sha256sum -c - \
  && unzip "chromedriver_linux64.zip" -d /usr/local/bin \
  && rm "chromedriver_linux64.zip"

WORKDIR /usr/src/app

CMD py.test

ONBUILD COPY requirements.txt /usr/src/app/requirements.txt
ONBUILD RUN pip install -r requirements.txt
ONBUILD COPY . /usr/src/app
