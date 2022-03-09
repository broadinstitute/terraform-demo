#!/bin/bash

DOCKER_IMAGE='hashicorp/terraform:latest'
DOCKER_SOCKET='/var/run/docker.sock'
SUDO=

SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

usage() {
  PROG=`basename $0`
  echo "usage: ${PROG} [--version] [--help] <command> [<args>]"
}

if [ "$TERM" != "dumb" ] ; then
  TTY='-it'
fi

if [ "$( uname -s )" != "Darwin" ]; then
  if [ ! -w "${DOCKER_SOCKET}" ]; then
    SUDO='sudo'
  fi
fi

if [ -z "$1" ]; then
  usage
  exit 1
fi

# If we already have a gcloud config, try to mount it in
GCLOUD_MOUNT=
if [ -d "${HOME}/.config/gcloud" ]; then
    GCLOUD_MOUNT="-v ${HOME}/.config/gcloud:/root/.config/gcloud"
fi

$SUDO docker run $TTY --rm \
  -w /data \
  $GCLOUD_MOUNT -v "${SCRIPT_DIR}:/data" \
  "$DOCKER_IMAGE" "$@"
