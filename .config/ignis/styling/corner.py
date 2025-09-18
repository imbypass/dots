
from typing import Optional
from pydantic import BaseModel


class Corner(BaseModel):
    enabled: bool
    radius: Optional[float] = None