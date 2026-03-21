FROM python:3.13-alpine
WORKDIR /app

COPY requirements.txt app.py ./
RUN python -m pip install --no-cache-dir -r requirements.txt

# exposicao
EXPOSE 8080
CMD [ "python", "app.py" ]