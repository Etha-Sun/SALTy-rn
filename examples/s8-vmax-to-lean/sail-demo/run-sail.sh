#!/usr/bin/env bash
set -euo pipefail
demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
out_dir=${OUT_DIR:-"$demo_dir/out"}
simulator=${SAIL_RISCV_SIM:-/tmp/s8-vmax-sail-tools/simulator/sail-riscv-Linux-x86_64/bin/sail_riscv_sim}
config_dir=${SAIL_CONFIG_DIR:-"$(dirname -- "$simulator")/../share/sail-riscv/config"}
OUT_DIR="$out_dir" bash "$demo_dir/build-elf.sh"
python3 "$demo_dir/elf-to-lean.py" "$out_dir/rvv-check.elf" \
  "$demo_dir/../rvv-output.s" "$out_dir/RvvProgram.lean"
"$simulator" --build-info > "$out_dir/simulator-build-info.txt"
for vlen in 128 256 512; do
  trace_args=()
  if [[ "$vlen" == 256 ]]; then
    trace_args=(--trace-instr --trace-output "$out_dir/sail-v256.trace")
  fi
  timeout 60 "$simulator" --inst-limit 100000 \
    --config "$config_dir/rv64d_v${vlen}_e64.json" \
    "${trace_args[@]}" \
    "$out_dir/rvv-check.elf" > "$out_dir/sail-execution-v${vlen}.log" 2>&1
  cat "$out_dir/sail-execution-v${vlen}.log"
done
