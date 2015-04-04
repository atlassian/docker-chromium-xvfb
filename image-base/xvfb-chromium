#!/bin/bash

_kill_procs() {
  kill -TERM $chromium
  wait $chromium
  kill -TERM $xvfb
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

# Start Xvfb
Xvfb :99 -screen 0 640x480x8 -nolisten tcp &
xvfb=$!

export DISPLAY=:99

chromium --no-sandbox $@ &
chromium=$!

wait $chromium
wait $xvfb
