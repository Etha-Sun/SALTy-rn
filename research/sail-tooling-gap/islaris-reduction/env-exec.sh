#!/usr/bin/env bash
set -euo pipefail
study=$(cd "$(dirname "$0")/.." && pwd)
export OPAMROOT="$study/vendor/islaris-opam"
export OPAMSWITCH=islaris-demo
export PATH="$study/vendor/islaris-tools:$PATH"
exec "$study/vendor/islaris-tools/opam" exec -- "$@"
