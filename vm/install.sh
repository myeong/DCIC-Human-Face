#!/bin/bash

# Fetch and install updates
echo "Fetching Updates..."
sudo apt-get -q -y update > /dev/null 2>&1 
#sudo apt-get -q -y dist-upgrade

# Setup US/Eastern as time zone
echo "US/Eastern" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

# Install Git
echo "- Installing Git"
sudo apt-get -q -y install git-core > /dev/null 2>&1

# Install MySQL
echo "- Installing MySQL"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password test123'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password test123'
sudo apt-get -q -y install mysql-server > /dev/null 2>&1
sudo cat /vagrant/my.cnf > /etc/mysql/my.cnf

# Allow MySQL connectivity from host 
mysql -u root -ptest123 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'test123' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Bind MySQL to selected IP address 
sudo sed -i 's/= 127.0.0.1/= 192.168.33.10/g' /etc/mysql/my.cnf
sudo service mysql restart > /dev/null 2>&1

# Install Samba
if [ ! -f /etc/samba/smb.conf ]; then
	echo "- Installing Samba"
	sudo apt-get -q -y install samba > /dev/null 2>&1
	sudo cat /vagrant/smb.conf >> /etc/samba/smb.conf
	sudo service smbd restart >> /dev/null 2>&1
	sudo service nmbd restart >> /dev/null 2>&1
fi

# Install Apache 2
echo "- Installing Apache 2"
sudo apt-get -q -y install apache2 > /dev/null 2>&1
if [ -d /var/www ]; then
	sudo chown -R vagrant.vagrant /var/www
fi

# Install mod_ssl for Apache
sudo a2enmod ssl > /dev/null 2>&1

# Modify Apache 2 configuration to support rewrite module
sudo sed -i "11s/None/All/g" /etc/apache2/sites-enabled/000-default
if [ ! -f /etc/apache2/mods-enabled/rewrite.load ]; then
        sudo ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled
fi

# Setup SSL directories and generate SSL certificates
echo "- Configuring SSL for Apache"
if [ ! -f /etc/apache2/ssl/key/server.key ]; then
	sudo mkdir -p /etc/apache2/ssl/key /etc/apache2/ssl/csr /etc/apache2/ssl/crt
	sudo openssl genrsa -out /etc/apache2/ssl/key/server.key 2048 > /dev/null 2>&1
	sudo openssl req -new -key /etc/apache2/ssl/key/server.key -config /vagrant/ssl.conf -out /etc/apache2/ssl/csr/server.csr > /dev/null 2>&1
	sudo openssl x509 -req -in /etc/apache2/ssl/csr/server.csr -passin pass:test123 -signkey /etc/apache2/ssl/key/server.key -extfile /vagrant/cert_extensions -out /etc/apache2/ssl/crt/server.crt -days 3065 > /dev/null 2>&1
fi
# Modify Apache 2 configuration to support SSL certificates
if [ ! -f /etc/apache2/sites-enabled/000-default-ssl ]; then
	sudo cp -p /etc/apache2/sites-available/default-ssl /etc/apache2/sites-enabled/000-default-ssl
	sudo sed -i "12s/None/All/g" /etc/apache2/sites-enabled/000-default-ssl
	sudo sed -i "51s/ssl\/certs\/ssl-cert-snakeoil\.pem/apache2\/ssl\/crt\/server.crt/g" /etc/apache2/sites-enabled/000-default-ssl
	sudo sed -i "52s/ssl\/private\/ssl-cert-snakeoil\.key/apache2\/ssl\/key\/server.key/g" /etc/apache2/sites-enabled/000-default-ssl
fi

# Create fqdn file for Apache with localhost set as ServerName
sudo echo "ServerName localhost" > /etc/apache2/conf.d/fqdn

# Install PHP 5.3.10`
echo "- Installing PHP 5.3.10 & modules"
sudo apt-get -q -y install php5 libapache2-mod-php5 php5-curl php5-gd php5-imap php5-ldap php5-mcrypt php5-mysql php5-xmlrpc php5-xsl > /dev/null 2>&1

# PHP configuration
#
# Set PHP memory limit to 256M
sudo sed -i 's/memory_limit = 128M/memory_limit = 256M/g' /etc/php5/apache2/php.ini

# Configure APC settings for php.ini
if [ ! -f /etc/php5/conf.d/apc.ini ]; then
        sudo cat /vagrant/apc.conf >> /etc/php5/apache2/php.ini
        sudo apt-get -q -y install php-apc > /dev/null 2>&1
fi

# Restart Apache to load installed PHP modules and all updated configuration settings.
sudo /usr/sbin/apachectl restart > /dev/null 2>&1

# Install and update Drush
echo "- Installing Drush & Upgrading to 5.9"
sudo apt-get -q -y install drush > /dev/null 2>&1
sudo drush -y dl drush-7.x-5.9 --destination='/usr/share' > /dev/null 2>&1
