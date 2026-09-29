# 两段机器码直接等价：Islaris 与可复用的已有工作

调研日期：2026-09-23。此次重点是论文、公开源码、证明入口和相关开发分支；没有重新执行 Islaris／HOL Light／PATE 的完整证明构建。此前运行的 Isla 指令实验与此次源码审查是不同证据。

## 1. 结论

**已经有工具直接证明两段真实机器码的关系／等价，而且不必以“双方满足同一个弱规格”为依据。最直接的实用先例是 s2n-bignum 的关系式证明基础设施；PATE 也直接比较两个 binary。**

**Islaris 当前公开主线中，没有核实到面向两段不同机器码、尤其 NEON→RVV 的现成关系式验证流程。** 它有单程序验证、循环证明以及 Sail/trace 间的 simulation 基础设施。这些值得复用，但不能据此认定跨程序等价已经实现。

**进一步核查还发现，Sail 生态的 Katamaran 当前主线已经有双程序 weakest-precondition 定义和 adequacy 证明。** 因而也不能说 Sail 路线缺少关系式逻辑本身；需要评估的是现成实现能否接上两套真实 ISA 及目标 kernel，详见第 4 节。

尚未核实到现成工具同时具备：原有 Sail Arm/RVV 语义、直接跨 ISA 程序比较、动态分块向量循环、可复用的自动化。这个组合是候选研究范围；“直接等价”“循环关系证明”“NEON 向量化验证”各自都已经有先例。

## 2. Islaris：查到了什么，没有查到什么

主线固定版本：`c978e10f50db5c40f0fdf113f5f76a779782c6f9`。

| 证据 | 实际能力 | 不能由此推得的结论 |
|---|---|---|
| [`theories/lifting.v` 的 `wp_asm_def`](https://github.com/rems-project/islaris/blob/c978e10f50db5c40f0fdf113f5f76a779782c6f9/theories/lifting.v#L87) | 对一个 trace／执行状态定义 weakest precondition | 已有双程序关系式证明入口 |
| [`theories/adequacy.v` 的 `isla_adequacy`](https://github.com/rems-project/islaris/blob/c978e10f50db5c40f0fdf113f5f76a779782c6f9/theories/adequacy.v#L91) | 对任意步数的执行建立安全性与事件规格性质 | 自动建立另一个程序的匹配执行，或自动保证返回／终止 |
| [`sail-riscv/base.v`](https://github.com/rems-project/islaris/blob/c978e10f50db5c40f0fdf113f5f76a779782c6f9/sail-riscv/base.v#L113) | 泛化的 simulation/refinement 定义，存在复用空间 | 已有 Arm↔RVV 的实例与配套自动化 |
| [`sail-riscv/memcpy.v`](https://github.com/rems-project/islaris/blob/c978e10f50db5c40f0fdf113f5f76a779782c6f9/sail-riscv/memcpy.v) | 验证同一 RISC-V 指令程序的 Sail-generated Coq 与 Isla trace 的连接 | 验证两个经过不同优化／跨 ISA 的程序 |

这与[原论文 §4–5](https://people.mpi-sws.org/~dreyer/papers/islaris/paper.pdf)的工作流一致。循环不变式可以覆盖任意合法迭代次数，但这解决的是单程序推理，不自动给出跨程序对应关系。`spec.v` 中出现的 `Equivalence` 是规格谓词自身的等价关系，不能仅凭关键词认作 binary equivalence 功能。

为避免只看旧主线，读取了官方 18 个公开分支和 API 返回的 4 个公开 fork，并检查几个可能相关的分支差异：

- `2024-12-new-coq-sail-stdpp`：RISC-V 模型与 coq-sail 寄存器状态迁移。
- `CN2Islaris`：输出目录、自动添加 SMT constraints。
- `alt-semantics`：较早的替代操作语义部分实现。
- 最近有活动的 `codygunton/islaris`：其默认分支与官方主线比较结果为 identical。

分支与 fork 元数据、上述 diff 已保存到 [sources/direct-equivalence/](sources/direct-equivalence/)。没有逐个完整审计所有分支、所有 fork，也不能排除未公开工作。

一个实质后续是 **Morello-Cerise（PLDI 2025）**：扩展 Islaris 处理 capability 和未知代码，证明封装安全。它确实涉及 logical relation，但其展示目标是任意外部代码下保护内存不变量，而不是两个 kernel 的行为等价。论文还明确说明，已知指令的简化假设仍要在程序证明中满足。[论文 §5–8](https://www.cl.cam.ac.uk/~pes20/pldi25-paper646-camera-ready.pdf)

因此，结论应是“没有找到已完成的目标实例与流程”，而不是“单程序逻辑在数学上不可能证明关系性质”。可以把另一程序的语义编码进规格或 ghost state，也可以构造组合程序；这些方案仍需证明连接、终止性与观察关系，不能称为已开箱即用。

## 3. 最接近的现成直接等价方法：s2n-bignum

**CAV 2025《Relational Hoare Logic for Realistically Modelled Machine Code》**提供 HOL Light 关系式逻辑，并用于优化前后密码学机器码的等价证明。其案例包含 NEON 向量化、指令重排和循环软件流水。[论文](https://arxiv.org/html/2505.14348v1)

本轮没有只接受论文摘要，而是读取了论文指定版本 `c747b1b66801e3975a8da502e18962838d3be945` 的实际定义、教程和证明文件：

1. **直接关系式目标存在。** [`common/relational2.ml`](https://github.com/awslabs/s2n-bignum/blob/c747b1b66801e3975a8da502e18962838d3be945/common/relational2.ml#L22) 定义 `ensures2`，前置条件和后置条件直接作用于一对机器状态。
2. **教程没有要求重写两边共同的数学功能。** [`arm/tutorial/rel_equivtac.ml`](https://github.com/awslabs/s2n-bignum/blob/c747b1b66801e3975a8da502e18962838d3be945/arm/tutorial/rel_equivtac.ml#L63) 的输出关系直接要求两边输出 buffer 内容相等，并约束各自允许修改的状态。
3. **有配套证明自动化。** [`arm/proofs/equiv.ml`](https://github.com/awslabs/s2n-bignum/blob/c747b1b66801e3975a8da502e18962838d3be945/arm/proofs/equiv.ml#L1181) 和教程提供 lockstep／stuttering 等逐步推理。用户提供指令块对应的 `equal`／`replace` action；工具再证明对应表达式相等。因此“有自动化”不等于自动发现所有对应关系。
4. **确实覆盖循环变换。** [`bignum_emontredc_8n_cdiff.ml`](https://github.com/awslabs/s2n-bignum/blob/c747b1b66801e3975a8da502e18962838d3be945/arm/proofs/bignum_emontredc_8n_cdiff.ml#L8227) 有 `MAINLOOP_EQUIV`，调用 `ENSURES2_WHILE_PAUP_TAC`，循环参数是 `k4`。文件开头说明了多个中间程序及等价证明的组合；这不是自动比较任意两个大循环。

### 为什么出现步数 n 仍不等于 bounded checking

`ensures2` 的执行步数由初始状态上的函数给出，定理量化所有满足前置条件的初始状态。循环证明中的步数可以随输入长度变化。**证明“每个输入都在它对应的步数后满足关系”，与“只搜索前 K 步”不同。** 判断是否 bounded 要看定理量化范围和证明方法，不能只看到 `n` 或 `eventually_n` 就下结论。

### 为什么还不能直接用来验证 NEON→RVV

- 使用仓库自己的 ARM／x86 HOL Light 模型，README 明确说明模型包含简化和理想化；此次没有找到其模型到原有 Sail ISA 的完整对应证明。[项目说明](https://github.com/awslabs/s2n-bignum/blob/2343008bfb878a1433fef1565ef8dad824b09ee7/README.md#L319)
- 已核查的 `ensures2` 使用一个状态类型 `S` 和一个 `step`，两边均是该机器的不同程序；ARM 专用 tactics 也按 ARM 状态工作。当前主线文件仍采用这一形式。跨 ISA 可考虑推广或统一编码，但这些是待实现适配，不能把同 ISA 案例当成已完成的异构 ISA 支持。
- 没有核实到 RVV 模型及 NEON↔RVV 实例。需要的人工状态关系、循环配对和专用引理仍不可忽略。

这项工作是我们应优先对比的方法基线。若只提出“加入关系不变式、允许两边不同步执行、组合局部等价”，创新性不足。

## 4. 其他路线是否已经补齐缺口

### Katamaran：已经有关系式逻辑代码，不能只按旧论文判断

2025-05-12 的[项目进展报告](https://cordis.europa.eu/project/id/101040088/reporting)称正在扩展关系式验证。本轮进一步检查当前公开主线 `fd327e8ccccabc03a069825b4b04a5bbf4001639`，发现实际代码比“未来计划”更具体：

- [`theories/Iris/BinaryWeakestPre.v`](https://github.com/katamaran-project/katamaran/blob/fd327e8ccccabc03a069825b4b04a5bbf4001639/theories/Iris/BinaryWeakestPre.v#L154) 的 `semWP2` 接收两个语句、两份局部状态及关系后置条件，分别管理两边机器资源。它不是仅仅把单程序规格叫作 relational。
- [`BinaryAdequacy.v`](https://github.com/katamaran-project/katamaran/blob/fd327e8ccccabc03a069825b4b04a5bbf4001639/theories/Iris/BinaryAdequacy.v#L241) 有 `wp2_strong_adequacy` 及证明体。其前提包含左侧执行到终值，右侧匹配执行存在性来自关系 WP；不能将这条定理直接读成双方无条件终止或对称行为集合相等。
- [`RiscvPmp/LoopVerificationBinary.v`](https://github.com/katamaran-project/katamaran/blob/fd327e8ccccabc03a069825b4b04a5bbf4001639/case_study/RiscvPmp/LoopVerificationBinary.v#L220) 有双侧 loop 推理；核查处使用相同的 step／loop 函数。模块共享 Base、Program 和 Semantics，并非已装配好的 Arm/RVV 两套 ISA 入口。
- [`RiscvPmp/BlockVer/BinaryVerifier.v`](https://github.com/katamaran-project/katamaran/blob/fd327e8ccccabc03a069825b4b04a5bbf4001639/case_study/RiscvPmp/BlockVer/BinaryVerifier.v#L85) 中有显式 `Axiom pure_decode_inr_inj`，用于解码唯一性。因此如要复用该具体 block-verification 路径，必须审计、证明或消除这个假设；不能据此否定全部 Katamaran，也不能不看依赖便称该路径完全无公理。

结论：**这是 Sail 方向更直接的关系逻辑复用候选，优先级应提高。** 目前没有核实其能导入完整 NEON/RVV、自动匹配不同分块循环，或给出本任务的端到端证明。本轮读取了这些定义和证明体，没有构建 Katamaran，也没有对其所有公理依赖做闭包审计。

### 其他对比项

| 工作 | 已有能力 | 与本任务的距离 |
|---|---|---|
| [PATE](https://github.com/GaloisInc/pate) | 输入原版与补丁 binary，直接比较可观察行为；尝试推断 slice 的条件，不需要用户手写完整功能规格 | 固定版本的架构入口只注册 AArch32 与 PPC；不具备本任务的 AArch64 NEON＋RVV＋Sail 接入 |
| [Simuliris，POPL 2022](https://iris-project.org/pdfs/2022-popl-simuliris.pdf) | Iris 系的语言通用 simulation 框架，研究保持终止性的程序变换 | 展示实例是 SimuLang、Stacked Borrows 等；没有核实到 Sail NEON/RVV 的现成实例。可以借鉴理论，不能与 Islaris 名字相近就视为已整合 |
| [DimSum，POPL 2023](https://plv.mpi-sws.org/dimsum/paper.pdf) | 不同语言、内存模型之间的组合与 refinement | 论文实例是 Rec 与基于 ARM 思路的 Asm 等；没有展示原始 Sail NEON/RVV kernel 的直接等价流程 |
| [Interaction Tree Semantics for RISC-V，2026 预印本](https://arxiv.org/html/2605.04933) | Rocq 原生 ITree 语义、跨层 bisimulation 与若干重排验证案例 | 列出的扩展不含 V；与 Sail 语义的一致性证明列为后续可能工作。不能当作已有可信 Sail→ITree lifting |

PATE 结论还核对了固定版本 [`ArchLoader.hs`](https://github.com/GaloisInc/pate/blob/284879d8bb3865e0f96e430995b944af2fbf21a0/arch/Pate/ArchLoader.hs)：目前组合的是 `AArch32.archLoader` 与 `PPC.archLoader`。本轮未运行 PATE，也未审计其完整 soundness；只确认它提供直接 binary 比较入口及明确的架构限制。

## 5. 对我们研究任务的修正

主问题应改为：

> 在原始 Sail ISA 语义基础上，现有关系式验证方法能否以较少人工适配，证明 NEON 固定分块与 RVV 动态分块 kernel 的直接可观察等价？

“直接关系式证明”仍需写明输入状态对应、可观察输出、允许的内存效果及 corner case 范围，但不必手写一个共同的数学算法规格。输出相等关系是我们要证明的性质，不是预先假设两边相等。

现在有两条应先评估的复用路线：Katamaran 已有 `semWP2` 与 Sail/μSail 生态连接；s2n-bignum 已有成熟度更可见的向量化和循环优化等价案例。前者重点核实 ISA 接入及具体证明假设，后者重点借鉴程序配对和自动化。不能因为 Islaris 主线没有直接入口，就立刻决定重新发明关系式逻辑。

有辨识力的最小后续实验是同一例 `s8-vmax`：

- 以已有 Sail/Isla 指令语义为起点，建立两边独立机器状态和共同输入内存。
- 用 s2n-bignum 的关系式组合思路作为基线，尝试组合 load–max–store 和循环；明确记录现有库可直接复用的部分与新增部分。
- 先固定 VLEN、保持合法 batch 符号化，直接证明最终输出内存相等，并单独满足终止／进度要求。不要用固定 16 字节指令比较替代此目标。
- 改成 `vmin`、制造长度更新或尾部处理错误，检查能否拒绝。超时只能记为未知，不能视为证明或反例。

还要注意：RVV 一轮不一定恰好对应整数个 NEON 轮次，关系应允许在不同控制位置建立，不能未经证明把动态 `vl` 当作 16 的倍数。若要使用这一性质，需要从具体 `vsetvl` 行为和可达状态证明它。

评价重点是：人工关系不变式／对齐提示的数量、每个新 kernel 的新增引理、随长度与配置变化的扩展性、ISA 语义连接的信任边界。若现有逻辑加薄适配就够用，应承认主要是工程集成；若困难集中在动态分块和归约的可复用自动化，再讨论新方法。

本轮的明确新发现是 **s2n-bignum 已有可审查的直接机器码等价证明代码，并涵盖 NEON 和循环变换；Katamaran 主线已有双程序逻辑和 adequacy 证明**。因此，之前仅以 Islaris 缺少现成入口推测 research gap 的证据不足，需要将这两条路线纳入对比。
