#!/bin/bash

# Update & Upgrade the system
yum update -y

# Install Apache, PHP and SQL client
yum install php -y
yum install php-mysqli -y
yum install mariadb105 -y

# Start and enable Apache and PHP services
systemctl start httpd
systemctl enable httpd

systemctl start php-fpm
systemctl enable php-fpm

# Add ec2-user to the apache group and change permissions /var/www/html
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www/html
sudo chown -R apache:apache /var/www/html


# Mount EFS drive
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport your-efs-endpoint:/ /var/www/html/

# To mount automatically after restart, type: sudo nano /etc/fstab and add this line your-efs-endpoint:/ /var/www/html/ nfs defaults,_netdev 0 0

# Download and configure WordPress
wget https://wordpress.org/latest.zip
unzip latest.zip
sudo cp -R wordpress/* /var/www/html/
rm -rf wordpress
rm latest.zip