ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}

ARG PROJECT_NAME=code
ARG PYTHON_VERSION=3.9
ARG APPLICATION_DIRECTORY=/home/user/code

ENV DEBIAN_FRONTEND="noninteractive" \
    LC_ALL="C.UTF-8" \
    LANG="C.UTF-8" \
    PYTHONPATH=${APPLICATION_DIRECTORY}

RUN apt update && apt install --no-install-recommends -y software-properties-common 
RUN apt-get install -y libgl1-mesa-dev build-essential libssl-dev libffi-dev python3-dev
RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt update && apt install --no-install-recommends -y \
    git curl make ssh openssh-client \
    python${PYTHON_VERSION} python3-pip python-is-python3

# Following is needed to swtich default python3 version
# For detail, please check following link https://unix.stackexchange.com/questions/410579/change-the-python3-default-version-in-ubuntu
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python${PYTHON_VERSION} 1 \
    && update-alternatives --set python3 /usr/bin/python${PYTHON_VERSION} \
    # `requests` needs to be upgraded to avoid RequestsDependencyWarning
    # ref: https://stackoverflow.com/questions/56155627/requestsdependencywarning-urllib3-1-25-2-or-chardet-3-0-4-doesnt-match-a-s
    && python3 -m pip install --upgrade pip setuptools requests \
    && python3 -m pip install poetry

WORKDIR ${APPLICATION_DIRECTORY}
COPY pyproject.toml poetry.lock ./
RUN poetry config installer.max-workers 10
RUN poetry install --no-root