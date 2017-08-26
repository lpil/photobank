help:
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help


QUAY_LATEST_TAG=quay.io/lpil/photobank:latest
HEROKU_STAGING_TAG=registry.heroku.com/photobank-staging/web

deploy-staging: ## Deploy latest master image to staging
	heroku container:login
	docker pull $(QUAY_LATEST_TAG)
	docker tag $(QUAY_LATEST_TAG) $(HEROKU_STAGING_TAG)
	docker push $(HEROKU_STAGING_TAG)
.PHONY: deploy-staging


logs-staging: ## View staging logs
	heroku logs -a photobank-staging --tail
.PHONY: logs-staging


migrate-staging: ## Migrate staging datbase
	heroku run -a photobank-staging HOME=/opt/app MIX_ENV=prod mix ecto.migrate
.PHONY: migrate-staging
