#! /bin/bash

pushd "$(dirname $0)"

docker buildx create --name b25

# b25
docker buildx build --builder mybuilder --platform linux/arm/v7 --load \
--tag 68fpjc/b25:latest-armhf \
dockerfiles/b25/

# bcas
docker buildx build --builder mybuilder --platform linux/arm/v7 --load \
--tag 68fpjc/bcas:latest-armhf \
dockerfiles/bcas/

popd

