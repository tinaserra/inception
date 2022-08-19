DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all: up

up:
	mkdir -p /home/vserra/data/wordpress
	mkdir -p /home/vserra/data/mariadb
	sudo docker-compose -f $(DOCKER_COMPOSE_FILE) --env-file ./srcs/.env up -d --build

stop:
	sudo docker-compose -f $(DOCKER_COMPOSE_FILE) down --volumes

rm: stop
	sudo rm -rf /home/vserra/data

re: rm all

.PHONY: all up stop rm re
