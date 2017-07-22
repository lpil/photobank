# https://cloud.google.com/deployment-manager/docs/quickstart

DEPLOYMENT_NAME=bank-deployment


deployment-create: ## Create deployment in GCP Deployment Manager
	gcloud deployment-manager deployments create $(DEPLOYMENT_NAME) --config infra/deployment.yml
.PHONY: deployment-create


deployment-preview: ## Preview changes to deployment
	gcloud deployment-manager deployments update $(DEPLOYMENT_NAME) --config infra/deployment.yml --preview
.PHONY: deployment-preview


deployment-cancel-preview: ## Cancel the deployment preview
	gcloud deployment-manager deployments cancel-preview $(DEPLOYMENT_NAME)
.PHONY: deployment-cancel-preview


deployment-apply: ## Apply the preview to the deployment
	gcloud deployment-manager deployments update $(DEPLOYMENT_NAME)
.PHONY: deployment-update


deployment-describe: ## View details of deployment
	gcloud deployment-manager deployments describe $(DEPLOYMENT_NAME)
.PHONY: deployment-describe


deployment-delete: ## Delete deployment
	gcloud deployment-manager deployments delete $(DEPLOYMENT_NAME)
.PHONY: deployment-delete
