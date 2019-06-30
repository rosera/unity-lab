# Run Unity in a container
#docker run -d \
#  -p 0:80 \
#  -rm \
#  -v /tmp/.X11-unix:/tmp/.X11-unix \
#  -e DISPLAY=$DISPLAY \
#  -v $HOME/Downloads:/home/chrome/Downloads \
#  --device /dev/snd \
#  --cap-add SYS_ADMIN \
#  --device /dev/fuse \
#  -v /dev/shm:/dev/shm \
#  --name unity \
#  rosera/unity:1.0

# Base docker image
FROM debian:buster
LABEL maintainer "rich rose"

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
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y desktop-file-utils

# Setup user account
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
        && chown -R user:user $HOME

# Ensure the App has execute permissions before copying to the image
COPY UnityHubSetup.AppImage /usr/local/bin

# Run "user" as non privileged user
USER user

WORKDIR $HOME

# Autorun UnityHubSetup
ENTRYPOINT [ "UnityHubSetup.AppImage" ]
