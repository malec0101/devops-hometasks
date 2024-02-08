#!/bin/bash

docker build -t hometask-image:v1 --no-cache=true . &&

docker run --rm --name hometask-dynamic -d -p 8080:80 hometask-image:v1
