Setup Instructions

1. Create a Dockerfile
   Create a Dockerfile in the root of your project directory with the following content for the Python application:

Dockerfile

```dockerfile
# Use an official Python runtime as the base image

FROM python:3.8-slim

# Set the working directory in the container

WORKDIR /app

# Copy the current directory contents into the container

COPY . .

# Command to run the application

CMD ["python", "./app.py"]
This Dockerfile sets up a basic Python environment and runs app.py.
```

```dockerfile
   docker build -t simpleapp .
   Run your Docker container:
```

```dockerfile
docker run -e MY_ENV_VAR="Docker User" simpleapp
You should see the message: Hello, Docker User!
```

3. Set Up a Docker Registry
   Create a repository on Docker Hub named simpleapp. Ensure you're logged into Docker Hub and have permissions to push images.

4. Automate with GitHub Actions
   Create a .github/workflows directory in your project and add a docker.yml file with the following content:

# yaml

```yaml
name: Docker Build and Push

on:
push:
branches: - main - master

jobs:
build-and-push:
runs-on: ubuntu-latest
steps: - uses: actions/checkout@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Login to Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}

      - name: Build and push
        uses: docker/build-push-action@v2
        with:
          push: true
          tags: your-docker-username/simpleapp:latest

Replace your-docker-username with your actual Docker Hub username.

5. Configure GitHub Secrets
   In your GitHub repository settings, add two new secrets:

DOCKER_USERNAME - your Docker Hub username.
DOCKER_PASSWORD - your Docker Hub password or access token.
```
