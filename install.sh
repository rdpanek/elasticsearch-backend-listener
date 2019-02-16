#!/bin/bash

curl -L -o elasticsearch-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/elasticsearch/6.3.1/elasticsearch-6.3.1.jar" && \
curl -L -o transport-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/client/transport/6.3.1/transport-6.3.1.jar" && \
curl -L -o elasticsearch-x-content-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/elasticsearch-x-content/6.3.1/elasticsearch-x-content-6.3.1.jar" && \
curl -L -o elasticsearch-core-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/elasticsearch-core/6.3.1/elasticsearch-core-6.3.1.jar" && \
curl -L -o reindex-client-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/reindex-client/6.3.1/reindex-client-6.3.1.jar" && \
curl -L -o percolator-client-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/percolator-client/6.3.1/percolator-client-6.3.1.jar" && \
curl -L -o lang-mustache-client-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/lang-mustache-client/6.3.1/lang-mustache-client-6.3.1.jar" && \
curl -L -o parent-join-client-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/parent-join-client/6.3.1/parent-join-client-6.3.1.jar" && \
curl -L -o hppc-0.8.1.jar "http://central.maven.org/maven2/com/carrotsearch/hppc/0.8.1/hppc-0.8.1.jar" && \
curl -L -o jackson-core-2.8.11.jar "http://central.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.8.11/jackson-core-2.8.11.jar" && \
curl -L -o transport-netty3-client-5.6.12.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/transport-netty3-client/5.6.12/transport-netty3-client-5.6.12.jar" && \
curl -L -o transport-netty4-client-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/transport-netty4-client/6.3.1/transport-netty4-client-6.3.1.jar" && \
curl -L -o joda-time-2.10.jar "http://central.maven.org/maven2/joda-time/joda-time/2.10/joda-time-2.10.jar" && \
curl -L -o netty-all-4.1.30.Final.jar "http://central.maven.org/maven2/io/netty/netty-all/4.1.30.Final/netty-all-4.1.30.Final.jar" && \
curl -L -o lucene-core-7.3.1.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-core/7.3.1/lucene-core-7.3.1.jar" && \
curl -L -o lucene-sandbox-7.3.1.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-sandbox/7.3.1/lucene-sandbox-7.3.1.jar" && \
curl -L -o elasticsearch-cli-6.3.1.jar "http://central.maven.org/maven2/org/elasticsearch/elasticsearch-cli/6.3.1/elasticsearch-cli-6.3.1.jar" && \
curl -L -o lucene-highlighter-7.3.1.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-highlighter/7.3.1/lucene-highlighter-7.3.1.jar" && \
curl -L -o lucene-join-7.3.1.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-join/7.3.1/lucene-join-7.3.1.jar" && \
curl -L -o lucene-queryparser-7.3.1.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-queryparser/7.3.1/lucene-queryparser-7.3.1.jar" && \
curl -L -o lucene-queries-7.3.1.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-queries/7.3.1/lucene-queries-7.3.1.jar" && \
curl -L -o t-digest-3.2.jar "http://central.maven.org/maven2/com/tdunning/t-digest/3.2/t-digest-3.2.jar" && \

# Download Elasticsearch BackendListener
cd ext/ && \
curl -L -o ElasticSearchBackendListenerClient.jar "https://github.com/rdpanek/elasticsearch-backend-listener/raw/8768c56925dc1148bbf53ce75527b95a7215677e/out/artifacts/ElasticSearchBackendListenerClient_jar/ElasticSearchBackendListenerClient.jar"
