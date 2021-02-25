FROM ruby:2.6.5-slim

# install and enable jemalloc
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl \
  imagemagick \
  libjemalloc2 \
  libmariadb-dev \
  nodejs && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

# verify jemalloc is used by ruby
# no output == jemalloc is not enabled
RUN MALLOC_CONF=stats_print:true ruby -e "exit"