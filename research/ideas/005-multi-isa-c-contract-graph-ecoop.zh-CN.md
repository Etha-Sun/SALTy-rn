# 从 NEON→RVV 到多 ISA C intrinsic 验证图：ECOOP experience 候选

日期：2026-10-24（America/Los_Angeles）。状态：定向文献与源码调研；助手提出的实验建议，未经用户采纳。未生成新 kernel、未运行新证明、未修改现有模型或公开合同。

## 用户原话与本轮假设

> 你看下现在verified 已经有30个case了，只是因为我们现在run out 了 token，现在我们假设这个已经连接上了，你现在需要帮我们想想下一步，我们的工作目标是ecoop的一个experience paper 因为这个novelty 毕竟有限，现在需要你参考一下autocomp，salty-rn，这些工作，搞清楚我们的立意。
> 我现在不想仅仅局限在neon to rvv，我觉得我们可以建立一个unified c semantic 只是需要你去调研一下我们有没有对于avx 或者hydrix（这个名字我忘记了）的c intrinsic？看看我们这个路线，有没有希望从一个neon to rvv的一个边，拓展到一个图？

名称澄清：用户对“是否指 Hexagon/HVX”回答“不确定，继续查就好”。本轮另发现发音更接近的 **Hydride**，它是编译器工作，不能把它当作 ISA；Hexagon/HVX 才提供另一族硬件 intrinsic。不能替用户确定原先想到的是哪一个。

按用户要求，以已有30项的链路可接通为研究前提。本轮没有重新审计30项或解除其 ISA/refinement/终止性边界；新架构支持及成本收益均未建立。此前核对的30项清单快照为 `c-shim-v2@daaeea1ef50cbf782eaefcddfeb95fdbfca03f0d`。

已有 idea 001/004 讨论共同规格、独立符合性、平台 profile 和直接关系证明成本。本卡扩展到多 ISA 及 experience 评估，不将这些旧候选认定为已经实现。

## 可以成立的研究目标

候选定位：**在现成 SIMD intrinsic C kernel 上，研究 agent 辅助的模块化验证如何跨 ISA 复用，以及语义、内存和工具边界如何限制这种复用。**

“增加架构数”“采用共同IR”“由等价传递性组成图”均不足以单独作为新颖性。ECOOP Experience 类别允许实际应用已有PL技术、工具和有价值的负结果；仍需相对已有工作提供新的、可复查的实证结论。

候选英文题意：*From Pairwise SIMD Translation to Reusable Cross-ISA Verification: An Experience Report*。不是已选论文标题，也不承诺录用。

## 已查证的外部事实

### AutoComp 与 SALTyRN

- AutoComp 论文 v3 §3.3 使用随机输入与参考实现对照测试过滤候选，并用硬件模拟性能反馈进行搜索；它不是该论文中全部候选的无界整核证明。当前仓库已经具有多硬件 agent/backend，因此不能将“LLM多后端”作为本项目独特贡献。
- SALTyRN 作者公开说明：NEON→RVV 翻译先经编译/Spike，再做固定配置与增长输入尺寸下的有界符号等价；优化阶段扩展 AutoComp，最终赢家再验证。不能把有界符号输入误称为随机测试，也不能把其配置外长度说成已证。
- 本项目可区分的候选问题是：真实C循环与内存行为、显式intrinsic合同、可检查证明、模型审查及跨ISA增量成本，而非再做一个更快的代码生成器。

来源：

1. Hong et al., *Autocomp: LLM-Driven Code Optimization for Tensor Accelerators*, arXiv:2505.18574v3，§3.3：<https://arxiv.org/html/2505.18574v3>。
2. AutoComp 官方仓库：<https://github.com/ucb-bar/autocomp>；README 本轮读取的 blob `15228bffdbb89b42a2ae9df23d56cd6104b15bfa`。
3. Chern et al., SALTyRN 作者报告，2026-07-27：<https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/>。
4. SALTy-rn 官方实现 README：<https://github.com/keaganchern/SALTy-rn/blob/main/README.md>，本轮 blob `79c2aab0bffdc3226431f128aeedbca69a361589`。

### AVX 与 HVX 的 C 接口和现成 kernel

AVX/AVX2/AVX-512 有成熟 C intrinsic，例如 `<immintrin.h>` 的 `_mm256_add_ps`、`_mm256_loadu_ps`。FP32加法是AVX；许多256-bit整数运算需要AVX2；FMA是需独立标明的扩展，不能把“AVX2”作为全部功能的统一能力开关。

Hexagon HVX 有 `<hexagon_types.h>`、`<hvx_hexagon_protos.h>` 等接口，公开 LLVM 头文件列出 `HVX_Vector Q6_Vw_vadd_VwVw(...)` 等原型及硬件 builtin 绑定。有头文件不等于拥有可直接由现有证明器处理的标准C实现，也不证明其ISA对应。

**直接可用的同算法样本来源是 XNNPACK。** 本轮查到其 `src/f32-vbinary/` 同时包含：

- `vop-neon.c.in`、`vop-rvv.c.in`；
- `vop-avx.c.in`、`vop-avx512f.c.in`；
- `vop-hvx.c.in`、`vop-wasmsimd.c.in`、`vop-scalar.c.in`。

`f32-vadd.inc` 明确登记 NEON、RVV、AVX、AVX512F、HVX、WasmSIMD 与 scalar 的实现。因此第三节点可先附接既有实现，避免把“LLM生成新目标代码”的失败与“新语义后端”的失败混在一起。生成模板仍要固定版本和参数，不能当作已经检查的实例。

XNNPACK 本轮查询到的 master HEAD：`23dd5070fa002ef0b124817798ae090fa29f9653`。

源码证据：

- <https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/f32-vbinary/f32-vadd.inc>；读取的 blob `a59978d4fa75eda7828f3ee053671f214693193e`。
- AVX模板：<https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/f32-vbinary/vop-avx.c.in>；blob `5d50a479927ba5d04cfab0e12babc2e757d5edd5`。尾部包含整数地址运算的mask表和masked load，并非只增加一个add合同。
- HVX模板：<https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/f32-vbinary/vop-hvx.c.in>；blob `00099e77284e3be6cafda143d2e2035efb61b7cb`。
- HVX浮点封装：<https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/xnnpack/simd/f32-hvx.h>；固定HEAD重新读取的 blob `eae8c337965d2d91dfd059025df44cb2bf4ae746`。
- LLVM HVX原型：<https://clang.llvm.org/doxygen/hvx__hexagon__protos_8h_source.html>。
- 编译器厂商 x86 C intrinsic 表：<https://learn.microsoft.com/en-us/cpp/intrinsics/x86-intrinsics-list>。

关键反对证据来自HVX封装：`__HVX_ARCH__ >= 81` 与旧版本的add/mul路径不同，旧版本出现qfloat转换；`xnn_div_f32` 使用 `fast_inverse__vsf` 后乘法；`XNN_SIMD_HAS_NATIVE_FMA` 为0，较新版本的 `xnn_fmadd_f32` 写成乘后加。这些源码足以否定“相同函数名天然具有同一精确FP语义”的假设，但本轮没有执行HVX，不宣称已经得到具体硬件反例。HVX版本与IEEE功能开关必须进入profile。

### 必须比较的近邻工作

| 工作 | 已覆盖的部分 | 本项目应检验的差异 |
|---|---|---|
| SIMDe | 既有x86/NEON intrinsic的跨平台实现 | 对实际C kernel/内存/循环的可检查证明；不能宣称首次跨平台intrinsic统一 |
| Highway | 可移植、长度无关的C++ SIMD接口 | 接收已有目标相关C程序，保留其实现和精确语义差异，而非要求用统一API重写 |
| Hydride，ASPLOS 2024 | 从vendor伪码生成共同AutoLLVM IR及多ISA后端；涵盖x86、NEON、HVX | 本轮读取的论文§6.2明确只支持整数指令、不合成load/store；可研究完整C控制流、内存及浮点经验，不能据此否认其现有形式语义和等价检查 |
| MISAAL，PLDI 2025 | 语义驱动、可重定向的综合/重写优化 | 应作为Hydride的后续工作一并比较，不能只拿旧编译器做新颖性判断 |
| Minotaur/Alive2 | LLVM层SIMD综合与精化验证；扩展165个x86 vector intrinsic | 所读版本处理无循环片段；需与本项目完整C循环/内存范围对齐，而非声称LLVM没有SIMD验证 |

来源：

- SIMDe官方README：<https://github.com/simd-everywhere/simde>，本轮 blob `24f9697fc80fe6b54a9568b76cf5144a6c1ea319`。
- Highway官方README：<https://github.com/google/highway>，本轮 blob `e5ce350c263eff7e19bffac77649a88f87f85d12`。
- Kothari et al., *Hydride: A Retargetable and Extensible Synthesis-based Compiler for Modern Hardware Architectures*, ASPLOS 2024, DOI 10.1145/3620665.3640385：<https://publish.illinois.edu/hpvm-project/files/2025/04/Hydride-4.pdf>，尤其§6.2；项目：<https://hydride.cs.illinois.edu/sample-page/>，代码：<https://github.com/akothen/Hydride>。
- *MISAAL: Synthesis-Based Automatic Generation of Efficient and Retargetable Semantics-Driven Optimizations*, DOI 10.1145/3729301：<https://hydride.cs.illinois.edu/misaal-synthesis-based-automatic-generation-of-efficient-and-retargetable-semantics-driven-optimizations/>。本轮读取项目摘要，未完整审计其实现或全部浮点/内存支持。
- *Minotaur: A SIMD-Oriented Synthesizing Superoptimizer*, arXiv:2306.00229v2：<https://arxiv.org/html/2306.00229v2>，§3.4及loop-free slice范围。
- ECOOP 2027类别与artifact要求：<https://2027.ecoop.org/track/ecoop-2027-technical-papers>。

## 对 unified C semantics 的候选解释

沿用现有C程序逻辑/语义，而不是重建完整ISO C解释器。可新增的是参数化intrinsic语义层：位宽整数、明确舍入的浮点操作、向量/谓词、带活动lane与地址范围的内存操作，再由每ISA profile/合同绑定。

各ISA的细节必须保留：wrap/饱和、融合/非融合、NaN与零、subnormal与FTZ、mask/tail、对齐与越界读取、布局与别名、lane shuffle。不能把所有名字为add/min/FMA的操作合并；不能把未观察lane一律设零后宣称覆盖RVV全部行为。

已有用户intrinsic-spec政策允许不为每个intrinsic重建C body；公开合同、语义定义和来源是明确边界，不能借新统一层把假设隐藏起来：
<https://github.com/Etha-Sun/SALTy-rn/blob/daaeea1ef50cbf782eaefcddfeb95fdbfca03f0d/verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md>。

## 图的含义与组合条件

一个节点应该是 `(kernel, ISA, 实现版本, profile, 输入/输出表示, 合同及证据)`，而非单独一个“AVX”。

对共同逻辑输入x，在覆盖的域D内，每个实现证明其返回观察等于共同参考F_K(x)，并满足各自内存/frame条件。表示适配、调用前提和域覆盖必须检查，才能组合两个节点的结论；部分正确性不自动提供终止性。

如果已有pairwise证书，也可直接利用关系的传递性，但必须对齐中间程序版本、内存表示、观察关系和适用域。参考可以是已验证NEON实现的观察，不要求先写完所有kernel的数学规格。参考正确性与产品功能正确性是额外问题。

从m个实现得到m(m-1)/2个可比较关系，不等于得到了这么多独立新证明。证明等价只需连通的生成边，固定NEON参考本身也只需m-1条边。因此不能把O(m²)→O(m)写成相对所有pairwise方法的收益；须对照同样支持复用的star/spanning-tree基线。

“二者都在1 ULP内”不自动给出相同1 ULP的可传递边。误差关系要组合预算；不同FMA顺序/近似倒数可能只能建立共同误差合同，而不是精确等价。三角互测或cycle一致不能替代共同语义本身的审查。

## 候选实验与最低成功标准

本轮建议，不是已授权实施/已采纳路线：

1. **最小三节点pilot**：选固定XNNPACK commit的f32-vadd，保留其实际NEON/RVV/AVX程序体；检查共同输入/观察、各侧tail和内存合同，新增AVX语义合同并证明caller。导出AVX↔RVV关系时不重新证明已关闭的NEON侧。首先记录mask表整数地址、C vector ABI与前端适配实际成本。
2. **6–8个代表kernel**：逐元素、整数reduction、量化clamp、min/max、复数/重排、一个GEMM等，具体样本按三个ISA真实可取得的匹配实现冻结。加入至少一个预期不等价或需独立修复的案例；不得为凑连接默默排除NaN或改变观察。
3. **HVX第四节点挑战**：先选1–2个整数或语义已核清的kernel；固定HVX版本。add/mul可以作为候选，不能预先假定浮点精确匹配；div/FMA作为范围挑战或负例候选。没有设备/模拟器时可做C模型证明，但不能报告硬件性能。
4. **成本对照**：同模型、同kernel版本、同合法域与观察、同agent/预算，对照(a)仅原生/差分测试，(b)原固定NEON参考的直接验证并允许参考侧复用，(c)共同合同/库复用。必要时在相同子集重放SALTyRN有界检查，不能比较不同规格的“成功率”。

指标应分开记录首次模型/合同/审查成本、每新ISA成本、每新kernel成本、重用定义/引理及实际重检依赖、token与费用、CPU/wall/RSS、unknown与预算失败、真实反例及修复。token耗尽是资源状态，不等价于证明不可能。

最强反对实验：若第三ISA仍要求为每kernel重写大部分语义/不变量，共同层只节约模板行数而不降低总成本，则不宣称可扩展验证图优势；仍可形成关于复用边界和失败原因的experience结论。若不增加ISA，也可用原30/40的多轮记录写验证工程经验，但“跨ISA图”只能留为展望。

## 论文可检验的候选问题

- 相同算法在不同ISA间，哪些语义/调用/观察条件决定能否精确连接？负结果是否有可复现反例或明确工具缺口？
- 对新ISA、新kernel和优化版本，哪些证明构件真正被复用，增量总成本是否下降？
- 在固定输入域和预算下，agent在循环不变量、地址/布局、FP与模型绑定上的成功和失败如何分布？哪些错误仅靠随机/有界检查不容易暴露？

这些问题应与当前30项历史证据分层：原版/修复版、C-body/spec-only、人工语义审核状态、固定硬件参数和观察政策分别记账。不能将不同轮次的绿色计数混为完全同一保证。

## 本次完成与下一步

完成了本地idea001/004和共享环境背景重读、AutoComp/SALTyRN与近邻定向调研、AVX/HVX接口和XNNPACK同族样本定位。发现Hydride是重要近邻，HVX数值策略是直接的可行性边界。

没有实现统一层、没有新proof或cost实验、没有证明新颖性或确定投稿成功。下一候选anchor是冻结一个三ISA f32-vadd pilot的输入/观察/比较合同，然后再决定是否正式投入多ISA扩展。当前选择权仍在用户。

## 2026-10-24 后续：将同 ISA 优化纳入动机

用户进一步明确：“不只是为了跨语义的翻译，也是保持语义的优化”，并要求仔细分析 SALTyRN 的 NEON→RVV 动机、下载相关 ECOOP Experience 论文。

后续材料见 [阅读包](../ecoop-experience-reading-20261024/README.zh-CN.md) 和 [动机笔记](../ecoop-experience-reading-20261024/MOTIVATION.zh-CN.md)。该扩展意味着图的边也包含 RVV baseline→RVV optimized 等同 ISA 改写；统一层的候选收益应同时在迁移和优化上测量。本卡原先的多 ISA pilot 仍是候选，不替代或限制用户新增目标。
