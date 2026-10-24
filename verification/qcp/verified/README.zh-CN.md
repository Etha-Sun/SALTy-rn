# 已验证的 kernel

当前 **21/40**，目标至少 **31/40**。最新新增 [qs8-rdsum](qs8-rdsum/README.md) 两侧修复版；包含 [u8-vclamp](u8-vclamp/README.md)。

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
