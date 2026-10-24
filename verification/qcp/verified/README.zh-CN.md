# 已验证的 kernel

2026-10-24 用户最新规则：目标至少 **36/40**；每 **30 分钟**读取一次当前账户实际额度，任一有效窗口的已使用比例 **严格超过 95%** 时开始收尾：停止新增 kernel/验证批次，保存证明、日志、已验证清单和恢复记录，汇总可交付结果；已启动的有效有限任务优先自然完成。读数不可用时明确记录未知，不编造百分比。此规则覆盖旧的31目标及“取消额度阈值”约定，不能将收尾视为36目标已完成。

当前 **29/40**，目标至少 **36/40**。最新新增 [qu8-vadd-minmax](qu8-vadd-minmax/README.md) 两侧修复版及 [QD8 QC8W IGEMM](qd8-f32-qc8w-igemm-minmax/README.md)；包含 [u8-vclamp](u8-vclamp/README.md)。

本目录收录完整模块化等价性检查通过的 kernel；清单见 manifest.json。后续 intrinsic 可以采用与原始规范对应的公开 spec，C 实现证明可选；实际 kernel、内存、普通 helper/caller 与 spec 绑定仍须完整检查。详见 [规范边界](../docs/INTRINSIC-SPEC-POLICY.zh-CN.md)。
原始 impl、公开 spec/contracts 和操作 shim 是审核入口；proof/c 只保存证明注释和策略。
程序前置条件、输出观察关系和硬件参数以各 case 的 spec 与 README 为准。
真实 ISA 与 shim 的对应、终止性及浮点异常标志不属于这里的完成计数。

运行某个 case：

```bash
python3 verification/qcp/verified/f32-vadd/proof/check.py --jobs 16
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
