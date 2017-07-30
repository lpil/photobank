#!/bin/sh
set -eu

BUCKET=gs://bank-functions

echo "Ensuring storage bucket exists ($BUCKET)"
gsutil ls "$BUCKET" > /dev/null || gsutil mb "$BUCKET" && echo "Cool. :)"

echo "Deploying function"
gcloud beta functions deploy happy \
  --stage-bucket "$BUCKET" \
  --entry-point handler \
  --local-path dist \
  --trigger-http
