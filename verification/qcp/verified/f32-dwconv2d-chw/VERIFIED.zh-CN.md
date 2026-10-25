# f32-dwconv2d-chw 完整门禁结果

当前修复／兼容版本已通过完整源码 fresh 门禁：**13 个实际 C 单元、1167 条 C 义务、37 个普通函数体、1250 个本案 Coq 模块（含最终模块）**。组件对象没有带入本次完整检查。最终是否已被全局收录以 [verified 清单](../manifest.json) 为准；签发证书见 [proof/status.json](proof/status.json)。旧 README 的 candidate 描述是冻结门禁输入，保留其历史身份。

公开域为正 H/N，padding_top=1，全部 binary32 与无序 clamp 边界。写入值采用数值相等或两侧均为 NaN；每侧未写地址保留自身原有 option 值。共享只读地址允许别名；末行输出重叠按原 o2/o1/o0 写序处理。输入初始化、地址容量和读写分离以 spec.c 为准。RVV 固定 VLEN128/SEW32/LMUL2/VLMAX8，覆盖全部合法 VL。

实际证明对象为 impl/ 及明确列入调用闭包的普通 helper、公开 caller 和策略；原始实现、反例、修改原因与精确补丁保留在 [repair](proof/repair.json) 及其引用文件。没有把修复后证明冒称原始未修复 C 的形式精化。

原生 intrinsic 采用公开原规范合同与 Coq 定义，见 [台账](proof/intrinsic-ledger.json)；**最终人工规范审核仍 pending**。现有框架／数学假设由 [假设审计](proof/assumption-audit.json) 逐项公开。没有新增未证明项目公理；不声称形式 ISA、物理 ABI、编译器精化或独立终止性定理。有限 native 回归及发布身份复查不算第二次形式证明。

完整门禁原始记录：[full-status.json](proof/full-status.json)，SHA256 `f5d204141a2b6929045fb15be95e5f43e7bd02628304fcdc42cc0f3fa3c4c021`。冻结输入 H：[frozen-full-handoff.json](proof/frozen-full-handoff.json)，SHA256 `5ca6cc57201d531eec2736680c5f27e48b0a0c6290ab0619fab21edb172aed63`。所有源、生成目标、日志和输出对象的来源身份由签发审计与清单绑定。
