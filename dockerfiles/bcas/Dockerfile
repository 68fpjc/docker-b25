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
command=/usr/sbin/pcscd --foreground\n\
stderr_logfile=/dev/stderr\n\
stderr_logfile_maxbytes=0\n\
\n\
[program:bcas-listener]\n\
command=/usr/bin/socat tcp-listen:40774,fork,reuseaddr unix-connect:/var/run/pcscd/pcscd.comm\n\
stderr_logfile=/dev/stderr\n\
stderr_logfile_maxbytes=0\n\
' > /etc/supervisord.conf \
    && :

EXPOSE 40774
ENTRYPOINT ["supervisord"]
