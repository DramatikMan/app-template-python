FROM python:slim AS base
SHELL ["/bin/bash", "-c"]
WORKDIR /project
COPY Pipfile .
RUN pip install pipenv
RUN mkdir .venv && pipenv install --skip-lock

FROM base AS final
COPY . .
CMD pipenv run jupyter notebook