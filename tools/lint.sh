#! /usr/bin/env sh
set -o errexit

say () {
  echo "$( date '+%Y-%m-%d %H:%M:%S' )" "$@"
}

die () {
  printf '\033[0;31m*** %s ***\033[0m\n' "$@"
  exit 1
}

say "File changed: $1"

tools/docker-run.sh itprotv/hasktags:205f940704c81e1ad511dba4b6e5b28426952e2a \
  hasktags --ctags --extendedctag --file .tags . &
tools/docker-run.sh itprotv/hasktags:205f940704c81e1ad511dba4b6e5b28426952e2a \
  hasktags --etags . &

say 'Running HLint ...'
tools/docker-run.sh itprotv/hlint:205f940704c81e1ad511dba4b6e5b28426952e2a \
  tools/for-each.sh tools/hlint.sh --color --no-summary ||
  die 'HLINT FAILED'

say 'Running Brittany ...'
tools/docker-run.sh itprotv/brittany:205f940704c81e1ad511dba4b6e5b28426952e2a \
  tools/for-each.sh tools/brittany.sh --check-mode ||
  die 'BRITTANY FAILED'

wait
say 'Done. Waiting for file changes.'
