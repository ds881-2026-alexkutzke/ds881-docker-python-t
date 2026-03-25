FROM python:3.12-alpine AS builder

# apk é o apt do alpine
RUN apk add --no-cache binutils gcc musl-dev zlib-dev

WORKDIR /app
COPY requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt pyinstaller

COPY app.py .

RUN pyinstaller --onefile --noconfirm --clean app.py


FROM alpine:latest
WORKDIR /app

COPY --from=builder /app/dist/app /app/calculadora


RUN chmod +x /app/calculadora

EXPOSE 8080

CMD ["./calculadora"]