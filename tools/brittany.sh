#! /usr/bin/env sh

# Runs Brittany against the given file. Uses a cache to avoid re-running when
# nothing has changed. Meant to be used with a single file as the first
# argument, but can be used however you'd like.
#
# > tools/brittany.sh some-file.hs --write-mode inplace

seed=$(md5sum brittany.yaml | cut --delimiter " " --fields 1)
file=$1
shift
cache=tools/cache/brittany/$seed
key="$cache/$(md5sum "$file" | cut --delimiter " " --fields 1)"

mkdir -p "$cache"

if test ! -f "$key"; then
  if brittany "$@" "$file"; then
    touch "$key"
  else
    exit 1
  fi
fi
