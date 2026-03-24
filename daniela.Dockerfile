# imagem base com python
FROM python:3.11-alpine

# pasta de trabalho
WORKDIR /app

# copia dependencias
COPY requirements.txt .

# instala libs
RUN pip install --no-cache-dir -r requirements.txt

# copia codigo
COPY . .

# porta da api
EXPOSE 8080

# comando inicial
CMD ["python", "app.py"]