export PATH := ./node_modules/.bin:$(PATH)

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help


start: ## Start the dev server
	NODE_ENV=development webpack-dev-server \
		--hot \
		--inline \
		--content-base src/, \
		--no-info \
		--colors \
		--config ./webpack.dev.config.js
.PHONY: start


build: ## Compile frontend assets
	NODE_ENV=production webpack \
		--optimize-minimize \
		--progress \
		--bail \
		--config ./webpack.prod.config.js
.PHONY: build


clean: ## Remove compiled artifacts
	rm -rf dist
.PHONY: clean


test-once: ## Run the front end tests
	elm-test
.PHONY: test-once


test: ## Run the front end test watcher
	elm-test --watch
.PHONY: test
