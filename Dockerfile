FROM python:slim
SHELL ["/bin/bash", "-c"]
WORKDIR /project
COPY Pipfile .
RUN pip install pipenv
RUN mkdir .venv && pipenv install --skip-lock
RUN pipenv run jt -t onedork
RUN sed -i "s+width: 980px;+width: 97% !important;+g" ~/.jupyter/custom/custom.css
CMD pipenv run jupyter notebook