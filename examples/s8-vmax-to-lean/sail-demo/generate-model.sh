#!/usr/bin/env bash
set -euo pipefail
demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
out_dir=${OUT_DIR:-"$demo_dir/out"}
sail_bin=${SAIL_BIN:-/tmp/s8-vmax-sail-tools/sail/bin/sail}
model_dir=${SAIL_RISCV_DIR:-/tmp/s8-vmax-sail-tools/sail-riscv-29e6158f0a88bdb26b9fbcd0718ab919449b5179}
export PATH="$(dirname -- "$sail_bin"):$PATH"
mkdir -p "$out_dir/config-project" "$out_dir/models"
out_dir=$(cd -- "$out_dir" && pwd)
model_dir=$(cd -- "$model_dir" && pwd)
# Generate upstream's standard JSON configs without configuring its C++ backend,
# which unnecessarily requires GMP development headers for this Lean-only task.
python3 - "$out_dir" "$model_dir" <<'PY'
import sys
from pathlib import Path
out, model = map(Path, sys.argv[1:])
(out / 'config-project/CMakeLists.txt').write_text(
    'cmake_minimum_required(VERSION 3.20)\n'
    'project(sail_demo_config NONE)\n'
    f'add_subdirectory("{model}/config" config)\n')
PY
cmake -S "$out_dir/config-project" -B "$out_dir/config-build"
cd "$model_dir/model"
timeout --kill-after=30 "${MODEL_TIMEOUT_SECONDS:-1800}" \
  "$sail_bin" --dprofile --config "$out_dir/config-build/config/rv64d_v256_e64.json" \
  --lean --memo-z3 --memo-z3-path "$out_dir/sail_smt_cache" \
  --lean-output-dir "$out_dir/models" --lean-force-output \
  --lean-lib-rev 79b4d08505af29d88b3918f32d29840fae1fa191 \
  --lean-non-beq-type instruction --lean-non-beq-type ExecutionResult \
  --lean-non-beq-type Step \
  --lean-import-file ../handwritten_support/RiscvExtrasExecutable.lean \
  -o Lean_RV64D_executable V Zca Zba Zicsr_insts postlude riscv.sail_project
