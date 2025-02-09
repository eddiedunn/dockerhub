## ngrok-custom.md

```markdown
# Custom ngrok Docker Image

This document details the build and usage of the custom ngrok Docker image. This image is built from a Debian 12 base, installs the latest ngrok agent, and uses a custom entrypoint to configure and launch ngrok with a reserved static domain.

## Overview

The custom image performs the following steps:
1. **Base Image:** Uses Debian 12.
2. **Install Dependencies:** Installs `wget`, `unzip`, and `ca-certificates`.
3. **Install ngrok:** Downloads the stable Linux ngrok binary, installs it to `/usr/local/bin`, and sets it as executable.
4. **Custom Entrypoint:** Uses a shell script (`start-ngrok.sh`) as the entrypoint that:
   - Reads the `NGROK_AUTHTOKEN` and `NGROK_DOMAIN` environment variables.
   - Registers the authtoken using `ngrok config add-authtoken`.
   - Starts an HTTP tunnel on a specified port (e.g. 5678) using your reserved static domain.

## Files in This Directory

- **Dockerfile:** Contains instructions to build the custom image.
- **start-ngrok.sh:** A startup script that adds the authtoken to the ngrok configuration and starts the tunnel.



## Building the Image

From the root of the repository, run:

```bash
docker build -t yourdockerhubusername/ngrok-custom:latest -f ngrok-custom/Dockerfile .
```

## Pushing the Image

After building locally, push the image to Docker Hub:

```bash
docker login
docker push yourdockerhubusername/ngrok-custom:latest
```

## Running the Container

Run the container with the necessary environment variables:

```bash
docker run --rm -it \
  -e NGROK_AUTHTOKEN=your_ngrok_authtoken \
  -e NGROK_DOMAIN=yourcompany.ngrok-free.app \
  -p 4040:4040 \
  yourdockerhubusername/ngrok-custom:latest
```

This will:
- Configure ngrok with your authtoken.
- Start an HTTP tunnel on port 5678 bound to your reserved static domain.
- Expose the ngrok web interface on port 4040 for monitoring.

## Troubleshooting

- **Environment Variables:** Ensure `NGROK_AUTHTOKEN` and `NGROK_DOMAIN` are set correctly.
- **Port Configuration:** Adjust the port (5678 in this example) if needed.
- **Debugging:** The script uses `set -ex`, so check container logs (`docker logs <container_id>`) to see the expanded commands and troubleshoot issues.

## Feedback and Contributions

If you encounter any issues or have suggestions for improvement, please open an issue or submit a pull request.

## License

This image is provided under the same license as the repository (see [LICENSE](../LICENSE)).
```


