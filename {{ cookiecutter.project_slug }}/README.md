# {{ cookiecutter.project_name }}

[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
{%- if cookiecutter.deployment == 'pypi' %}
[![PyPI](<https://img.shields.io/pypi/v/{{ cookiecutter.project_slug }}>)][pypi-link]
[![PyPI platforms][pypi-platforms]][pypi-link]
![PyPI - License](<https://img.shields.io/pypi/l/{{ cookiecutter.project_slug }}>)
{%- endif %}

Welcome to {{ cookiecutter.project_name }}! :rocket:

## Features

- :swimmer:
- :bike:
- :runner:

{%- if cookiecutter.deployment == 'pypi' %}

## Installation

```bash
uv tool install {{ cookiecutter.project_slug }}
```

{%- endif %}

{%- if cookiecutter.deployment == 'openshift' %}

## Deployment

See `openshift` templates.
{%- endif %}

## Usage

```bash
$ {{ cookiecutter.project_slug }}
3.8km 🏊, 180km 🚲, 42.2km 🏃
```

## Development

Create and maintain a development virtual environment via:

```bash
make dev-env
```

Activate the virtual environment in the current shell via:

```bash
source .venv/bin/activate
```

Run the tests suite via:

```bash
make tests
```

## License

This project is licensed under the terms of the [Apache 2.0 license](/LICENSE).

[pypi-link]:      <https://pypi.org/project/{{ cookiecutter.project_slug }}/>
[pypi-platforms]: <https://img.shields.io/pypi/pyversions/{{ cookiecutter.project_slug }}>
