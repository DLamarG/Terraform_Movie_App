#!/bin/bash

# SECTION 1: Update OS and Install Prerequisites
sudo yum update -y
sudo yum install -y python3-pip docker git nodejs npm
pip install --upgrade pip

# Start Docker and enable it
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone the repository
sudo git clone https://github.com/DLamarG/Movie_App_CICD.git /home/ec2-user/Movie_App_CICD
cd /home/ec2-user/Movie_App_CICD/do-assessment3-movie-db/templates/flask-react
sudo chown -R ec2-user:ec2-user /home/ec2-user/Movie_App_CICD

# Get the EC2 instance public IP
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
PUBLIC_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)
echo "Public IP: $PUBLIC_IP"

# Update App.jsx in the React app
cd /home/ec2-user/Movie_App_CICD/do-assessment3-movie-db/templates/flask-react/nginx/reactApp/src
sed -i "s|const API_URL = 'http://127.0.0.1:5500'|const API_URL = 'http://$PUBLIC_IP:5500'|" App.jsx


# Save the IP to a text file for debugging
echo "$PUBLIC_IP" > /home/ec2-user/ip_add.txt

# Build and run Docker containers without cache
sudo docker-compose build --no-cache
sudo docker-compose up -d
