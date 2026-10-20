# 本轮已验证的补证经验

- 冻结公开 spec、普通 C、shim、模型与 driver。只在新的候选目录改 proof，不能把未关闭的 cut、private call-pre 或 ghost 循环义务留给“以后”。
- 对照实际 sequent 的 Have/Prove；`-wp-prover none -wp-print` 只导出问题，不能记录为通过。
- **ghost C 与 ACSL 的下标语义不同**。本轮 NEON helper 的四条 input pre 被嵌套 `to_uint64` 卡住；在实际 load 前捕获 ghost 指针，再使用该指针的 lane 常量下标后，41/41 项检查通过。不要为这种归一化问题收紧长度条件或改模型。
- 固定四 lane 的 ghost 调用可直接展开四次，避免额外 ghost 循环状态。它不展开处理整个数组的循环，不限制 n。尾部读四 lane 的合法性仍必须由公开 padding 前提推出。
- 输入有效性和分离条件要在相应循环中明确保持。memory/v13 的七条不变式及五条旧内存目标已全部检查，不能只证明使用处而漏掉十四条建立/保持义务。
- 必要的纯 ghost helper 可使用 private pre，但必须检查实际函数体、每次调用的全部前件、读取 RTE、assigns 和终止。NEON4 core 只选择 helper ensures；完整 helper frame 必须由最终 full 另查。
- 浮点 NaN 不满足 `x == x`。读取 frame 使用现有 `same_float`，输出比较使用冻结 spec 的 numeric-or-both-NaN 观察方式；不能暗加 finite/non-NaN 假设。
- 官方 proof hint 的目标遵循 `-wp-prop` 的过滤规则。函数名 hint 不自动覆盖它调用的 callee requires；可用带引号的 `"@requires"`，或更精确的真实 predicate label。合并时注意后来注册的 hint 优先级，必须实际查看成功 script。
- 当前内存证明需要 TIP 单枝深度 6–7，因此新 profile 显式 pin depth16 wrapper。WP 求解并行使用 64，单 solver 仍 30 秒/1024 MiB；并行不能直接加速串行 Qed 公式生成。
- `main-report.json` 不存在时，v4 的 `verify01.json` 可能只含 global rows。不要据此计算整核分母。全局引理也不能重复计入 main 和 combined 两次。
- 导出失败导致的 `false 未证` 不是有效 negative control。检查正/反控制的实际 raw 和日志；控制通过也不是完整模型一致性定理。

对应官方来源为本环境固定版本的 `wp_plugin.tex` 第 2000–2130 行，以及 native-v6 源码 `ProofStrategy.ml`、`TacHavoc.ml`、`TacFilter.ml`、`TacLemma.ml`。工具源及外部安装内容由 model lock 固定；本轮未改这些文件。
