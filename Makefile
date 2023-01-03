DEFAULT_GOAL: help

ifneq (,$(wildcard ./.env))
	include .env
	export
endif

PHONY: help
help: ## Print this message and exit.
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z_-]+:.*?## / {printf "\033[36m%s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST) \
		| sort \
		| column -s ':' -t

.PHONY: build
build: ## Builds the docker image
	docker build -t hypr-static-apache .

.PHONY: rebuild
rebuild: ## Builds the docker image
	docker rmi hypr-static-apache
	docker build -t hypr-static-apache .

.PHONY: up
up: ## Starts the web server
	docker-compose up --detach

.PHONY: down
down: ## Stops the web server
	docker-compose down
