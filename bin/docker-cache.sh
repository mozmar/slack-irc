#!/bin/bash -ex

case "$1" in
  save)
    # Save built images to cache directory
    mkdir -p $(dirname "${DOCKER_CACHE_FILE}")
    docker save $(docker history -q "$DOCKER_IMG_TAG" | grep -v '<missing>') | \
           gzip > "${DOCKER_CACHE_FILE}"
    ;;
  load)
    if [[ -f "${DOCKER_CACHE_FILE}" ]]; then
      gunzip -c "${DOCKER_CACHE_FILE}" | docker load
    fi
    ;;
  *)
    echo "Unknown action $1"
esac
