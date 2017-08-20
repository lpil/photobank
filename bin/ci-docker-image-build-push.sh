#!/bin/sh
set -eu

COMMIT_SHA=$(git rev-parse --short HEAD)
BRANCH=$(git branch | grep -e "^*" | cut -d' ' -f 2 | sed 's/[^a-zA-Z0-9]/_/g')
PROJECT=quay.io/lpil/photobank
TAG="$PROJECT":"$BRANCH"-"$COMMIT_SHA"

mkdir -p backend-elixir/tmp
cp -r /tmp/workspace/frontend/dist backend-elixir/tmp/static

cd backend-elixir

echo Authenticating with quay.io
docker login -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io

echo Building image
docker build \
  -t "$TAG" \
  .

echo Pushing image
docker push "$TAG"

if [ "$BRANCH" == "master" ]; then
  echo Detected as master branch

  echo Tagging image as latest
  docker tag "$TAG" "$PROJECT":latest

  echo Pushing latest tagged image
  docker push "$PROJECT":latest
fi

echo Done!
