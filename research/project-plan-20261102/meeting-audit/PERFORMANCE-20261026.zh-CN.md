# 10月26日修复前后性能实验：设置与版本核对

2026-11-02 补充核对。**确实做过 catalog 原始 RVV → 冻结修复 RVV 的周期比较。此前只找到10月15日功能审计和10月30日优化实验，遗漏了这份归档，应纠正。它符合“修复前后比较”的对象要求，但不代表全部40项、两种架构或后来恢复结构的最新版都已测完。**

## 证据来源和核实程度

通过 Mac 上聊天“分析并解释冻结版文档”（`01a17a1f-6fde-7d91-9e65-a0908af86655`）恢复了实际读取归档文件的命令输出，不仅依据旧助手的总结。原归档位于 `/Users/sun/Desktop/code/quick-trial/publication-frozen-821969733-20261026T212509Z`。

- [恢复的配置、版本说明及原始周期摘录](performance-20261026-recovered-evidence.json)：保留命令、输出、截断状态和来源。
- [恢复的主图30行CSV](performance-20261026-main30.csv)：从历史 `cat main_plot_data30.csv` 输出提取，数值未重算；是汇总数据，不是322任务全部原始日志。
- 本轮重新读取本地固定 Git 对象，并计算下面两个关键源文件的 SHA256，匹配归档版本说明中的旧版前缀。
- 本轮没有重新访问 Mac 文件系统或实验服务器、重新校验全部ELF/日志、运行benchmark或重跑证明。历史 `SHA256 checked 105 failures []` 仍属历史记录。

## A、B到底是谁，是否是“现在”

| 对象 | 确切含义 |
|---|---|
| A：original | SALTyRN catalog `kernels/target/<kernel>.c` 的原始 RVV 译文；不是XNNPACK手写RVV或Autocomp优化输出 |
| B：current / frozen repaired | 固定 `821969733d7953a212c51839194add416fd5799b` 的 `verification/qcp/verified/<kernel>/impl/testRVV.c` 及实际普通helper |
| 本次会议静态审核 | 同一提交；关键Maxpool helper和HWC主文件新算哈希匹配历史冻结记录 |
| 后来恢复结构的版本 | **未被此图测量**；不能把旧版回退倍数直接用于新版 |

归档 `COHORT-VERSION-NOTICE.zh-CN.txt` 明确记录：

| 文件 | 本轮重算821快照SHA256 | 当时记录的新候选SHA前缀（本轮未取得候选文件） |
|---|---|---|
| Maxpool `shim/propagate.c` | `6866385bf0cd56d4fc10c90c1751d6acf34022a107911dd5356cc12711e1d48b` | `a8e0ce19176223af…` |
| HWC `impl/testRVV.c` | `fbe1d3bd721d8fb09d1067b3bedf29dc01be91c07b7f0d8360aa070587871335` | `ef6bcc7679166fb5…` |

Maxpool主函数可以相同而helper不同，因此核对版本不能只看主C。归档当时已注明“按用户要求先不重测”；它不是新版性能报告。

## 实验设置

| 项目 | 冻结记录 |
|---|---|
| 执行平台 | CPU运行 FireSim/FASED metasim 的真实RVV机器码/RTL模型，目标 `chipyard.GENV512D256ShuttleConfig`，Shuttle＋Saturn |
| 向量配置 | VLEN=512 bit，DLEN=256 bit，MLEN=256 bit |
| 缓存/内存 | L1I 32KiB、L1D 16KiB、L2 512KiB；16GiB模型内存，LatencyPipe读写延迟参数30周期 |
| 频率 | 目标配置1GHz，不是仿真主机频率；测目标cycles，不测仿真墙钟速度 |
| 工具链 | Zephyr SDK `riscv64-zephyr-elf-gcc`；pin路径记录GCC 14.3.0运行库/头文件 |
| 简单/复杂kernel编译 | `-O3 -march=rv64gcv -mabi=lp64d -ftree-vectorize -fopt-info-vec-all -mcmodel=medany -mno-relax -std=c11 -DNDEBUG` |
| 测试驱动 | 额外 `-fno-tree-vectorize -fno-tree-slp-vectorize`；矩阵/Exp使用各自归档协议，不据此推定所有编译命令完全一致 |
| helper | 复杂核普通 `.c` helper分开编译、无LTO；矩阵source-faithful profile保留header helper在同一TU可见，仍无LTO |
| 顺序 | 每形状分别运行AB和BA：A原始、B修复；两个ELF分别启动，同一任务中分别计时两个版本 |
| 重复/预热 | 每顺序每版本计时1次；简单/复杂/Exp无候选预热，矩阵计时前各运行1次功能检查；无清缓存保证 |
| 时间窗口 | 多数使用fence、显式AVL=0重置、rdcycle围住实际native调用；真实helper成本在内，输入准备/oracle/检查/打印在外；Exp按legacy协议 |
| 指标 | 每形状先取AB、BA的原始/修复cycles比值的几何平均，再对该kernel完整有效形状等权GM |
| 可比边界 | 带本地COM字段和after-main退出协议修正；`paper_exact=false`，不称原论文FPGA平台精确复现 |

输入不统一：逐元素有16/64/256/1024/4096等适用规模；rdsum部分为10行、改变通道数；Exp含16/64/256/960/1024/4096/8160/16384个FP32；F32 GEMM为M=1,K=512,N=512，而F32 IGEMM为M=1,K=7,N=13,E=3，SPMM为M=4,N=13、每输出1个非零且dmap全0。矩阵主结果各只有1个形状，不应推广为完整尺寸表现。

## 40项实际覆盖到了哪里

- 30个至少一侧主C有修改的kernel进入主表：28个RVV有改动，2个仅NEON改变（`qs8-f32-vcvt`、`qu8-rsum`）。
- 主表29项有有效GM：实际修改RVV中27项有结果（8项>1，19项<1），另2个源码相同RVV对照也有结果。`f32-dwconv2d-chw`为0/6完整形状，无主表GM。
- 额外未改对照 `f32-vmulc` 的历史GM为0.9746555721645441，不在主图。另9项未测：f32-vadd/vcmul/vdiv/vlrelu/vmul/vrndne/vsqrt/vsub、u8-vclamp。
- 总计31个kernel被安排、30个有汇总比值（包含额外vmulc），并非40个全部有性能结果。
- 冻结时322个顺序任务：294 SUCCESS、16 RAW_COST_NON_EQUIVALENT、4 PARSE_FAILED、8 running；314结束不等于314有效。主表145个完整有效形状。
- DWConv主GM仅1/9形状，另8个因原始版布局/oracle不匹配被排除；Transpose完成3/4。错误输出的cycles没有混进等价加速比。
- 4个DWCHW任务另有事后整程1小时预算截断，发生于首个计时标记之前；不能据此声称kernel挂死或运行超过1小时。独立补充中的单顺序/另一profile结果不能填进主表。

## 会上可用的结果及限制

| 821冻结修复版 | GM：原始/修复cycles | 修复版耗时倍数，约 |
|---|---:|---:|
| f32-maxpool | 0.0220678 | 45.32 |
| f32-conv-hwc2chw | 0.0396811 | 25.20 |
| x32-packw-gemm-goi | 0.106529 | 9.39 |
| f32-raddstoreexpminusmax | 0.191080 | 5.23 |
| qs8-vmul-minmax-fp32 | 0.265867 | 3.76 |
| f32-argmaxpool | 0.414587 | 2.41 |

Maxpool一个小形状（C8、池化1、输出1）原始/修复cycles为AB 648/18567、BA 541/18723，两顺序均明显回退。**大幅回退已有观测，不再只是静态风险；具体有多少来自修复、helper边界、编译或布局，还需消融。** 两个源码相同对照也达到1.1257和1.1497，不能把几个百分点的变动当作已确立的收益；AB/BA不是重复采样，当前无置信区间。

性能oracle包含有限测试及部分容差（Exp），不等于全域/逐位等价证明；VLEN512运行结果也不扩大原有各kernel形式证明配置。只要程序在测试输入上过了oracle，并不意味着该修复已被用户批准。

会议建议：承认已有这组前后测量，保留821旧版作证据；优先定位恢复版Maxpool/HWC的完整源码闭包，用同一协议补新版对照；补DWCHW及缺失形状，并根据论文范围补9项未测对照。另做最小正确性修复版对照以区分正确性成本与证明适配成本。NEON性能仍需独立测量。

## 与Keagan论文的区别，以及回退原因（后续问答）

本轮读取了仓库保存的原始16页论文，见[PDF](../../sol-pipeline-comparison-20261030/round5-paper-bottom3/paper/SaltyRN-original.pdf)第8页基础设施、第12页Table II；另读取[作者后续35核报告](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/)。两个版本的案例数/最终数字不同，不拼接为同一次实验。

| 维度 | Keagan论文/公开代码 | 10月26日冻结实验 |
|---|---|---|
| 共同硬件参数 | Saturn＋Shuttle，VLEN512/DLEN256，表I按目标1GHz换算 | 这些参数一致 |
| 仿真宿主 | 论文明确AMD Xilinx U250 FPGA加速FireSim | CPU FireSim/FASED metasim；测的仍是目标cycles |
| 完整硬件身份 | 尚未绑定原论文唯一preset、revision、cache/内存配置 | 明确GEN preset与本地COM字段/退出协议修正；不能宣称完全复现 |
| ARM侧 | 原论文有Apple M1 Pro NEON实测 | 无NEON计时 |
| 比较对象 | 原始翻译/优化后RVV对手写RVV；另有优化前后等图 | catalog原始译文对我们821修复版，不包含Autocomp优化输出 |
| 计时协议 | 公开harness依类型而异；通用模板参考预跑3次、候选测3次取最小；Exp另有5轮预热。所检查入口按候选列表遍历，没有自动AB/BA交换 | 每形状AB/BA，各版本各1次；多数无候选预热，矩阵有功能预调用 |
| 构建 | 公开后端注入候选、Zephyr/CMake构建；论文最终每图完整编译链接身份尚未绑定 | 固定SDK、实际helper；普通.c helper独立TU无LTO，header helper另按source-faithful处理 |
| 形状 | Table II给五个优化案例；最终出图与所有公开harness并非已逐项对应 | 部分对齐Table II，额外小尺寸；矩阵主表每核仅1形状 |

公开代码直接依据：[通用HARNESS_MAIN](https://github.com/keaganchern/autocomp/blob/5b8b2163d715ab5be3bd7cfd1aa4d340e4e2a740/autocomp/backend/saturn/rvv_bench/src/harness_common.h#L198)、[Exp预热和遍历](https://github.com/keaganchern/autocomp/blob/5b8b2163d715ab5be3bd7cfd1aa4d340e4e2a740/harnesses/xnnpack-f32/test0.c#L32)。这些是公开代码事实，不等于证明原论文每根柱子采用该版本模板。

**CPU与FPGA仿真的宿主速度不同，不能直接解释目标周期回退。** 若目标RTL、内存模型、输入及协议一致，宿主快慢主要影响跑实验的墙钟时间。本轮A/B都在同一冻结profile运行，观察到的回退应首先检查程序/构建/测试状态；与论文环境不同主要限制跨实验结果对齐，不是免责解释。

将本次静态分类与恢复CSV连接：8项大改/策略强改变中7项有GM且全部<1，1项缺结果；实际修改RVV的20项局部小改中12项<1、8项>1。合计27项有效修改RVV中19项<1、8项>1；方向统计不等于显著性检验或总体模型减速。

| 修改机制 | 源码证据与观测 | 判断边界 |
|---|---|---|
| Maxpool向量计算转临时数组/标量恢复 | 每次NaN传播helper把三个向量写到数组，逐lane处理再load；GM0.0221 | 常规有限输入也走这些操作；是45.3倍回退的强嫌疑，但没有逐指令归因。NaN传播必要，不表示必须用这种实现或保留payload优先级 |
| HWC拆多层pixel/FMA helper | 修复文档承认重复只读load和全局交错改变，且普通.c分开编译无LTO；GM0.0397 | 可能增加调用、重载、寄存器保存并失去复用；不能把25.2倍全归为修复masked-load/clamp的固有成本 |
| Exp压低活跃VL并重建求和树 | 原m4动态VL，修复主循环AVL=4；VLEN512/SEW32/LMUL4容量64，即大输入每轮64→4；GM0.1911 | 16倍循环次数潜在差异不是16倍耗时预测。有限值1ULP反例在numeric-or-bothNaN下仍失败；必须处理舍入顺序，但可以研究宽向量计算指数＋独立保持顺序的累加，尚非已完成优化 |
| DWConv固定四通道布局 | AVL≤4、权重步长vl→4，同时修NaN；主GM0.6729只含1/9形状 | 原版另8形状输出错误被排除，不能以错误实现的快为正确基线。layout修复必要，具体4lane实现未证明性能最优；原生各自packing补充实验独立，不合并 |
| VMIN/VMAX及GEMM clamp增加检查/merge | VMIN加两个NaN比较、一次add及两次merge，普通输入也执行；VMIN0.9039/VMAX0.9336 | 全NaN输入域下需要处理返回NaN与返回数字的区别，忽略payload不能删除传播；这种修复可能有正常路径成本，确切比例需消融 |
| PackW/量化乘法helper化 | PackW分段store改两次跨步store并拆helper；QS8 multiply计算移入record helper；GM0.1065/0.2659 | 普通函数边界、数据搬运、硬件指令成本是候选原因；尚无独立增量归因 |
| 扩展参数域的分支 | 量化vadd增加shift范围与方向分支；GM约0.92/0.87 | 编译器可能循环外提，不能仅凭源码断言每轮都额外分支；参数域须有调用依据，必要性逐项确认 |
| 纯语法适配 | F32→F16只把两个hex常量改精确十进制，GM1.012 | 不应产生固有运行时计算成本；没有证明本实验最终机器码相同，1.2%也不能作为该写法的优化收益 |

SPMM虽归局部小改却约3.87倍耗时，不能忽略：已测形状M=4、每输出只有1个非零，新增每输出NaN处理相对计算量很大；这是合理假设。其mul+add→FMA同时修正舍入，不能从整核下降推导FMA本身更慢。

共同观察只忽略输出NaN payload与±0：仍区分NaN和数字、仍区分不同有限值，不允许随意改变中间符号零/NaN语义。反之，Maxpool旧包若要求payload位级选择，比用户希望的观察更强，可能多付成本；必须另立经确认的合同并重验，不能直接撤掉代码沿用证明。

最有信息量的下一步是同profile比较原始版、最小正确性修复版、821证明兼容版、保持修复但恢复结构的优化版；原始错误形状只留诊断。再分别做helper可见性/LTO、NaN实现、VL策略的消融并检查汇编。既有独立REF补充里，Maxpool同TU可见性并未改善该小形状，故不能预先许诺“开LTO就全恢复”。本轮只分析，未启动这些新实验或改变合同。
