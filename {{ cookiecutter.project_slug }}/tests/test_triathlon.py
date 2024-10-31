import pytest

from {{ cookiecutter.project_module }}.triathlon import TriDistance, race


@pytest.mark.parametrize(
    ("distance", "expected_swim"),
    [
        (TriDistance.SPRINT, "750m"),
        (TriDistance.OLYMPIC, "1.5km"),
        (TriDistance.HALF, "1.9km"),
        (TriDistance.FULL, "3.8km"),
        pytest.param(TriDistance.T100, "", marks=pytest.mark.xfail),
    ],
)
def test_triathlon_race(distance: TriDistance, expected_swim: str) -> None:
    assert expected_swim in race(distance)
