.DEFAULT_GOAL := test

CONTAINER_ENGINE ?= $(shell which podman >/dev/null 2>&1 && echo podman || echo docker)

{%- if cookiecutter.deployment == 'pypi' %}
# do not print pypi commands to avoid the token leaking to the logs
.SILENT: pypi
.PHONY: pypi
pypi:
	uv build --sdist --wheel
	UV_PUBLISH_TOKEN=$(shell cat /run/secrets/app-sre-pypi-credentials/token) \
		uv publish
{%- endif %}

.PHONY: format
format:
	uv run ruff check
	uv run ruff format

.PHONY: test
test:
	uv run ruff check --no-fix
	uv run ruff format --check
	uv run mypy
	uv run pytest -vv --cov={{ cookiecutter.project_module }} --cov-report=term-missing --cov-report xml

.PHONY: build
build:
	$(CONTAINER_ENGINE) build -t {{ cookiecutter.project_slug }}:test --target test .

.PHONY: dev-env
dev-env:
	uv sync
