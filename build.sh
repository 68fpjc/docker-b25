#! /bin/bash

docker build --tag 68fpjc/b25:2021-01-23 --tag 68fpjc/b25:latest \
"$(dirname $0)"/dockerfiles/b25/
docker build --tag 68fpjc/bcas:2021-01-23 --tag 68fpjc/bcas:latest \
"$(dirname $0)"/dockerfiles/bcas/
