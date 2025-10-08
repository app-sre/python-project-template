#
# Base image with defaults for all stages
FROM registry.access.redhat.com/ubi9/python-{{ cookiecutter.python_version.replace(".", "") }} AS base

# Keep this version tag in sync with pyproject.toml or feel free to remove it
LABEL konflux.additional-tags="{{ cookiecutter.version }}"
COPY LICENSE /licenses/


#
# Builder image
#
FROM base AS builder
COPY --from=ghcr.io/astral-sh/uv:0.9.0@sha256:8f926a80debadba6f18442030df316c0e2b28d6af62d1292fb44b1c874173dc0 /uv /bin/uv

ENV \
    # use venv from ubi image
    UV_PROJECT_ENVIRONMENT=$APP_ROOT \
    # compile bytecode for faster startup
    UV_COMPILE_BYTECODE="true" \
    # disable uv cache. it doesn't make sense in a container
    UV_NO_CACHE=true

COPY pyproject.toml uv.lock ./
# Test lock file is up to date
RUN uv lock --check
# Install the project dependencies
RUN uv sync --frozen --no-install-project --no-group dev

COPY README.md ./
COPY {{ cookiecutter.project_module }} ./{{ cookiecutter.project_module }}
RUN uv sync --frozen --no-group dev


#
# Test image
#
FROM builder AS test

COPY Makefile ./
RUN uv sync --frozen

COPY tests ./tests
RUN make test


{%- if cookiecutter.deployment == 'pypi' %}
#
# PyPI publish image
#
FROM test AS pypi
# Secrets are owned by root and are not readable by others :(
USER root
RUN --mount=type=secret,id=app-sre-pypi-credentials/token make -s pypi
{%- endif %}
{%- if cookiecutter.deployment == 'openshift' %}
#
# Production image
#
FROM base AS prod
COPY --from=builder /opt/app-root /opt/app-root
ENTRYPOINT [ "{{ cookiecutter.project_module }}" ]
{%- endif %}
