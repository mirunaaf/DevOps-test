Manipulating the /etc/passwd File in a Docker Container
Prerequisites
Ensure you have Docker Desktop installed on your machine and possess basic knowledge of the terminal or command line interface.

Setup and Execution Guide

1. Pull an Ubuntu Image
   First, pull the latest Ubuntu image by executing the following command in your terminal:

shell

docker pull ubuntu:latest
After downloading, verify that the image is present by listing all Docker images:

shell

docker images 2. Run a Docker Container
Start a new Docker container named my_container using the Ubuntu image you just downloaded:

shell

docker run -it --name my_container ubuntu:latest 3. Create a New User Inside the Container
Inside the container, create a new user named john. Ensure you provide him with a home directory and a default shell:

shell

useradd -m john -s /bin/bash
Once done, exit back to the host system:

shell

exit 4. Copy the Script to the Container
Copy the create_large_file.sh script from your host system to John's home directory inside the container:

shell

docker cp /path/to/create_large_file.sh my_container:/home/john/ 5. Restart and Attach to the Container
Restart the container and attach your terminal to it:

shell

docker start -ai my_container 6. Prepare and Execute the Script
You have two primary methods to proceed with executing the script inside the container:

Option 1: Execute as john User
First, switch to the john user:

shell

su - john
Then, make the script executable and attempt to run it:

shell

chmod +x /home/john/create_large_file.sh
/home/john/create_large_file.sh
Note: This script verifies if it's executed with superuser (root) privileges and will prompt an error if run as john.

Option 2: Execute as root User
Without switching to john, make the script executable and run it as root:

shell

chmod +x /home/john/create_large_file.sh
/home/john/create_large_file.sh
Executing as root bypasses the permission check, allowing the script to run successfully.

Important Notes
The script performs various operations, such as manipulating the /etc/passwd file and making network requests. It requires root access for certain actions.
Switching to the john user as scripted (switch_to_john) is more of a theoretical step within the script's context due to the nature of user switching.
