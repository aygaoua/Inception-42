all: up

up: build
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
	docker system prune -a --volumes -f
