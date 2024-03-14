# Use the official Redis image from Docker Hub
FROM redis:latest

# Copy the custom Redis configuration file into the container
COPY redis.conf /usr/local/etc/redis/redis.conf

# Install the Redis CLI so we can access CLI on the same docker continer
RUN apt-get update && apt-get install -y redis-tools

# Expose the default Redis port (6379)
EXPOSE 6379

# Start the Redis server with the cutom configuration file
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
