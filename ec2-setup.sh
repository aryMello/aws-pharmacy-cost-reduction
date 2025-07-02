#!/bin/bash

# Update all packages
echo "Updating all packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install necessary software (Apache, MySQL, PHP, etc.)
echo "Installing Apache, MySQL, PHP, and other necessary software..."
sudo apt-get install -y apache2 mysql-server php php-mysql libapache2-mod-php unzip curl

# Configure Apache to start on boot
echo "Configuring Apache to start on boot..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Configure MySQL to start on boot
echo "Configuring MySQL to start on boot..."
sudo systemctl enable mysql
sudo systemctl start mysql

# Set up a MySQL root password (use a strong password here)
echo "Setting up MySQL root password..."
sudo mysql_secure_installation

# Allow HTTP and HTTPS through the firewall (important for web servers)
echo "Allowing HTTP and HTTPS traffic through the firewall..."
sudo ufw allow in "Apache Full"

# Create a sample PHP file to test Apache and PHP setup
echo "Creating a sample PHP info file..."
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Install AWS CLI for S3 interactions
echo "Installing AWS CLI..."
sudo apt-get install -y awscli

# Setup AWS S3 bucket synchronization (optional)
echo "Setting up AWS S3 sync command..."
aws configure  # This will prompt for AWS Access Key and Secret Key

# Test the Apache and MySQL setup
echo "Testing Apache and MySQL setup..."
curl http://localhost/info.php

# Clean up the info.php file after testing
sudo rm /var/www/html/info.php

echo "EC2 setup complete!"
