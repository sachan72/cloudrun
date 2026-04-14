# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Cloud Run listens on port 8080
ENV PORT=8080

# Run with Gunicorn (production server)
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
