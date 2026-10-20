当前进度见 current-status.json。v12-input-snapshot 已实际 main41/41+17globals：20私有调用前件、14RTE（含4新增读取）、helper ensures、NEON4原值断言全闭；这不是整核或helper完整body证明。最终新full须重新检查assigns/termination/frame/全部不变量。v13-tail-points 正尝试相同尾部方案。下方保留的是更早阶段历史说明，不应当作当前最终结果。

# vlrelu纯值联系专项

没有关闭任何一个原main值义务，也没有新增完整kernel通过。普通C、公开spec、shim、driver、model和checker全部冻结，未增加axiom或publicpre。

新增6条纯值lemma全部真实验证：unary congruence/select/join、任意mask选择、same_float非NaN sign-transfer、mask sign-transfer。v06 source globals共16/16（旧10+新6），完整NaN/±0域。可移植片段见unary-lemmas.acsl，raw/SHA见global-evidence.json。

|候选|真实证据|
|---|---|
|v01|重建patch遗漏EOF标记，guard拒绝，没跑WP。|
|v02|global13/13；自动生成property名字不能选择，main0个，gateway正确missing scope。|
|v03|global13/13；10值label生成11main VC，450s行政终止无完整main raw；观察到2条timeout。|
|v04|global14/14；4个vector值main0/4，全部timeout。labelhint未覆盖更后注册的equivalent memory hint。|
|v05|global14/14；NEON4显式operands/select两cut真证，sign/原value失败，main2/4。|
|v06|global16/16；NEON4 source-mask sign真证，input-mask sign/原value失败，main1/3。|

精确卡点：输入lane与真实入口slope/乘积联系已证明，mask与源vx符号已证明，vbsl输出选择已证明；把源vx符号通过same_float载入联系转移到input值的量化关系仍未在固定SMT界限闭合，即使一般sign-transfer lemma已单独真证。没有反例，不证明kernel错误。原值义务不能因前面新cut假设而计成功。

入口ghost slope快照避免辅助关系反复读heap params；初始化新增RTE、所有body/global/caller/assigns及未选目标仍需最终full。v05/v06仅值诊断把equivalent hint改既有direct VmemSMT；完整合并应保留memory策略，并把更具体value hint注册到harness末尾以获得官方后注册优先级。

所有历史/失败raw与日志保留。final-results.json包含精确候选路径、冻结pins与raw分母；不同版本分母不能直接合并为整核成功。
