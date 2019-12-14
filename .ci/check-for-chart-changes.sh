#!/bin/bash
#
# check for chart changes to speedup ci
#

set -o errexit
set -o pipefail

CHART_REPO="https://github.com/kiwigrid/helm-charts.git"

git remote add chart-changes "${CHART_REPO}"
git fetch chart-changes master

if [ -z "$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/chart-changes/master -- charts)" ]; then
  echo "Error! No chart changes detected!"
  exit 1
fi
