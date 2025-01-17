FROM python:3.9-alpine

ARG PACKER_VERSION=1.7.0
ARG PACKER_PLATFORM=linux_amd64
ARG ANSIBLE_VERSION=2.10.6-r0

LABEL org.opencontainers.image.description="Hashicorp Packer with Ansible" \
      org.opencontainers.image.authors="ThinkingLabs (hello@thinkinglabs.io)" \
      org.opencontainers.image.licenses="MIT"

RUN wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_${PACKER_PLATFORM}.zip \
    && wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS \
    && set -o pipefail && grep ${PACKER_PLATFORM} packer_${PACKER_VERSION}_SHA256SUMS | sha256sum -c - \
    && unzip packer_1.7.0_linux_amd64.zip -d /usr/local/bin \
    && rm packer_${PACKER_VERSION}_linux_amd64.zip \
    && apk add ansible=${ANSIBLE_VERSION}
