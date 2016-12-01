all: up

up:
	docker-compose up

it:
	docker-compose run web bash -l

clone:
	docker-compose run --service-ports web bash -l

d:
	docker-compose up -d

status:
	docker inspect alrik

build:
	docker-compose build web
