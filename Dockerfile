FROM elasticsearch:1.5.2
MAINTAINER Wang Qiang <qiang.wang@razerzone.com>

# backup ES snapshots to s3
# ref: https://github.com/fabric8io/elasticsearch-cloud-kubernetes
RUN plugin install elasticsearch/elasticsearch-cloud-aws/2.4.1

# copy jars that are required by log rotation
COPY jars/apache-log4j-extras-1.2.17.jar /usr/share/elasticsearch/lib/apache-log4j-extras-1.2.17.jar
COPY jars/hsqldb-1.8.0.7.jar /usr/share/elasticsearch/lib/hsqldb-1.8.0.7.jar

COPY config/logging.yml /usr/share/elasticsearch/config/logging.yml
COPY config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# /usr/share/elasticsearch/data is defined in the original image
VOLUME /usr/share/elasticsearch/logs

COPY etcdctl /
COPY elasticsearch_discovery.sh /
RUN chmod +x /elasticsearch_discovery.sh
COPY etcd_ttl.sh /
RUN chmod +x /etcd_ttl.sh
COPY run.sh /
RUN chmod +x /run.sh

ENV ES_CLUSTER_NAME razeres
ENV ES_HEAP_SIZE 2g
ENV ES_IS_DATA_NODE true
ENV ES_IS_MASTER_NODE true
ENV ES_HTTP_ENABLED true

CMD /run.sh
