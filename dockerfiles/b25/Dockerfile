FROM alpine:3.12

RUN : \
    && set -eux \
    && apk add --no-cache \
        ccid \
        musl \
        pcsc-lite-libs \
        socat \
        tzdata \
        supervisor \
    && : \
    && mv /etc/supervisord.conf /etc/supervisord.bak.conf \
    && printf '\
[supervisord]\n\
nodaemon=true\n\
user=root\n\
\n\
[program:pcscd]\n\
command=/usr/bin/socat unix-listen:/var/run/pcscd/pcscd.comm,fork tcp-connect:bcas:40774\n\
stderr_logfile=/dev/stderr\n\
stderr_logfile_maxbytes=0\n\
\n\
[program:socat]\n\
command=/usr/bin/socat tcp-listen:40773,fork,reuseaddr system:b25\n\
stderr_logfile=/dev/stderr\n\
stderr_logfile_maxbytes=0\n\
' > /etc/supervisord.conf \
    && : \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        g++\
        make \
        musl-dev \
        nodejs \
        npm \
        pcsc-lite-dev \
        pkgconf \
    && : \
    && (cd /tmp; npm i arib-b25-stream-test) \
    && cp /tmp/node_modules/.bin/arib-b25-stream-test /usr/local/bin/b25 \
    && : \
    # cleanup
    && apk del --purge .build-deps \
    && rm -rf /tmp/* \
    && :

COPY b25-server /usr/local/bin/

EXPOSE 40773
ENTRYPOINT ["b25-server"]
