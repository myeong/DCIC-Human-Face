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

# Install and update Postgresql
echo "- Installing Postgresql"
sudo apt-get update > /dev/null 2>&1
sudo apt-get install postgresql postgresql-contrib > /dev/null 2>&1



#!/bin/sh -e

# Edit the following to change the name of the database user that will be created:
APP_DB_USER=humanface
APP_DB_PASS=humanface

# Edit the following to change the name of the database that is created (defaults to the user name)
APP_DB_NAME=$APP_DB_USER

# Edit the following to change the version of PostgreSQL that is installed
PG_VERSION=9.4

###########################################################
# Changes below this line are probably not necessary
###########################################################
print_db_usage () {
  echo "Your PostgreSQL database has been setup and can be accessed on your local machine on the forwarded port (default: 15432)"
  echo "  Host: localhost"
  echo "  Port: 15432"
  echo "  Database: $APP_DB_NAME"
  echo "  Username: $APP_DB_USER"
  echo "  Password: $APP_DB_PASS"
  echo ""
  echo "Admin access to postgres user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo ""
  echo "psql access to app database user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost $APP_DB_NAME"
  echo ""
  echo "Env variable for application development:"
  echo "  DATABASE_URL=postgresql://$APP_DB_USER:$APP_DB_PASS@localhost:15432/$APP_DB_NAME"
  echo ""
  echo "Local command to access the database via psql:"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost -p 15432 $APP_DB_NAME"
}

export DEBIAN_FRONTEND=noninteractive

PROVISIONED_ON=/etc/vm_provision_on_timestamp
if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo ""
  print_db_usage
  exit
fi

PG_REPO_APT_SOURCE=/etc/apt/sources.list.d/pgdg.list
if [ ! -f "$PG_REPO_APT_SOURCE" ]
then
  # Add PG apt repo:
  echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > "$PG_REPO_APT_SOURCE"

  # Add PGDG repo key:
  wget --quiet -O - https://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
fi

# Update package list and upgrade all packages
apt-get update
apt-get -y upgrade

apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION"

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

# Restart so that all new config is loaded:
service postgresql restart

cat << EOF | su - postgres -c psql
-- Create the database user:
CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';

-- Create the database:
CREATE DATABASE $APP_DB_NAME WITH OWNER=$APP_DB_USER
                                  LC_COLLATE='en_US.utf8'
                                  LC_CTYPE='en_US.utf8'
                                  ENCODING='UTF8'
                                  TEMPLATE=template0;
EOF

# Tag the provision time:
date > "$PROVISIONED_ON"

echo "Successfully created PostgreSQL dev virtual machine."
echo ""
print_db_usage

