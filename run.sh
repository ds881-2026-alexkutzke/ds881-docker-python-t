#!/bin/bash

# parar container se existir
docker stop calculadora-api 2>/dev/null

# remover container se existir
docker rm calculadora-api 2>/dev/null

# Build da imagem
docker build -t calculadora-api -f jamily.Dockerfile .

# Rodar container
docker run -d -p 8080:8080 --name calculadora-api calculadora-api