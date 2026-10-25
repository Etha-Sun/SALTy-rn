# QS8 乘法与 clamp（候选）

尚未完整验证。原 NEON 保持不变；RVV 改为与 NEON 相同的 magic-bias 位算法及饱和减法，并在最后一次浮点运算之后恢复 NaN scale 的符号。不限制 scale 为有限数、正数或特定范围；保留无序 clamp 边界。

原件、零 fuzz 精确补丁、修复原因与三个实际 C 反例见 `proof/originals.json`、`repair-rvv.patch`、`repair.json`、`original-counterexamples.json`。已复现大有限 scale 的原始差异，以及 Frama-C 参考修复在负 quiet/signaling NaN 下仍有的符号差异。两侧 native 模型分别处理 Arm NaN 传播和 RVV canonical NaN；来源与当前配置见 `proof/isa-source-review.json`。这是规范对照与有限仿真，尚无真实 ISA 到模型的形式化对应证明。

修复后 UBSan 与实际16GiB/swap0 cgroup ASan 均通过278016个调用，每侧12804556个元素。覆盖全部65536个有序 byte 对（38种边界scale）、全部65536个 signed16 输出零点、全部256种输入零点编码、部分/完全输入别名、NaN/Inf/±0/subnormal及无序clamp，输入/参数/输出canary检查通过。单侧错误和双侧共错均被独立标量 oracle 拒绝。这些 native 结果不增加 verified 数量。

逐元素数学等价定理 `Qs8Mul.Pointwise.qm_pointwise_equivalence` 已从9个本地 `.v` 新鲜普通编译通过；覆盖所有 binary32 scale、signed16 输出零点与无序 clamp，另闭合实际标量 `scale != scale` 分支到 NaN 判定的桥。见 `proof/pointwise-math-status.json`；仅含4个既有框架假设，尚未证明 kernel C。

后续按公开 intrinsic spec 边界证明完整实际 C kernel、循环、内存、普通适配器和最终等价性；公开每项原始规范、精确合同、Coq定义和配置供最终人工审核。数学和 native 组件均不等于整案完成。
