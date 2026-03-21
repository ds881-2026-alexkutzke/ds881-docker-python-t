docker build -f bruno.Dockerfile -t bruno-api:test .
docker run -p 8080:8080 bruno-api:test