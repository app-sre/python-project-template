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
   $ uvx cookiecutter http://github.com/app-sre/python-project-template

    [1/9] full_name (AppSRE):
    [2/9] email (sd-app-sre@redhat.com):
    [3/9] project_name (Project Name):
    [4/9] project_slug (project-name):
    [5/9] project_module (project_name):
    [6/9] project_short_description (Please enter a short description of your project):
    [7/9] Select deployment
        1 - openshift
        2 - pypi
        Choose from [1/2] (1):
    [8/9] version (0.1.0):
    [9/9] Select python_version
        1 - 3.12
        2 - 3.11
        Choose from [1/2] (1):
   ```

1. Move all files and directories from the generated `{{ cookiecutter.project_slug }}` directory to the root of your repository.
1. Review the generated files and commit them to your new repository.
