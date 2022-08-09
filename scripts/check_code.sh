#!/bin/bash

poetry exec autoflake $1
poetry exec isort $1
poetry exec black $1
poetry exec flake8 $1
poetry exec mypy $1