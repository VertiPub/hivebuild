#!/bin/sh -ex
# build the artifacts using the hive ant build

#refixing wb-803 for wb-505, this would need to be a community patch, and this is  already changed in hive-0.11
cp ${WORKSPACE}/scripts/data.hive-exec-log4j.properties ${WORKSPACE}/hive/data/conf/hive-log4j.properties
cp ${WORKSPACE}/scripts/ql.hive-exec-log4j.properties ${WORKSPACE}/hive/ql/src/java/conf/hive-exec-log4j.properties
cp ${WORKSPACE}/scripts/pdk.log4j.properties ${WORKSPACE}/hive/pdk/scripts/conf/log4j.properties
cp ${WORKSPACE}/scripts/hive-log4j.properties ${WORKSPACE}/hive/common/src/java/conf/hive-log4j.properties
ant clean package tar -Dhadoop.version=2.0.2-alpha -Dhadoop-0.23.version=2.0.2-alpha -Dhadoop.mr.rev=23 -Dversion=${ARTIFACT_VERSION}
