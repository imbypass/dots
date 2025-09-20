from typing import Optional
from pydantic import BaseModel

class Borders(BaseModel):
    color: str
    gap: float
    size: float
