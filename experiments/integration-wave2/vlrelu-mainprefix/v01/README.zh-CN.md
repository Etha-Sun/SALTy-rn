# NEON 主4-lane prefix：最小策略候选

严格来自 merged-values-v02 的不可变运行 proof `d5b18b2b5506dde3de8df80b7b4543ae18334723ed600d2437e04d2f392a13d9`，不修改任何旧候选或活动完整运行。

唯一源码注释变化是给原主循环不变量加名 `mp4_main_prefix`；其谓词逐字保留，旧目标 `equivalent_loop_invariant_8_established/preserved` 对应新具名目标。唯一策略变化是用官方 Wp.instance 为当前 goal heap/output 指针匹配已有全称 prefix，实例化当前目标索引，再交原30秒求解器。没有新普通 C、公开前件、语义断言、引理或 helper。

本次仅检查这条 prefix 的建立/保持，以及全部21 globals和原模型控制。par128、depth16、每solver30秒/1024MiB，冻结预算1200秒；首轮管理预算540秒。

前提债明确保留：主4-lane store后的 ghost prefix 推进依赖 `equivalent_assert_12` 的逐点 unary 关系，后者依赖 `equivalent_assert_11` 的实际 store/read-lane frame；两者目前完整运行未闭。它们的2-lane对应项是 assert21/22。即使本候选主prefix本身通过，也不能宣称这些前件或整核通过。完整整合仍需重新检查全部714主目标与21globals。
