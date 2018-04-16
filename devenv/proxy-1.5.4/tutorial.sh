# https://www.digitalocean.com/community/tutorials/how-to-use-traefik-as-a-reverse-proxy-for-docker-containers-on-ubuntu-16-04

# Step 1 — Configuring and Running Traefik
sudo apt-get install apache2-utils

# htpasswd => admin:$apr1$GA..KXSJ$SCN6lk4vLThxUlPAXugjn.
htpasswd -nb admin password

# configure traefik.toml

# Step 2 – Running the Traefik Container
docker network create proxy

# Let's Encrypt information
touch acme.json && chmod 600 acme.json #only the root user can read and write to this file

# Traefik container
docker run -d \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "$PWD/traefik.toml:/traefik.toml" \
  -v "$PWD/acme.json:/acme.json" \
  -p "80:80" \
  -p "443:443" \
  -l "traefik.frontend.rule=Host:monitor.localhost" \
  -l "traefik.port=8080" \
  --network proxy \
  --name traefik \
  traefik:1.5.4-alpine --docker

# single line
rm -rf acme acme.json && touch acme.json && chmod 600 acme.json && docker run -d --rm --name traefik -v "/var/run/docker.sock:/var/run/docker.sock" -v "$PWD/traefik.toml:/traefik.toml" -v "$PWD/acme.json:/acme.json" -p "80:80" -p "443:443" -l "traefik.frontend.rule=Host:monitor.localhost" -l "traefik.port=8080" --network proxy traefik:1.5.4-alpine --docker

# testing: https://monitor.localhost:8081

# Step 3 — Registering Containers with Traefik
vim docker-compose.yml

# set values in your shell for the WORDPRESS_DB_PASSWORD and MYSQL_ROOT_PASSWORD variables before you start your containers
export WORDPRESS_DB_PASSWORD=password
export MYSQL_ROOT_PASSWORD=password

# run the containers using
docker-compose up -d

# testing: https://blog.localhost:8081
# testing: https://db-admin.localhost:8081?server=mysql&username=root with the username root and MYSQL_ROOT_PASSWORD for the password

# final test: https://blog.localhost:8081/