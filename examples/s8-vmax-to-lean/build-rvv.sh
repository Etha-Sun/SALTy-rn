#!/usr/bin/env bash
set -euo pipefail

demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
rvv_cc=${RVV_CC:-/tmp/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc}

if ! command -v "$rvv_cc" >/dev/null 2>&1; then
  printf 'Compiler not found: %s\nSet RVV_CC to a RISC-V GCC with RVV intrinsic support.\n' "$rvv_cc" >&2
  exit 1
fi

"$rvv_cc" -march=rv64gcv_zba -mabi=lp64d -O2 -DNDEBUG \
  -S "$demo_dir/rvv-input.c" \
  -o "$demo_dir/rvv-output.s"

"$rvv_cc" --version
printf '\nGenerated: %s/rvv-output.s\n' "$demo_dir"
