#!/bin/bash

set -ex


# virtualenv 16.4.0 fixed symlink handling. The interaction of the new
# corrected behavior with legacy bugs in packaged virtualenv releases in
# distributions means we need to hold on to the pip bootstrap installation
# chain to preserve symlinks. As distributions upgrade their default
# installations we may not need this workaround in the future
PIPBOOTSTRAP=/var/lib/pipbootstrap

# Create the boostrap environment so we can get pip from virtualenv
python3 -m virtualenv --python=python3 ${PIPBOOTSTRAP}
source ${PIPBOOTSTRAP}/bin/activate

# Install setuptools explicitly required for virtualenv > 20 installation
pip install --upgrade pip setuptools

# Upgrade to the latest version of virtualenv
pip install --upgrade ${PIP_ARGS} virtualenv

# Forget the cached locations of python binaries
hash -r

# Create the virtualenv with the updated toolchain for openstack service
python3 -m virtualenv --python=python3 /var/lib/openstack

# Deactivate the old bootstrap virtualenv and switch to the new one
deactivate
source /var/lib/openstack/bin/activate
