#! /bin/bash

[ -z "${BUILDCMD}" ] && BUILDCMD="docker build"
${BUILDCMD} "$(dirname $0)"/dockerfiles/b25/ --tag 68fpjc/b25:2021-01-23 \
&& docker image tag 68fpjc/b25:2021-01-23 68fpjc/b25
${BUILDCMD} "$(dirname $0)"/dockerfiles/bcas/ --tag 68fpjc/bcas:2021-01-23 \
&& docker image tag 68fpjc/bcas:2021-01-23 68fpjc/bcas
