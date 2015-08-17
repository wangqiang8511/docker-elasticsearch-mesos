#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -it --rm \
	-e ES_CLUSTER_NAME=$ES_CLUSTER_NAME \
	-e ETCD_SERVER=$ETCD_SERVER \
	-e ES_IS_DATA_NODE=false \
	-e ES_IS_MASTER_NODE=false \
	$IMAGE 
