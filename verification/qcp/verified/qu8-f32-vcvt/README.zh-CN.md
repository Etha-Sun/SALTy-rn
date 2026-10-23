# qu8-f32-vcvt：修复／兼容版 C-shim 等价性验证

完整统一门禁已通过：31 个实际 C 单元／1476 个 C VC 字段、61 个唯一函数体、10 组策略／30 个字段；646 个本地模块全部从源码重新编译，另一个最终门禁模块完成所有 fully-qualified typed 接口与1506项假设检查。没有复用组件 `.vo`。当前验证针对下述公开契约和固定 C-shim 的部分正确性。人工审核入口为 `impl/`、唯一公开契约 `spec.c`、`shim/` 和它们导入的 `proof/coq/{Model,UnsignedModel,Types,RvvModel,ProgramModel,UnsignedProgramFacts}.v`。当前实际闭包清单为 `proof/component-unit-preflight.json`：31 个 C 单元、61 个唯一函数体、1476 个翻译单元 VC 字段；这些不是1476个独立数学性质或新增 kernel。完整统一 fresh 门禁及最终准入状态在 `proof/full-status.json`、`proof/status.json`；组件成功不代替它。

NEON 原件在 `-params->scalar.zero_point` 遇到 `INT32_MIN` 时发生有符号溢出；修复为 uint32 模取负后原 int16 窄化。原件、UBSan 反例和独立 `repair-neon.patch` 均保留。RVV 原件的逗号 for-step 被固定 QCP 2.1.4 解析器拒绝，属于工具缺口，没有捏造语义反例；兼容版只把 `batch -= vl; input += vl; output += vl;` 按原顺序移到循环体末尾。原体没有 break、continue、return、goto，`vl` 在 step 期间稳定。`repair-rvv.patch` 与组合 `repair.patch` 公开保留。`ForStepBridge.v` 的两个已检查纯状态转移／边界引理和严格源码模式审核，是有限适用范围的额外桥接证据，不是原始 RVV 整核正确性定理。正式 C 证明针对当前两份修改后的真实 `impl/`。

公开域保持 `0<n<=UINT64_MAX/4`、`n+7` 个可读无符号输入字节、两份各 `n` 个 float 可写输出，以及分离且保留的参数单元。零点覆盖所有 int32，scale 覆盖全部 binary32，包括 NaN、Inf、±0。必须先完成16位 wrap，再作 signed16 重解释／扩展、binary32 转换和乘法。中间使用结构／位精确关系；公开观察为数值相等或同为 NaN。固定 VLEN128，e8m2→e16m4→e32m8 的 VLMAX32，调度模型 `min(AVL,32)`。不声称任意硬件 VLEN、物理向量 ABI、ISA 到 shim 精化或完整程序终止性。

新增无符号宽加、两个 NEON 重解释和 RVV unsigned16→signed16 重解释都有真实 C body 和独立 typed 目标。不能把 QS8 的 int8 参数宽加当成 unsigned8；算术显式调用已检查的窄化 helper，避开已记录的表达式 cast 翻译缺口。NEON 原嵌套组合由真实三调用 helper 保存顺序和单次求值，未知宏形状会拒绝；其三个原 intrinsic body 仍在完整闭包内。语义来源、机器配置和未形式化边界见 `proof/semantics.json`。

有限 native 证据独立记录：数组表示的实际两 kernel／公开 wrapper 215340 例、每侧4518100个活跃 lane；28个实际 scalar-field C helper／精确 frontend／公开 wrapper 157086例、每侧2348342个 lane，均经 UBSan、ASan和实际16GiB cgroup检查。原/兼容 RVV 输出逐位对照、输入／参数／边界保持及错误结果负控均包含。无符号真实 scalar oracle 另覆盖16842753项并拒绝错误进位负控。它们不是形式 VC；当前递归源库存分别记录在 `native-status.json`、`formal-native-status.json`，系统头未哈希。

旧组件证书及执行日志保持原字节。清理未使用 donor 声明后，28个 helper 和两个 kernel、公开 wrapper 的当前 CPP／重生目标身份逐项审核；目标与历史已检查接口逐字一致。`current-identity-audit.json` 明确区分这一身份审核与新的 Coq 执行。整案最终门禁已从当前源重新生成全部 C／策略目标、重新编译整个必要 Coq DAG，并为每个 fully-qualified `VC_Correct` 和每项假设输出完成检查。安装的外部 QCP／Coq 库属于显式工具链边界，本次没有重建。
