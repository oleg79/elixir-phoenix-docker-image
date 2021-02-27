FROM elixir:latest

ARG APP_DIR="/app"
#ARG PROJECT_NAME
#ARG OPTS=""

# externall tools and deps
RUN apt-get update && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh

# install elixir packages
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new --force

WORKDIR $APP_DIR

#RUN mix phx.new $PROJECT_NAME $OPTS
COPY . .

CMD ["mix", "phx.server"]

