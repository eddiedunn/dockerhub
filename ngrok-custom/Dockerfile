# Start from Debian 12 base image
FROM debian:12

# Install necessary packages
RUN apt-get update && apt-get install -y \
      wget \
      unzip \
      ca-certificates \
      sudo \
      curl && \
    rm -rf /var/lib/apt/lists/*


RUN curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
    | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
    && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
    | sudo tee /etc/apt/sources.list.d/ngrok.list \
    && sudo apt update \
    && sudo apt install ngrok -y

# Create a directory for ngrok configuration
RUN mkdir -p /etc/ngrok

# Copy your startup script into the image and make it executable
COPY start-ngrok.sh /start-ngrok.sh
RUN chmod +x /start-ngrok.sh

# Use your script as the container's entrypoint
ENTRYPOINT ["/start-ngrok.sh"]
