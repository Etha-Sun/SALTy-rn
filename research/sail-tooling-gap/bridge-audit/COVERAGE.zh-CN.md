# 指令接入与证明覆盖表

自动生成：`python3 research/sail-tooling-gap/bridge-audit/audit.py`。

这里只报告本目录实际测试与之前两条 RVV 定理；“未尝试”不表示上游工具不支持。相同 opcode 只标注复用候选，仍须验证该位置的配置和前置条件。地址表展示完成度最高的配置，并在括号中注明该配置；不表示所有配置均已证明。

| 探针 | 地址 | 状态 | Isla 字节 / 行 | Coq 字节 / 行 | 提取秒数 |
|---|---|---|---|---|---|
| neon_addv | `0x2105dc` | instruction_property_proved | 5185 / 81 | 7031 / 67 | 1.218 |
| neon_uadalp8 | `0x2105bc` | instruction_property_proved | 7328 / 86 | 12412 / 73 | 1.218 |
| neon_uadalp16 | `0x2105c4` | instruction_property_proved | 6020 / 82 | 9344 / 69 | 1.219 |
| neon_load | `0x210604` | coq_import_checked | 24225 / 301 | 31177 / 252 | 1.332 |
| neon_mul | `0x210630` | coq_import_checked | 8590 / 80 | 15149 / 67 | 1.218 |
| rvv_load | `0x800001ca` | extraction_timeout | 0 / 0 | — / — | 180.003 |
| rvv_widen | `0x800001d2` | first_lane_property_proved_zero_destination | 928877 / 119 | 24395 / 116 | 0.918 |
| rvv_add | `0x800001d6` | coq_import_checked | 929961 / 129 | 26273 / 126 | 0.868 |
| rvv_load_platform | `0x800001ca` | coq_import_checked | 32689256 / 702 | 528508 / 695 | 6.833 |
| rvv_load_symbolic | `0x800001ca` | coq_import_checked | 32701783 / 850 | 552359 / 843 | 10.656 |
| rvv_add_allvl | `0x800001d6` | coq_import_checked | 61148211 / 7268 | 1978471 / 7009 | 92.225 |
| rvv_widen_allvl | `0x800001d2` | coq_import_checked | 61160279 / 7194 | 1889665 / 6935 | 91.524 |
| neon_load_ram | `0x210604` | instruction_property_proved | 10015 / 139 | 12359 / 108 | 1.268 |
| neon_load_unaligned | `0x210604` | coq_import_checked | 28611 / 355 | 38492 / 302 | 1.368 |

状态说明：`coq_import_checked` 只表示 trace 数据能被 Coq 接受；只有标记 `proved` 的行有对应行为定理。加载超时输出的 0 字节文件不是有效 trace。RVV 扩宽的定理若完成，只覆盖第一 lane，且目的寄存器预置零。

## NEON：42 条静态指令

| 地址 | opcode | 反汇编 | 状态 / 复用候选 |
|---|---|---|---|
| `0x210598` | `0x6f00e400` | `movi v0.2d, #0000000000000000` | not_attempted |
| `0x21059c` | `0xf120001f` | `cmp x0, #2048` | not_attempted |
| `0x2105a0` | `0x540001c3` | `b.lo 0x2105d8 <test_neon+0x40>` | not_attempted |
| `0x2105a4` | `0x6f00e400` | `movi v0.2d, #0000000000000000` | not_attempted |
| `0x2105a8` | `0x6f00e401` | `movi v1.2d, #0000000000000000` | not_attempted |
| `0x2105ac` | `0xaa1f03e8` | `mov x8, xzr` | not_attempted |
| `0x2105b0` | `0x3ce86822` | `ldr q2, [x1, x8]` | not_attempted |
| `0x2105b4` | `0x91004108` | `add x8, x8, #16` | not_attempted |
| `0x2105b8` | `0xf120011f` | `cmp x8, #2048` | not_attempted |
| `0x2105bc` | `0x6e206841` | `uadalp v1.8h, v2.16b` | instruction_property_proved (neon_uadalp8) |
| `0x2105c0` | `0x54ffff81` | `b.ne 0x2105b0 <test_neon+0x18>` | not_attempted |
| `0x2105c4` | `0x6e606820` | `uadalp v0.4s, v1.8h` | instruction_property_proved (neon_uadalp16) |
| `0x2105c8` | `0x91200021` | `add x1, x1, #2048` | not_attempted |
| `0x2105cc` | `0xd1200000` | `sub x0, x0, #2048` | not_attempted |
| `0x2105d0` | `0xf11ffc1f` | `cmp x0, #2047` | not_attempted |
| `0x2105d4` | `0x54fffea8` | `b.hi 0x2105a8 <test_neon+0x10>` | not_attempted |
| `0x2105d8` | `0xb50000e0` | `cbnz x0, 0x2105f4 <test_neon+0x5c>` | not_attempted |
| `0x2105dc` | `0x4eb1b800` | `addv s0, v0.4s` | instruction_property_proved (neon_addv) |
| `0x2105e0` | `0xb9400048` | `ldr w8, [x2]` | not_attempted |
| `0x2105e4` | `0x1e260009` | `fmov w9, s0` | not_attempted |
| `0x2105e8` | `0xb090108` | `add w8, w8, w9` | not_attempted |
| `0x2105ec` | `0xb9000048` | `str w8, [x2]` | not_attempted |
| `0x2105f0` | `0xd65f03c0` | `ret` | not_attempted |
| `0x2105f4` | `0x6f00e401` | `movi v1.2d, #0000000000000000` | not_attempted |
| `0x2105f8` | `0xf100401f` | `cmp x0, #16` | not_attempted |
| `0x2105fc` | `0x54000103` | `b.lo 0x21061c <test_neon+0x84>` | not_attempted |
| `0x210600` | `0x6f00e401` | `movi v1.2d, #0000000000000000` | not_attempted |
| `0x210604` | `0x3cc10422` | `ldr q2, [x1], #16` | instruction_property_proved (neon_load_ram) |
| `0x210608` | `0xd1004000` | `sub x0, x0, #16` | not_attempted |
| `0x21060c` | `0xf1003c1f` | `cmp x0, #15` | not_attempted |
| `0x210610` | `0x6e206841` | `uadalp v1.8h, v2.16b` | not_attempted; 相同 opcode：0x2105bc |
| `0x210614` | `0x54ffff88` | `b.hi 0x210604 <test_neon+0x6c>` | not_attempted |
| `0x210618` | `0xb4000100` | `cbz x0, 0x210638 <test_neon+0xa0>` | not_attempted |
| `0x21061c` | `0x90ffff88` | `adrp x8, 0x200000 <test_neon+0x44>` | not_attempted |
| `0x210620` | `0x3dc00022` | `ldr q2, [x1]` | not_attempted |
| `0x210624` | `0x9108c108` | `add x8, x8, #560` | not_attempted |
| `0x210628` | `0xcb000108` | `sub x8, x8, x0` | not_attempted |
| `0x21062c` | `0x3dc00503` | `ldr q3, [x8, #16]` | not_attempted |
| `0x210630` | `0x4e229c62` | `mul v2.16b, v3.16b, v2.16b` | coq_import_checked (neon_mul) |
| `0x210634` | `0x6e206841` | `uadalp v1.8h, v2.16b` | not_attempted; 相同 opcode：0x2105bc |
| `0x210638` | `0x6e606820` | `uadalp v0.4s, v1.8h` | not_attempted; 相同 opcode：0x2105c4 |
| `0x21063c` | `0x17ffffe8` | `b 0x2105dc <test_neon+0x44>` | not_attempted |

## RVV：19 条静态指令

| 地址 | opcode | 反汇编 | 状态 / 复用候选 |
|---|---|---|---|
| `0x800001bc` | `0xd307757` | `vsetvli a4,zero,e32,m8,ta,ma` | not_attempted |
| `0x800001c0` | `0x5e003457` | `vmv.v.i v8,0` | not_attempted |
| `0x800001c4` | `0xcd01` | `beqz a0,800001dc <test_rvv+0x20>` | not_attempted |
| `0x800001c6` | `0x93577d7` | `vsetvli a5,a0,e32,m8,tu,ma` | previous_instruction_property_proved |
| `0x800001ca` | `0x2058107` | `vle8.v v2,(a1)` | coq_import_checked (rvv_load_symbolic) |
| `0x800001ce` | `0x8d1d` | `sub a0,a0,a5` | not_attempted |
| `0x800001d0` | `0x95be` | `add a1,a1,a5` | not_attempted |
| `0x800001d2` | `0x4a222857` | `vzext.vf4 v16,v2` | first_lane_property_proved_zero_destination (rvv_widen) |
| `0x800001d6` | `0x2880457` | `vadd.vv v8,v8,v16` | coq_import_checked (rvv_add_allvl) |
| `0x800001da` | `0xf575` | `bnez a0,800001c6 <test_rvv+0xa>` | not_attempted |
| `0x800001dc` | `0xd0077d7` | `vsetvli a5,zero,e32,m1,ta,ma` | not_attempted |
| `0x800001e0` | `0x5e0030d7` | `vmv.v.i v1,0` | not_attempted |
| `0x800001e4` | `0xd307757` | `vsetvli a4,zero,e32,m8,ta,ma` | not_attempted |
| `0x800001e8` | `0x4214` | `lw a3,0(a2)` | not_attempted |
| `0x800001ea` | `0x280a457` | `vredsum.vs v8,v8,v1` | previous_instruction_property_proved |
| `0x800001ee` | `0x428027d7` | `vmv.x.s a5,v8` | not_attempted |
| `0x800001f2` | `0x9fb5` | `addw a5,a5,a3` | not_attempted |
| `0x800001f4` | `0xc21c` | `sw a5,0(a2)` | not_attempted |
| `0x800001f6` | `0x8082` | `ret` | not_attempted |
