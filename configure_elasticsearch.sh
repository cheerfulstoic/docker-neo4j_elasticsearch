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
echo "elasticsearch.include_id_field=false" >> conf/neo4j.properties
echo "elasticsearch.include_labels_field=false" >> conf/neo4j.properties

if [[ "${ELASTICSEARCH_URL:-}" =~ ^https?://(.*)$ ]]; then
  /wait-for-it.sh -t "${WAIT_TIMEOUT:-30}" -s "${BASH_REMATCH[1]-}" -- echo "ElasticSearch is ready"
fi

/docker-entrypoint.sh "$@"
