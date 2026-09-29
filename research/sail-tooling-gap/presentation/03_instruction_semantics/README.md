# 完整 kernel 的指令语义

这里包含 NEON 20 条、RVV 19 条指令的全部 Isla trace 及对应生成的 Coq 文件。加载 trace 以无损 gzip 保存。文件名中的数字是指令地址。

**完整 kernel 不是一份循环全部展开的巨大 trace。** [Programs.v](../04_proofs/Programs.v) 把这些单指令 trace 按地址组成指令表；分支和跳转连接这些地址，循环正确性由循环不变量与组合证明处理。

- 原始程序：[NEON 汇编](../01_programs/neon/neon-simple.S)、[RVV 汇编](../01_programs/rvv/rvv-simple.S)。
- 共同数学规格：[KernelSpec.v](../02_specs/KernelSpec.v)。它描述希望算出什么，不是程序实现。
- 完整 kernel 合同与证明：[NeonKernel.v](../04_proofs/neon/NeonKernel.v)、[RvvKernelConditional.v](../04_proofs/rvv/kernel_conditional/RvvKernelConditional.v)。RVV 仍依赖未完全证明的 Hload。
- 最终共同规格包装：[NeonByteSpec.v](../02_specs/NeonByteSpec.v)、[RvvByteSpecConditional.v](../02_specs/RvvByteSpecConditional.v)。

以下是语义提取清单，不是全部指令合同已证明的清单。证明状态见 [STATUS.md](../STATUS.md)。

| ISA | 地址 | 指令 | Isla trace | 生成的 Coq trace |
|---|---|---|---|---|
| NEON | `0x80001000` | `movi	v0.2d, #0000000000000000` | [Isla](neon/a80001000.isla) | [Coq](neon/a80001000.v) |
| NEON | `0x80001004` | `cmp	x0, #16` | [Isla](neon/a80001004.isla) | [Coq](neon/a80001004.v) |
| NEON | `0x80001008` | `b.lo	0x80001024 <sum_u8+0x24>` | [Isla](neon/a80001008.isla) | [Coq](neon/a80001008.v) |
| NEON | `0x8000100c` | `ldr	q2, [x1], #16` | [Isla](neon/a8000100c.isla) | [Coq](neon/a8000100c.v) |
| NEON | `0x80001010` | `movi	v1.2d, #0000000000000000` | [Isla](neon/a80001010.isla) | [Coq](neon/a80001010.v) |
| NEON | `0x80001014` | `uadalp	v1.8h, v2.16b` | [Isla](neon/a80001014.isla) | [Coq](neon/a80001014.v) |
| NEON | `0x80001018` | `uadalp	v0.4s, v1.8h` | [Isla](neon/a80001018.isla) | [Coq](neon/a80001018.v) |
| NEON | `0x8000101c` | `sub	x0, x0, #16` | [Isla](neon/a8000101c.isla) | [Coq](neon/a8000101c.v) |
| NEON | `0x80001020` | `b	0x80001004 <sum_u8+0x4>` | [Isla](neon/a80001020.isla) | [Coq](neon/a80001020.v) |
| NEON | `0x80001024` | `addv	s0, v0.4s` | [Isla](neon/a80001024.isla) | [Coq](neon/a80001024.v) |
| NEON | `0x80001028` | `fmov	w9, s0` | [Isla](neon/a80001028.isla) | [Coq](neon/a80001028.v) |
| NEON | `0x8000102c` | `cbz	x0, 0x80001040 <sum_u8+0x40>` | [Isla](neon/a8000102c.isla) | [Coq](neon/a8000102c.v) |
| NEON | `0x80001030` | `ldrb	w8, [x1], #1` | [Isla](neon/a80001030.isla) | [Coq](neon/a80001030.v) |
| NEON | `0x80001034` | `add	w9, w9, w8` | [Isla](neon/a80001034.isla) | [Coq](neon/a80001034.v) |
| NEON | `0x80001038` | `subs	x0, x0, #1` | [Isla](neon/a80001038.isla) | [Coq](neon/a80001038.v) |
| NEON | `0x8000103c` | `b.ne	0x80001030 <sum_u8+0x30>` | [Isla](neon/a8000103c.isla) | [Coq](neon/a8000103c.v) |
| NEON | `0x80001040` | `ldr	w8, [x2]` | [Isla](neon/a80001040.isla) | [Coq](neon/a80001040.v) |
| NEON | `0x80001044` | `add	w8, w8, w9` | [Isla](neon/a80001044.isla) | [Coq](neon/a80001044.v) |
| NEON | `0x80001048` | `str	w8, [x2]` | [Isla](neon/a80001048.isla) | [Coq](neon/a80001048.v) |
| NEON | `0x8000104c` | `ret` | [Isla](neon/a8000104c.isla) | [Coq](neon/a8000104c.v) |
| RVV | `0x800001bc` | `vsetvli	a4,zero,e32,m1,ta,ma` | [Isla](rvv/a800001bc.isla) | [Coq](rvv/a800001bc.v) |
| RVV | `0x800001c0` | `vmv.v.i	v8,0` | [Isla](rvv/a800001c0.isla) | [Coq](rvv/a800001c0.v) |
| RVV | `0x800001c4` | `beqz	a0,800001dc <sum_u8+0x20>` | [Isla](rvv/a800001c4.isla) | [Coq](rvv/a800001c4.v) |
| RVV | `0x800001c6` | `vsetvli	a5,a0,e32,m1,tu,ma` | [Isla](rvv/a800001c6.isla) | [Coq](rvv/a800001c6.v) |
| RVV | `0x800001ca` | `vle8.v	v2,(a1)` | [Isla](rvv/a800001ca.isla.gz) | [Coq](rvv/a800001ca.v) |
| RVV | `0x800001ce` | `sub	a0,a0,a5` | [Isla](rvv/a800001ce.isla) | [Coq](rvv/a800001ce.v) |
| RVV | `0x800001d0` | `add	a1,a1,a5` | [Isla](rvv/a800001d0.isla) | [Coq](rvv/a800001d0.v) |
| RVV | `0x800001d2` | `vzext.vf4	v16,v2` | [Isla](rvv/a800001d2.isla) | [Coq](rvv/a800001d2.v) |
| RVV | `0x800001d6` | `vadd.vv	v8,v8,v16` | [Isla](rvv/a800001d6.isla) | [Coq](rvv/a800001d6.v) |
| RVV | `0x800001da` | `bnez	a0,800001c6 <sum_u8+0xa>` | [Isla](rvv/a800001da.isla) | [Coq](rvv/a800001da.v) |
| RVV | `0x800001dc` | `vsetvli	a5,zero,e32,m1,ta,ma` | [Isla](rvv/a800001dc.isla) | [Coq](rvv/a800001dc.v) |
| RVV | `0x800001e0` | `vmv.v.i	v1,0` | [Isla](rvv/a800001e0.isla) | [Coq](rvv/a800001e0.v) |
| RVV | `0x800001e4` | `vsetvli	a4,zero,e32,m1,ta,ma` | [Isla](rvv/a800001e4.isla) | [Coq](rvv/a800001e4.v) |
| RVV | `0x800001e8` | `lw	a3,0(a2)` | [Isla](rvv/a800001e8.isla) | [Coq](rvv/a800001e8.v) |
| RVV | `0x800001ea` | `vredsum.vs	v8,v8,v1` | [Isla](rvv/a800001ea.isla) | [Coq](rvv/a800001ea.v) |
| RVV | `0x800001ee` | `vmv.x.s	a5,v8` | [Isla](rvv/a800001ee.isla) | [Coq](rvv/a800001ee.v) |
| RVV | `0x800001f2` | `addw	a5,a5,a3` | [Isla](rvv/a800001f2.isla) | [Coq](rvv/a800001f2.v) |
| RVV | `0x800001f4` | `sw	a5,0(a2)` | [Isla](rvv/a800001f4.isla) | [Coq](rvv/a800001f4.v) |
| RVV | `0x800001f6` | `ret` | [Isla](rvv/a800001f6.isla) | [Coq](rvv/a800001f6.v) |
