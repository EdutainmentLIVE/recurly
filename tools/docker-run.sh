#! /usr/bin/env sh

# Runs something in an ephemeral Docker container. The first argument is the
# image to use and everything else is used as the command in that image. For
# example:
#
# > tools/docker-run.sh haskell:8.10.2 ghc -e 'putStrLn "Hello, world!"'
#
# The Docker container will have the current directory mounted as a volume.
# That directory will be the working directory too.

exec docker run \
  --env LANG=C.UTF-8 \
  --net host \
  --rm \
  --volume "$(pwd):$(pwd)" \
  --workdir "$(pwd)" \
  "$@"
