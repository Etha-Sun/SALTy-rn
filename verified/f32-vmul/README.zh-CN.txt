f32-vmul WP 证明

冻结实现/spec 后，agent 只补 proof.patch。
最终记录：logs/run02-summary.json、run02.json、run02.log。
raw obligations 468/468，complete=true，unchanged=true，
24 个函数 body ensures 和 6 个全局 lemma 有检查覆盖。

n 为任意满足 spec.h 的符号长度；VLEN=128，vl=min(n剩余,32)。
输出观察为数值相等或双方 NaN；不比较 NaN payload、signed-zero 位差、FP flags。
ISA→C shim 对应仍未形式证明。对准同一 host compiler 的 IR 检查见 logs/llvm-identity.json。
若 LLVM14 llvm-diff 自身误报，另存 logs/llvm-self-diff.json；不要将该工具字段改成通过。

该 kernel proof ACSL/ghost 非空物理行 190，含注释边界行，
共享 base/float_ops 复用成本分别 11/72 行；新 module 见 effort.json 逐文件计数。
没有独立的 per-kernel helper 文件；ghost 辅助定义包含在同一个 proof.patch 中。
