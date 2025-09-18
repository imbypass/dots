
from pydantic import BaseModel
from styling.gradient import Gradient


class Gradients(BaseModel):
    start: Gradient
    end: Gradient