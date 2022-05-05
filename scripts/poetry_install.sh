#!/bin/bash
set -e

pip install poetry
pip install poetry-exec-plugin
poetry config virtualenvs.in-project true

mkdir .venv
poetry install --no-root