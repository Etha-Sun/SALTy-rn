# Vekto：论文定位、来源和元信息

**后续写作更新：** 用户已授权并要求生成中英文论文式 Markdown、以 LaTeX 编写全部表格，并把图注移到图片外。新稿见[交付包](vekto-paper-draft-20261103/README.md)。下文关于等待写作授权和图内模拟标记的旧安排，由此次要求取代；模拟数据仍须在题注和来源中明确披露，不能作为结果。

2026-11-03。区分用户已确认的安排与尚待讨论的定位。本文没有启动优化、证明或性能实验。图表模拟数据只用于视觉审阅。

## 已确认

- 系统暂名 **Vekto**，展开为 **Verifiable Kernel Translation and Optimization**。
- 作者暂记 **Yuechun Sun**；邮箱逐字保留为 **ycsun@berkeley**，正式投稿前核对完整地址，不自动补后缀。机构信息暂留空。
- E1 只验证 Keagan 已有最终优化结果，不重新运行优化搜索，不以旧 catalog 中间版本替代。
- 来源：[keaganchern/optimized-rvv-kernels](https://github.com/keaganchern/optimized-rvv-kernels)，本轮 main 提交 **80feb4564cb470de301062109b6f89db672bdf9d**；完整树有 **35 个 C 文件**。逐文件路径与 Git blob 身份已保存到 [清单](KEAGAN-FINAL-SOURCE-INVENTORY.json)。原 NEON 与优化前 RVV 尚未逐项绑定，清单对应字段留空。
- 性能优先贴近 Keagan 的评测方式与配置。确实无法取得的硬件或配置须明确列出；本研究内部对照保持同一目标平台、输入和计时协议。接近原论文数值是复现期待，不是修改协议或筛除样本的验收条件。
- 用户允许编造图表预览数据；只有独立 synthetic-preview 目录可存模拟值，图上明示。正式结果和正文数字仍留空，LaTeX 正文等待叙述方案确认。

## 建议定位：独立验证层，以 SALTyRN 最终产物为主实验

建议表述：Vekto 为 SIMD 迁移和优化产物建立可审查的语义等价证明；SALTyRN/Autocomp 提供主实验中的真实候选。两者能组成完整工作流，生成端与证明端的贡献分别归属。

| 关系选项 | 优点 | 目前判断 |
| --- | --- | --- |
| SALTyRN 是主实验来源，Vekto 是独立验证框架 | 真实高性能候选，贡献边界清楚，能容纳 XNNPACK 与其他 ISA | 推荐，尚待用户决定 |
| Vekto 是 SALTyRN 的验证扩展 | 集成故事直接，适合描述优化后的验收位置 | 可作为 E1 集成方式；只写这一定位会弱化其他三组实验 |
| 将 SALTyRN 整体作为 Vekto 主框架 | 完整迁移、优化、验证流程易于叙述 | 当前不建议；需要真实集成证据与准确归属，且不能将外部优化能力变成本工作的独立贡献 |

不能把原框架写成只有随机测试。[优化产物 README](https://github.com/keaganchern/optimized-rvv-kernels/blob/80feb4564cb470de301062109b6f89db672bdf9d/README.md) 明确记载有界符号等价检查，且最终候选会针对 RVV 基线重新检查。Vekto 的实际增量应逐项比较：长度是否仍受展开界限约束、参数域、内存/别名/尾部、浮点观察、证明检查器、模型与前端信任边界。当前不能先承诺全部 35 项都达到更强保证。

两者联系可以在三个位置描述：

1. 引言/动机：以真实优化候选提出问题，已有检查提供何种保证，哪些部署条件仍需明确。
2. 方法/系统图：上游翻译优化产出固定候选；Vekto 接收原源程序、候选和有依据的合同，构造并检查证明，报告验收、反例或未完成。当前离线检查最终产物；不声称每次搜索迭代已在线接入 Vekto。
3. E1 主实验：完整 35 项、源文件与合同身份、原样验证比例、必要修复、成本和优化收益保留情况。E2/E3/E4 支撑独立于这个上游项目的适用范围。

一个可用的英文定位句：

> Vekto validates semantic equivalence for translated and optimized SIMD kernels. Our main evaluation uses the final RVV implementations produced by SALTyRN and its Autocomp-based optimization stage.

这是工作范围表述，尚非实验成功声明。暂定标题可为 **Vekto: Verifying Semantic Equivalence of Optimized SIMD Kernels**。系统全称包含 translation/optimization，正文需解释 Vekto 验证这些变换，当前 E1 不包含新的优化搜索算法。

## 性能平台与比较对象

本轮重新读取本地原论文 Infrastructure：ARM 是 Apple M1 Pro；RVV 是 Saturn + Shuttle，VLEN=512、datapath=256，使用 U250 上的 FireSim。原 PDF 是 32 项版本，而新仓库是 35 项，不能认为所有图和配置已自动一一对应。来源：[本地论文](../sol-pipeline-comparison-20261030/round5-paper-bottom3/paper/SaltyRN-original.pdf)、[已有差异审计](meeting-audit/PERFORMANCE-20261026.zh-CN.md)。

当前命令确认本机为 x86_64 AMD EPYC 9554；没有据此断定用户其他机器不具备 M1 Pro。既有记录表明本地运行过 Saturn/FireSim metasim/RTL，但本轮没有重新启动。原 FireSimSaturnConfig 与本地 GENV512D256ShuttleConfig 的完整对应尚未确认；仅 VLEN/DLEN 相同不等于同一评测环境。

工作安排：
- 优先恢复目标 RTL/Chipyard revision、scalar/vector/cache/内存配置、编译器/flags、输入尺寸/packing、预热、计时窗口、重复次数、最小值/几何平均等原协议。
- 将原 NEON、优化前 RVV、最终优化 RVV、必要修复后的 RVV、手写 RVV 对照分别绑定版本；手写基线和优化前译文是不同分母。
- 在一个固定 RVV profile 中测最终版、验收版和可用基线，不能混用旧结果或不同机器。
- 若 FPGA 不可用，优先评估同目标 FireSim metasim 路线；它是否等同于论文配置仍需核对目标与时序内存模型。宿主墙钟时间不是目标 cycle。
- 若 M1 Pro 不可用，ARM 对照作为明确标注的替代平台实验，或暂缺该项；不影响 RVV 内部性能保留对照。不能用换 ARM 平台的倍数当作精确复现。
- 与 Keagan 报告比较先确保候选、基线、输入和分母相同，再报告差异；不保证数值一定接近。

E1 不重新优化，因此优化阶段时间/token 属于外部历史成本。有可追溯记录才报告，缺失用 NR。主成本图突出本研究的验证时间/token、重试和共享建设成本，不用新测量倒推历史优化成本。

## 后续 Overleaf 宏约定

现阶段保存约定，不创建论文 .tex。后续 preamble 使用：

```latex
\usepackage{xspace}
\newcommand{\fix}{\marginpar{\scriptsize FIX}}
\newcommand{\new}{\marginpar{\scriptsize NEW}}
\newcommand{\tool}{\textsc{Vekto}\xspace}
\newcommand{\toolname}{Verifiable Kernel Translation and Optimization\xspace}
```

作者信息按最终模板填写，暂用 Yuechun Sun / ycsun@berkeley。用户给出的 TopoVerus、ExVerus、AutoVerus 是宏组织示例，不作为本项目系统名称；只有后续正文确实使用某个比较系统或 Iterative Refinement 基线时，再定义对应宏。FIX/NEW 用于写作批注，正式投稿导出时统一隐藏。

## 预览图的身份

[性能柱图](paper-plan-figures/synthetic-preview/01-performance.png)、[验证耗时/token](paper-plan-figures/synthetic-preview/02-verification-cost.png)、[覆盖与成本表](paper-plan-figures/synthetic-preview/03-coverage-table.png) 全部使用模拟数据。K01–K35 没有映射真实文件，31/2/2 等结果分布只是排版样例。不同图使用同一个模拟 CSV，避免样例之间数字矛盾。没有伪造置信区间。

[系统关系图](paper-plan-figures/synthetic-preview/04-framework.png) 是建议定位的概念图，没有模拟测量值，也不表示集成已完成。
