#! /bin/bash

[ -z "${BUILDCMD}" ] && BUILDCMD="docker build"
${BUILDCMD} "$(dirname $0)"/dockerfiles/b25/ --tag 68fpjc/b25:2024-07-14 \
&& docker image tag 68fpjc/b25:2024-07-14 68fpjc/b25
