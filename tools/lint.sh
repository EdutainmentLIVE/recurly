#! /usr/bin/env sh
set -o errexit

say () {
  printf '%s %s\n' "$( date '+%Y-%m-%d %H:%M:%S' )" "$@"
}

die () {
  printf '\033[0;31m*** %s ***\033[0m\n' "$@"
  exit 1
}

printf '%s \033[0;33mFile changed: %s\033[0m\n' "$( date '+%Y-%m-%d %H:%M:%S' )" "$1"
. tools/docker-tools-tag.sh

tools/docker-run.sh "itprotv/hasktags:$DOCKER_TOOLS_TAG" \
  hasktags --ctags --extendedctag --file .tags . &
tools/docker-run.sh "itprotv/hasktags:$DOCKER_TOOLS_TAG" \
  hasktags --etags . &

printf '%s \033[0;33mRunning HLint ...\033[0m\n' "$( date '+%Y-%m-%d %H:%M:%S' )"
tools/docker-run.sh "itprotv/hlint:$DOCKER_TOOLS_TAG" \
  tools/for-each.sh tools/hlint.sh --color --no-summary ||
  die 'HLINT FAILED'

printf '%s \033[0;33mRunning Brittany ...\033[0m\n' "$( date '+%Y-%m-%d %H:%M:%S' )"
tools/docker-run.sh "itprotv/brittany:$DOCKER_TOOLS_TAG" \
  tools/for-each.sh tools/brittany.sh --check-mode ||
  die 'BRITTANY FAILED'

wait
printf '%s \033[0;32mSuccessfully linted!\033[0m\n' "$( date '+%Y-%m-%d %H:%M:%S' )"
