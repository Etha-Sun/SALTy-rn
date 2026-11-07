# W01：包结构 v2 样板（f32-vadd）与门禁升级

## 目标
以 `build/qcp-kernel-framework/verification/qcp/verified/f32-vadd/`（v1 包，已在本机完整门禁通过：87 模块，FinalCheck 通过）为基础，在 `work/f32-vadd-v2/` 做出 v2 布局的样板包，作为以后所有 E2/E3 包的模板。**向量表示、证明内容一律不改**，只调整布局并升级门禁。

## v2 布局（用户已批准）
- `impl/`：两个原版文件，逐字节保留。
- `spec.c`：只保留 `equivalent`，包括 Require（输入域）、Ensure（`outputs_related`）和函数体。
- `spec/observation.v`：`same_value`、`outputs_related` 的定义，从 v1 的 `proof/coq/NanBridge`、`VaddComparator` 中移出。
- `proof/bridge/`：`test_neon`/`test_rvv` 的合同，`vadd_values` 等函数规格，`compare_outputs` 及其辅助函数。
- `ledger.json`：环境前提、条件（本例没有）、来源 sha，以及 shim 版本。
- `README.zh-CN.md`：列出哪些需要审核、哪些不用，以及结论的范围。

## 门禁新增两项（写进 `proof/check.py`）
1. 对最终定理（`equivalent` 及整条调用闭包）运行 `Print Assumptions`，解析输出，只允许出现白名单中的公理，白名单写在 `proof/assumptions-allowlist.txt`。先查出当前实际出现的公理，逐条说明来源（QCP、Flocq、funext、经典逻辑等），再写入白名单。出现白名单以外的公理时，门禁失败。
2. 非空性见证：证明 `equivalent` 的前置条件可以被满足，例如在 Coq 中证一个存在性引理：存在 n 和内存，使 Require 成立。也可以选一种更简单、同样严格的做法，但要说明为什么它能排除前置条件为空。

另外加两个负对照，证明新门禁会失败：（a）证明里加一条 `Axiom`；（b）把 Require 改成不可满足。负对照只在临时副本中运行。

## 完成标准
- 在 `work/f32-vadd-v2/` 从空目录运行 `proof/check.py --jobs 32`，rc=0，87 个模块（或调整后的数量）全部编译通过，FinalCheck、Print Assumptions、非空性见证都通过。
- 两个负对照都被拒绝。
- `REPORT.md` 列出 v1→v2 的文件对应表、新门禁的实现方法和白名单内容，以及一段"把这个模板迁移到别的 kernel 时要改哪些地方"的说明。
