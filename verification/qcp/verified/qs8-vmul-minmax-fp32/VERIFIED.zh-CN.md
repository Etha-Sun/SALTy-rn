# qs8-vmul-minmax-fp32 完整门禁结果

当前修复／兼容版本已通过完整源码 fresh 门禁：**24 个实际 C 单元、871 条 C 义务、40 个普通函数体、984 个本案 Coq 模块（含最终模块）**。组件对象没有带入本次完整检查。最终是否已被全局收录以 [verified 清单](../manifest.json) 为准；签发证书见 [proof/status.json](proof/status.json)。旧 README 的 candidate 描述是冻结门禁输入，保留其历史身份。

公开域为正 uint64 字节长度；两输入各 N+7 字节可读，可部分或完全重叠，输出 N 字节与只读资源分离。Scale 包含全部 binary32，输出零点 signed16，clamp 两边界 signed8 且允许无序。结果逐字节相等。RVV 固定 VLEN128/XLEN64/ELEN64；e8m2、e16m4、e32m8 均为 VLMAX32，覆盖全部合法 VL 及保守任意 inactive lane。

实际证明对象为 impl/ 及明确列入调用闭包的普通 helper、公开 caller 和策略；原始实现、反例、修改原因与精确补丁保留在 [repair](proof/repair.json) 及其引用文件。没有把修复后证明冒称原始未修复 C 的形式精化。

原生 intrinsic 采用公开原规范合同与 Coq 定义，见 [台账](proof/intrinsic-ledger.json)；**最终人工规范审核仍 pending**。现有框架／数学假设由 [假设审计](proof/assumption-audit.json) 逐项公开。没有新增未证明项目公理；不声称形式 ISA、物理 ABI、编译器精化或独立终止性定理。有限 native 回归及发布身份复查不算第二次形式证明。

完整门禁原始记录：[full-status.json](proof/full-status.json)，SHA256 `a9547311dcdb42e88d0ff2a15ccb2f47ffe6e8bb8ae5ba07fc4bab2ed29e0bfd`。冻结输入 H：[frozen-full-handoff.json](proof/frozen-full-handoff.json)，SHA256 `2def9774efeb30c35a977e2382cf97c80cdcb042901299d14857d7a8b9da8bca`。所有源、生成目标、日志和输出对象的来源身份由签发审计与清单绑定。
