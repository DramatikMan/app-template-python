ARG DOCKER_REGISTRY="https://docker.io/library"
FROM python:3.12-slim AS base
SHELL ["/bin/bash", "-c"]
WORKDIR /project
ENV PYTHONPATH "${PYTHONPATH}:/project"
USER 0

RUN apt update \
    && apt install --no-install-recommends -y build-essential \
    && rm -rf /var/lib/apt/lists/*

################## builder ##################
FROM base AS builder
ARG PYTHON_INDEX_URL="https://pypi.org/simple"
ENV PIP_DISABLE_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_INDEX_URL=$PYTHON_INDEX_URL
RUN pip install "pip==23.3.1" --upgrade \
    && pip install "pdm==2.10.4" \
    && pdm config check_update false \
    && pdm config pypi.url $PYTHON_INDEX_URL \
    && pdm config venv.in_project true \
    && mkdir .venv \
    && pdm venv create 3.12

COPY pyproject.toml pdm.lock ./
ARG build_env
RUN bash -c \
    'if [[ "$build_env" == "dev" ]]; then \
        pdm sync --no-editable; \
    else \
        pdm sync --no-editable --prod; \
    fi'

################## final ##################
FROM base AS final
COPY --from=builder /project/.venv /project/.venv
COPY app app
RUN chown -R 0 /project && chmod -R g=u /project
EXPOSE 8080
USER 1001
ENV PATH="/project/.venv/bin"
ENTRYPOINT [".venv/bin/app"]
