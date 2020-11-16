#!/usr/bin/env sh
. tools/docker-tools-tag.sh
./tools/docker-run.sh "itprotv/brittany:$DOCKER_TOOLS_TAG" tools/for-each.sh tools/brittany.sh --write-mode inplace
