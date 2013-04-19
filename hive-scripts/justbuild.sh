#!/bin/sh -ex
# build the artifacts using the hive ant build

cp ${WORKSPACE}/hive-scripts/hive-log4j.properties ${WORKSPACE}/hive/common/src/java/conf/hive-log4j.properties
ant clean package tar -Dhadoop.version=2.0.2-alpha -Dhadoop-0.23.version=2.0.2-alpha -Dhadoop.mr.rev=23 -Dversion=${ARTIFACT_VERSION}
