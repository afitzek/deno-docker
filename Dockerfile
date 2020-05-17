FROM debian:buster-slim as build

WORKDIR /tmp

RUN apt update && apt install --yes curl unzip

env DENO_VERSION v1.0.0

RUN curl -fsSL https://deno.land/x/install/install.sh > install.sh && /bin/sh install.sh $DENO_VERSION && rm -rf /tmp/*

env DENO_INSTALL="/root/.deno"
env PATH="$DENO_INSTALL/bin:$PATH"
