# https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-16-04

# Step 1 — Configuring and Running Traefik
sudo apt-get install apache2-utils

# htpasswd => admin:$apr1$GA..KXSJ$SCN6lk4vLThxUlPAXugjn.
htpasswd -nb admin password

# set values in your shell for the WORDPRESS_DB_PASSWORD and MYSQL_ROOT_PASSWORD variables before you start your containers
export WORDPRESS_DB_PASSWORD=password
export MYSQL_ROOT_PASSWORD=password

# Step 3 — Registering Containers with Traefik
docker network create proxy

# Traefik container
rm -rf acme acme.json && touch acme.json && chmod 600 acme.json && docker-compose up -d

# testing: https://monitor.localhost:8081
# testing: https://blog.localhost:8081
# testing: https://db-admin.localhost:8081?server=mysql&username=root with the username root and MYSQL_ROOT_PASSWORD for the password