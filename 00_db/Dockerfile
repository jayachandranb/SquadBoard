FROM neo4j:latest

USER root

RUN apt-get update -y && \
    apt-get install wget -y && \
    rm -rf /var/lib/apt/lists/*

USER neo4j

ENV NEO4J_AUTH=neo4j/letmein

ENV APOC_VERSION 3.5.0.4
ENV APOC_URI https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/${APOC_VERSION}/apoc-${APOC_VERSION}-all.jar
RUN wget -P /var/lib/neo4j/plugins ${APOC_URI}

ENV GRAPH_ALGO_VERSION 3.5.4.0
ENV GRAPH_ALGO_URI https://github.com/neo4j-contrib/neo4j-graph-algorithms/releases/download/${GRAPH_ALGO_VERSION}/graph-algorithms-algo-${GRAPH_ALGO_VERSION}.jar
RUN wget -P /var/lib/neo4j/plugins ${GRAPH_ALGO_URI}

ENV GRAPHQL_VERSION 3.5.0.4
ENV GRAPHQL_URI https://github.com/neo4j-graphql/neo4j-graphql/releases/download/${GRAPHQL_VERSION}/neo4j-graphql-${GRAPHQL_VERSION}.jar
RUN wget -P /var/lib/neo4j/plugins ${GRAPHQL_URI}

RUN echo 'dbms.unmanaged_extension_classes=org.neo4j.graphql=/graphql' >> /var/lib/neo4j/conf/neo4j.conf

EXPOSE 7474 7473 7687

CMD ["neo4j"]