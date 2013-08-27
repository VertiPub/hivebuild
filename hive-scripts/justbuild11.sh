#!/bin/sh -ex
# build the artifacts using the hive ant build

#refixing wb-803 for wb-505, this would need to be a community patch, and this is  already changed in hive-0.11
export ANT_OPTS="-XX:MaxPermSize=512m -Xmx1024m"
ant clean package tar -Dhadoop.version=2.0.2-alpha -Dhadoop-0.23.version=2.0.2-alpha -Dhadoop.mr.rev=23 -Dmvn.hadoop.profile=hadoop23 -Dhadoop23.version=2.0.2-alpha
