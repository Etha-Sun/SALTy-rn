<!-- CURRENT_VERIFIED36_QS8_MUL_20261025 -->
当前完整已验证 **36/40**，目标 **40/40**。新增 qs8-vmul-minmax-fp32：24个实际C单元、871条C义务、7策略字段、40个普通函数体、984个源码fresh Coq模块、1042命令全0、878最终Print；14项继承假设、0新增项目公理。57个原生intrinsic spec视图人工审核仍pending。本聊天23+外部8+基线5；外部SPMM及矩阵成果保留作者归属。剩余DWCHW、Argmax、Exp、HWC2CHW继续；组件不计新增核。

QS8原件、实际反例、完整47目标精确补丁（main+46支持文件）保留，原NEON未修改。发布副本24单元CPP/归档身份和独立签发dry-run通过；私有副本数组/字段视图的UBSan及实16GiB ASan各278016例/12804556lane/side、独立oracle与单错/共错负控全通过。有限复查不算第二次形式证明。

以下保留先前阶段记录。

<!-- CURRENT_VERIFIED35_PACKW_20261025 -->
当前完整已验证 **35/40**，目标 **40/40**。新增 x32-packw-gemm-goi：13个实际C单元、312条C义务、14个普通函数体、295次源码fresh Coq编译、325命令全0、444最终假设报告；12个原生intrinsic视图人工审核仍pending。SPMM@2239bcf90属于外部贡献。本聊天22+外部8+原有5。QS8/DW全门禁继续，Argmax/Exp/HWC仍为candidate。

完整证据及 intrinsic 人工审核入口见[逐核审核索引](../docs/VERIFIED-REVIEW-INDEX.zh-CN.md)。

以下保留历史记录。

# 已验证的 kernel

2026-10-25 最新目标 **40/40**；保留半小时检查真实额度、严格超过95%收尾的规则。下文36目标为历史。

2026-10-24 用户最新规则：目标至少 **36/40**；每 **30 分钟**读取一次当前账户实际额度，任一有效窗口的已使用比例 **严格超过 95%** 时开始收尾：停止新增 kernel/验证批次，保存证明、日志、已验证清单和恢复记录，汇总可交付结果；已启动的有效有限任务优先自然完成。读数不可用时明确记录未知，不编造百分比。此规则覆盖旧的31目标及“取消额度阈值”约定，不能将收尾视为36目标已完成。

当前 **34/40**，目标 **40/40**。最新新增 [F32 SpMM](f32-spmm-minmax/README.zh-CN.md)；此前新增 [f32-maxpool](f32-maxpool/VERIFIED.zh-CN.md)；另有外部worker新增 [QS8-QC8W GEMM](qs8-qc8w-gemm-minmax-fp32/README.zh-CN.md)；此前新增 [x32-transposec](x32-transposec/README.md)；此前新增 [QD8-F32-QC4W GEMM](qd8-f32-qc4w-gemm-minmax/README.zh-CN.md)；此前包括 [qu8-vadd-minmax](qu8-vadd-minmax/README.md) 两侧修复版及 [QD8 QC8W IGEMM](qd8-f32-qc8w-igemm-minmax/README.md)；包含 [u8-vclamp](u8-vclamp/README.md)。

本目录收录完整模块化等价性检查通过的 kernel；清单见 manifest.json。后续 intrinsic 可以采用与原始规范对应的公开 spec，C 实现证明可选；实际 kernel、内存、普通 helper/caller 与 spec 绑定仍须完整检查。详见 [规范边界](../docs/INTRINSIC-SPEC-POLICY.zh-CN.md)。
原始 impl、公开 spec/contracts 和操作 shim 是审核入口；proof/c 只保存证明注释和策略。
程序前置条件、输出观察关系和硬件参数以各 case 的 spec 与 README 为准。
真实 ISA 与 shim 的对应、终止性及浮点异常标志不属于这里的完成计数。

运行某个 case：

```bash
python3 verification/qcp/verified/f32-vadd/proof/check.py --jobs 32
```

候选保留在 ../candidates；必须完整检查实际 kernel、普通 helper、比较器、wrapper、intrinsic-spec 绑定与 Coq 依赖后才能入库。

QS8转换修正明确64位类型后，已完成全部26实际C单元的统一 fresh 门禁并重新收录；旧32位模型失效记录与原证明均保留，此前17包括这项新的完整64位验收；本次再收录QS8激活，合计18。

QS8 RDSUM 本次以更强的已有C-body边界完成35实际单元/1590字段、703普通Coq、1771最终假设报告与干净发布复核；上述intrinsic新规则未被用于改写其冻结证据。

QD8 F32 QC8W GEMM 本次新增完整修复版：[审核与重放入口](qd8-f32-qc8w-gemm-minmax/README.md)。在公开 intrinsic spec 下，5个实际C单元/1914字段、1455个本地普通Coq模块及1941项最终假设报告通过；32路配置，全合法正K/N、全binary32观察域保留。人工语义复核尚未进行，ISA对应与独立终止性不计入结论。

F32 GEMM 完整修复版：[审核入口](f32-gemm-minmax/README.md)。4实际C单元/895字段、1063个本地普通Coq模块及923项最终假设报告通过；32路配置，完整合法正K/N、mr1..4、全binary32。intrinsic采用公开来源审查spec，最终人工语义复核pending；不声称ISA或独立终止性。

QS8 VADD-MINMAX 修复版现已完整收录：[审核入口](qs8-vadd-minmax/README.md)。27实际C单元、4300 C字段+15策略、492普通Coq、4496假设报告及干净发布复核全部通过；原件、修复反例与逐项intrinsic清单保留。

F32 VSQRT 两侧原始实现完整收录：[审核入口](f32-vsqrt/README.zh-CN.md)。9实际C单元/262字段+28策略/210普通Coq/290假设报告；7项intrinsic采用可审核spec，人工规格审核及正式ISA对应仍待完成。

F32→F16 精确同值 literal 兼容版完整收录：[审核入口](f32-f16-vcvt/README.zh-CN.md)。56实际C单元/2672字段+36策略/374普通Coq/2708假设报告及干净发布复核全部通过；保持原完整intrinsic C-body证明，不因新规则改写证据。

QU8 RDSUM 两侧大行数修复版完整收录：[审核入口](qu8-rdsum/README.md)。37实际C单元/62函数体/1854字段、893普通Coq、2034最终假设报告及干净发布复核全部通过；完整合法64位行数、重叠只读行和stride零保留。固定VLEN128/VLMAX32、非回绕内存契约下的部分正确性；原intrinsic C-body证明与11个继承假设完整保留。

2026-10-24：QD8 F32 QC8W GEMM补齐真实StrategyCheck目标绑定并完成独立全案复核。策略DSL具体类型改为I16，原kernel/spec SHA不变；1455个fresh模块及1941项假设报告通过，旧封存证据保留。此项是既有核复核，总数仍25/40。

QD8 F32 QC8W IGEMM 完整兼容版已收录：[审核入口](qd8-f32-qc8w-igemm-minmax/README.md)。6实际C单元/1381字段、15策略字段、1398freshCoq模块及1409假设报告全部通过。合法正K/N/entries、全binary32、重复与重叠只读输入窗口保留；配置32路。固定VLEN128，intrinsic语义人工审核pending，不声称ISA/物理ABI或独立终止性。

F32 IGEMM 完整修复版已收录：[审核入口](f32-igemm-minmax/README.md)。4实际C单元/593字段、7策略字段、687freshCoq模块和604假设报告全部通过；32路。任意合法正K/N/E、全binary32与重复/重叠只读窗口保留。固定VLEN128；intrinsic语义人工审核pending，不声称ISA/物理ABI或独立终止性。

DWConv 修复版完整收录：[证明与实现](f32-dwconv-minmax/README.zh-CN.md)，[V2发行工具路径修复](f32-dwconv-minmax/ADMISSION_REPAIR.zh-CN.md)。487项实际C字段+9策略、179次源码fresh普通Coq、501假设报告；发布身份审计与双sanitizer有限回归通过。

QD8-F32-QC4W GEMM 完整修复版已收录：[审核入口](qd8-f32-qc4w-gemm-minmax/README.zh-CN.md)。5实际C单元/1531字段、12策略字段、1610fresh Coq模块和1567假设报告全部通过；32路。MR1/NR16/cn_stride64，任意公开容量内正N/K，全binary32；NEON源码保持，RVV NaN恢复修复。固定VLEN128；intrinsic语义人工审核pending，无ISA/物理ABI或独立终止性结论。

x32-transposec 修复/兼容版完整收录：[审核入口](x32-transposec/README.md)。8实际C/381字段/13普通body、116fresh Coq、489最终Print；11既有假设、9项原intrinsic规格视图、全UInt32 written与ownframe关系。原始零宽不等价反例及精确补丁保留，修复版完整证明；不宣称原始C refinement、任意VLEN、ISA/ABI对应或独立终止性。

2026-10-25 QS8-QC8W GEMM FP32完整修复版：4实际C/1531义务/16策略/3051同环境fresh模块（续跑谱系明确）/1874假设报告，递归coqchk及32并发准入通过。原NEON保持，RVV恢复ARM NaN优先级；公开容量内正N/K，全binary32参数，固定VLEN128，精确int8输出。intrinsic语义人工复核pending，无形式ISA/ABI或完整终止性定理。 [审核入口](qs8-qc8w-gemm-minmax-fp32/README.zh-CN.md)。

2026-10-25 F32 SpMM完整修复/兼容版：4实际C/788义务/19策略/835同环境fresh模块/956假设报告，递归coqchk及32并发准入通过。完整M/N/稀疏循环、NEON4/2/1与全部合法RVV VL；全binary32，循环打包与显式容量，固定VLEN128/e32m8，数值相等或同为NaN。原件保留，两侧表达式兼容改写，RVV另修复FMA/NaN。intrinsic人工语义审阅pending，无形式ISA/ABI或完整终止性定理。 [审核入口](f32-spmm-minmax/README.zh-CN.md)。
