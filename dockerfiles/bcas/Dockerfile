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
[program:pcscd1]\n\
command=/usr/sbin/pcscd --foreground\n\
\n\
[program:socat2]\n\
command=/usr/bin/socat tcp-listen:40774,fork,reuseaddr unix-connect:/var/run/pcscd/pcscd.comm\n\
' > /etc/supervisord.conf \
    && :

EXPOSE 40774
ENTRYPOINT ["supervisord"]
