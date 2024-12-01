# default target
all: up

# start the biulding process
# create the wordpress and mariadb data directories.
# start the containers in the background and leaves them running
up: build
	docker-compose -f ./srcs/docker-compose.yml up -d

# stop the containers
down:
	docker-compose -f ./srcs/docker-compose.yml down

# stop the containers
stop:
	docker-compose -f ./srcs/docker-compose.yml stop

# start the containers
start:
	docker-compose -f ./srcs/docker-compose.yml start

# build the containers
build:
	docker-compose -f ./srcs/docker-compose.yml build

# clean the containers
# stop all running containers and remove them.
# remove all images, volumes and networks.
# remove the wordpress and mariadb data directories.
# the (|| true) is used to ignore the error if there are no containers running to prevent the make command from stopping.
clean-imgs:
	docker images -q | xargs docker rmi -f

clean-containers-volumes:
	docker rm -vf $$(docker ps -aq)
	docker volume rm mariadb wordpress

clean: clean-containers-volumes clean-imgs

# clean and start the containers
re: clean up

# prune the containers: execute the clean target and remove all containers, images, volumes and networks from the system.
prune: clean
	docker system prune -a --volumes -f