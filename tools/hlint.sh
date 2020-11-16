#! /usr/bin/env sh

# Runs HLint against the given file. Uses a cache to avoid re-running when
# nothing has changed. Meant to be used with a single file as the first
# argument, but can be used however you'd like.
#
# > tools/hlint.sh some-file.hs --color

cache_dir="tools/cache"
mkdir -p $cache_dir

file=$1
shift
key="$cache_dir/hlint-$(cat "$file" ".hlint.yaml" | md5sum | cut --delimiter " " --fields 1)"

if test ! -f "$key"; then
  if hlint "$@" "$file"; then
    touch "$key"
  else
    exit 1
  fi
fi
