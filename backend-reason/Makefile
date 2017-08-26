export PATH := ./node_modules/.bin:$(PATH)


help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help


server: ## Run a dev server
	@echo "TODO!!!"
	exit 1
.PHONY: server


test: ## Run the tests once
	jest
.PHONY: test


test-watch: ## Run the test watcher
	jest --watch
.PHONY: test-watch


build-watch: ## Incrementally compile the project
	bsb -make-world -w
.PHONY: build-watch


build: ## Compile the project once
	bsb -make-world
.PHONY: build


clean: ## Delete compiled artefacts
	bsb -clean-world
.PHONY: clean


deploy: build ## Deploy to GCP Cloud Functions
	@echo "TODO!!!"
	exit 1
	cp package.json dist/
	./bin/deploy.sh
.PHONY: deploy
