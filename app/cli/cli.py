import typer as t

from .start import start

entrypoint = t.Typer(name="app")
entrypoint.add_typer(start, name="start")
