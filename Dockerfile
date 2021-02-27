FROM elixir:latest

ARG app_dir="/app"

RUN apt-get update && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new --force

WORKDIR $app_dir

COPY . .

CMD ["mix", "phx.server"]

