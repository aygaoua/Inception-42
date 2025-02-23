all: up

up: build
	sudo mkdir -p /home/azgaoua/data/wordpress
	sudo mkdir -p /home/azgaoua/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

build:
	docker-compose -f ./srcs/docker-compose.yml build

clean-imgs:
	docker images -q | xargs docker rmi -f

clean-containers-volumes:
	docker rm -vf $$(docker ps -aq)
	docker volume rm mariadb wordpress

clean: clean-containers-volumes clean-imgs

re: clean up

prune: clean
	sudo rm -rf /home/azgaoua/data/
	docker system prune -a --volumes -f
