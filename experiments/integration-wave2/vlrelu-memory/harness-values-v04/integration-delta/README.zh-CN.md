已实际检查 v04：36/36 主项 + 18/18 globals，两个原 harness 目标及其全部新增前件、10 个 RTE 全闭；这只是局部 scope，未称整核通过。

1. `harness-neon-on-memory-v13.patch` 相对 memory/v13，仅 harness.c 与 neon.c；没有旧 bits/model/driver 文件覆盖。harness 中 count 定义已拆出，须插入 `count-extension.acsl` 到 extensions.h 一次，保留 harness 的晚绑定 VmemSMT hint。实际已检查 v04 原先把完全相同 count 定义放在 harness；整理文件位置后必须在最终合并 full 重新检查，不能继承原结果。
2. 已有 values worker 的 NEON 改动请保留。`neon-params-only-on-entry-snapshot.patch` 仅4条 params readonly invariant +3条 store 前空间 cut，适合按 label 手工合入，不覆盖 worker 的 input snapshot、point helper、value cuts。
3. `rvv-entry-snapshot-on-memory-v13.patch` 单独给 RVV entry slope 快照及 aux 参数替换；如 values worker 最新 RVV 已有这些，不重复插入。只合 harness+NEON 而漏掉该模式会使 right post 再次需要 RVV slope frame。
4. 7条 value lemma 与 values/v07 逐字相同，见 alignment JSON；保留最新 peer extensions.h，只去重相同定义。新增第18条是 count，signed 部分的其余 globals 继续保留并全查。
5. `harness-required-hints.acsl` 列出所有必须的本分支策略/hints。保留 memory/v13 的 Vmem* 定义、peer 的 ValuesSMT/hints 和 signed 策略。HVFilter 仅精确命名目标，晚注册优先，不能删其它 helper 门禁。
6. `required-dependencies.json` 给36个已闭本地目标、18 globals、19旧memory目标及最终full必查类别。final full还要检查所有body/callpre/assigns/termination/closure/controls；不能只跑该focus。

所有原始 C/spec/shim/native-v6 model/driver 仍冻结，未加公共 requires、axiom、assume 或新 helper。root 已独立复核，并实际 LLVM identity 检查相同。
