#!/bin/bash

# Fail on any error.
set -ex

cd "${KOKORO_ARTIFACTS_DIR}/github/kokoro-codelab-pavelj"
./build.sh

curl -sL https://firebase.tools | bash

echo $GSA_KEY > "${KOKORO_ARTIFACTS_DIR}/gcloud.json"
export GOOGLE_APPLICATION_CREDENTIALS="$KOKORO_ARTIFACTS_DIR/gcloud.json"

cat "$KOKORO_ARTIFACTS_DIR/gcloud.json"

firebase ext:list --project "${PUBLISHER_PROJECT_ID}"

cd "${KOKORO_ARTIFACTS_DIR}/github/firebase-extensions"

