#!/bin/bash

# define the environment variables
BASE_NAME=clj_py_ml
#BASE_FILE=./clojure_python_jupyter.Dockerfile
BASE_FILE=./clojure_python_jupyter.Dockerfile


# build the base docker image
docker build . -f $BASE_FILE -t $BASE_NAME
