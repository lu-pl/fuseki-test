#!/bin/bash

/docker-entrypoint.sh &


echo "Waiting for Fuseki."
until curl -f http://localhost:3030/ 2>/dev/null; do
    echo "Waiting..."
    sleep 2
done

echo "Fuseki is ready."

curl -X POST -H "Content-Type: text/turtle" --data-binary @/data/graph1.ttl "http://localhost:3030/ds/data?graph=http://example.org/graph1"
curl -X POST -H "Content-Type: text/turtle" --data-binary @/data/graph2.ttl "http://localhost:3030/ds/data?graph=http://example.org/graph2"

echo "Data ingest successful."

tail -f /dev/null
