FROM python:3.13-alpine AS build
#imagem leve e mais recente
WORKDIR /app
# diretorio do container como /app
COPY requirements.txt .
# copia o arquivo de requisitos para o container

RUN pip install --no-cache-dir --user -r requirements.txt 
#instala dependencia, sem cache, reduz o tamanho da imagem e -r abrevia a dependencia (flask)

FROM python:3.13-alpine

WORKDIR /app

COPY --from=build /root/.local  /root/.local
COPY . .
# copia o restante dos arquivos para o container

EXPOSE 8080
# expõe a porta 8080 

CMD ["python", "app.py"]
# comando para rodar a aplicação, python app.py
