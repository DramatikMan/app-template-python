FROM python:slim
SHELL ["/bin/bash", "-c"]
WORKDIR /project
COPY Pipfile .
RUN pip install pipenv
RUN mkdir .venv && pipenv install --skip-lock
CMD pipenv run jupyter notebook