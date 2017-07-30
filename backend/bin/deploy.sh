#!/bin/sh
set -eu

BUCKET=gs://photobank-functions

echo "Ensuring storage bucket exists ($BUCKET)"
gsutil ls "$BUCKET" > /dev/null || gsutil mb "$BUCKET" && echo "Cool. :)"

echo "Deploying function"
gcloud beta functions deploy backend-graphql-api \
  --stage-bucket "$BUCKET" \
  --entry-point handler \
  --local-path dist \
  --trigger-http
