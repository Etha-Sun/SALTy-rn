# Idea 记录方法与索引

本目录沿用 `AGENTS.md` 和 `SERVER_HANDOFF.zh-CN.md` 的约定：保存用户原意，结合项目源码和原始资料调研；候选方向不自动成为项目决定。2026-10-09 将既有卡片的记录方式明确写在此处。

每份卡片记录以下内容，按问题规模调整篇幅：

1. **日期、状态和目标**：区分待澄清、已调研候选、局部实验通过、真实语义桥完成、已采纳；最后一种需要用户已有决定。
2. **用户原话**：保留原文；后续澄清追加记录，不用助手的术语改写原始想法。
3. **助手解释与假设**：说明所理解的问题、范围及与已有 idea 的关系。
4. **证据**：分别链接本项目源码、已有检查记录、当次实验和外部一手资料；注明日期、配置与支持边界。
5. **成立条件与反对理由**：列出额外证明义务、可能失败的例子，以及现有工作已覆盖的部分。
6. **候选验证与成功标准**：尽量使用同一输入域、同一观察和相同未解除前提作对照，计入首次基础设施成本。
7. **本次实际动作与未完成项**：阅读/推断不写成形式证明；历史检查不写成新运行；未检查的方案不写成已实现。

同一主张的澄清可追加到原卡；有独立研究问题时新建连续编号卡片并互链。更新本索引，保留原有内容、失败证据和用户的未提交工作。具体日期的调研记录保持可追溯，不用新的结论覆盖旧证据的时间和范围。

| 编号 | 问题 | 当前记录状态 |
|---|---|---|
| [001](001-cross-isa-spec-interface.zh-CN.md) | 用共同确定性规格隔离跨 ISA 顶层与完整模型 | 候选；总成本收益待对照 |
| [002](002-rvv-small-vl-reference.zh-CN.md) | 用小 vl 参考执行简化 RVV 验证 | 受限程序类候选；无通用小规模充分性 |
| [003](003-rvv-loop-block-semantics.zh-CN.md) | RVV 指令内部的 lane loop 与受检查 block | 抽象 pilot 有检查记录；真实 ISA bridge 未完成 |
| [004](004-shared-contract-isa-profiles.zh-CN.md) | 共享 kernel 合同与可复用的两侧环境/调用适配 | 2026-10-11 抽象接口、clamp 与观察组合有检查记录；真实 ISA bridge 未完成 |
| [005](005-multi-isa-c-contract-graph-ecoop.zh-CN.md) | 从 NEON→RVV 扩展到多 ISA C intrinsic 验证图及 ECOOP experience 定位 | 2026-10-24 定向调研候选；已定位 AVX/HVX 与 XNNPACK 样本，复用收益和新 ISA 证明未建立 |
| [006](006-verified-optimization-rules.zh-CN.md) | 从实际 kernel 优化提取带前提的已验证规则，减少重复证明 | 2026-10-30 已分类并调研 ATL/Exo/Isaria 等；新规则证明、语义桥与摊销收益待实验 |

相关后续证据：[2026-10-07 的 40 kernel 合同审查](../kernel-contract-vl-audit-20261007/README.zh-CN.md)。它扩展了 001/002 的项目背景，不等于 40 个 kernel 已验证。

讨论与核查（2026-10-10）：[Tianrui 讨论后的 Isla 假设、异常与小模型调研](../isa-assumptions-20261010/README.zh-CN.md)，附 39 条指令的假设清单及给 Alvin 的英文草稿。作为 004 的后续证据保存，没有将新建议自动采纳为实现路线。

该记录第 8 节追加用户的三项 TODO，并保留转写更正：Cell 指 Sail，LLVM 指 RVV；合成器与小模型仍为探索方向。

会议与 Slack 后续（2026-10-11）：[三层合同、Keagan SMT→Lean 与 GEMM checklist](../meeting-followup-20261011/README.zh-CN.md)。新增抽象 Lean 证明，2,244 组 GEMM host 模型测试及 NaN 差异；真实 Coq/Isla 环境缺失与未完成语义桥分开记录。


GEMM 后续（2026-10-11）：[任意 NaN bounds 修复、FMA payload 反例、共享观察及 ULP 预算](../meeting-followup-20261011/README.zh-CN.md#11-多方向继续任意-boundsfma-payload共享观察和-ulp)。局部 Lean 定理与新测试通过；整段 all-input bit-exact GEMM 尚未完成，NaN 类别等价仍为候选政策。


FMA 后续（2026-10-11）：[payload 修复与任意非空 K 的条件性组合](../meeting-followup-20261011/README.zh-CN.md#12-fma-payload-修复与任意-k-的组合2026-10-11)。既有 NaN 反例均已逐位回归通过；数值 FMA bridge、真实内存/循环和 ISA refinement 未完成，新增 scratch footprint 已显式记录。


数值桥后续（2026-10-11）：[独立 SoftFloat / host FMA 对照及 SMT NaN round-trip 审计](../meeting-followup-20261011/README.zh-CN.md#13-独立数值-fma-检查与-smt-编码边界2026-10-11)。百万级样本逐位通过；canonical adapter 的 Quiet 性质经 Lean 检查，ISA/IEEE refinement 仍是未完成义务。


舍入桥后续（2026-10-11）：[RNE 舍入核心与 sticky-bit 证明](../meeting-followup-20261011/README.zh-CN.md#14-数值桥的第一段rne-舍入核心2026-10-11)。整数规则与带明确无回绕上界的 32 位操作等价，七项局部定理经 Lean 检查，无额外 native checker 假设；精确乘加、指数对齐、打包与真实 ISA 对应仍未完成。


共享 spec 审核点（2026-10-11）：[整数 FMA、具体 GEMM 合同与三方检查](../meeting-followup-20261011/README.zh-CN.md#15-可执行共享-spec-与审核点2026-10-11)。新增 11 项局部定理；128,118 组 FMA、640 组 GEMM/13,440 个输出逐位通过。待用户审核固定 FP profile 下只观察输出位模式的第一阶段范围；小模型没有被认定为已认证 ISA，Sail/真实内存 refinement 仍未完成。
