#!/usr/bin/env bash
set -o errexit
set -o nounset

SCRIPT="$(readlink -f "${BASH_SOURCE[0]}")"
SCRIPT_PATH="$(dirname "$SCRIPT")"

function die() {
    echo "ERROR $? IN $SCRIPT AT LINE ${BASH_LINENO[0]}"
    exit 1
}
trap die ERR

version="$(git -C "$SCRIPT_PATH" describe --tags --always)"
version="${version#v}"

## Build docker image
containers=()
containers+=(pandoc-core)
containers+=(pandoc-latex)
containers+=(pandoc-mermaid)

NO_CACHE="${NO_CACHE:-}"

for container in "${containers[@]}" ; do
	opts=()
	opts+=(--tag "$container":latest)
	opts+=(--tag "$container":"$version")
	opts+=(--build-arg VERSION="$version")
	# forward proxy settings if present
	[[ -n "${http_proxy:-}" ]] && opts+=(--build-arg http_proxy=$http_proxy)
	[[ -n "${https_proxy:-}" ]] && opts+=(--build-arg https_proxy=$https_proxy)
	docker build "${opts[@]}" --file "${SCRIPT_PATH}/$container/Dockerfile" "$SCRIPT_PATH"
done

