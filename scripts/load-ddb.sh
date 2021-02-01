#!/bin/bash

set -e
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ..

IMPORT_DATA_DIR=`pwd`/data/social-network-preprocessed
DUCKDB_DIR=`pwd`/ddb-scratch
DUCKDB_BINARY=`pwd`/ddb-scratch/duckdb

rm -f ${DUCKDB_DIR}/ldbc.duckdb*
cat ddb/schema.sql | ${DUCKDB_BINARY} ${DUCKDB_DIR}/ldbc.duckdb
sed "s|PATHVAR|${IMPORT_DATA_DIR}|" ddb/snb-load.sql | ${DUCKDB_BINARY} ${DUCKDB_DIR}/ldbc.duckdb
