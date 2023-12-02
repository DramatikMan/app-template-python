#!/bin/bash
docker build \
    --build-arg DOCKER_REGISTRY='https://docker.io/library' \
    --build-arg PYTHON_INDEX_URL='https://pypi.org/simple' \
    -t app-template-python \
    ./
