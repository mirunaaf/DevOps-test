# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Define environment variable
ENV MY_ENV_VAR User

# Run app.py when the container launches
CMD ["python", "./app.py"]
