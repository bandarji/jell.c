#!/bin/bash
set -euo pipefail

root="$(cd "$(dirname "$0")" && pwd)"

docker build -t www-jellc:local "$root"
exec docker run --rm -p 8080:80 \
	-v "$root/html:/usr/share/nginx/html:ro" \
	www-jellc:local
