#!/bin/sh -ex
# build the artifacts using the hive ant build
# set the hadoop version for the lowest common denominator and let it be overridden by env
# sepcify $ADDITIONAL_OPTIONS for any fixed options "-Dskip.javadoc=true", for instance
export HADOOP_VERSION=${HADOOP_VERSION:-2.0.5-alpha}

#refixing wb-803 for wb-505, this would need to be a community patch, and this is  already changed in hive-0.11
export ANT_OPTS="-XX:MaxPermSize=512m -Xmx1024m"
ant clean package tar -Dhadoop.version=${HADOOP_VERSION} -Dhadoop-0.23.version=2.0.2-alpha -Dhadoop.mr.rev=23 -Dmvn.hadoop.profile=hadoop23 -Dhadoop23.version=2.0.2-alpha ${ADDITIONAL_OPTIONS}
