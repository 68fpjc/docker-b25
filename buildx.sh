#! /bin/bash

docker buildx create --name mybuilder

docker buildx build --builder mybuilder --platform linux/arm/v7 \
--output type=tar,dest=linux_arm_v7-b25-2021-01-23.tar \
"$(dirname $0)"/dockerfiles/b25/
docker buildx build --builder mybuilder --platform linux/arm/v7 \
--output type=tar,dest=linux_arm_v7-bcas-2021-01-23.tar \
"$(dirname $0)"/dockerfiles/bcas/
