#!/usr/bin/env bash

cd ../
docker-compose up -d

ELASTIC_READY=''
while [ ! $ELASTIC_READY ]; do
    ELASTIC_READY=$(curl -v --silent localhost:9200/_cluster/health 2>&1 | grep '\"status\":\"green\"')
    echo $ELASTIC_READY
    echo '.'
    sleep 1
done

docker run -d \
    --name test-node \
    --log-driver syslog \
    --log-opt syslog-address=tcp://localhost:5000 \
    --log-opt syslog-facility=daemon \
    ozlevka/test-node