NBIN=$(shell pwd)/node_modules/.bin
ELM_TEST=$(NBIN)/elm-test --compiler $(NBIN)/elm-make

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help


start: src/Queries.elm ## Start the dev server
	NODE_ENV=development $(NBIN)/webpack-dev-server \
		--hot \
		--inline \
		--content-base src/, \
		--no-info \
		--colors \
		--config ./webpack.dev.config.js
.PHONY: start


build: src/Queries.elm ## Compile frontend assets
	NODE_ENV=production $(NBIN)/webpack \
		--optimize-minimize \
		--progress \
		--bail \
		--config ./webpack.prod.config.js
.PHONY: build


clean: ## Remove compiled artifacts
	rm -rf dist
	rm -rf src/Queries.elm
.PHONY: clean


test-once: src/Queries.elm ## Run the front end tests
	$(ELM_TEST)
.PHONY: test-once


test: src/Queries.elm ## Run the front end test watcher
	$(ELM_TEST) --watch
.PHONY: test


#
# We generate the module the provides the GraphQL queries
# rather than writing the queries inline in Elm code.
#
src/Queries.elm: $(wildcard queries/**/*)
	bin/generate-queries-module.sh
