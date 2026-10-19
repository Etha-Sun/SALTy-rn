# true tactic child 结果遗漏：只读审计

新高位控制的两个正确post仍为Unknown，不算通过。记录链是：

1. ProofEngine.commit 调用每个child的 Wpo.resolve。
2. wpo.ml:724 的 `is_trivial g || ...` 在本来已true时短路，没有运行后面的 `set_result Qed Valid`。
3. ProverScript.process 先检查 ProofEngine.locally_proved；后者调用 Wpo.is_locally_valid，is_trivial即返回true。因而跳过child的crawl和所有配置的prover。
4. ProofEngine.compute也走locally_valid，但通过prover_stats仅汇总 get_results；空数组导致父统计Unknown。
5. 策略日志里的proved指explore_tactic成功生成/安排children，非所有children已有可验收raw。三个故意假的目标也打印过Strategy proved，恰好印证不能当验收。

显式child `\prover("qed")` 无法穿过步骤3，预计无效；其他prover相同。ProverTask.prove本身先simplify并会记录Qed，但该路径没有执行。先尝试配置 `-wp-no-qed -wp-no-clean` 也只可能避免预先化true，构造器直接得到true则仍复现；没有声称此配置能够修复。原严格失败保留。

若配置试验不能避免，独立新版本最小源码修复方向：Wpo.resolve先计算 `let valid = is_trivial g || reduce g in`，再对valid统一执行现有Qed结果记录。不能把所有空结果当valid，不能直接放宽checker/raw判定。需另行主agent授权构建并验证：2正确高位post应有明确父Valid和child Qed结果；3假post仍失败；简单true tactic child/普通非trivial child均覆盖；旧IEEE/FMA正反及成功kernel回归。主agent授权后已保存独立 tool.patch 以及 wpo.ml.before/after、PATCH-SHA256.json、acceptance.json；补丁未应用到任何旧source或安装。主agent将建立全新v2工具并实际验收。
