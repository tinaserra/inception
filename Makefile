DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all:	up
up:
	mkdir -p /home/vserra/data/wordpress
	mkdir -p /home/vserra/data/mariadb
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build
stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop
rm: stop
	docker rm mariadb
	docker rm wordpress
	docker rm nginx
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	rm -rf /home/vserra/data

re: all

.PHONY: all up down start stop