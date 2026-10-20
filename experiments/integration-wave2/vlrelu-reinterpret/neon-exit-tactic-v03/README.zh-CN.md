本轮诊断 main 4/5，全部global18/18；不是整核admission。sourceguard5740tokens，controls正常，模型和输入未改变。只在不可变基底proof之后追加harness hint，普通C/spec/contracts/invariants/ghost均不改。资源固定par128/depth16、每solver30s/1GiB。

v03四个旧pending中，tailprefix、NEON1 prefix建立/保持、finalall真闭；唯一未闭是多余的lane替代路线。lane由worker的v19独立201/201+18globals闭合，不能把本版称整核完成。

成功scripts实际只使用完整CASES分支，未执行任何Wp.instance。可合并的最小策略文本在neon-exit-tactic-v03/minimal-cases-only.acsl.txt，共21行；minimal-delivery.json包含原成功script完整内容和SHA。新整核仍由root实际重跑，不继承历史green。
