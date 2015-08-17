#!/bin/bash
/etcd_ttl.sh &>/dev/null &
/elasticsearch_discovery.sh >> /usr/share/elasticsearch/config/elasticsearch.yml 
/usr/share/elasticsearch/bin/elasticsearch
