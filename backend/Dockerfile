# Use the official optimized Rasa image
FROM rasa/rasa:3.6.20-full

# Use root user to change permissions (Rasa image runs as user 1001 by default)
USER root
WORKDIR /app

# Copy all project files into /app
COPY . /app

# Ensure correct permissions
RUN chown -R 1001:1001 /app

# Switch back to non-root user for security
USER 1001

# Optimization for low memory (Railway free tier 512MB)
ENV PYTHONMALLOC=malloc

EXPOSE 5005

# Clear the rasa entrypoint to allow our command to run in a shell
ENTRYPOINT []

# Start Rasa server with 1 worker to save RAM
# Shell form allows ${PORT} expansion
CMD rasa run -m models --enable-api --cors "*" --port ${PORT:-5005} --connector rest --workers 1

