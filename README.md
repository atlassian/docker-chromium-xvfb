# Chromium in Docker via Xvfb

This Docker image provides a way to run a real Chromium / Chrome browser
headless inside of a Docker container. Use cases include:

* Running Karma tests inside a container during development or during CI builds
* Running Python Selenium tests from inside of a Docker container during CI builds
* Pretty much anything else where you'd want to use a real Chrome browser within a Docker container

## Images

* [markadams/chromium-xvfb](https://registry.hub.docker.com/u/markadams/chromium-xvfb/)
  Base Docker image (Installs Debian, Chromium, Xvfb)
* [markadams/chromium-xvfb-js](https://registry.hub.docker.com/u/markadams/chromium-xvfb-js/)
  Designed for running headless JS tests in Chromium (includes iojs (node) and npm)
  This image automatically runs `npm install` and `npm test`
* [markadams/chromium-xvfb-py2](https://registry.hub.docker.com/u/markadams/chromium-xvfb-py2/)
  Designed for running headless Selenium tests in Chromium (Python 2)
  This image automatically runs `pip install -r requirements.txt`
* [markadams/chromium-xvfb-py3](https://registry.hub.docker.com/u/markadams/chromium-xvfb-py3/)
  Designed for running headless Selenium tests in Chromium (Python 3)
  This image automatically runs `pip3 install -r requirements.txt`

## Methodology
The key to this project and to getting Chromium / Google Chrome to work inside
of a container is the wrapper script, [xvfb-chromium](images/image-base/xvfb-chromium).

The wrapper script does a number of things:
1. Launches the X virtual frame buffer (Xvfb) which emulates an X11 display so
that the GUI code in the browser has a display to interact with.
2. Launches Chromium / Google Chrome and passes along any command line arguments
to the browser process.
3. Traps SIGTERM and relays the signal to the browser and Xvfb so that they will
not continue to run once the test runner is finished. This is mostly required to deal
with Karma's insistence that the browser process be terminated before it can exit.
Without this relaying, Karma would hang indefinitely.

## Directories

* `/images` - Contains the sources for all of the chromium-xvfb-* images
* `/samples` - This image contains an example of running tests for JS / Karma
  and Selenium with Python 2 and 3.

## Running the sample applications

1. `cd` into any of the projects in /samples
2. `docker build -t sample .`
3. `docker run sample`

The sample application will run the example test and output
its results to the console as well as a xunit-format XML file
in the test-results/ directory inside of the container.
