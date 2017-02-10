#!/bin/bash

curl -L -o elasticsearch-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/elasticsearch/5.0.0/elasticsearch-5.0.0.jar" && \
curl -L -o transport-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/client/transport/5.0.0/transport-5.0.0.jar" && \
curl -L -o transport-netty3-client-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/transport-netty3-client/5.0.0/transport-netty3-client-5.0.0.jar" && \
curl -L -o transport-netty4-client-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/transport-netty4-client/5.0.0/transport-netty4-client-5.0.0.jar" && \
curl -L -o reindex-client-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/reindex-client/5.0.0/reindex-client-5.0.0.jar" && \
curl -L -o percolator-client-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/percolator-client/5.0.0/percolator-client-5.0.0.jar" && \
curl -L -o lang-mustache-client-5.0.0.jar "http://central.maven.org/maven2/org/elasticsearch/plugin/lang-mustache-client/5.0.0/lang-mustache-client-5.0.0.jar" && \
curl -L -o hppc-0.7.1.jar "http://central.maven.org/maven2/com/carrotsearch/hppc/0.7.1/hppc-0.7.1.jar" && \
curl -L -o lucene-core-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-core/6.3.0/lucene-core-6.3.0.jar" && \
curl -L -o log4j-api-2.6.2.jar "http://central.maven.org/maven2/org/apache/logging/log4j/log4j-api/2.6.2/log4j-api-2.6.2.jar" && \
curl -L -o lucene-queries-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-queries/6.3.0/lucene-queries-6.3.0.jar" && \
curl -L -o lucene-join-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-join/6.3.0/lucene-join-6.3.0.jar" && \
curl -L -o lucene-suggest-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-suggest/6.3.0/lucene-suggest-6.3.0.jar" && \
curl -L -o lucene-highlighter-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-highlighter/6.3.0/lucene-highlighter-6.3.0.jar" && \
curl -L -o lucene-queryparser-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-queryparser/6.3.0/lucene-queryparser-6.3.0.jar" && \
curl -L -o lucene-spatial-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-spatial/6.3.0/lucene-spatial-6.3.0.jar" && \
curl -L -o lucene-sandbox-6.3.0.jar "http://central.maven.org/maven2/org/apache/lucene/lucene-sandbox/6.3.0/lucene-sandbox-6.3.0.jar" && \
curl -L -o netty-all-4.1.6.Final.jar "http://central.maven.org/maven2/io/netty/netty-all/4.1.6.Final/netty-all-4.1.6.Final.jar" && \
curl -L -o log4j-core-2.6.2.jar "http://central.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.6.2/log4j-core-2.6.2.jar" && \
curl -L -o t-digest-3..1.jar "http://central.maven.org/maven2/com/tdunning/t-digest/3.1/t-digest-3.1.jar" && \
# Remove old .jar
rm -rf netty-all-4.0.27.Final.jar

# Download Elasticsearch BackendListener
cd ext/ && \
curl -L -o ElasticSearchBackendListenerClient.jar "https://github.com/test-stack/elasticSearchBackendListenerClient/blob/master/out/artifacts/ElasticSearchBackendListenerClient_jar/ElasticSearchBackendListenerClient.jar?raw=true"
