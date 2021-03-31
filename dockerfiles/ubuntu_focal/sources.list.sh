#!/bin/bash -ex

cat <<EOF
deb $UBUNTU_URL focal main universe
deb $UBUNTU_URL focal-updates main universe
deb $UBUNTU_URL focal-backports main universe
deb $UBUNTU_URL focal-security main universe
deb $CEPH_URL focal main
deb $NECTAR_URL focal main
EOF

if [ ! $OPENSTACK_VERSION = ussuri ]; then
    echo deb $CLOUD_ARCHIVE_URL focal-updates/$OPENSTACK_VERSION main
fi
