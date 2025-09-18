
from pydantic import BaseModel
from styling.corner import Corner


class Corners(BaseModel):
    enabled: bool
    radius: float
    topleft: Corner
    topright: Corner
    bottomleft: Corner
    bottomright: Corner