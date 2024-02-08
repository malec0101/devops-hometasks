#!/bin/bash

docker build -t word-cloud-image:v1 --no-cache=true -f Dockerfile.multi .

docker run --rm -d --name word-cloud-generator -p 8080:8888 word-cloud-image:v1
