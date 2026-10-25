# 本包审核与重放入口

2026-10-25：wholecase02完整准入通过，3051本地模块、1531实际C义务、16策略、1874份假设报告与递归coqchk全部通过；仅14项继承假设。完整谱系和首次失败见proof/evidence/full-run，统一入口proof/status.json。此包已完成后应保持封存身份；继续矩阵迁移时另开候选SpMM，不修改本包来掩盖新案差异。

先读 README.zh-CN.md、spec.c、repair.md、proof/intrinsic-review.json 与实际 impl 两文件。若 proof/status.json 尚不存在或 passed 不为 true，本包仍未完成整核准入；不要按单项证明数量计入 verified。

当前主线是完整两侧 C、普通 assert helper、实际 caller 和16策略的 typed 接口 Qs8Admission.FinalCheck。NEON 原始大目标通过 proof/generated/neon_goal.v.gz 无损保留，proof/partition_neon_goal.py --verify 核对1741 literal定义、1482分块和完整1261字段接口。不要删义务、改公式或用新公理补缺口。

重放使用 proof/check.py，指定唯一 --run、--jobs 32 和已有共享预算运行器 --budget-runner。默认重新生成实际 C、重新编译全部本地依赖、递归 coqchk、负控、环境与来源绑定；复用已有 generation/native/compile 记录必须显式传参并通过当前哈希审计。不要复制任意旧 .vo，也不要覆盖封存结果。外部 QCP/Coq/Flocq 环境不是 Git clone 自动提供的。

未来批次固定配置32worker；普通16GiB、重型32GiB，有限 CPU/wall预算，共享512GiB池。32并发是配置上限，实际执行遵从依赖图和资源池。继续失败批次时，proof/resume_compile.py 只允许显式列出的未通过/未编译模块源码更新；已成功模块及其依赖、环境、对象身份必须保持。历史快照和失败日志不可删除。

本案边界是 source-reviewed intrinsic-spec 下的 C-shim 模块化部分正确性和精确 int8 输出。MR1/NR8/cn_stride8、公开容量内正uint64 N/K、padding与内存分离、A64 DN0/FZ0/AH0/RNE、固定RVV VLEN128/e32m2/e16m1/e8mf2均需保留。没有形式 ISA/物理 ABI 对应或完整终止性定理。修复与反例集中在 repair.md；不能把修复版说成原 RVV 已证明。
