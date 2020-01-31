FROM gcr.io/qwiklabs-resources/unity_base:0.1
LABEL maintainer Rich Rose

#ENV DEBIAN_FRONTEND noninteractive

# Update the packages
#RUN apt-get update && apt-get install -y xfce4 desktop-file-utils

# Setup user account
#ENV HOME /home/user
#RUN useradd --create-home --home-dir $HOME user \
#        && chown -R user:user $HOME

# Unity Download: https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage?_ga=2.219337498.2051047535.1570640419-436581294.1559930891

# Set Environment variable 
#ENV UNITY UnityHub.AppImage

# Ensure the App has execute permissions before copying to the image
#COPY $UNITY /usr/local/bin
COPY unity.sh /usr/local/bin/unity.sh

RUN chmod +x /usr/local/bin/unity.sh
#RUN chmod +x /usr/local/bin/$UNITY 

#RUN chown -R user:user $HOME

# Run "user" as non privileged user
#USER user

#WORKDIR $HOME

# Licence location - https://forum.unity.com/threads/unity-hub-wont-open-license-machine-id-error.659962/ #32
# Create this directory to make the licence activation button work
#RUN mkdir -p $HOME/.local/share/unity3d/Unity 

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
