ARG FROM=ubuntu:focal
FROM ${FROM}

ARG UBUNTU_URL=http://archive.ubuntu.com/ubuntu/
ARG CLOUD_ARCHIVE_URL=http://ubuntu-cloud.archive.canonical.com/ubuntu/
ARG CEPH_URL=http://download.ceph.com/debian-octopus/
ARG NECTAR_URL=http://download.rc.nectar.org.au/nectar-ubuntu
ARG ALLOW_UNAUTHENTICATED=false
ARG OPENSTACK_VERSION=victoria
ARG PIP_INDEX_URL=https://pypi.python.org/simple/
ARG PIP_TRUSTED_HOST=pypi.python.org
ENV PIP_INDEX_URL=${PIP_INDEX_URL}
ENV PIP_TRUSTED_HOST=${PIP_TRUSTED_HOST}
ENV VPP_INSTALL_SKIP_SYSCTL=1

COPY sources.list.sh /tmp
COPY cloud-archive.gpg ceph.gpg nectar.gpg /etc/apt/trusted.gpg.d/
RUN \
    UBUNTU_URL="${UBUNTU_URL}" \
    CLOUD_ARCHIVE_URL="${CLOUD_ARCHIVE_URL}" \
    CEPH_URL="${CEPH_URL}" \
    NECTAR_URL="${NECTAR_URL}" \
    OPENSTACK_VERSION="${OPENSTACK_VERSION}" \
    bash /tmp/sources.list.sh > /etc/apt/sources.list

RUN echo "APT::Get::AllowUnauthenticated \"${ALLOW_UNAUTHENTICATED}\";\n\
Acquire::AllowInsecureRepositories \"${ALLOW_UNAUTHENTICATED}\";\n\
Acquire::AllowDowngradeToInsecureRepositories \"${ALLOW_UNAUTHENTICATED}\";" \
    >> /etc/apt/apt.conf.d/allow-unathenticated
