help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

NBIN=./node_modules/.bin
EXTS=ts,js,json,graphql
TEST_CMD=$(NBIN)/ts-node $(NBIN)/tape test/**/*.{ts,js} | $(NBIN)/tap-diff

server: ## Run a dev server
	$(NBIN)/nodemon --ext $(EXTS) bin/dev-server.js
.PHONY: server


test: ## Run the test watcher
	$(NBIN)/nodemon --ext $(EXTS) --exec "$(TEST_CMD) || true"
.PHONY: test


test-once: ## Run the tests once
	$(TEST_CMD)
.PHONY: test-once


build: ## Incrementally compile the project
	$(NBIN)/tsc --watch
.PHONY: build


build-once: ## Compile the project once
	$(NBIN)/tsc
.PHONY: build-once


clean: ## Delete compiled artefacts
	rm -r dist
.PHONY: clean


deploy: dist ## Deploy to GCP Cloud Functions
	./bin/deploy.sh
.PHONY: deploy


dist: build
