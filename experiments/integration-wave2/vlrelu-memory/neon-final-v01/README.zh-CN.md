# NEON 最终 prefix 收束：独立候选 v01

本备选已停止，原因是 root 选用了更小且已经实际检查的纯策略证明，不需要移动 ghost 计数器。正常取消记录见 `cancel-reason.json`；本候选 source guard 通过、模型负控制正常、18/18 全局引理通过，但主运行被取消前没有完整 raw，**不称主证明通过**。源码、最小 delta、所有日志和运行快照均保留，没有其它任务被停止。

来源是 `vlrelu-values/v19-neon1-point/attempts/0001/proof.patch` 及对应实际 annotated；身份见 `provenance.json`。不使用有解析错误的 v16/v17。

`minimal-on-v19.patch` 只改变最后一条 1-lane store 后 ghost loop：将 ghost 计数器声明移到 contract 前，contract 仍紧贴 for；加入 extent、退出计数器等于 total、规范化全 prefix 三条待检查 cut，并为这些目标和最终 `values_neon_all` 绑定普通 SMT 策略。2-lane loop、普通 C、公开 spec、模型及 driver 保持不变。

运行选择新 counter 不变量的建立/保持、原 prefix 不变量的建立/保持、三条新 cut、原最终 all，以及 caller 全部 RTE、assigns、variant、termination/exits。每个求解器仍为 30 秒/1024MiB，TIP depth16、par128、任务和本次管理预算1200秒。

原 `values_neon1_prefix` 保持、前一段 `values_neon_tailprefix` 仍是明确的外部证明依赖；其它 worker 正独立处理。本候选即使局部 all 通过，也不能替代它们或最终完整 caller/helper/global/closure 复验。状态以本候选新 raw 为准，未继承来源通过数字。
