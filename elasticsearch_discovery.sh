#!/bin/bash

ETCD_SERVER=${ETCD_SERVER:-"http://localhost:4001/v2/keys"}
ES_CLUSTER_NAME=${ES_CLUSTER_NAME:-"test"}

HOSTS=$(/etcdctl --peers="$ETCD_SERVER" ls /es/$ES_CLUSTER_NAME 2>/dev/null)

init_str="discovery.zen.ping.unicast.hosts: ["

host_ips=()
for h in $HOSTS
do
    host_ip=$(/etcdctl --peers="$ETCD_SERVER" get /$h)
    host_ips+=($host_ip)
done

hosts_ip_str=$(printf ", %s" "${host_ips[@]}")
hosts_ip_str=${hosts_ip_str:2}

host_list=$init_str$hosts_ip_str"]"
echo $host_list
