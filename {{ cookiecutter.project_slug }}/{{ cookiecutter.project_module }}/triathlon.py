from enum import StrEnum


class TriDistance(StrEnum):
    SPRINT = "Sprint"
    OLYMPIC = "Olympic"
    HALF = "Half"
    FULL = "Full"
    T100 = "T100"


class DistanceError(Exception):
    def __init__(self) -> None:
        super().__init__("Unsupported distance")


def race(distance: TriDistance = TriDistance.FULL) -> str:
    match distance:
        case TriDistance.SPRINT:
            return "750m :swimmer:, 20km :bike:, 5km :runner:"
        case TriDistance.OLYMPIC:
            return "1.5km :swimmer:, 40km :bike:, 10km :runner:"
        case TriDistance.HALF:
            return "1.9km :swimmer:, 90km :bike:, 21.1km :runner:"
        case TriDistance.FULL:
            return "3.8km :swimmer:, 180km :bike:, 42.2km :runner:"
        case _:
            raise DistanceError
