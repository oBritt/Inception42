
NAME = ./srcs/docker-compose.yml

all:
	mkdir -p /home/obrittne/data/wordpress_volume1
	mkdir -p /home/obrittne/data/mariadb_volume1
	docker-compose -f $(NAME) up -d


down:
	docker-compose -f $(NAME) down -y

re: down build
