from litestar import Litestar, get

from app.schema.api.web import Response


@get("/")
async def index() -> Response:
    return Response(msg="This is a web API response.")


api = Litestar([index])
