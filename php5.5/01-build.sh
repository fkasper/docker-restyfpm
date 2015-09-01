#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl perl make build-essential procps nginx \
  libreadline-dev libncurses5-dev libpcre3-dev libssl-dev supervisor \
  && rm -rf /var/lib/apt/lists/*

curl -sSL http://openresty.org/download/ngx_openresty-1.7.10.2.tar.gz | tar -xvz
