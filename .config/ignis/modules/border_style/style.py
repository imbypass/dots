
from pydantic import BaseModel
from .styling import Borders

class Style(BaseModel):
    borders: Borders
