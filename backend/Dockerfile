# Use the official optimized Rasa image
FROM rasa/rasa:3.6.20-full

# Use root user to change permissions (Rasa image runs as user 1001 by default)
USER root
WORKDIR /app

# Copy all project files into /app
COPY . /app

# Ensure correct permissions
RUN chown -R 1001:1001 /app

# Train a new model inside the Linux container AS ROOT
# This guarantees cross-OS compatibility and prevents pickup/unpickle FileNotFoundError crashes
RUN rm -rf models/*
RUN rasa train

# Switch back to non-root user for security
USER 1001

EXPOSE 5005

# Start Rasa server
CMD ["run", "-m", "models", "--enable-api", "--cors", "*", "--port", "5005"]

