#!/usr/bin/env bash

set -e

if [ "${1}" ]
then
    DOCKER_USER=${1}
else
    DOCKER_USER=${USER}
fi

# .NET Core latest
docker build \
       --force-rm \
       --tag "${DOCKER_USER}/dotnet:latest" \
       .

# .NET Core 1.1
docker build \
       --force-rm \
       --tag "${DOCKER_USER}/dotnet:1.1" \
       1.1

# .NET Core 2.0.0
docker build \
       --force-rm \
       --tag "${DOCKER_USER}/dotnet:2.0.0" \
       2.0.0

# Tests
clear
COMMAND='/usr/local/bin/dotnet --version'
echo -n 'latest: ' && \
    docker run \
           --rm "${DOCKER_USER}/dotnet:latest" \
           bash -c "${COMMAND}"
echo -n '1.1: ' && \
    docker run \
           --rm "${DOCKER_USER}/dotnet:1.1" \
           bash -c "${COMMAND}"
echo -n '2.0.0: ' && \
    docker run \
           --rm "${DOCKER_USER}/dotnet:2.0.0" \
           bash -c "${COMMAND}"
# EOF
