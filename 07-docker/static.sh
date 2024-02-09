#!/bin/bash

docker run -d --rm --name hometask-static \
  -v $PWD/files/static:/var/www/html/ \
  -p 8081:80 hometask-image:v1
