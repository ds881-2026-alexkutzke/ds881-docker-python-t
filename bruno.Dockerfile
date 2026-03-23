FROM python:3.13-alpine AS builder

WORKDIR /tmp
COPY requirements.txt ./
RUN python -m pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.13-alpine
WORKDIR /app

COPY --from=builder /install /usr/local
COPY app.py ./

# exposicao
EXPOSE 8080
CMD [ "python", "app.py" ]