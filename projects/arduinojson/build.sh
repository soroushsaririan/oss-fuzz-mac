#!/bin/bash -eu
# Build script for ArduinoJson fuzz targets.
#
# Buttercup mounts the challenge repo (ArduinoJson-mac) at $SRC/arduinojson,
# which matches the WORKDIR set in the Dockerfile.

# -fsanitize=function is not supported on aarch64 — strip it from all flag lists
if [[ "$(uname -m)" == "aarch64" ]]; then
    export CFLAGS="${CFLAGS//,function/}"
    export CXXFLAGS="${CXXFLAGS//,function/}"
fi

cd "$SRC/arduinojson/extras/fuzzing"
make all
