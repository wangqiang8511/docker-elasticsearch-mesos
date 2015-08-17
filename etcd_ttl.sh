#!/bin/bash

ETCD_SERVER=${ETCD_SERVER:-"http://localhost:4001"}
ES_CLUSTER_NAME=${ES_CLUSTER_NAME:-"test"}

while true;
do
    curl -L -XPUT "$ETCD_SERVER/v2/keys/es/$ES_CLUSTER_NAME/$(hostname -f)" -d value=$(hostname -i) -d ttl=10
    sleep 5
done
