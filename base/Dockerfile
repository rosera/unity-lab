FROM ubuntu:bionic

LABEL MAINTAINER Rich Rose

# Create Environment variables
ENV UNITY UnityHub.AppImage
#ENV LOCAL_DISPLAY :1
ENV LOCAL_VNC_PORT 5901
ENV LOCAL_NO_VNC_PORT 6901
ENV LOCAL_USER developer

ENV HOME /home/$LOCAL_USER

#ENV DISPLAY=$LOCAL_DISPLAY \
ENV VNC_PORT=$LOCAL_VNC_PORT \
    NO_VNC_PORT=$LOCAL_NO_VNC_PORT

ENV DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false

# Install Packages
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        desktop-file-utils \
        fuse \
        gnupg \
        kdialog \
        libcanberra-gtk* \
        libdbus-glib-1-dev \
        libfuse2 \
#        libgl1-mesa-dri \
#        libgl1-mesa-glx \
        libnss3-dev \
        libpango1.0-0 \
        libpulse0 \
        libv4l-0 \
        xdg-utils \
        xfce4 \
        xvfb \
        zenity \
        --no-install-recommends \
        && apt-get purge --auto-remove -y \
        && rm -rf /var/lib/apt/lists/*

# Move the application to the bin directory
COPY $UNITY /usr/local/bin
RUN chmod +x /usr/local/bin/$UNITY

RUN groupadd -r $LOCAL_USER && useradd -r -g $LOCAL_USER -G audio,video $LOCAL_U
SER \
    && mkdir -p /home/$LOCAL_USER/Downloads \
    && chown -R $LOCAL_USER:$LOCAL_USER /home/$LOCAL_USER

# Default to the user directory
WORKDIR /$HOME

# EXPOSE PORTS
#EXPOSE $VNC_PORT $NO_VNC_PORT

# Set the default USER
USER $LOCAL_USER

# Licence location - https://forum.unity.com/threads/unity-hub-wont-open-license
-machine-id-error.659962/ #32
# Create this directory to make the licence activation button work
RUN mkdir -p /home/$LOCAL_USER/.local/share/unity3d/Unity

# RUN Unity
ENTRYPOINT [ "/usr/local/bin/UnityHub.AppImage" ]
