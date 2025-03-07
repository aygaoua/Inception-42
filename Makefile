all: up

up: build
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build

clean-imgs:
	docker images -q | xargs -r docker rmi -f

clean-containers-volumes:
	docker rm -vf $$(docker ps -aq)
	docker volume rm mariadb wordpress || true

clean: clean-containers-volumes clean-imgs

prune: clean
	docker system prune -a --volumes -f

re: prune up

.PHONY: down build clean-imgs clean-containers-volumes