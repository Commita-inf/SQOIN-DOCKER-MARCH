FROM python:3.8-slim-buster
WORKDIR /app
COPY requirement.txt /app
RUN pip install --no-cache-dir -r requirement:.txt
COPY . .
CMD ["python", "app.py"]