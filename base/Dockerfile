FROM ubuntu:bionic
LABEL maintainer "rich rose"

ENV DEBIAN_FRONTEND noninteractive

# Install Unity
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        libcanberra-gtk* \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        libpango1.0-0 \
        libdbus-glib-1-dev \
        libnss3-dev \
        libpulse0 \
        fuse \
        libfuse2 \
        libv4l-0 \
        --no-install-recommends \
#       && apt-get purge --auto-remove -y curl \
        && apt-get purge --auto-remove -y \
        && rm -rf /var/lib/apt/lists/*

# Install XPRA - (Debian)stretch/(Ubuntu)bionic
RUN curl https://winswitch.org/gpg.asc | apt-key add - && \
  echo "deb http://winswitch.org/ bionic main" > /etc/apt/sources.list.d/xpra.list && \
  apt-get update && \
  apt-get install -y xpra xvfb xterm python3-cairo python-pyinotify && \
  apt-get clean && \ 
  rm -rf /var/lib/apt/lists/*
