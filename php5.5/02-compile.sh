#!/bin/bash

apt-get install -yqq libpcre3-dev libssl-dev
cd ngx_openresty-1.7.10.2

NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)

./configure \
  --sbin-path=/usr/sbin/nginx \
  --conf-path=/etc/nginx/nginx.conf \
  --error-log-path=/var/log/nginx/error.log \
  --http-client-body-temp-path=/var/lib/nginx/body \
  --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
  --http-log-path=/var/log/nginx/access.log \
  --http-proxy-temp-path=/var/lib/nginx/proxy \
  --http-scgi-temp-path=/var/lib/nginx/scgi \
  --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
  --lock-path=/var/lock/nginx.lock \
  --pid-path=/var/run/nginx.pid \
  --with-http_spdy_module \
  --with-http_gzip_static_module \
  --with-http_stub_status_module \
  --with-http_ssl_module \
  --with-http_sub_module \
  --with-ipv6 \
  --with-sha1=/usr/include/openssl \
  --with-md5=/usr/include/openssl \
  --with-http_stub_status_module \
  --with-http_secure_link_module \
  --with-http_sub_module

make -j $NPROC
make install -j $NPROC

rm -rf ngx_openresty-1.7.10.2
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
