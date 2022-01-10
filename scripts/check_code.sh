#!/bin/bash

echo "### STATIC TYPE CHECKING ###"
poetry run mypy \
    ${PWD}/notebook \
    --ignore-missing-imports \
    --show-error-codes \
    --strict

echo

echo '### LINTING ###'
poetry run flake8 \
    ${PWD}/notebook \
    --count \
    --statistics \
    --show-source