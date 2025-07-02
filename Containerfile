FROM alpine:latest AS builder
RUN apk add crystal
RUN apk add \
  alpine-sdk \
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
RUN crystal --version
COPY . .
# RUN make crystal target=aarch64-linux-gnu static=1 release=1 interpreter=1 openssl=1 zlib=1 progress=1
# RUN bin/crystal --version
#
# FROM fedora AS stage1
# RUN sudo dnf -y install \
#   clang \
#   lld \
#   mold \
#   ldd \
#   gcc \
#   gcc-c++ \
#   gc \
#   gc-devel \
#   gmp-devel \
#   libffi-devel \
#   libbsd-devel \
#   libevent-devel \
#   libxml2-devel \
#   libxml2-static \
#   libyaml-devel \
#   llvm-devel \
#   llvm-static \
#   libstdc++-static \
#   make \
#   openssl-devel \
#   pcre2-devel \
#   pcre2-static \
#   redhat-rpm-config \ 
#   zig 
# WORKDIR /opt/crystal
# COPY . .
# COPY --from=builder .build/crystal.o .
# COPY --from=builder bin/crystal ./.build/
# RUN clang crystal.o -o .build/crystal \
#   $(pkg-config bdw-gc libpcre2-8 --libs) \
#   $(llvm-config-20 --libs --system-libs --ldflags) \
#   -lffi \
#   -lm
# RUN ./bin/crystal --version
#
