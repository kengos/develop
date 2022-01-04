.DEFAULT_GOAL := up

.PHONY: up
up:
	@docker-compose up -d --build
	@docker container exec -it rust1.dev.local zsh

down:
	@docker-compose down
