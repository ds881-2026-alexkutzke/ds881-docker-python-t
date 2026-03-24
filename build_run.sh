#!/bin/bash

IMAGE_NAME="calculadora-clarissa"

# pasta atual
docker build -t $IMAGE_NAME -f clarissa.Dockerfile .


# roda e mapeia 
docker run -d -p 8080:8080 --name container-calculadora $IMAGE_NAME

echo "Teste com o comando curl"