#!/bin/bash -e

# NOTE Do **not** set -x here as that would expose sensitive credentials
#      in the Travis build logs.

if [[ -z "$HEROKU_EMAIL" ]]; then
  echo "Heroku credentials not configured"
  exit 1
fi

DOCKER_TAG="$DOCKER_REGISTRY/$HEROKU_APP/$HEROKU_PROC_TYPE"
echo "Pushing $DOCKER_TAG"
docker login -u "$HEROKU_EMAIL" -p "$HEROKU_API_KEY" "$DOCKER_REGISTRY"
docker tag "$DOCKER_IMG_TAG" "$DOCKER_TAG"
docker push "$DOCKER_TAG"
