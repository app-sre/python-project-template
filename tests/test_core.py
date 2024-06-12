from python_project_template.core import app


def test_app() -> None:
    assert app("Hello, world!") == "Hello, world!"
