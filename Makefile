
NAME ./srcs/docker-compose.yml

all:
	docker-compose -f $(NAME) up -d

build:
	docker-compose -f $(NAME) up -d --build

down:
	docker-compose -f $(NAME) down -y

re: down build

clean: down
	docker system prune -a

fclean: clean
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes

.PHONY: all buid down re clean fclean