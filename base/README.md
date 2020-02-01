# Unity Docker

Ubuntu:18.04 base build 

## Author: 
Rich Rose

## Base Image: 

The base image uses ubuntu:18.04

## Docker Local Build - Dockerfile manifest

docker build -t unity_base:[v.v] .

## Docker Run 


docker run -d --net=host -e DISPLAY=$DISPLAY --cap-add SYS_ADMIN  --device /dev/fuse --security-opt apparmor:unconfined [project]/unityhub:0.1


* NOTE: On Chromebook - will need to do xhost local:root+ (to undo xhost local:root-)

## Google Cloud Build
gcloud builds submit --config cloudbuild.yaml .



