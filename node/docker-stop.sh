#!/usr/bin/env bash

cd ../


docker rm $(docker kill test-node)

echo $(curl -X DELETE localhost:9200/logstash-*)

docker-compose kill
docker-compose rm -f