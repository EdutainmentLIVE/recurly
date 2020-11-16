#! /usr/bin/env sh
set -o errexit

# This script runs another script over all the relevant Haskell files. It runs
# in parallel. Pass the script you want to run as the first argument. That
# script will get the file as it's first argument, then all the other arguments
# you passed in. For example:
#
# > tools/for-each.sh echo wow
# test/Test.hs wow
# ...

script=$1
shift
# number of cpu cores - 1
cpus=$(($(ls -d /sys/devices/system/cpu/cpu[[:digit:]]* | wc -w) - 1))

find library -name '*.hs' -print0 |
  xargs -I{} --max-args 1 --max-procs "$cpus" --null \
    "$script" {} "$@"
