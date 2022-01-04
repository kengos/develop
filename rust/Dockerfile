FROM rust:1.57.0-slim-bullseye

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
      build-essential \
      gcc \
      git \
      less \
      vim \
      zsh \
      locales-all
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja\
    LC_ALL=ja_JP.UTF-8
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN groupadd -g 999 devuser && \
    useradd -m -u 999 -g devuser -s /bin/zsh devuser

RUN rustup component add rustfmt rust-analysis rust-src rls
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

USER devuser
WORKDIR /home/devuser/workspace
ENTRYPOINT ["entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
