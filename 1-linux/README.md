# Manipulating the /etc/passwd File in a Docker Container

## Prerequisites

Ensure you have Docker Desktop installed on your machine and possess basic knowledge of the terminal or command line interface.

## Setup and Execution Guide

## 1. Pull an Ubuntu Image

```bash
docker pull ubuntu:latest
```

## Verify the image is present

```bash
docker images
```

## 2. Run a Docker Container

```bash
docker run -it --name my_container ubuntu:latest
```

## 3. Create a New User Inside the Container

## Note: These commands are to be executed inside the Docker container

```bash
useradd -m john -s /bin/bash
```

## Exit back to the host system

```bash
exit
```

## 4. Copy the Script to the Container

```bash
docker cp /path/to/create_large_file.sh my_container:/home/john/
```

## 5. Restart and Attach to the Container

```bash
docker start -ai my_container
```

## 6. Prepare and Execute the Script

## Option 1: Execute as john User

## Switch to the john user (inside the container)

```bash
su - john
```

## Make the script executable and attempt to run it

```bash
chmod +x /home/john/create_large_file.sh
/home/john/create_large_file.sh
```

# Note: This will prompt an error if not executed with root privileges.

## Option 2: Execute as root User

## Without switching to john, make the script executable and run it as root (from the root context)

```bash
chmod +x /home/john/create_large_file.sh
/home/john/create_large_file.sh
```
