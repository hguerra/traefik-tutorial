# install
sudo apt-get install apache2-utils

# password config
PASSWORD=password

htpasswd -nb admin $PASSWORD

export WORDPRESS_DB_PASSWORD=$PASSWORD
export MYSQL_ROOT_PASSWORD=$PASSWORD
