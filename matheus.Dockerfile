
# Build do binário
FROM python:3.13-alpine3.21 AS builder

WORKDIR /app

RUN apk add --no-cache gcc musl-dev libffi-dev

# Copia dependências
COPY requirements.txt .
RUN pip install --no-cache-dir pyinstaller -r requirements.txt

# Copia aplicação
COPY app.py .

# Gera o binário
RUN pyinstaller --onefile --clean --strip app.py


# Runtime leve
FROM alpine:3.21

WORKDIR /app

RUN apk add --no-cache gcompat

# Copia o executável
COPY --from=builder /app/dist/app .

EXPOSE 8080

# Executa o binário
CMD ["./app"]