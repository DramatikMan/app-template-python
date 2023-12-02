#!/bin/bash
docker run \
    --rm \
    --name app-template-python \
    -p '8890:8080' \
    app-template-python:latest \
    start api web
