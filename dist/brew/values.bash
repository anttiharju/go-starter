#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${GITHUB_REPOSITORY:-}" ]]; then
  echo "GITHUB_REPOSITORY is not set" >&2
  exit 1
fi

capture() {
  eval "$1=\"$2\""
  echo "$1=\"$2\""
}

REPO_ROOT="$(git rev-parse --show-toplevel)"

repo_name="$(basename "$GITHUB_REPOSITORY")"
echo "repo_name=\"$repo_name\""

capture class_name "$(echo "$repo_name" | perl -pe 's/(^|-+)([a-z])/\U$2/g')"
capture description "$(gh repo view --json description --jq .description)"
capture homepage "$(gh api "repos/$GITHUB_REPOSITORY" --jq .homepage)"
capture version "${TAG#v}"
capture repo_owner "${GITHUB_REPOSITORY%%/*}"
capture darwin_amd64_sha256 "$(shasum -a 256 "$REPO_ROOT/$repo_name-darwin-amd64.tar.gz" | cut -d ' ' -f1)"
capture darwin_arm64_sha256 "$(shasum -a 256 "$REPO_ROOT/$repo_name-darwin-arm64.tar.gz" | cut -d ' ' -f1)"
capture linux_amd64_sha256 "$(shasum -a 256 "$REPO_ROOT/$repo_name-linux-amd64.tar.gz" | cut -d ' ' -f1)"
capture linux_arm64_sha256 "$(shasum -a 256 "$REPO_ROOT/$repo_name-linux-arm64.tar.gz" | cut -d ' ' -f1)"
