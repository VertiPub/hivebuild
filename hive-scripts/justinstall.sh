#!/bin/sh -ex
# deal with the hive artifacts to create a tarball
RPM_VERSION=0.1.0
# have to add a 0 since hive doesn't make it's branch names match it's versions
NAMED_VERSION=${ARTIFACT_VERSION}.0

# convert each tarball into an RPM
DEST_ROOT=${INSTALL_DIR}/opt
mkdir --mode=0755 -p ${DEST_ROOT}
cd ${DEST_ROOT}
tar -xvzpf ${WORKSPACE}/hive/build/hive-${NAMED_VERSION}.tar.gz
mkdir --mode=0755 -p ${INSTALL_DIR}/etc
mv ${INSTALL_DIR}/opt/hive-${NAMED_VERSION}/conf ${INSTALL_DIR}/etc/hive-${NAMED_VERSION}
cd ${INSTALL_DIR}/opt/hive-${NAMED_VERSION}
ln -s /etc/hive-${NAMED_VERSION} conf

# convert all the etc files to config files
cd ${INSTALL_DIR}
export CONFIG_FILES=""
find etc -type f -print | awk '{print "/" $1}' > /tmp/$$.files
for i in `cat /tmp/$$.files`; do CONFIG_FILES="--config-files $i $CONFIG_FILES "; done
export CONFIG_FILES
rm -f /tmp/$$.files


cd ${RPM_DIR}

export RPM_NAME=vcc-hive-${ARTIFACT_VERSION}
fpm --verbose \
--maintainer ops@verticloud.com \
--vendor VertiCloud \
--provides ${RPM_NAME} \
--description "${DESCRIPTION}" \
--replaces vcc-hive \
-s dir \
-t rpm \
-n ${RPM_NAME} \
-v ${RPM_VERSION} \
--iteration ${DATE_STRING} \
${CONFIG_FILES} \
--rpm-user root \
--rpm-group root \
-C ${INSTALL_DIR} \
opt etc
