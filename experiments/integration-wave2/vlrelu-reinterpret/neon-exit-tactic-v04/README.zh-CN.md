本轮诊断 main 3/3，全部global18/18；不是整核admission。sourceguard5740tokens，controls正常，模型和输入未改变。只在不可变基底proof之后追加harness hint，普通C/spec/contracts/invariants/ghost均不改。资源固定par128/depth16、每solver30s/1GiB。

v04从worker v19已经实际闭合lane的不可变proof出发，独立检查NEON1 prefix建立/保持及finalall全部3/3真闭；没有借v15未证lane缩小验证范围。基底其它201项不计入本版3项。

成功scripts实际只使用完整CASES分支，未执行任何Wp.instance。可合并的最小策略文本在neon-exit-tactic-v03/minimal-cases-only.acsl.txt，共21行；minimal-delivery.json包含原成功script完整内容和SHA。新整核仍由root实际重跑，不继承历史green。
