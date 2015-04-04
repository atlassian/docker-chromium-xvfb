# Chromium in Docker via Xvfb

This Docker image provides a way to run a real Chromium / Chrome browser
headless inside of a Docker container. Use cases include:

* Running JS tests from inside a Docker container (during a CI build, etc)
* Running Selenium tests from inside of a Docker container

## Images

* [markadams/chromium-xvfb](https://registry.hub.docker.com/u/markadams/chromium-xvfb/)
  Base Docker image (Installs Debian, Chromium, Xvfb)
* [markadams/chromium-xvfb-js](https://registry.hub.docker.com/u/markadams/chromium-xvfb-js/)
  Designed for running headless JS tests in Chromium (includes node and npm)
  This image automatically runs `npm install` and `npm test`

## Directories

* `/image-base` - The base image used to build markadams/chromium-xvfb
* `/image-js` - The base image used to build markadams/chromium-xvfb-js. This
image is focused on running automated JS tests (Karma, etc.) using `npm test`.
* `/sample-app` - This image contains an example of running tests for a JS
project using the markadams/chromium-xvfb-js image.

## Running the sample application

1. `cd sample-app`
2. `docker build -t sample .`
3. `docker run sample`

The sample application will run the example test and output
its results to the console as well as a xunit-format XML file
in the test-results/ directory inside of the container.
