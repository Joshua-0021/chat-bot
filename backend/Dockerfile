# Rasa Main Server
FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy all project files
COPY . .

# Install rasa
RUN pip install --upgrade pip && pip install rasa==3.6.20

# Expose port
EXPOSE 5005

# Start Rasa server
CMD ["rasa", "run", "-m", "models", "--enable-api", "--cors", "*", "--port", "5005", "--interface", "0.0.0.0"]
