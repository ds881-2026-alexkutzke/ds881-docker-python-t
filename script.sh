docker build -f bruno.Dockerfile -t bruno-api:test3 .
docker run -p 8080:8080 bruno-api:test3