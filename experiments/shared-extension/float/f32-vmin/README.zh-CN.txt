一致性审计未通过：同一浮点注释上下文能把无前置 ensures \false 的空函数判为 Valid。以下 raw WP 成功计数不能视为可信等价性证明；目前所有 float case 暂停接纳，详见 ../model-audit/INITIAL-ALERT.zh-CN.txt。

f32-vmin WP 证明

冻结实现/spec 后，agent 只补 proof.patch。该 case 验证 root 预先修复并冻结的 target；rvv-original.c 保留原始版本。NaN fixup 的合同也在 actual shim body 上验证。

最终记录：logs/run02-summary.json、run02.json、run02.log。
raw obligations 528/528，complete=true，unchanged=true，
25 个函数 body ensures 和 6 个全局 lemma 有检查覆盖。

n 为任意满足 spec.h 的符号长度；VLEN=128，vl=min(n剩余,32)。
输出观察为数值相等或双方 NaN；不比较 NaN payload、signed-zero 位差、FP flags。
ISA→C shim 对应仍未形式证明。对准同一 host compiler 的 IR 检查见 logs/llvm-identity.json。
若 LLVM14 llvm-diff 自身误报，另存 logs/llvm-self-diff.json；不要将该工具字段改成通过。

该 kernel proof ACSL/ghost 非空物理行 201，含注释边界行，
共享 base/float_ops 复用成本分别 11/72 行；新 module 见 effort.json 逐文件计数。
没有独立的 per-kernel helper 文件；ghost 辅助定义包含在同一个 proof.patch 中。
