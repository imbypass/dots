
from pydantic import BaseModel
from styling.borders import Borders


class Style(BaseModel):
    borders: Borders