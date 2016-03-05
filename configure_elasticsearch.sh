#!/bin/bash -eu

if [ -z "${ELASTICSEARCH_URL:-}" ]; then
  echo "You must provide a value for ELASTICSEARCH_URL"
  exit 1
elif [ -z "${ELASTICSEARCH_NEO4J_INDEX:-}" ]; then
  echo "You must provide a value for ELASTICSEARCH_NEO4J_INDEX"
  exit 1
fi

echo "elasticsearch.host_name=${ELASTICSEARCH_URL-}" >> conf/neo4j.properties
echo "elasticsearch.index_spec=${ELASTICSEARCH_NEO4J_INDEX-}" >> conf/neo4j.properties

/docker-entrypoint.sh "$@"
