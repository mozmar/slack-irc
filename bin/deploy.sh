#!/bin/bash -e

# NOTE Do **not** set -x here as that would expose sensitive credentials
#      in the Travis build logs.

DOCKER_TAG="$DOCKER_REGISTRY/$HEROKU_APP/$HEROKU_PROC_TYPE"
echo "Pushing $DOCKER_TAG"
docker login -u "$HEROKU_EMAIL" -p "$HEROKU_API_KEY" "$DOCKER_REGISTRY"
docker tag slack_irc_bot "$DOCKER_TAG"
docker push "$DOCKER_TAG"
