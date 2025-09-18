
from typing import Optional
from pydantic import BaseModel

from styling.border import Border
from styling.corners import Corners
from styling.gradients import Gradients


class Borders(BaseModel):
    enabled: bool
    color: str
    gradient: Optional[Gradients] = None
    gap: float
    top: Border
    left: Border
    right: Border
    bottom: Border
    corners: Corners