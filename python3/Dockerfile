# syntax=docker/dockerfile:1
FROM python:3.10.1-slim-bullseye

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      build-essential \
      git \
      gcc \
      zsh \
      less \
      vim \
      locales-all
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja\
    LC_ALL=ja_JP.UTF-8
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN groupadd -g 999 devuser && \
    useradd -m -u 999 -g devuser -s /bin/zsh devuser
RUN mkdir -p /opt/python && \
    mkdir -p /opt/cache && \
    chown -R devuser:devuser /opt/
RUN python -m pip install --upgrade pip
COPY ./requirements.txt /opt/python/
RUN --mount=type=cache,target=/opt/cache/.pip_chache pip install --cache-dir /opt/cache/.pip_cache -r /opt/python/requirements.txt

COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

USER devuser
WORKDIR /home/devuser/workspace
ENTRYPOINT ["entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
