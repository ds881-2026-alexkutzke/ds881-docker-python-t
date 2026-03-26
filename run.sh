#!/bin/bash

# Build da imagem
docker build -t calculadora-api -f jamily.Dockerfile .

# Rodar container
docker run -d -p 8080:8080 --name calculadora-api calculadora-api