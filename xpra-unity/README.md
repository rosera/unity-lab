# Unity Docker

This build will create (XPRA)[https://xpra.org] wrapper for Unity

## Author: 
Rich Rose


## Unity Image: 

The base image uses ubuntu:18.04

Ensure the Unity application is downloaded and available in the current directory prior to building the image.
Link to download the Linux version :

+ Unity Download:  [here](https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage)
+ Dockerfile expect the app to be named UnityHub.AppImage

## Docker Build - Dockerfile manifest

docker build -t qwiklabs_unity:[v.v] .


## Google Cloud Build
gcloud builds submit --config cloudbuild.yaml . 


## Running the container

sudo docker run -d -p 8082:8082 -p 80:80 -p 443:443 --cap-add SYS_ADMIN  --device /dev/fuse --security-opt apparmor:unconfined gcr.io/qwiklabs-resources/qwiklabs_unity:0.1

Access the active container via the browser e.g. 

* Linux/Mac localhost:8082
* ChromeOS  penguin.linux.test:8082

