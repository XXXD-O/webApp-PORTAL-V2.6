FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Dependencias sistema
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Proyecto
COPY . .

EXPOSE 5000

# Gunicorn
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "wsgi:app"]
