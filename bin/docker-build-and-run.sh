#!/bin/bash

docker build -f Dockerfile -t toy-robot .
docker run -it --rm toy-robot
