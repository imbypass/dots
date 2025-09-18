
from typing import Optional
from pydantic import BaseModel


class Border(BaseModel):
    enabled: bool
    width: Optional[float] = None
    height: Optional[float] = None