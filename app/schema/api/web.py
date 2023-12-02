from typing import Annotated

from pydantic import BaseModel, Field


class Response(BaseModel):
    msg: Annotated[str, Field(min_length=1, strict=True)]
