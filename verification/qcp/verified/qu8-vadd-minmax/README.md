# QU8 VADD MINMAX：修复后的 C-shim 等价验证

完整 fresh 门禁已通过：31个实际 C 单元、3,151个 C 义务和15个策略字段；398个本案源与18个最终接口／假设检查模块，共416次普通 Coq 编译全部成功。公开原始实现、修复补丁、反例、逐字段 Print Assumptions 和可重放证据。独立准入、归档与发布由集成阶段完成。

公开观察是两个输出的逐 unsigned-byte 相等，并保留输入、参数及分离的空间 frame。参数覆盖全部 int32 乘数、raw shift、bias，全部 int16 输出零点和 byte 输入零点、上下界；没有 `output_min <= output_max` 前提。长度为 `0 < n <= UINT64_MAX-7`，每个输入可读 n+7 字节，输出可写 n 字节，内存区域遵守公开分离契约。

形式 C 采用显式 unsigned long long 64 位 `size_t`，宽度由实际 C 目标、普通 Coq 和 native 检查共同固定。历史上 QCP 对 bare unsigned long 的 32 位解释与 LP64 native 不一致，旧错误结果仅保留在历史中，不用于当前信用。

原始 `INT32_MIN` 取负未定义行为及两类 unsigned-to-signed cast 的实际前端假目标均保留。修复的右移控制只用有界算术计算 `signedlow8(-raw)`，unsigned16 到 signed16 的解码用显式减 65536。没有修改两边 intrinsic 解释或缩小参数范围。精确 patch 以 `--fuzz=0` 从原始字节重新应用。

RVV C representative 固定 VLEN=128、e8m2/e16m4/e32m8、VLMAX=32、VL=min(AVL,32)、vstart=0。未观察的 inactive C 字段取零是 representative 选择，不宣称它是 ISA tail-agnostic 的字面结果。该结果是 C-shim 部分正确性，尚不是源程序至 ISA/ABI 的精化、终止性、QC/vxsat 或硬件浮点状态定理。

完整 runner 重生每个实际 C 单元、callee、公开比较器/wrapper 和策略，核对 CPP、原始 goal 及完整声明/合同/调用闭包。较大 goal 使用逐 Definition 保持字节和顺序的透明投影，并核对原接口、每块身份及负控；不声称超过内存预算的原始单文件已经编译成功。所有最终依赖只从 `.v` fresh 编译，最终接口完全限定到本案 goal，逐字段 Print Assumptions。继承库参数与公理按明确白名单公开，不宣称报告为空。

有限 native 回归独立覆盖 21,472 输入、每侧每路径 2,665,773 lanes，包含公开 caller 和 shared-wrong-result 负控；UBSan 与实际 16GiB cgroup ASan 都运行。有限测试用于独立回归，不能代替全域 Coq 证明。

入口：`proof/check_full.py`；原件：`proof/original/`；修复：`proof/repair.json`、`proof/repair.patch`；语义边界与官方来源：`proof/semantics.json`；投影负控：`proof/goal-projection-controls-status.json`。
