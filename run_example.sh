#!/bin/sh
#cd "${SCRIPT_PATH}"
PANDOC="pandoc"
"${PANDOC}" --output "README.html" --from gfm --to html5 --filter mermaid-filter "README.md"
