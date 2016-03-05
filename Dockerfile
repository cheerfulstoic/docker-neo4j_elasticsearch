FROM neo4j:2.3.2

MAINTAINER Levi Wilson

RUN apt-get update

COPY plugins/* /plugins/

COPY configure_elasticsearch.sh /configure_elasticsearch.sh
COPY wait-for-it.sh /wait-for-it.sh

ENTRYPOINT ["/configure_elasticsearch.sh"]
CMD ["neo4j"]
