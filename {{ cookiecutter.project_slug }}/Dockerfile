#
# Base image with defaults for all stages
FROM registry.access.redhat.com/ubi10/python-{{ cookiecutter.python_version.replace(".", "") }}-minimal AS base

# Keep this version tag in sync with pyproject.toml or feel free to remove it
LABEL konflux.additional-tags="{{ cookiecutter.version }}"
COPY LICENSE /licenses/


#
# Builder image
#
FROM base AS builder
COPY --from=ghcr.io/astral-sh/uv:0.11.24@sha256:99ea34acedc870ba4ad11a1f540a1c04267c9f30aadc465a94406f52dfda2c36 /uv /bin/uv

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

USER root
RUN microdnf install -y make
USER 1001

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
