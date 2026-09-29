#!/usr/bin/env bash
set -euo pipefail
demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
out_dir=${OUT_DIR:-"$demo_dir/out"}
sail_bin=${SAIL_BIN:-/tmp/s8-vmax-sail-tools/sail/bin/sail}
export PATH="$(dirname -- "$sail_bin"):$PATH"
export ELAN_TOOLCHAIN=${DEMO_LEAN_TOOLCHAIN:-leanprover/lean4:v4.29.1}
mkdir -p "$out_dir"
"$sail_bin" --lean --lean-output-dir "$out_dir" --lean-force-output \
  --lean-lib-rev 79b4d08505af29d88b3918f32d29840fae1fa191 \
  -o LaneExample "$demo_dir/signed_max.sail"
cd "$out_dir/LaneExample"
lake update
lake build
lake env lean "$demo_dir/CheckLane.lean"
