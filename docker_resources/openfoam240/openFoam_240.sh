#!/bin/bash

IMAGE_NAME=of240
IMAGE_FILE=Dockerfile

docker build -f $IMAGE_FILE -t $IMAGE_NAME .
