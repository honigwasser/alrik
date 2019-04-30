all: up

up:
	docker-compose up

it:
	docker-compose run app bash -l

clone:
	docker-compose run --service-ports app bash -l

d:
	docker-compose up -d

status:
	docker inspect alrik

build:
	docker-compose build app
