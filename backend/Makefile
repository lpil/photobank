help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

NBIN=./node_modules/.bin


server: ## Run a dev server
	$(NBIN)/nodemon --ext js,json,graphql bin/dev-server.js
.PHONY: server


test: ## Run the test watcher
	$(NBIN)/ava --watch
.PHONY: test


test-once: ## Run the tests once
	$(NBIN)/ava
.PHONY: test-once


deploy: ## Deploy to GCP Cloud Functions
	./bin/deploy.sh
.PHONY: deploy
