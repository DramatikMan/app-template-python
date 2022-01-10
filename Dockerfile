FROM python:3.10-slim
SHELL ["/bin/bash", "-c"]
WORKDIR /project
ENV PYTHONPATH "${PYTHONPATH}:/project"
COPY pyproject.toml pyproject.toml
COPY scripts scripts
COPY notebook notebook
RUN scripts/poetry_install.sh
CMD scripts/run_jupyter.sh