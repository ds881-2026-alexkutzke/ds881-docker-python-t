#!/bin/bash
echo "Construindo a imagem"

docker build -t calculadora -f dyego.Dockerfile .
docker run -d -p 8080:8080 --name calc-dyego calculadora

sleep 3
echo "curl -X POST http://localhost:8080/calcular \n
           -H "Content-Type: application/json" \n
           -d '{"operador": "multiplicacao", "op1": 7, "op2": 6}'\n"

curl -X POST http://localhost:8080/calcular \
     -H "Content-Type: application/json" \
     -d '{"operador": "multiplicacao", "op1": 7, "op2": 6}'
    