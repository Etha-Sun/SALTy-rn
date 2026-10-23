# QS8 到 FP32：修复后的 C-shim 等价验证

完整门禁验证修复后的 NEON 与原始 RVV 实现，在公开入口契约下输出数值相等或两侧均为 NaN。完整记录为 `proof/full-status.json`（运行 `.build/full-adz1c3m4`，SHA256 `e4413308b1b41def5a57ce37f819be15164332b7253b3373451af6b021ef36ac`）；当前验收状态由 `proof/status.json` 记录。

公开契约要求 `0<n<=4611686018427387903`，输入提供 `n+7` 个可读有符号字节，每侧输出提供 `n` 个可写 FP32 元素，输入、参数和两个输出按分离逻辑契约提供。全部 int32 零点和全部 FP32 scale 均保留，包括 NaN、无穷与正负零。输入和参数保持不变。

原 NEON 在 `zero_point == INT32_MIN` 时对有符号整数取负，UBSan 已实际重现溢出。修复将取负改为 `0U-(uint32_t)zero_point`，再执行原有的 16 位窄化；RVV 字节保持原样。修复原因、原始身份、精确补丁、UBSan 反例和来源保留在 `proof/repair.json`、`proof/repair.patch`、`proof/originals.json`。`semantics.json` 是模型说明，当前完整验收以 `proof/status.json` 为准。早期 repair/native 记录里的 `whole_kernel_verified: false` 是当时的历史状态，当前完整验收以 `proof/status.json` 为准。

模型保留先做二补码 16 位环绕减法、再将有符号 16 位结果精确转换到 FP32、最后乘 scale 的顺序。固定 LP64、小端、IEEE binary32/RNE；RVV 固定 VLEN=128，e8m2/e16m4/e32m8 的 VLMAX 均为 32，`vl=min(AVL,32)`，vstart=0。观察关系允许两侧 NaN 及正负零，不比较 NaN payload/sign 或异常标志。

| 实际 C 单元分组 | 字段数 |
|---|---:|
| 标量、NEON/RVV 向量与内存函数（23 单元） | 832 |
| 完整 NEON / RVV kernel | 424 / 46 |
| 公开 comparator、caller 与 assert | 35 |
| 合计 | 1337 |

统一重放检查 26 个实际 C 单元、49 个真实函数体；声明、签名、Require/Ensure 和实际调用闭包逐项核对。另独立生成并检查 10 组策略的 30 个字段。所有 `631` 个普通 Coq 模块，包括 BASE 依赖和最终门禁，都从源码重新编译，不使用组件 `.vo`。最终门禁以每个实际生成目标的 `VC_Correct` 显式检查实例，并对全部 1367 个 C/策略字段打印 Assumptions；本案无新增项目 axiom、Parameter、Admitted。QCP、Coq、SL/Flocq 等外部安装库属于记录的环境依赖。

QCP 对 arithmetic expression 上的 short 返回转换有已记录的建模缺口。本案使用有真实 C 函数体且独立检查的 `qcp_cvt_narrow16`，不改变 16 位环绕语义或参数范围。两个 NEON 组合操作同样由真实 get-low/high、局部中间值和 widening 调用实现，保留单次求值。诊断 seed probe 及有缺陷的转换试验不作为实际 C 证明提供者。

独立原生回归包括公开数组运行时 215340 个完整调用（每侧4486728 lanes）、实际标量字段 shim/精确 frontend/公开 `equivalent` 的157086个调用（每侧2315452 lanes），以及组合 helper 的131072个检查。覆盖全部65536种零点低16位、int32端点、FP32特殊值、独立标量oracle、输入/参数/输出哨兵和比较器错误值对照；ASan/UBSan 记录保持原样。实际字段回归另绑定53个递归本地源码/头文件，系统头不在哈希清单内。有限测试不加入形式化字段数。

结论范围是显式内存、类型、地址和舍入模型下的 C-shim 模块化部分正确性。硬件 ISA、实际 ABI/layout 精化、任意硬件 VLEN 和独立终止定理不属于已建立结论。

重放使用已配置的 QCP2.1.4 / Coq8.20.1：`python3 proof/check_full.py --config <coq-flags.json> --dependency-dir <f32-vadd checked coq directory> --jobs 16 --timeout 3600`。脚本重新生成所有实际 C 目标与策略，从 `.v` 编译并执行全限定 typed 门禁，前后核对冻结源码、工具、配置、原件/补丁与原生输入身份。归档工具只验证和保存原证明证据，迁移/发布身份审计不算第二次形式化证明。
