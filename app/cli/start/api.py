import subprocess as sp
from typing import Annotated

import typer as t

from app.core import cfg

api = t.Typer(help="API servers.")


@api.command(help="Start web API server.")
def web(
    workers: Annotated[int, t.Option(help="Number of workers.")] = cfg.WEB_API_WORKERS,
    port: Annotated[int, t.Option(help="Server port.")] = cfg.WEB_API_PORT,
) -> None:
    sp.run(
        [
            "gunicorn",
            "app.api:web",
            f"--workers={workers}",
            "--worker-class=uvicorn.workers.UvicornWorker",
            f"--bind=0.0.0.0:{port}",
        ],
        check=True,
    )


if cfg.DEV:

    @api.command(name="web-dev", help="Start development web API server.")
    def web_dev() -> None:
        sp.run(
            [
                "uvicorn",
                "app.api:web",
                "--host=0.0.0.0",
                "--port=8080",
            ],
            check=True,
        )
