# VLRELU 四个主程序匿名目标有限审计

基线为 d5b18b2b5506dde3de8df80b7b4543ae18334723ed600d2437e04d2f392a13d9；原 full 主报告708/714，四项均未证。本轮新闭合主目标 **0 条**，没有合并 proof。

|原目标|neon.c逻辑/物理行|新稳定label|内容|
|---|---|---|---|
|equivalent_assert_11|87 / 95|mainframe4_store|store4后 o_base[k] 与 vacc0123.lane[k-off] 同浮点值|
|equivalent_assert_12|89 / 97|mainframe4_value|store4 ghost prefix当前k满足unary值|
|equivalent_assert_21|149 / 157|mainframe2_store|store2后 o_base[k] 与 vacc_lo.lane[k-off] 同浮点值|
|equivalent_assert_22|151 / 159|mainframe2_value|store2 ghost prefix当前k满足unary值|

v01只加label并导精确none sequent（不是证明），见 v01/sequent01/sequent.log。store两项目标确实由vst1合同中的forall lane直接实例化，k-off范围已由前一checked assertion提供；value两项需要按k<off区分旧prefix与本次store，再实例化已有unary值关系。

v02最初value forall selector未绑定实际store数组，有误选product/full-tail数组的风险；保留并提前取消，只诊断、不计结果。v03将selector绑定当前read的同一个vector，只新增harness末尾官方Wp.instance/CASES策略；没有改公式/合同/invariant/ghost执行语句、普通C、public spec、shim、model、driver或checker。

v03在固定420秒行政预算内完成21/21独立globals与正负controls，主4项尚无完整raw报告时预算耗尽。因此不能宣称4项通过，也不能把行政超时当反例或模型缺口。一次进程树无solver的采样不足以判定IPC停滞；root随后确认CVC5活动，本报告不提出工具故障结论。

普通C sourceguard已独立重跑：5740 tokens，与d5b18相同，见v03/source-guard.json。source-identity.json确认spec/driver/rvv/bits/float_ops/extensions字节与基线一致；全部delta为4个label和proof hints，见v03/minimal-on-d5b18.patch（尚未获得可移植闭合证据）。128并行，单solver30秒/1024MiB，depth16与root基线一致。

未触碰其他worker或root活跃full。两个本轮controller均已结束；solver按原30秒限制自然收尾。所有失败候选、命令、输入hash与报告保留，审计汇总见v03/review.json。


## 后续稳定v07已闭四项

v07-exact-instance 同snapshot重验 caller64/64（36RTE、18privatepre、10assert）+helper body/frame6/6+globals21/21，正常正负control，全部exit0。四个原主目标及完整新增依赖已闭。普通C guard5740未变；相对d5b18最小delta88行。详见v07-exact-instance/review.json及complete-deps01/，不是整核通过，root还需合入prefix/permission后最终full。旧失败记录保持原貌，v08未采用。
