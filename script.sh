#!/bin/bash

docker build  -t calculadora-matheus -f matheus.Dockerfile .
docker run -p 8080:8080 calculadora-matheus