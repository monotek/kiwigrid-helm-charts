#!/bin/bash
#
# use kubeval to validate helm generated kubernetes manifest
#

set -o errexit
set -o pipefail

ls -al

CHART_DIRS="$(git diff --name-only master | grep '[cC]hart.yaml' | sed -e 's#/[Cc]hart.yaml##g')"

for CHART_DIR in ${CHART_DIRS};do 
  echo "kubeval(idating) ${CHART_DIR##charts/} chart..."
  helm template "${CHART_DIR}" | docker run -i kiwigrid/gcloud-kubectl-helm:latest kubeval
done
