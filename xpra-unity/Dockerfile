FROM gcr.io/qwiklabs-resources/unity_base:0.1
LABEL maintainer Rich Rose

#ENV DEBIAN_FRONTEND noninteractive

# Install XPRA - (Debian)stretch/(Ubuntu)bionic
RUN curl https://winswitch.org/gpg.asc | apt-key add - && \
  echo "deb http://winswitch.org/ bionic main" > /etc/apt/sources.list.d/xpra.list && \
  apt-get update && \
  apt-get install -y xpra \
  xvfb \
  xterm \
  python3-cairo \
  python-pyinotify \
  xfce4 \
  desktop-file-utils && \
  apt-get clean && \ 
  rm -rf /var/lib/apt/lists/* 
  
# Ensure the App has execute permissions before copying to the image
COPY unity.sh /usr/local/bin/unity.sh

RUN chmod +x /usr/local/bin/unity.sh

# Should make this ARG value
EXPOSE 8082

# set XPRA environment variables
ENV DISPLAY :100 xterm
ENV XPRA_BANDWIDTH_DETECTION 0
ENV XPRA_FORCE_BATCH 1
ENV XPRA_ACK_TOLERANCE 1000
ENV XPRA_MESSAGEBOX 0

# Start the unity process - port 8082 
CMD xpra start --bind-tcp=0.0.0.0:8082 --html=on --exit-with-children --daemon=no --xvfb="/usr/bin/Xvfb +extension  Composite -screen 0 1920x1080x16+24 -nolisten tcp -noreset" --pulseaudio=no --notifications=no --bell=no --microphone=no --bandwidth-limit=10M --desktop-scaling=off --video-scaling=off --opengl=yes --dpi=96 --swap-keys=no --encoding=rgb --env "LC_ALL=en_US.UTF-8" --start-env="LC_ALL=en_US.UTF-8" --start-child=unity.sh
