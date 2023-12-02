FROM python:3.10-slim-buster

WORKDIR /app

COPY main.py requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "main.py"]


