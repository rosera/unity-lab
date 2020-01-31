# Unity Docker

Ubuntu:18.04 base build 


## Author: 
Rich Rose


## Base Image: 

The base image uses ubuntu:18.04

## Docker Local Build - Dockerfile manifest

docker build -t unity_base:[v.v] .

## Google Cloud Build
gcloud builds submit --config cloudbuild.yaml .



