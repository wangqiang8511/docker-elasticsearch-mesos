#!/bin/bash
/etcd_ttl.sh &>/dev/null &
sleep 2
/elasticsearch_discovery.sh >> /usr/share/elasticsearch/config/elasticsearch.yml 
/usr/share/elasticsearch/bin/elasticsearch
