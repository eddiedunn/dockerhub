# Custom Docker Images Repository

This repository contains custom Docker image builds for personal projects and experimentation. Each subdirectory represents a separate image build with its own Dockerfile and supporting files.


## Building a Custom Image

To build a custom Docker image from one of the subdirectories, navigate into that directory and run:

```bash
docker build -t yourdockerhubusername/<image-name>:latest .
```

Replace `yourdockerhubusername` with your Docker Hub username and `<image-name>` with the name of the image (for example, `ngrok-custom`).

## Pushing Images to Docker Hub

After building the image locally, log in to Docker Hub and push the image:

```bash
docker login
docker push yourdockerhubusername/<image-name>:latest
```

## Running a Container

You can run a container from any of these images using:

```bash
docker run --rm -it yourdockerhubusername/<image-name>:latest
```

## Image-Specific Instructions

For detailed usage, configuration, and troubleshooting for a specific image, please refer to the corresponding markdown file in that subdirectory. For example, for the custom ngrok image, see [ngrok-custom.md](ngrok-custom.md).

## Contributing

Contributions and improvements are welcome. If you have suggestions, please open an issue or submit a pull request.

## License

This repository is licensed under the terms found in the [LICENSE](LICENSE) file.


