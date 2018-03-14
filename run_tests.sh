#!/bin/bash
set -e

# This script builds all the Docker images and runs the samples

# Rebuild the base image
docker build --pull -t markadams/chromium-xvfb -f  images/base/Dockerfile images/base/

# Build Python 2 image
docker build -f images/python2-onbuild/Dockerfile -t markadams/chromium-xvfb-py2:latest-onbuild images/python2-onbuild
docker build -f samples/python2/Dockerfile -t markadams/chromium-xvfb-py2-sample samples/python2

# Build Python 3 image
docker build -f images/python3-onbuild/Dockerfile -t markadams/chromium-xvfb-py3:latest-onbuild images/python3-onbuild
docker build -f samples/python3/Dockerfile -t markadams/chromium-xvfb-py3-sample samples/python3

# Build JS images
docker build -f images/js/Dockerfile-8.x -t markadams/chromium-xvfb-js:8 images/js
docker build -f images/js-onbuild/Dockerfile-8.x -t markadams/chromium-xvfb-js:8-onbuild images/js-onbuild

docker build -f images/js/Dockerfile-9.x -t markadams/chromium-xvfb-js:9 images/js
docker build -f images/js-onbuild/Dockerfile-9.x -t markadams/chromium-xvfb-js:9-onbuild images/js-onbuild


docker build -f samples/js/Dockerfile -t markadams/chromium-xvfb-js-sample samples/js

# Run samples to test
docker run --rm markadams/chromium-xvfb-py2-sample
docker run --rm markadams/chromium-xvfb-py3-sample
docker run --rm markadams/chromium-xvfb-js-sample
