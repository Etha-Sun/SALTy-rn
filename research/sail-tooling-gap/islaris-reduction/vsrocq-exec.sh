#!/usr/bin/env bash
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
study=$(cd "$here/.." && pwd)
# Use the same load paths and ordering as kernel-e2e/check.py:coq_args().
# VsRocq on Coq 8.19 reverses overlapping -Q mappings read from _CoqProject.
exec "$here/env-exec.sh" vsrocqtop -without-project-file \
  -Q "$study/vendor/islaris-main/_build/default/theories" isla \
  -Q "$study/kernel-e2e" "" \
  -Q "$study/bridge-audit" "" \
  -Q "$study/islaris-reduction" "" \
  -Q "$study/bridge-audit/generated" Bridge \
  -Q "$study/kernel-e2e/simple/generated/neon" Kernel.neon \
  -Q "$study/kernel-e2e/simple/generated/rvv" Simple.rvv \
  -Q "$study/kernel-e2e/generated/rvv" Kernel.rvv \
  "$@"
