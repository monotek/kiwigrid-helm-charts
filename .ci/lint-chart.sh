#!/bin/sh
#
# lint charts
#

set -o errexit

CONFIG_DIR=".ci"
GIT_REPO="https://github.com/monotek/helm-charts"
REPO_ROOT="$(git rev-parse --show-toplevel)"

echo "$REPO_ROOT"

git remote add k8s "${GIT_REPO}"
git fetch k8s master

git remote -v
git log

ct lint --config="${REPO_ROOT}/${CONFIG_DIR}"/ct.yaml \
  --lint-conf="${REPO_ROOT}/${CONFIG_DIR}"/lintconf.yaml \
  --chart-yaml-schema="${REPO_ROOT}/${CONFIG_DIR}"/chart_schema.yaml \
  --debug
