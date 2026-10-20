# 完整目标枚举：不是证明结果

同一冻结proof `31eda107...`、同一实际annotated/unit.c，保留实际full的全部模型/inline/RTE/skip参数，没有 wp-fct 或 wp-prop 子集。只将prover设为none，报告/session/output隔离，并增加verbose2枚举输出。没有另跑SMT。

枚举进程exit0，得到**749个唯一主目标ID**，与活动full的749 scheduled一致。只解析 `[wp] Goal <ID> : ...`，不将日志里的Terminating、Unreachable或其它聚合统计行加入计数。21条global仍由正式runner另行完整检查，此清单不代替其证明。

command.json、provenance.json和summary.json记录完整命令/源码guard/SHA、实际full命令的一致性及annotated前后未变证据；goal-ids.json保存所有目标。生成公式或出现trivial标记均不算完整程序验证。

实际full完成后，从仓库根目录运行：

```bash
python3 experiments/integration-wave2/vlrelu-final-merge/v02/root-full-enumeration/compare_full_raw.py
```

该脚本只比对同一proof/guard/frozen身份、全部主ID集合、重复/缺失/意外目标以及每行实际valid状态；写full-raw-comparison.json，不进行准入。最终globals、全部body/closure/model controls、source guard和LLVM仍须root审查。
