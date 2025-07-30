#!/bin/bash

# Install Docker if it's not already installed
if ! command -v docker &> /dev/null
then
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
else
    echo "Docker is already installed"
fi

# Run the Docker container
sudo docker build -t hello-python-app /home/ec2-user/hello-python-app
sudo docker run -d -p 80:5000 hello-python-app
