#!/usr/bin/env bash
set -euo pipefail

demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
repo_dir=$(cd -- "$demo_dir/../.." && pwd)
neon2rvv_dir=${NEON2RVV_DIR:-"$repo_dir/../neon2rvv-reference"}
rvv_cc=${RVV_CC:-/tmp/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc}

if ! command -v "$rvv_cc" >/dev/null 2>&1; then
  printf 'Compiler not found: %s\nSet RVV_CC to a RISC-V GCC with RVV intrinsic support.\n' "$rvv_cc" >&2
  exit 1
fi
if [[ ! -f "$neon2rvv_dir/neon2rvv.h" ]]; then
  printf 'Header not found: %s/neon2rvv.h\nSet NEON2RVV_DIR to its directory.\n' "$neon2rvv_dir" >&2
  exit 1
fi

"$rvv_cc" -march=rv64gcv_zba -mabi=lp64d -O2 -DNDEBUG \
  -I "$neon2rvv_dir" \
  -S "$demo_dir/neon2rvv-input.c" \
  -o "$demo_dir/neon2rvv-output.s"

"$rvv_cc" -march=rv64gcv_zba -mabi=lp64d -O2 -DNDEBUG \
  -S "$demo_dir/neon2rvv-expanded.c" \
  -o "$demo_dir/neon2rvv-expanded.s"

diff -u <(sed '/^[[:space:]]*\.file[[:space:]]/d' "$demo_dir/neon2rvv-output.s") \
        <(sed '/^[[:space:]]*\.file[[:space:]]/d' "$demo_dir/neon2rvv-expanded.s")

"$rvv_cc" --version
printf '\nGenerated: %s/neon2rvv-output.s\n' "$demo_dir"
printf 'Generated: %s/neon2rvv-expanded.s\nAssembly matches after removing .file metadata.\n' "$demo_dir"
