（监督者在 04:30 UTC 主动停止了你的第 2 轮，原因是下面的门禁变更让剩余的 shim 函数体证明不再必要。被中断的后台任务可能留下半成品，请先检查 work/ 的状态。）

监督者通知（11-07 04:10 UTC）：

1. 规则工具 **v1.6（含 R23：`T v = *p++;` / `x = *p++;` → `T v = *p; p += 1;`）已合入仓库 `tools/rvv_ptr_lower`**（版本串 1.6.0，`rvv_ptr_lower.py` sha256 `7b9f073c…a022d8e`）。监督者已复检：目标 `s8-rmax-neon-u32-acc2.c` 用 `--isa neon` 改写后 `*input++` 消失，qemu-aarch64 差分 7200 例 0 不一致。
2. 请用仓库里的 v1.6 重新改写 NEON A（不要用自己的草稿脚本，不要手改），在包里记录工具版本和 sha256，然后完成 V-006 的 NEON 侧：A ≡ B_fixed（`_tu` 修复版），三个 VLEN（128/256/512），按 v2 的布局和门禁组织。
3. 原始 A ≢ B（XNN-003 反例）保留为 E3 发现，不要删除。
4. 最后从空目录运行 `proof/check.py`，rc=0 才算完成；按 COMMON-RULES 的格式更新 REPORT.md（结论、命令/退出码/日志、白名单、门禁、未完成项）。新出现的 `Axiom`（不是 QCP 的 `Parameter`）要单独列出，不能自行加入白名单。

**门禁变更（用户 11-07 决定）：intrinsic 不需要 C 函数体和函数体证明。** 见更新后的 COMMON-RULES 第 4 条：每个 ISA 一个共享 intrinsic 合同库（记录 sha256），合同写成"输出 lane = 具名 Coq 函数(输入 lane)"，每个具名函数对真实指令做差分测试。`xnn_*` wrapper 和 static inline 函数仍要证函数体。已证明的 shim 函数体可以保留，但不要再为 intrinsic 函数体花时间。
