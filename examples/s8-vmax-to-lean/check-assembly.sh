#!/usr/bin/env bash
set -euo pipefail
demo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
rvv_cc=${RVV_CC:-/tmp/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc}
qemu_rvv=${QEMU_RVV:-/tmp/neon2rvv-qemu-riscv64-static}
check_dir=$(mktemp -d /tmp/s8-vmax-asm-check.XXXXXX)

# Assemble the files being reviewed directly; do not regenerate them from C.
"$rvv_cc" -march=rv64gcv_zba -mabi=lp64d -mcmodel=medany \
  -O2 -fno-builtin -fno-tree-loop-distribute-patterns -fno-stack-protector \
  -nostdlib -static -Wl,--no-relax -Wl,-e,_start \
  "$demo_dir/asm-check-start.S" "$demo_dir/asm-check.c" \
  "$demo_dir/neon2rvv-output.s" "$demo_dir/rvv-output.s" \
  -o "$check_dir/check.elf"

for vector_bits in 128 256 512; do
  printf '\nVLEN=%s\n' "$vector_bits"
  timeout 30 "$qemu_rvv" \
    -cpu "rv64,v=true,vlen=$vector_bits,elen=64,vext_spec=v1.0" \
    "$check_dir/check.elf"
done
