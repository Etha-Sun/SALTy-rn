# QS8 VADD MINMAX：修复后的 C-shim 等价验证

本目录保留原始实现、修复补丁、反例和实际证明证据。完整门禁已实际通过：27 个 C 单元、4,300 个 C 义务、15 个策略义务，492 个普通 Coq 模块全部从 `.v` fresh 编译，包含两个完整 kernel、实际 callee 闭包、公开 caller 和最终完全限定的 typed 门禁。全部 C/策略字段的 Print Assumptions 分为 16 组并完整合并；详细输入身份、数学支持与继承库假设以 `proof/full-status.json` 和归档证书为准。

公开观察是两个输出的逐 signed-byte 相等，并保留输入、参数及分离的空间 frame。参数覆盖全部 int32 乘数、raw shift、bias，全部 int16 输出零点和全部 int8 输入零点、上下界；没有 `output_min <= output_max` 前提。长度为 `0 < n <= UINT64_MAX-7`，每个输入可读 n+7 字节，输出可写 n 字节，内存区域遵守公开分离契约。

形式 C 采用显式 unsigned long long 64 位 `size_t`，宽度由实际 C 目标、普通 Coq 和 native 检查共同固定。历史上 QCP 对 bare unsigned long 的 32 位解释与 LP64 native 不一致，旧错误结果仅保留在历史中，不用于当前信用。

原始 `INT32_MIN` 取负未定义行为及 unsigned32-to-signed32 cast 的实际前端假目标均保留。修复的右移控制只用有界算术计算 `signedlow8(-raw)`。没有修改两边 intrinsic 解释或缩小参数范围。精确 patch 以 `--fuzz=0` 从原始字节重新应用。

RVV C representative 固定 VLEN=128、e8m2/e16m4/e32m8、VLMAX=32、VL=min(AVL,32)、vstart=0。未观察的 inactive C 字段取零是 representative 选择，不宣称它是 ISA tail-agnostic 的字面结果。该结果是 C-shim 部分正确性，尚不是源程序至 ISA/ABI 的精化、终止性、QC/vxsat 或硬件浮点状态定理。

完整 runner 重生每个实际 C 单元、callee、公开比较器/wrapper 和策略，核对 CPP、原始 goal 及完整声明/合同/调用闭包。较大 goal 使用逐 Definition 保持字节和顺序的透明投影，并核对原接口、每块身份及负控；不声称超过内存预算的原始单文件已经编译成功。所有最终依赖只从 `.v` fresh 编译，最终接口完全限定到本案 goal，逐字段 Print Assumptions。继承库参数与公理按明确白名单公开，不宣称报告为空。

有限 native 回归独立覆盖 21,472 输入、每侧每路径 2,665,773 lanes，包含公开 caller 和 shared-wrong-result 负控；UBSan 与实际 16GiB cgroup ASan 都运行。有限测试用于独立回归，不能代替全域 Coq 证明。

入口：`proof/check_full.py`；原件：`proof/original/`；修复：`proof/repair.json`、`proof/repair.patch`；语义边界与官方来源：`proof/semantics.json`；投影负控：`proof/goal-projection-controls-status.json`。

本轮完整 fresh 路径：`.build/full-q988fcpl`；冻结 handoff SHA256：`cd3e965b1bc42daeda1935495b995d450cbfee1cb5d209b0310888d1863bc027`。所有绑定输入在生成前后逐项核对，未复用其他组件的 `.vo`。本 README 为不影响已冻结证明输入的结果说明。

Intrinsic 逐项公开合同、Coq 完全限定定义及源码哈希见 [`proof/intrinsic-ledger.json`](proof/intrinsic-ledger.json)：45 项 intrinsic、38 项模型定义。该案保留完整 C body 证明；人工规格审核及正式 ISA 对应证明仍待完成。
