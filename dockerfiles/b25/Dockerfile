FROM debian:bookworm-slim

WORKDIR /app
RUN : \
    && set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends supervisor socat ca-certificates wget \
    \
    # recisdb
    && wget https://github.com/kazuki0824/recisdb-rs/releases/download/1.2.1/recisdb_1.2.1-1_$(dpkg --print-architecture).deb \
    && apt-get install -y ./recisdb_1.2.1-1_$(dpkg --print-architecture).deb \
    \
    # cleanup
    && rm recisdb_1.2.1-1_$(dpkg --print-architecture).deb \
    && apt-get remove -y ca-certificates wget \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && :
COPY supervisord.conf .
COPY b25-server .

EXPOSE 40773
ENTRYPOINT ["/app/b25-server"]
