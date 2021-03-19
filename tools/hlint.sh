#! /usr/bin/env sh

# Runs HLint against the given file. Uses a cache to avoid re-running when
# nothing has changed. Meant to be used with a single file as the first
# argument, but can be used however you'd like.
#
# > tools/hlint.sh some-file.hs --color

seed=$(md5sum .hlint.yaml | cut --delimiter " " --fields 1)
file=$1
shift
cache=tools/cache/hlint/$seed
key="$cache/$(md5sum "$file" | cut --delimiter " " --fields 1)"

mkdir -p "$cache"

if test ! -f "$key"; then
  if hlint "$@" "$file"; then
    touch "$key"
  else
    exit 1
  fi
fi
