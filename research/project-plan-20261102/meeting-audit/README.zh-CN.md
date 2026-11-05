# 会议速览：40个kernel的修改分级与性能证据

2026-11-02，只读静态审核。比较固定 `c-shim-v2@821969733d7953a212c51839194add416fd5799b` 中的 `kernels/source|target/<kernel>.c` 与 `verification/qcp/verified/<kernel>/impl/testNEON|RVV.c`。结论针对这个可核验快照；其他分支/服务器上的后续结构保持版本不据此判定，采用时再核对。

**会议建议口径：10项两侧主C完全没改，8项大改或执行策略强改变，22项局部小改。8项中，6项有明显证明前端/资源驱动的重构，另外2项主要是为修复真实数值或布局不一致而改变执行策略。**

这不是按行数阈值自动分类，也不是修改批准。大改不自动说明错误，小改也不说明安全。“未改”只针对两侧主C字节，不能扩大为所有预处理、helper、语义模型和合同均未改。

逐项可筛选：[40项CSV](kernel-triage.csv)；逐项可读：[完整40项表及80份原始diff](ALL-40.zh-CN.md)。主文件行数沿用先前去注释/空白的文本指标，不含helper、宏展开；格式和语句拆行仍可能影响计数。

## 1. 最值得质疑的六项证明驱动重构

“可以质疑必要性”指业务/算法正确性本身不要求采用这种结构；现有QCP前端或证明资源可能要求它。以下是明确有依据的审查判断，不是已经证明存在无代价替代方案。

| 优先级 | Kernel | 明显改变 | 我的判断与会议问题 |
|---|---|---|---|
| P0 | `f32-maxpool` | RVV NaN helper从向量bitmask改为三个初始化的32-word栈数组，向量store→逐lane标量恢复→向量load；另有读表适配 | **最明显的证明适配妥协。** 计数溢出/NaN传播修复与这种scalar化不是一回事。优先要求恢复向量helper，或提供为何必须如此及性能代价的证据 |
| P0 | `f32-conv-hwc2chw` | NEON主函数650→219行；两侧拆成pixel/FMA helpers；文档明确重复只读加载次数和独立累加器交错改变 | **已改变实现结构与调度。** RVV原有masked-load、第二行clamp、写序等真实修复应独立保留审核；NEON大幅重构不应仅凭proof通过被接受 |
| P0 | `f32-dwconv2d-chw` | 58处嵌套调用展开、46处scalar-load包装、row9FMA helper抽取，增加只读权重读取 | **已超出单纯语法兼容。** 特别审查额外load与helper分界是否破坏原有寄存器复用；保持单个累加器FMA顺序并不意味着性能结构相同 |
| P0 | `x32-packw-gemm-goi` | KC循环/header因子化；NEON LD2-lane拆LD1；RVV tuple/segmented store拆成两条strided store；新增进度计数 | **明显工具驱动重构。** 点值桥只说明局部值对应，不能替代完整原程序精化与性能对照。优先研究保留原生操作与循环的方法 |
| P0 | `qs8-vmul-minmax-fp32` | 主文件RVV只计18行变化，但整段算术移入 `qm_record_compute`，另有输入/FP消费者、output-parameter加载helper | **不能按18行归小改。** magic-bias/NaN符号修复有反例依据；整段record/helper化是另一个需要解释的前端妥协 |
| P1 | `f32-argmaxpool` | RVV整通道块提取为 `ap_rvv_block32`，读表/更新/存储分层；原因明确为QCP在有限预算内处理主函数 | **显著模块化重构，但保留原九次有序更新。** 计数宽化和NEON有效tail读取是独立正确性修复；block抽取的必要性、inline和成本另审 |

依据均已读取固定源码与修复记录：

- Maxpool：[当前helper](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-maxpool/shim/propagate.c)、[修复动机](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-maxpool/proof/repair.json)。
- HWC：[修复与兼容说明](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-conv-hwc2chw/proof/REPAIR.zh-CN.md)。
- DWCHW：[逐项changes](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-dwconv2d-chw/proof/repair.json)。
- PackW：[结构与指令分解说明](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/x32-packw-gemm-goi/README.zh-CN.md)。
- QS8 multiply：[兼容与量化修复的区别](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/qs8-vmul-minmax-fp32/proof/repair.json)。
- Argmaxpool：[有限证明预算下的block抽取](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-argmaxpool/proof/repair.json)。

**性能证据更正：本轮没有新跑benchmark，但已恢复10月26日的修复前后RTL记录。** 821旧版Maxpool约45.32倍、HWC约25.20倍耗时回退已有观测；具体成本归因仍需消融，不能仅按helper数量推断。详见[实验设置与版本核对](PERFORMANCE-20261026.zh-CN.md)。

## 2. 两项执行策略改变很大，但有真实反例支持

| Kernel | 改变 | 为什么不能简单称不必要 |
|---|---|---|
| `f32-raddstoreexpminusmax` | RVV从动态向量累加/无序归约改为请求AVL=4，重建四累加器、固定pairwise树与2+1尾部 | 已有7元素普通有限数反例：sum相差1ULP；即使忽略NaN payload和零符号也不等价。需要修复或明确改变数值合同；具体固定4方案仍可寻找更高效替代 |
| `f32-dwconv-minmax` | 请求至多4lane，packed权重步长从vl改4，同时补NaN传播 | 原两侧消费同一个固定四通道权重buffer，却用不同布局推进；有限反例支持布局修复。仅23行变化也足以显著改变向量利用率 |

依据：[Exp当前说明](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-raddstoreexpminusmax/README.zh-CN.md)、[DWConv修复原因](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-dwconv-minmax/proof/repair.json)。

## 3. 两侧主C逐字未改的10项

`f32-vadd`、`f32-vcmul`、`f32-vdiv`、`f32-vlrelu`、`f32-vmul`、`f32-vmulc`、`f32-vrndne`、`f32-vsqrt`、`f32-vsub`、`u8-vclamp`。

依据是80份主文件的原件/实际版本SHA256，不是manifest中的variant标签。它们适合作为“保留主源码”对照；依然需要审查实际预处理、intrinsic绑定和公开合同。

## 4. 其余22项局部小改：仍有应标记的事项

完整列表在[40项表](ALL-40.zh-CN.md)。需要在会上单独提到：

- **GEMM**：原始diff被空白和排版放大；核心是NEON do→while及RVV局部NaN修复，不宜与HWC/PackW的结构重写归同类。增加NaN指令仍可能有成本。
- **SPMM**：拆副作用表达式和局部NaN修复；RVV mul+add改FMA是重要数值修复，但没有大幅重写循环结构。
- **qs8-rsum / qu8-rsum**：去除局部常量表 `static` 是明确前端妥协，业务语义不要求；值得检查能否恢复，以及编译器是否生成额外栈初始化。qs8-rsum另有独立的有符号溢出修复。
- **x32-transposec**：tuple zip拆zip1/zip2、strided-store普通适配器属于局部工具兼容；零宽/空高行为另审。
- **f32-f16-vcvt**：hex常量改精确同值decimal，属于前端文字兼容；不按长十进制字符串误判为算法改写。
- **量化/整数小改**：取负、shift、累加回绕、计数宽化都有可能修复极值行为；小改不是自动批准。

观察规则还需注意：当前 Maxpool/Argmaxpool 包使用比VADD更强的逐位浮点输出要求。Maxpool恢复具体payload的成本应结合用户希望的numeric-or-bothNaN目标重新评估，**不能直接删除所有NaN传播**。量化kernel把中间浮点位串reinterpret为整数时，payload可能影响最终整数，不能援引“浮点输出忽略payload”来删中间修复。

## 5. 之前有没有测40项修复前后performance？

**已找到。10月26日实验确实比较原始RVV与 `821969733` 冻结修复版及真实helper。主表30项中29项有有效GM，额外vmulc有对照，9项未测。NEON未计时；后来恢复结构的Maxpool/HWC新版明确未包含。** 此前检索遗漏Mac上的冻结归档，下面几份其他实验不能替代它，但也不能据它们说没做过修复前后实验。

[完整设置、覆盖缺口、关键源码哈希与结果](PERFORMANCE-20261026.zh-CN.md)；[恢复的主图CSV](performance-20261026-main30.csv)。本轮核对了历史真实工具输出，并重算两个关键Git文件哈希；没有重跑或新校验全部远端ELF。

| 找到的记录 | 实际测了什么 | 是否回答本次问题 |
|---|---|---|
| [2026-10-15 40项审计](../../kernel-optimization-20261015/README.zh-CN.md) | 40项清单，36个非空RVV目标编译，3种VLEN共108次功能运行、103次通过；当时尚无Saturn周期 | **不是40项性能测量，更不是40项修复前后对照** |
| 同次IGEMM/softmax候选 | 原版与优化候选的QEMU guest指令数；IGEMM减少、softmax增加 | 有局部前后对照，但不是当前C-shim修复版，也不是硬件/RTL周期 |
| [2026-10-30/31 三项RTL优化](../../sol-pipeline-comparison-20261030/round5-paper-bottom3/REPORT.zh-CN.md) | IGEMM约1.325×、Exp约1.234×、GEMM约1.010×，Saturn VLEN512 RTL周期 | 是优化baseline→候选对照，未运行形式验证；baseline来自作者公开优化版或另一份初始翻译，不能等同本次原件→verified实现 |
| `u8-vclamp/.../performance-comparison.json` | Coq构建从4并发到16并发的两次用时观察 | **证明构建耗时，不是kernel运行performance** |

10月15日源身份也重新对了一遍：[结果](performance-source-match.json)。36项有RVV目标SHA，其中35份匹配本次catalog原件；11份也匹配当前verified主C（因为这些RVV主C本身没改）。GEMM为另一个已修改版本，4项当时缺目标/空文件。这份JSON每项只有一个目标版本，没有成对记录原件与当前修复版；不能从“跑过40项”推导修改没有性能代价。

三项RTL对照的[baseline来源](../../sol-pipeline-comparison-20261030/round5-paper-bottom3/evidence/baseline-sources.json)与[配置及形式检查范围](../../sol-pipeline-comparison-20261030/round5-paper-bottom3/evidence/run-manifest.json)已读取；没有把原报告的性能数字转记到当前证明包。

## 6. 明天会议可以明确的三件事

1. **逐案区分真实修复与证明兼容重构。** 优先过第1节六项；先给出可保留原结构的方案或明确接受理由。NEON修复也可接受，但仍需逐项确认。
2. **利用已有旧版结果，补测恢复版并拆解成本。** 对Maxpool、HWC、DWCHW、PackW、QS8 multiply优先安排原件/最小语义修复版/当前证明兼容版的同配置对照；Argmaxpool与Exp/DWConv随后纳入。保持同源码闭包、编译器、FP模式、VLEN和工作负载；原版错误输入只作诊断，正确性与性能分别记录。
3. **全40项建立三列性能状态。** `原件`、`最小语义修复`、`实际验证版本`；没有中间版本就标缺失，不临时发明。沿用已恢复的29项主表GM，补DWCHW、新版与未测项；不能把功能测试时间或Coq时间当kernel周期。

有些旧README/repair.json仍写candidate或whole_kernel_verified=false，属于修复阶段历史文本；签发状态须以固定manifest绑定的status检查，本表引用这些文件只为源码改动动机，不据旧文字撤销或增加证明信用。本轮没有运行新proof、benchmark或修改kernel，仅新增会议笔记、分类CSV、diff副本和源身份核对结果。
