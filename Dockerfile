FROM debian:bookworm-slim AS build

RUN apt update && \
    apt-get install -y build-essential cmake curl libmicrohttpd-dev libjansson-dev \
                       libcurl4-openssl-dev libgcrypt20-dev libsodium-dev \
                       netcat-traditional pkg-config git

ADD ./datum_gateway /parent_dir/datum_gateway
# The submodule's git dir lives in the parent repo. Copy it so the build can
# stamp the Blockvase commit into git_version.h.
ADD ./.git/modules/datum_gateway /parent_dir/.git/modules/datum_gateway
WORKDIR /parent_dir/datum_gateway
RUN git config --global --add safe.directory /parent_dir/datum_gateway \
 && git config --file /parent_dir/.git/modules/datum_gateway/config core.worktree /parent_dir/datum_gateway \
 && git rev-parse --short HEAD
RUN cmake . && make

FROM debian:bookworm-slim AS final

RUN apt update && \
     apt-get install -y curl netcat-traditional libmicrohttpd12 libjansson4 libsodium23

WORKDIR /root

COPY --from=build /parent_dir/datum_gateway/datum_gateway /usr/local/bin/datum_gateway

RUN chmod +x /usr/local/bin/datum_gateway

WORKDIR /root
