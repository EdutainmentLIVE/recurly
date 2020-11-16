#! /usr/bin/env sh
set -o errexit

say() {
  echo "$(date '+%Y-%m-%d %H:%M:%S')" "$@"
}

die() {
  printf '\033[0;31m*** %s ***\033[0m\n' "$@"
  exit 1
}

say "File changed: $1"
. tools/docker-tools-tag.sh

tools/docker-run.sh "itprotv/hasktags:$DOCKER_TOOLS_TAG" \
  hasktags --ctags --extendedctag --file .tags . &
tools/docker-run.sh "itprotv/hasktags:$DOCKER_TOOLS_TAG" \
  hasktags --etags . &

say 'Running HLint ...'
tools/docker-run.sh "itprotv/hlint:$DOCKER_TOOLS_TAG" \
  tools/for-each.sh tools/hlint.sh --color --no-summary ||
  die 'HLINT FAILED'

say 'Running Brittany ...'
tools/docker-run.sh "itprotv/brittany:$DOCKER_TOOLS_TAG" \
  tools/for-each.sh tools/brittany.sh --check-mode ||
  die 'BRITTANY FAILED'

wait
say 'Done. Waiting for file changes.'
