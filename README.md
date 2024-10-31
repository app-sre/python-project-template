# AppSRE Python-project-template

This is a template for a Python project.

## Features

- [Uv](https://docs.astral.sh/uv/) for dependency management
- [Ruff](https://docs.astral.sh/ruff/) for linting and formatting
- Konflux CI tasks
- Secure `.gitignore` and `.dockerignore` files
- Example code and tests

## Usage

1. Create a new blank repository on GitHub.
1. Clone your new repository to your local machine.
1. Run:

   ```bash
   uvx cookiecutter http://github.com/app-sre/python-project-template
   ```

1. Move all files and directories from the generated `{{ cookiecutter.project_slug }}` directory to the root of your repository.
1. Review the generated files and commit them to your new repository.
