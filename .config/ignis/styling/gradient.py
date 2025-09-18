
from pydantic import BaseModel


class Gradient(BaseModel):
    color: str
    x: float
    y: float