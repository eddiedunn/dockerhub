#!/bin/sh
set -ex  # Enable tracing and exit on error

# echo "NGROK_AUTHTOKEN: $NGROK_AUTHTOKEN"
# echo "NGROK_DOMAIN: $NGROK_DOMAIN"

# Create a configuration file that includes:
# - the authtoken,
# - instructs ngrok to bind the inspection (web interface) to 0.0.0.0:4040,
# - and sets up the tunnel using your reserved static domain.
cat > /etc/ngrok/ngrok.yml <<EOF
version: "3"
agent:
  authtoken: $NGROK_AUTHTOKEN

endpoints:
  - name: basic
    url: $NGROK_DOMAIN
    upstream:
      url: "n8n:5678"
EOF

# Optionally, echo the config file for debugging:
cat /etc/ngrok/ngrok.yml

# Start ngrok using the configuration file.
# The '--all' flag will start all tunnels defined in the configuration.
exec ngrok start --all --config /etc/ngrok/ngrok.yml
