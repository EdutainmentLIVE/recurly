#! /usr/bin/env sh

# Runs Brittany against the given file. Uses a cache to avoid re-running when
# nothing has changed. Meant to be used with a single file as the first
# argument, but can be used however you'd like.
#
# > tools/brittany.sh some-file.hs --write-mode inplace

cache_dir="tools/cache"
mkdir -p $cache_dir

file=$1
shift
key="$cache_dir/brittany-$(cat "$file" "brittany.yaml" | md5sum | cut --delimiter " " --fields 1)"

if test ! -f "$key"; then
  if brittany "$@" "$file"; then
    touch "$key"
  else
    exit 1
  fi
fi
