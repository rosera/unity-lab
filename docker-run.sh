docker run -d \
  -p 0:80 \
  --rm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=$DISPLAY \
  -v $HOME/Downloads:/home/chrome/Downloads \
  --device /dev/snd \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  -v /dev/shm:/dev/shm \
  --name unity \
  rosera/unity:1.0
