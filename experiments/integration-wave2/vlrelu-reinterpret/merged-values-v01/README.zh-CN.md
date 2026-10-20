# VLReLU 统一证明候选

本目录已由 root 静态审计并冻结，曾执行**独立全量验证**，1200 秒行政预算到期，无完整主报告。
`root-freeze.json` 记录 proof/config 身份；此前 `merge-audit.json` 是冻结前的草稿审计记录，保留其历史状态。来源局部结果不计入本次通过数字。

`merge_draft.py` 是冻结前的合并来源记录；正式 `task.json` 存在后拒绝重建。重建其他新候选时使用新的独立目录，冻结前的命令为：

```bash
python3 experiments/integration-wave2/vlrelu-reinterpret/merged-values-v01/merge_draft.py
```

当前来源为 `rvv-values-v03` 的实际 annotated 文件、`v15-tail-input-frame` 的实际 annotated 文件，以及 `harness-values-v04` 的实际 annotated 文件。三份原始 proof SHA 和每个来源文件 SHA 记录于 `merge-audit.json`。v15 的 fresh source guard 已通过，主证明已落盘203/207、18条global全闭；v14 的主运行因原 watchdog 到期没有完整 raw，不能计为主证明通过。v14 的 18 条全局引理有独立成功记录。旧 v14 草稿保留在 `draft-history/v14/`。

来源 proof 身份只取 `attempts/0001/proof.patch` 的运行快照，不读取可继续修改的 draft 来宣称历史身份。脚本同时核对对应 `verify01/guard.json` 的 passed、proof SHA、attempt frozen SHA 和每个实际 annotated 文件 SHA；缺少这些不可变来源证据就拒绝生成。

以 RVV v03 为基底，只改变 `extensions.h`、`neon.c`、`harness.c`：

- RVV、signed reinterpret、真实 store/load 和内存 frame 证明全部保留。
- NEON 采用 v15 的点值证明、tail transfer helper、输入快照、三个高半部 frame cuts 和两个 extent/cast cuts。
- 加入 harness-v04 的完整输出等价收束证明、四个 params readonly 不变量及三个 store 前有效性/分离 cuts。`hv_count4` 保留在它实际验证过的 harness 位置。
- 相同 `proof_values_unary_point` 和 `values_unary_mask_source` 逐字去重。保留各来源晚注册的策略提示，见 `late-hints.acsl`；不能仅复制函数级提示而遗漏 private requires 标签提示。

源文本只移除完整 `#line` 指令以免重复定位元数据；原始 SHA 仍保留。十个受保护文件在这一元数据规范化后逐字一致，全部 C/H 普通 C token 与 frozen 原版一致。`patch-roundtrip.json` 记录唯一 `draft/proof.patch` 以 `--fuzz=0` 应用后与工作树逐字一致。这些是离线合并检查，不等于正式 source guard、编译器身份检查或证明检查。

`review-from-rvv-v03.patch` 是完整审核差异；`full-required-dependencies.json` 列出实际 21 条唯一 global、所有具名断言/不变量/私有合同，以及新旧义务必查类别。

特别注意 NEON 的三个新增 whole-memory 不变量 `values_neon_whole_read`、`values_neon_whole_sep`、`values_neon_current_read`：每条的建立和保持都必须实际检查，共六项。此前局部 private precondition 成功不能替代这六项，不能把未检查的不变量当作已解除的前提债。

当前冻结配置保留 qualified native-v6 Bytes 模型、driver、checker 和公开 spec：TIP depth16，WP par128，每 prover 30 秒/1024MiB，整次预算1200秒。`task.proposed.json` 与 `case/frozen.proposed.json` 保留冻结前草稿；实际使用 `task.json` 和 `case/frozen.json`，没有函数或属性子集。

Root 为重叠公式生成时间，在 NEON 两项局部诊断仍运行时，独立冻结本候选并启动 full；不继承任何未完成诊断。最终必须重新执行完整 globals、全部实际 caller/helper bodies、私有前件、RTE、assigns、终止/变元、call closure、负控制、模型控制、source guard 和 LLVM 普通实现身份检查。即使所有来源局部已通过，统一完整运行之前仍不能称整个 kernel 已验证。

本次完整运行记录见 `root-full-timeout.json`：日志生成708条主公式，21/21 global真闭，但 main-report.json 不存在，所以整核分母和通过数均不记录。 source guard 与 LLVM identity 通过仅说明实现身份。后续在新独立目录采用已验证的针对性提示，不修改此快照。
