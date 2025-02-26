all: up

up: build
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

stop:
	docker-compose -f srcs/docker-compose.yml stop

start:
	docker-compose -f srcs/docker-compose.yml start

build:
	docker-compose -f srcs/docker-compose.yml build

clean-imgs:
	docker images -q | xargs -r docker rmi -f

clean-containers-volumes:
	docker rm -vf $$(docker ps -aq)
	docker volume rm mariadb wordpress || true

clean: clean-containers-volumes clean-imgs

prune: clean
	sudo rm -rf /home/azgaoua/data/mariadb/*
	sudo rm -rf /home/azgaoua/data/wordpress/*
	docker system prune -a --volumes -f

re: prune up

.PHONY: down stop start build clean-imgs clean-containers-volumes