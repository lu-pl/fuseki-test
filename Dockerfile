FROM secoresearch/fuseki

USER root

RUN apk --no-cache add curl

COPY graph1.ttl /data/graph1.ttl
COPY graph2.ttl /data/graph2.ttl

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3030