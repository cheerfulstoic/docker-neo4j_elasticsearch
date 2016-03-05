## Description
This image is based off of the `neo4j:2.3.2` image and is intended to wire up [neo4j](http://neo4j.com/) with the [ElasticSearch](http://neo4j.com/developer/elastic-search/) plugin as well as configure the neo4j container to talk to it. It allows you to pass in the `ELASTICSEARCH_URL` to point to as well as the `ELASTICSEARCH_NEO4J_INDEX` configuration for neo4j.

The image will [`wait-for-it`](https://github.com/vishnubob/wait-for-it) (30 seconds by default) on the `ELASTICSEARCH_URL` to be ready before moving on successfully to start up neo4j. This is in case you are using this in addition to a `docker-compose` with your ElasticSearch instance and want neo4j to wait until that is ready.

## Arguments
- `ELASTICSEARCH_URL` - The URL of your ElasticSearch endpoint (required). Example: `-e "ELASTICSEARCH_URL=http://some-endpoint:9200"`
- `ELASTICSEARCH_NEO4J_INDEX` - The index definition for neo4j (required). Example: `-e "ELASTICSEARCH_NEO4J_INDEX=people:Person(first_name,last_name)"`
- `WAIT_TIMEOUT` - How long to wait for ElasticSearch to be ready (optional, default=30). Example: `-e "WAIT_TIMEOUT=37"`
