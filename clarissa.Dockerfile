FROM python:3.11-alpine

# diretório de trabalho
WORKDIR /app

# copia apenas o arquivo de requisitos primeiro
COPY requirements.txt .

# dependências
RUN pip install --no-cache-dir -r requirements.txt

# copia o código da aplicação
COPY app.py .

# inicia a API Flask na porta 8080
CMD ["python3", "app.py"]

