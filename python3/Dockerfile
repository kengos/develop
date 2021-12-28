# syntax=docker/dockerfile:1
FROM python:3.10.1-slim-bullseye

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      build-essential \
      gcc
RUN groupadd -g 999 devuser && \
    useradd -r -u 999 -g devuser devuser
RUN mkdir -p /opt/python && \
    mkdir -p /opt/cache && \
    chown -R devuser:devuser /opt/

USER devuser
ENV HOME="/opt/"
RUN python -m venv /opt/python/venv
ENV PATH="/opt/python/venv/bin:$PATH"
RUN python -m pip install --upgrade pip

WORKDIR /opt/app
COPY ./requirements.txt /opt/app/
RUN --mount=type=cache,target=/opt/cache/.pip_chache pip install --cache-dir /opt/cache/.pip_cache -r requirements.txt
ENTRYPOINT [ "/bin/bash", "-c"]
CMD ["python"]
