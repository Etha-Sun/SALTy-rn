#!/usr/bin/env bash
set -euo pipefail
demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
out_dir=${OUT_DIR:-"$demo_dir/out"}
rvv_cc=${RVV_CC:-/tmp/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc}
mkdir -p "$out_dir"
"$rvv_cc" -march=rv64gcv_zba -mabi=lp64d -mcmodel=medany \
  -O1 -fno-tree-vectorize -fno-builtin -fno-stack-protector \
  -nostdlib -static -Wl,--no-relax -Wl,-T,"$demo_dir/link.ld" \
  "$demo_dir/start.S" "$demo_dir/check.c" "$demo_dir/../rvv-output.s" \
  -o "$out_dir/rvv-check.elf"
"${rvv_cc%gcc}objdump" -d "$out_dir/rvv-check.elf" > "$out_dir/rvv-check.disasm"
"${rvv_cc%gcc}objcopy" --dump-section .text="$out_dir/text.bin" "$out_dir/rvv-check.elf"
sha256sum "$demo_dir/../rvv-output.s" "$out_dir/rvv-check.elf"
