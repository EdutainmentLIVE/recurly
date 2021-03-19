#!/usr/bin/env sh

# cleanup old cache & own the cache folder for ease of deletion
seed=$(md5sum ".hlint.yaml" | cut --delimiter " " --fields 1)
cache=tools/cache/hlint
mkdir -p "$cache/$seed"
find $cache -mindepth 1 -name "$seed" -prune -o -exec rm -rf {} + || true

. tools/docker-tools-tag.sh
./tools/docker-run.sh "itprotv/hlint:$DOCKER_TOOLS_TAG" tools/for-each.sh tools/hlint.sh --refactor --refactor-options="-i"
