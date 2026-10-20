# f32-gemm-minmax 整合候选

ROOT10 固定提交 `101fc27d738d6bfd934730ef5aec055dca716542` 的种子：`experiments/integration-review-v1/candidates/gemm-hybrid-v3`。DeepSeek 原草稿 hash 和具体保留声明见 `provenance.json`。

- Copy reviewed DeepSeek pure congruence/representation declarations and check all global lemmas, no assumptions.
- Split each actual NEON two-stage clamp with a proved-obligation min cut before max; existing final clamp/bridge cuts retained.

当前只有一个可提交 proof 文件：`draft/proof.patch`。`root10-annotated/`、`deepseek-annotated/` 是审阅原料；实际验证使用 Gateway 快照 `attempts/*/proof.patch`，不直接执行这些原料。C/spec/wrapper/shim/driver/model 沿用当前许可 profile 的冻结清单，没有修改公开前置条件或输出观察。旧策略只在不含语义注解的独立块中移除，防止生成名跨模型误用。

每个lemma、ghost/helper body、公开caller、调用前提、循环invariant、RTE、assigns/termination均需真实检查；即便全局和定点目标通过，也不等于整核等价。`focus` 只用于诊断；`full` 才可能产生整核候选。结果与命令在 `attempts/`，尚未收录 verified。
