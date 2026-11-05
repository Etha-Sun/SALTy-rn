# 论文初稿规划：待用户审阅

2026-11-03。只确定叙述、章节职责和图表位置；用户批准后再创建 LaTeX。所有正式实验结果留空，35 和 5 是计划样本量，不是完成数量。用户随后授权的模拟数据仅用于独立的图表审美预览。沿用[四组实验设计](EXPERIMENT-DESIGN.zh-CN.md)与[执行规范](KERNEL-EXECUTION-POLICY.zh-CN.md)。最新确认的来源、作者、系统名及关系讨论见[Vekto 定位与元信息](PAPER-POSITIONING-AND-METADATA.zh-CN.md)。

## 1. 叙述主线

暂定英文标题：**Vekto: Verifying Semantic Equivalence of Optimized SIMD Kernels**。系统名已由用户暂定为 Vekto，展开 Verifiable Kernel Translation and Optimization；作者暂记 Yuechun Sun，邮箱 ycsun@berkeley（正式稿前核对）。可在确认投稿类型后增加 Experience Report 副标题。

面向读者的问题：优化和迁移会改变指令、循环和访存。开发者如何判断一个具体 SIMD 实现可以替换已有实现，又保留优化带来的性能？

论证顺序：真实替换需求 → 数值、内存与输入契约导致的困难 → 明确的语义与模块化证明接口 → 原实现保留和反例审查 → 四组实验 → 可复用经验及限制。

计划检验的三个论点：

- C1：在明确合法域与观察标准下，能够验证真实优化实现，而无需普遍重写为容易证明的代码。证据来自 E1、修改记录和性能；大量重写或性能损失将迫使结论收窄。
- C2：已有语义和证明资产能支持新操作、新 ISA 的接入。证据来自 E2 的新增工作与复用成本；未做受控对照时只声称实现复用，不声称因果性的效率提升。
- C3：该方法能诊断独立实现的差异，并在满足接口条件时支持程序组合。E3 与 E4 分别提供证据；无真实 bug 或应用未完成时，分别删除相应强结论。

E1 使用 Keagan 已有最终优化产物，不重新进行优化搜索；agent 用于本研究的证明与诊断，E2 的迁移单独记录。建议 Vekto 定位为独立验证层，以 SALTyRN/Autocomp 的产物为主实验；这一关系尚待讨论。原框架已有有界检查，不得写成没有验证。多 CLI 调度作为可复现工程实践简述，不单独作为论文算法贡献；不声称本文发明了优化器、共同规格或组合验证。

## 2. 每个章节呈现什么

| 章节（初稿英文） | 读者应获得的信息 | 内容与对应展示 |
| --- | --- | --- |
| Abstract | 问题、方法、实测结论和范围 | 结果句暂留占位；最后完成，不预写成功率/加速比/bug 数 |
| 1. Introduction | 为什么优化后的实现需要独立验证，本文解决什么具体问题 | 从已有优化库、迁移和 agent 候选切入；说明四组评估范围，贡献表述保持与结果一致 |
| 2. A Motivating Example | 为什么同名操作和通过测试都不能直接证明可替换 | 选一个实际 kernel，展示源/目标关键代码、契约、差异与证明障碍；候选尚未确认，当前不虚构代码或反例 |
| 3. Semantic Contracts and Verification Guarantees | 究竟证明什么、在什么条件下成立 | 输入映射、内存安全/保持、输出观察、ISA profile、部分正确性及信任边界；解释前置条件补全的合法性；F1 概念图 |
| 4. Verification Workflow and Implementation | 如何对真实源代码建立第 3 节的保证 | spec/impl/proof；intrinsic 语义接口；各实现符合性证明与组合；原源码保留、反例诊断、复用与版本验收；工具与模型版本表 |
| 5. Evaluation | 方法能覆盖多少、需要什么成本、是否保留性能 | 5.1 公共设置；5.2 E1 优化验证；5.3 E2 AVX 扩展；5.4 E3 交叉检查；5.5 E4 应用；T1–T4、F2–F4 |
| 6. Case Studies and Lessons | 哪些经验能用于下一个 kernel，哪些限制不能绕过 | 三个案例分别解释优化保留、不可行反例与契约补全、真实差异诊断；结合总体成本/失败分类，避免重复主表 |
| 7. Related Work | 与已有迁移、优化、验证和可移植 SIMD 工作的准确关系 | SALTyRN/Autocomp；translation validation；MetaLift/Tenspiler 等共享语义工作；工具使用经验；按差异与后果组织 |
| 8. Limitations and Conclusion | 当前保证到哪里，证据支持什么结论 | 模型/前端/编译器边界、硬件配置、数值观察、输入域和样本选择；只总结已经建立的结果 |

附录：全 35 项明细、5 个操作与目标关系、完整契约和审查记录、硬件/编译/计时配置、完整成本台账、反例和补丁、复现命令。不会把服务器路径、会话 ID 或任务管理日志写进正文叙述。

篇幅在确认投稿轮次与模板后分配。目标是方法与实验占主体，避免用过长背景和形式符号稀释经验发现。

## 3. 方法节的形式化深度

固定输入域 D、ISA 配置 p、观察函数 O 和具体实现 K。写清实际证明判断、两个实现的逻辑输入与内存布局对应，以及实现满足共同 spec 如何推出所需输出关系。

共同 spec 若允许多个输出，要证明它们在 O 下相同，不能仅因两个实现都满足一个宽泛的误差区间，就宣称它们等价。部分正确性只约束终止执行，终止性单独声明。浮点中间值保留真实语义；忽略输出 NaN payload/正负零的关系不能未经证明传递到任意调用者。

契约补全用真实调用域 R 与新增前置条件 P 表达审查义务：R ⇒ P。必须有 R 的来源、逐条约束依据和必要性说明；不把排除一个反例当作合法域覆盖证明。形式化内容应对应实现和验收证据，不为增加形式感引入一个未实现的大型 IR。

### 验证层次的设计依据

在方法节增加短小的 Choosing the Verification Abstraction，解释 assembly/Sail、自定义 C/intrinsic IR 与 C-shim 在语义覆盖、源代码保留、证明成本和信任边界上的取舍。研究历史用于支撑选择，不写成开发时间线；未经受控比较不宣称某一层普遍更优。Chengxi 的 verification 分支使用 CByte IR，并非 LLVM IR；其 transpiler 是独立路线，不能将使用 Lean 实现翻译器等同于已证明翻译正确。

具体证据与 E3/E4 可行性见[调查报告](FEASIBILITY-ABSTRACTION-XNNPACK-APPLICATION.zh-CN.md)。XNNPACK 共同 reference 不代表所有实现严格等价；先选精确语义操作。E4 暂以完整 Softmax 算子作为接入候选，现成 NEON/RVV 近似算法不同，因此优先评估保持指定 NEON 计算行为的 RVV 迁移。它是否满足最终应用实验范围仍待确定；单独算子不能写成完整推理应用。所有结果继续留空。

## 4. 表格：数值全部留空

初稿中的 `TBD` 表示尚未取得结果；将来 `NR` 表示没有可追溯记录，`N/A` 表示不适用。不能把缺失填成 0，也不能将未运行写为失败。下面的示例行是排版位置，不是已选定 kernel。

### T1：Evaluation coverage（正文概览）

| Experiment | Planned scope | Admitted equivalences | Reproduced differences | Unresolved |
| --- | --- | --- | --- | --- |
| E1 Optimized RVV | 35 kernels | TBD | TBD | TBD |
| E2 AVX ports | 5 operations; 2 targets each | TBD | TBD | TBD |
| E3 XNNPACK cross-checks | TBD pairs | TBD | TBD | TBD |
| E4 Application | 1 application | TBD | TBD | TBD |

分母以实际冻结集合为准；E1 的 kernel 数和 E2/E3 的实现关系数不能相加充当独立样本量。

### T2：Verification cost（正文分组汇总，外部历史优化成本单列）

| Kernel family | n | Verification time (h) | Verification tokens (M) | Peak RSS (GiB) |
| --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD |

E1 不重新优化，主表突出验证成本；外部优化时间/token 有可追溯日志才另表报告，缺失填 NR，不能拿本次验证时间代替。验证成本包括失败重试；人工等待、共享建设成本和监督开销分开记录。时间先报告中位数与范围；数值就绪后决定是否需要分位数。输入/缓存输入/输出 token 明细在附录，避免重复计数。

### T3：Source changes and performance（正文摘要，逐 kernel 数据放附录）

| Kernel | A changed LOC (+/−) | B changed LOC (+/−) | Contract revised? | Proof status | Optimized speedup | Admitted speedup |
| --- | --- | --- | --- | --- | --- | --- |
| TBD | TBD | TBD | TBD | TBD | TBD | TBD |

代码、注释、生成 proof LOC 分开统计；纳入 helper/宏与完整依赖，不以主文件小 diff 掩盖改写。修复原因与审查证据用表脚注或附录索引，正文不塞进长段说明。

### T4：Porting and cross-check outcomes（两个紧凑子表）

扩展子表：Operation、Target、New intrinsics、Reused proof assets、Added proof LOC、Verification cost、Outcome。交叉检查子表：Implementation pair、Difference class、Feasible in original setting?、Native reproduction、Contract/patch review、Upstream status。当前每个数据单元均为 TBD；没有对应观测时不猜计数。

## 5. 图的职责与美观方案

第一版以白底、深灰文字、克制的蓝/青与赭色配色为主，纹理与文字辅助区分，避免仅靠红绿。字体/尺寸最终随投稿模板调整。矢量 PDF/SVG 和 PNG 预览由同一脚本生成；不截图拼贴。

| 图 | 问题与形式 | 数据/空白处理 |
| --- | --- | --- |
| F1 Verification overview | 概念图：原始实现与候选→明确契约/各侧证明→检查器→等价结论；差异经可行性审查进入证明、规格或源码修订 | 根据实际方法绘制；提议能力与已实现能力标清。批准后细化，不画未经实现的自动闭环 |
| F2 Performance of optimized and admitted kernels | 每 kernel 两根分组柱：最终优化 RVV 与最终验收 RVV，使用同一个优化前 RVV 基线；标 1× 参考线；35 项按家族分成多个面板 | 当前只显示坐标和待填标识，不生成假柱；没有数据的 kernel 保留位置，不能显示成 0× |
| F3 Time and token cost | 对齐的两个面板分别展示每 kernel 验证耗时和 token；验证器与 agent 时间细分仅在可靠可分离时使用；外部优化成本有记录才另报 | 单位分别标明，不用双纵轴混合秒与 token；缺少优化日志保留 NR，不插值 |
| F4 Extension outcomes | 5 个操作×两个目标的状态矩阵，配新增/复用成本小表 | 不用颜色深浅暗示未经测量的“能力”；当前全部留空 |
| F5 Application performance（E4 有结果才进入正文） | 同一 RVV 平台的端到端柱状图，必要时辅以各阶段耗时 | 不把不同设备上的 NEON/RVV 比值当成迁移方法的速度收益；无结果先留图位 |

速度比定义：S_opt = T(B0)/T(Bopt)，S_admitted = T(B0)/T(Badmitted)；二者共用 B0 和相同输入形状。Bopt 原样验收时，两根柱相同是合理结果。修改后的保留比 T(Bopt)/T(Badmitted) 单独报告，不能混淆为优化收益。

每 kernel 多形状的汇总方法在运行前冻结，建议先求各形状配对速度比，再用几何平均；说明覆盖形状与权重。整体几何平均限定明确、相同的可比较集合，并展示覆盖数；不隐藏缺失或错误候选。置信区间来自真实重复样本，不凭空添加。柱图从零起始；差异跨度确需对数图时，使用清楚标轴的补充点图，避免截断柱高造成误读。

当前审阅用[空数据图表预览](paper-plan-figures/layout-preview.png)把 F2/F3/F4 放在一张设计板上，正式论文会拆为独立图。图中 K01–K35、Op1–Op5 是未分配位置，不是样本身份；没有任何实验值或成功标记。预设纵轴范围仅展示排版，正式取值随真实数据调整。

用户随后授权了[模拟数据图表预览](paper-plan-figures/synthetic-preview/README.md)，用于评价有柱体、有表格数值时的美观程度。每图标 SYNTHETIC DATA，CSV 独立保存，不与真实 source inventory 绑定。主文/正式表格仍使用 TBD；模拟数值不进入摘要、结论和实验完成数。

## 6. 初稿的留空规则

可以先写：背景问题、准确的相关工作、可从代码确认的方法、保证定义、实验问题与协议。

需要证据后才能写：实际成功数、加速比、token/耗时、复用降本、真实 bug 数、上游接受状态、应用完成情况。初稿用单独可搜索的结果占位，不写“我们发现/证明/提升”后接虚构数字。摘要和结论的结果段随证据填写；35/5 只写成计划评估范围。

代码例子、反例和 case study 先占位，选到真实源码与证据后再展开。正文不出现内部审批过程、agent 派工过程和本次聊天历史。

## 7. 需要用户补充或确认的信息

### 用户已经确认（本轮更新）

1. **优化器的角色**：只验证 Keagan 已有最终优化版本，不重新搜索。两项目的论文关系尚待讨论，当前推荐独立验证层加主实验来源。
2. **35 项的来源入口**：[optimized-rvv-kernels](https://github.com/keaganchern/optimized-rvv-kernels/tree/80feb4564cb470de301062109b6f89db672bdf9d)，35 个 C 文件已核实，见[身份清单](KEAGAN-FINAL-SOURCE-INVENTORY.json)。源 NEON、优化前 RVV 和 harness 的映射仍需核查。
3. **性能环境与对照目标**：优先对齐 Keagan 的 Saturn + Shuttle / FireSim 评测。无法取得的配置明确报告，替代平台内部对照保持一致，不保证跨平台数值相同。M1 Pro 影响 ARM 对照，不阻止 RVV 内部对照；HVX 可测环境仍待核实。

### 可在章节批准后确定，当前有默认安排

- 投稿沿用 ECOOP Experience、英文稿；具体年份/轮次/篇幅与官方模板实施时核实。作者和系统名按新元信息，单位及完整邮箱仍待核对。Overleaf 的 tool/FIX/NEW 宏约定已保存，不提前生成正文。
- E2 选样遵循“目标后端缺少对应操作”的优先条件；缺少五项时报告而不悄悄改变条件。
- 应用尚未选定；先保留图像预处理/Softmax 候选，不把某一个写成已采用。
- 主要保证沿用当前讨论的合法输入域、数值相等或双方 NaN、忽略最终 ±0/payload，其他包有独立契约的逐项说明；内存条件、部分正确性与硬件配置明确列出。
- B0 无法找到时如何定义性能基线，交叉检查样本数、真实测试/有界检查对照及基准形状集合，先依据代码调查形成具体建议再确认。

## 8. 找到的写作要求及适用方式

来源：[Humanizer 中 Yuechun 的学术写作偏好](/home/ycsun/.codex/skills/humanizer/SKILL.md)，其记录说明来自用户明确偏好及 Kexin Pei、Jun Yang 的反馈；另参考 [paper-outline](/home/ycsun/.codex/skills/deepscientist-paper-outline/SKILL.md) 与 [write](/home/ycsun/.codex/skills/deepscientist-write/SKILL.md)。

- 保持既有术语一致，不为同一对象反复换名，不创造难懂的连字符标签。
- 在概念出现处解释具体对象、条件和操作，代码与反例必须来自真实材料。
- 不用破折号压缩句间关系；清楚说明主体、条件和因果。数学减号、范围与规范术语照常保留。
- 段落形成连贯论证，设计选择回到实际问题；相关工作不夸大前人缺陷。
- 区分测量、个案观察、解释和因果证明；保留基线、分母、配置与范围。
- 结果段解释数据回答了什么问题，不罗列数字，也不加空泛口号。

已有参考阅读包：[ECOOP Experience 与相关工作](../ecoop-experience-reading-20261024/README.zh-CN.md)。MetaLift 的复用成本、GraphicsFuzz 的差异分类、PhASAR 的资源分析提供组织参考；正式写作前核对对应原文与引文，不把阅读笔记直接当原论文证据。

当前交付包括审阅计划、空数据版式和用户授权的模拟数据预览。没有 LaTeX、真实新实验结果或专用 outline validator 验收；用户批准后再生成英文论文初稿及可编译模板。
