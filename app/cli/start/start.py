import typer as t

from .api import api

start = t.Typer(help="Application start.")
start.add_typer(api, name="api")
