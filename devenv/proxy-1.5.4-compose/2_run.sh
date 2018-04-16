# Registering Containers with Traefik
docker network create proxy

# Traefik container
rm -rf acme acme.json && touch acme.json && chmod 600 acme.json && docker-compose up -d

# testing: https://monitor.localhost:8081
# testing: https://blog.localhost:8081
# testing: https://db-admin.localhost:8081?server=mysql&username=root with the username root and MYSQL_ROOT_PASSWORD for the password