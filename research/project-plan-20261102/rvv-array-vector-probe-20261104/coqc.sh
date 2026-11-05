#!/usr/bin/env bash
# coqc with QCP library paths (from research/qcp-shim-vadd/results/coq-flags.json, minus -topfile) + probe namespaces
set -euo pipefail
P=/zp_vegeta/scratch_sb/ycsun/verus/build/rvv-array-vector-probe-20261104
mapfile -t FLAGS < <(python3 -I -c "
import json;f=json.load(open('/zp_vegeta/scratch_sb/ycsun/verus/research/qcp-shim-vadd/results/coq-flags.json'))['flags']
i=0
while i<len(f):
  if f[i]=='-topfile': i+=2; continue
  print(f[i]); i+=1")
exec qcp-env coqc "${FLAGS[@]}" -R "$P/lib" SimpleC.EE.QCP_demos_human -R "$P/p1/out" Probe1 -R "$P/p2/out" Probe2 "$@"
