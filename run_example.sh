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

PANDOC="${SCRIPT_PATH}/pandoc"

cd "${SCRIPT_PATH}"
"${PANDOC}" --output "README.html" --from gfm --to html5 --filter mermaid-filter "README.md"

