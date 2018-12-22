FROM ubuntu:xenial

RUN apt-get update && apt-get install --no-install-recommends -y \
  wget \
  imagemagick \
  ruby-dev \
  build-essential \
  bundler \
  git \
  zlib1g-dev \
  phantomjs \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ryanfb/dzi-dl.git && cd /dzi-dl && bundler install

ADD get_tiles.sh /

ENTRYPOINT ["/get_tiles.sh"]
