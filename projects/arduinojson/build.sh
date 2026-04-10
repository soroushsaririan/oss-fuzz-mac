#!/bin/bash -eu
# Build script for ArduinoJson fuzz targets.
#
# Buttercup mounts the challenge repo (ArduinoJson-mac) at $SRC/arduinojson,
# which matches the WORKDIR set in the Dockerfile.
#
# The existing extras/fuzzing/Makefile is already OSS-Fuzz compatible:
#   - Uses $OUT for output binaries
#   - Uses $CXX / $CXXFLAGS for compilation
#   - Uses $LIB_FUZZING_ENGINE for linking
#   - Packages seed corpora as .zip files
#   - Writes .options files

cd "$SRC/arduinojson/extras/fuzzing"
make all
