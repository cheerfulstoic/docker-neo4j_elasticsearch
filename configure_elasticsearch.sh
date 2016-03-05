#!/bin/bash -eu
echo "elasticsearch.host_name=${ELASTICSEARCH_URL-}" >> conf/neo4j.properties
echo "elasticsearch.index_spec=${ELASTICSEARCH_NEO4J_INDEX-}" >> conf/neo4j.properties

/docker-entrypoint.sh "$@"
