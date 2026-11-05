# Introduction 九段主张核查与写作说明

后续更新：本文保留初版九段的事实核查记录。Introduction 曾缩写为八段，但作者随后要求恢复原始叙述顺序、不按页数压缩。最新九段译文、原始 prompt 及英文见 `review/intro-narrative-reset-20261104/REVIEW.zh-CN.md`。以下事实边界继续适用，初版措辞不再代表当前正文。

2026-11-04。此文是作者审阅材料，正文是 `sections/introduction.tex`。本轮做文献与已有源码检查，没有重新运行 kernel 证明或性能实验。按用户后续要求，不写 Abstract。

## 叙述脉络

硬件相关的软件优化需要专门的 kernel → agents 能搜索候选 → C intrinsics 提供接近硬件且保留 C 控制流的接口 → 现有测试和有界验证已有价值，但需要明确整个 kernel 的保证范围 → 在机器码、IR、C 三个边界中选择 C → 复用语义、分离 impl/spec/proof、通过 QCP 检查 → 人工审查契约和变化 → 优化验证、迁移和独立实现检查共用同一个关系 → 实验检验覆盖、成本与性能保持。

没有把探索 Sail、byte machine、C-shim 的开发历史改写成贡献。它们用于判断抽象选择和边界。

## 逐段处理

| 原段 | 核查与调整 | 主要依据 |
|---|---|---|
| 1 | 开头写 hardware-aware software/kernel optimization，避免把软件优化误称为优化硬件本身。KernelBench 是 GPU benchmark，不是 CPU SIMD 证据；不泛称 agent 已超过所有专家。 | [KernelBench ICML 2025](https://proceedings.mlr.press/v267/ouyang25a.html)、[Autocomp v3](https://arxiv.org/abs/2505.18574v3) |
| 2 | NEON/RVV 是 ISA 扩展，不是 kernel 或新语言。用固定宽度/动态 active length 的具体差异。不承诺每个 intrinsic 都一对一翻译成单条指令，也不承诺写 intrinsic 必然高性能。 | [Arm ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html)、[RVV spec](https://docs.riscv.org/reference/isa/v20260120/unpriv/v-st-ext.html)、[IntrinTrans v3](https://arxiv.org/abs/2510.10119v3) |
| 3 | **“现有工作都未形式化验证等价性”不成立。** SALTyRN 明确有 bounded symbolic equivalence；LLM-Vectorizer 使用 Alive2。Reward hacking 的例子也包含计时作弊，功能证明不能防止所有类型。 | [SALTyRN 作者说明](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/)、[LLM-Vectorizer](https://arxiv.org/html/2406.04693v1)、[KernelBench 维护者说明](https://scalingintelligence.stanford.edu/blogs/kernelbenchv01/) |
| 4 | 用 Sail/Islaris 代表 ISA 层；Alive2 代表 LLVM IR 验证；Rake 代表 Halide vector expression 到 HVX 的等价指令选择。不能写 Rake 已完成任意跨 ISA 全程序验证。 | [Sail POPL 2019](https://alastairreid.github.io/papers/popl19-isasemantics.pdf)、[Islaris PLDI 2022](https://pub.ista.ac.at/~msammler/paper/islaris.pdf)、[Alive2 PLDI 2021](https://web.ist.utl.pt/nuno.lopes/pubs.php?id=alive2-pldi21)、[Rake ASPLOS 2022](https://people.eecs.berkeley.edu/~akcheung/papers/asplos22.pdf) |
| 5 | 使用 functional equivalence under explicit calling contracts。区分架构异常/中断与 NaN、Inf、UB、内存错误。后者不能以“不关心意外情况”排除。Sail 不是“为了 VLA 另外造了一个无法连接的语言”；不同 ISA 的状态关系、长度及内存语义需要证明，C 层也未消除它们。C 是目标驱动的选择，未声称普遍更快或更可靠。 | 上述 ISA 工作、仓库 Sail checkpoint、当前 C-shim 的实际依赖 |
| 6 | 四 ISA 写为设计范围，支持表标 TODO。QCP 通过符号执行产生局部义务；kernel/body/helper 证明支撑顶层组合。QCP 不是“证明失败必定产反例”的决策器。保持 proved / concrete discrepancy / unresolved 三种结果。 | [QCP §4、§6.1](https://arxiv.org/html/2505.12878v1)、[官方教程](https://www.qua.codes/en/tutorials/index.html)、本地 `proof/coverage.py` |
| 7 | 不写“人类只需看几十行”，因为导入的 spec 定义、模型、工具链也须审查。反例违反原调用前提时，可以补齐前提；必须有调用域证据，不能把不想处理的合法输入叫作虚假反例。低性能成本是待测目标，不是修复的自动保证。 | 已接受的 kernel execution policy；QCP public specs 的导入依赖 |
| 8 | 保留三用途。AVX/NEON 与 RVV/HVX 的相对覆盖是**某库某版本某操作**的问题；HVX 并非全新的 ISA。称 equivalence checking / semantic cross-checking，引用 differential testing 解释思想来源，引用 SymDiff 解释形式化关系。差异要分类，不能自动计为 bug。 | [McKeeman 1998](https://www.cs.tufts.edu/comp/150FP/archive/bill-mckeeman/DifferentailTesting.pdf)、[SymDiff CAV 2012](https://www.microsoft.com/en-us/research/publication/symdiff-a-language-agnostic-semantic-diff-tool-for-imperative-programs/)、[XNNPACK #441](https://github.com/google/XNNPACK/issues/441) |
| 9 | 35 是待验证的最终优化 cohort 大小，不是成功数。5 AVX 操作、10 个目标端关系、XNNPACK 缺陷数、softmax 证明/性能全部未完成。简版 P8 留在 LaTeX 注释中，未使用过去时虚构成果。 | 固定 [final kernel repository](https://github.com/keaganchern/optimized-rvv-kernels/tree/80feb4564cb470de301062109b6f89db672bdf9d)；项目已有决策 |

## 从附件吸收的写法

阅读了用户 `report.pdf` 的模型、clamp 合同、内存和源码连接部分。采用“先给具体程序及观察，再给形式定义，再解释每个前提的作用”的顺序；没有复制文字、36 个完成数、total-return 结论或 byte-memory 实现。附件属于旧 byte-machine 技术报告，不是 QCP 或新 35 项最终优化版本的证明证据。

现稿的第三节先定义逻辑输入、两侧表示和 profile，再定义浮点观察、部分正确性关系、共同规格唯一性，以及内存/终止性边界。形式表示的目的在于把可审核承诺说清楚，不是增加符号数量。

## Motivating example 的取舍

`vmax` 目前最适合解释以下链条：不同循环组织 → 同名数值操作的 ISA 差异 → 一元素 NaN 反例 → 旧本地 checker 的模型错误 → 最小目标端修复 → 回归与实测成本。

不能据此声称：

- 有界检查由于“长度太短”漏检。正确模型在长度 1 就能反驳。
- QCP 自动找到该反例。已有证据分别来自 ISA 模拟回放和隔离的 cvc5 模型诊断。
- 最终优化版及其修复已完成新 QCP 证明。
- 修复后依然比 XNNPACK 快。实测 GM 为 0.826×，原最终版为 0.982×；修复周期比 GM 增加 18.8%。
- XNNPACK 被确认有新 bug。其历史 min/max 契约未保证 NaN 传播。

因此该节明确标为候选案例，图使用真实已有结果。后续若选择符合“原优化显著更快、修复保留收益”的例子，应替换本节，而不能修改现有数字凑故事。

## 当前最需要后续落实的信息

1. 新 cohort 的 exact source/profile/proof 对应，以及四 ISA 实际支持子集。
2. 是否补终止性证明。当前证据已确认不包含该结论，见 `QCP-GUARANTEE-AUDIT.zh-CN.md`，并非让用户凭直觉决定事实。
3. 五个 AVX 操作的实际库覆盖缺口，softmax 的具体源程序及近似算法/归约顺序。
4. 主实验统一性能平台与 Keagan 原协议的差异；所有时间/token/成功数保持 TODO。
5. 作者完整邮箱和投稿时 metadata。暂保留用户给的 `ycsun@berkeley`；编译版匿名，未擅自补邮箱后缀。

## 模板与本轮范围

[ECOOP 2027 CFP](https://2027.ecoop.org/track/ecoop-2027-technical-papers) 指定 LIPIcs，双匿名；投稿无硬性页限，camera-ready 正文最多 25 页（不含参考文献）。采用页面链接的官方 `lipics-v2021` v2021.1.3，未改 class 或页边距。用户要求暂不写 Abstract，故源码中只保留说明，不生成 Abstract 占位段落。正式投稿需要补齐。

采用 `vekto-paper-writing` 和 `humanizer`，禁正文破折号连接分句；代码使用 listings 可编辑语法高亮，未截屏。没有新跑证明、性能测试，也没有向上游发 issue/PR。
