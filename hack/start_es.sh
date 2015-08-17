#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -it --rm \
	-e ES_CLUSTER_NAME=$ES_CLUSTER_NAME \
	-e ETCD_SERVER=$ETCD_SERVER \
	$IMAGE 
