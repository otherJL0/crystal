FROM alpine:latest
RUN apk add crystal
RUN apk add \
  gc-dev gc-static \
  gcc \
  gmp-dev \
  libatomic_ops \
  musl-dev \
  libxml2-dev libxml2-static \
  llvm20-dev llvm20-static \
  openssl-dev \
  pcre2-dev pcre2-static \
  tzdata \
  yaml-dev \
  zlib-dev zlib-static \
  zstd-dev zstd-static
RUN apk add alpine-sdk
RUN crystal --version
COPY . .
RUN make crystal target=aarch64-linux-gnu static=1 release=1 interpreter=1 openssl=1 zlib=1 progress=1
RUN bin/crystal --version
