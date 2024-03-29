#!/usr/bin/env sh

# cleanup old cache & own the cache folder for ease of deletion
seed=$(md5sum "brittany.yaml" | cut --delimiter " " --fields 1)
cache=tools/cache/brittany
mkdir -p "$cache/$seed"
find $cache -mindepth 1 -name "$seed" -prune -o -exec rm -rf {} + || true

. tools/docker-tools-tag.sh
./tools/docker-run.sh "itprotv/brittany:$DOCKER_TOOLS_TAG" tools/for-each.sh tools/brittany.sh --write-mode inplace
