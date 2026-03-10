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

EXPOSE 5005

# Start Rasa server using the port assigned by Railway
# We use sh -c to allow the $PORT environment variable to be expanded
CMD ["sh", "-c", "rasa run -m models --enable-api --cors '*' --port ${PORT:-5005} --connector rest"]

