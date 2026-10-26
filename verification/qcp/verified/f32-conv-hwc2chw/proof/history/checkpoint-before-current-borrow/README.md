# HWC → CHW 卷积候选，尚未整核验证

目标来自40项catalog；当前保存两侧原件、历史Frama-C参考、已fresh重编通过的浮点数学模型（8本地模块），并已落RVV修复草稿（待native/实际C证明）。正式计数不增加。

复用DW中完整binary32/FMA/NaN/minmax模型；已重新编译8个本案数学源，不复用VO或证明信用。后续保留原NEON的27次FMA顺序及通道/末行别名写序，修复RVV第二行上界、越界load、NaN传播和奇数右边界跳过FMA等问题。实际uint64索引也需修复，不能把输入宽度缩为32位来绕开溢出。

历史参考的raw6/6并非whole complete；其returncode1/completefalse完整保留。当前RVV草稿采用真实masked load/FMA、两普通NaN传播helper及全uint64全局索引；NEON原件不变。SDK/native检查、完整补丁及native反例、实际helper/两侧kernel/caller、写入及未写frame、intrinsic原始ISA对应清单和全案fresh门禁仍待完成。公开契约草案的输入/输出跨度、padding、RO别名与valid footprint边界需对齐原API和真实C后明确记录；当前未宣布任何域为已验证。
