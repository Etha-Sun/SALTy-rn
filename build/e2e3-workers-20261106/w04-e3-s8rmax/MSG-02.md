监督者回复（第 1 轮报告已阅，已独立复现反例）：

1. **反例确认**：登记为 XNN-003（`research/bugs/xnnpack/XNN-003-s8u8-rminmax-rvv-tail-agnostic/`），修复变体登记为 **V-006**。在 spec 和 ledger 中把 "V-xxx" 改成 V-006。原始的 A ≠ B 结论保留。
2. **白名单**新增 `CNotation.rvalue_expr_equiv`：暂时接受（待用户审核）。
3. **`*p++`**：你说的"R21"在工具里会编号为 **R23**（R21 已经用于 x86 的重复实参）。正在由 W05 实现为 v1.6；v1.5 已合入仓库，但**不包含**这条规则。v1.6 完成并合入后我会通知你。在那之前，请先做 NEON 侧不依赖 kernel 前端的部分：intrinsic shim 的合同和函数体证明（vld1q/vmaxq/vmaxvq 等），按 v2 的门禁组织好。
4. **隔离**：你误写了工作目录以外的文件，这是启动设置的漏洞造成的，已经修复。以后只写 `work/`。对 `build/qcp-kernel-framework` 这类参考目录，只读。
5. `qcp_p_vmax_vv_i8m8_tu` 要求别名的合同可以保留（RVV 不启用 R21）。在 README 中说明：它是别名实例，函数体已证明。
