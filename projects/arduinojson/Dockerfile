FROM gcr.io/oss-fuzz-base/base-builder

# Copy the build script into the OSS-Fuzz source directory
COPY build.sh $SRC/

# Set WORKDIR so Buttercup mounts the challenge repo source here.
# The challenge repo (ArduinoJson-mac) will be mounted at /src/arduinojson.
WORKDIR /src/arduinojson
