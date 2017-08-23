export PATH := ./node_modules/.bin:$(PATH)

NODEMON = nodemon --ext ts,js,json,graphql


help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help


server: ## Run a dev server
	$(NODEMON) bin/dev-server.js
.PHONY: server


test: ## Run the test watcher
	$(NODEMON) --exec "make test-once || true"
.PHONY: test


test-once: ## Run the tests once
	ts-node ./node_modules/.bin/tape test/**/*.{ts,js} | tap-diff
.PHONY: test-once


build-watch: ## Incrementally compile the project
	tsc --watch
.PHONY: build-watch


build: ## Compile the project once
	tsc
.PHONY: build


clean: ## Delete compiled artefacts
	rm -fr dist
.PHONY: clean


deploy: build ## Deploy to GCP Cloud Functions
	cp package.json dist/
	./bin/deploy.sh
.PHONY: deploy
