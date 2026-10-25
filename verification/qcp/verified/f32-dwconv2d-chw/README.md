# f32-dwconv2d-chw（candidate）

当前仍为 candidate，不能计入 verified。NEON主函数559项及RVV主函数180项实际C义务均已通过完整VC_Correct、第二次类型检查及逐字段假设报告；普通helper、公开caller与策略组件也已通过。当前完整清单为13个实际C翻译单元、1167条C义务、37个普通函数体与3组策略11字段，等待全部目标重新生成与完整源码fresh门禁。

验证对象是 `impl/` 中披露修复与兼容重构后的 C；原件在 `proof/original/`，精确补丁、NaN反例、原件来源与修复原因在 `proof/repair.json`。该历史记录的patch_file_count=5已在 `proof/repair-inventory-audit.json`纠正为实际6个补丁目标；独立准入必须零模糊重放全部6个。不声称原始未修复C已经形式精化到此版本。历史错误load注释及其失败记录保存在 `proof/address-contract-repair.json` 和 history 中，不记新证明信用。

公开输入保留所有binary32值，包括NaN、无穷和正负零。观察标准是数值相等或两侧均为NaN；每侧所有未写地址保留自身原有option值。RVV固定VLEN128/SEW32/LMUL2/VLMAX8，覆盖所有合法VL，inactive lanes不额外约束。H、N为正，padding_top=1；精确地址、初始化与分离条件见 `spec.c`、`ProgramModel.dw_inputs` 和 `proof/semantics.json`。只读区域可共享地址，末行写入可重叠，按原o2/o1/o0次序处理。

原生intrinsic以可审规范为边界，不要求另造C函数体。`proof/intrinsic-ledger.json` 固定30项原生/修复/兼容intrinsic的官方来源、合同与Coq定义；`proof/full_call_coverage.py`核对每个实际调用视图的精确合同，全部普通函数都需要实际C证明。最终独立人工规范审查仍待进行；不声称形式ISA、物理ABI、编译器精化或终止性证明。

完整重放由 `proof/build_full_handoff.py --freeze` 准备固定输入，`proof/check_full.py --config ... --jobs 32 --live-slots ...` 执行。只有完整fresh门禁及独立归档审计均通过后才允许发布证书。组件对象不会带入最终门禁。

本案完整证明源的唯一选择由H中的own_modules/source_dag给定；其他早期失败尝试及历史记录保留来源，不算已证明字段或额外kernel。Root15条memory与18条tail-store调用分别有独立完整类型/二次类型及逐字段收据；中间私有跨run对象依赖不一致已被Coq拒绝，最终组件在统一环境从源重新编译，最终全案不复用任何组件VO。

2026-10-25 完整门禁 H1 的1232本案源码模块和实际C/策略总接口均编译通过，但最终支持定理假设报告漏写了策略实现的嵌套module路径，故 H1 整案失败、不能收录。失败输入/工具/状态保存在 `proof/history/final-report-generator-H1/`，原运行不改。`proof/report-name-repair.json` 记录仅修正完整报告名称的工具修复，全部原定理与1167C+11策略报告保留；H2须重新冻结并完整源码fresh重放。C、模型、公开域、现有证明源不改。
