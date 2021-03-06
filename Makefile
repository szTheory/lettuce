# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

docs: ## generate docs and opens the index.html
	mix deps.get
	mix compile
	mix docs
	open doc/index.html

docs-in-docker: ## builds the apache image
	docker build . -t cashier-docs
	docker run -p 8080:80 cashier-docs
	open http://localhost:8080
