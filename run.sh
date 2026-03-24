#!/bin/bash

# build da imagem
docker build -f daniela.Dockerfile -t calculadora-api .

# rodar container
docker run -p 8080:8080 calculadora-api
