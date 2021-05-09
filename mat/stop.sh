#!/bin/bash

set -eu
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ..

. mat/vars.sh

docker stop ${MATERIALIZE_CONTAINER_NAME} || echo "No container ${MATERIALIZE_CONTAINER_NAME} found"
