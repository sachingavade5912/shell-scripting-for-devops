#!/bin/bash

<< task
Deploy a Django app and handle code errors
task

set -e

APP_DIR="django-notes-app"

code_clone() {
	echo "Cloning the Django app"

	if [ -d "$APP_DIR/.git" ]; then
		echo "Repository already exists, pulling latest changes"
		cd "$APP_DIR"
		git pull
	else
		git clone https://github.com/LondheShubham153/django-notes-app
		cd "$APP_DIR"
	fi
}

install_requirements() {
	echo "Installing Nginx"
	sudo apt install nginx -y

	echo "Installing Docker"
	sudo apt-get update
	sudo apt-get install ca-certificates curl gnupg

	# Create the directory for the Docker keyrings
	sudo install -m 0755 -d /etc/apt/keyrings

	# Download and add Docker's official GPG key
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

	# Set permissions on the GPG key file
sudo chmod a+r /etc/apt/keyrings/docker.gpg

	# Add the Docker repository to Apt sources
	echo \
  	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

	# Update the package index again with the new repository
	sudo apt-get update
}

required_restarts() {
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo systemctl enable nginx
	sudo systemctl start nginx
}

deploy() {
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}

echo "---- DEPLOYMENT STARTED ----"
code_clone
install_requirements
required_restarts
deploy
echo "---- DEPLOYMENT COMPLETED ----"

