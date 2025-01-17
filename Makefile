.PHONY: all install lint serve build deploy

all: install serve

install:
	pip install --upgrade pip
	pip install mkdocs
	mkdocs --version
	pip install mkdocs-material
	pip install mkdocs-mermaid2-plugin
	pip install mkdocs-redirects

lint:
	mkdocs build --strict

serve:
	mkdocs serve

build:
	mkdocs build

deploy:
	mkdocs gh-deploy --force

# To run this, ensure GITHUB_ACCESS_TOKEN environment variable set
labels:
	npm install -g github-label-sync
	github-label-sync --labels .github/labels.yml microsoft/electionguard
	github-label-sync --labels .github/labels.yml microsoft/electionguard-cpp
	github-label-sync --labels .github/labels.yml microsoft/electionguard-python
	github-label-sync --labels .github/labels.yml microsoft/electionguard-api-python
	github-label-sync --labels .github/labels.yml microsoft/electionguard-ui