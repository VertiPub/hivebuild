#!/bin/sh -ex
# build the artifacts using the hive ant build

ant clean package tar -Dhadoop.version=2.0.2-alpha -Dhadoop-0.23.version=2.0.2-alpha -Dhadoop.mr.rev=23 -Dversion=${ARTIFACT_VERSION}
