
NAME = ./srcs/docker-compose.yml

all:
	mkdir -p /home/obrittne/data/wordpress_volume1
	mkdir -p /home/obrittne/data/mariadb_volume1
	@docker-compose -f $(NAME) up -d

down:
	@printf "Stopping configuration $(NAME) ... \n"
	@docker-compose -f $(NAME) down -y


# docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null
# all : up

# up : 
# 	@docker-compose -f ./srcs/docker-compose.yml up -d

# down : 
# 	@docker-compose -f ./srcs/docker-compose.yml down

# stop : 
# 	@docker-compose -f ./srcs/docker-compose.yml stop

# start : 
# 	@docker-compose -f ./srcs/docker-compose.yml start

# status : 
# 	@docker ps

logs:
	@docker-compose -f $(NAME) logs
fclean:
	@printf "Complete clearning of all docker configuration ... \n"
	@docker stop $$(docker ps -qa);\
	docker system prune -a ;\
	docker system prune --all --force --volumes;\
	docker network prune --force;\
	docker volume rm srcs_volume_wp;\
	docker volume rm srcs_volume_db;