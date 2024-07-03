
NAME = ./srcs/docker-compose.yml

all:
	mkdir -p /home/obrittne/data/wordpress_volume1
	mkdir -p /home/obrittne/data/mariadb_volume1
	@docker-compose -f $(NAME) up -d

down:
	@printf "Stopping configuration $(NAME) ... \n"
	@docker-compose -f $(NAME) down -y



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