.DEFAULT_GOAL := test
CONTAINER_ENGINE ?= $(shell which podman >/dev/null 2>&1 && echo podman || echo docker)

TMPDIR := $(shell mktemp -d)
TMPPROJ := $(TMPDIR)/project-name

_test:
	mkdir -p $(TMPDIR)
	uv tool run cookiecutter --output-dir $(TMPDIR) --no-input .
	cd $(TMPPROJ) && make dev-env
	cd $(TMPPROJ) && uv run project-name | grep -q "180km"
	cd $(TMPPROJ) && make test

.PHONY: test
test:
	$(CONTAINER_ENGINE) build --progress plain -t python-project-template:test .
