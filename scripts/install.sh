#!/bin/bash

set -Eeuo pipefail

export TIMEOUT="180s"
export RELEASE_NAME="openfga-install"

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

echo "Install chart"

set +e
helm install "${RELEASE_NAME}" "./openfga" --wait --debug --atomic --timeout="${TIMEOUT}"
export INSTALLATION_STATUS=$?
set -e

if [[ ${INSTALLATION_STATUS} -ne 0 ]]; then
  echo "Installation failed"
  kubectl describe pods -A -l "app.kubernetes.io/instance=${RELEASE_NAME}" || true
  kubectl logs --all-containers=true -l "app.kubernetes.io/instance=${RELEASE_NAME}" || true
  exit "${INSTALLATION_STATUS}"
fi

echo "Run chart tests"

n=0
until [[ $n -ge 15 ]]; do
  set +e
  helm test --timeout "${TIMEOUT}" "${RELEASE_NAME}"
  TEST_STATUS=$?
  set -e

  if [[ ${TEST_STATUS} -eq 0 ]]; then
    echo "---> Test Successful"
    exit ${TEST_STATUS}
  fi
  n=$(( n+1 ))
  sleep 10
done

echo "---> Something failed along the way"
exit 1
