# 四核整合首轮结果

新增整核通过 **0**。四核都构造了新 proof、冻结模型/实现/规格、通过 source guard 并实际启动完整 WP；四份 full 都在1150秒硬预算处取消，没有最终 main raw，不能报告整核通过率。

|kernel|完整运行实际scheduled库存（日志）|独立global实际raw|状态/主要证据|
|---|---:|---:|---|
|f32-gemm-minmax|1485|20/20|Typed位表示/canonical_nan memcpy及内层frame等timeout；另见下述入口状态修正。|
|f32-igemm-minmax|762|16/16|真实indirect table/row/packed-weight frame、loop/assigns/caller timeout。|
|qd8-f32-qc4w-gemm-minmax|2519|14/14|native-v6实际运行；ROOT10真实AND/nibble与DS fold词汇已桥接。量化helper缺少assigns/完整合同，body/循环/RTE仍欠。|
|f32-spmm-minmax|911|13/13|稀疏map、uintptr步进、frame及最终输出/assigns仍欠；没有数值不等反例。|

scheduled只是新候选真实生成的库存，不是最终raw分母，日志中Timeout事件也不是全部未证VC计数。四组同上下文true/false控制均符合预期，所有63条global obligation都真正完成；其中重复使用的共享数学lemma不能算63个不同新数学结论。

普通C/spec/wrapper/shim/driver/当前qualified模型均保留原冻结项；三个Typed候选另建case-v4，沿用已存在的v4 checker强化显式global检查和调用闭包，旧case/v3结果保留。没有修改任何工具源码或引入ROOT10未资格化工具/Byte1..35/flat模型，没有API调用。实际命令均从actual-commands.jsonl核对为wp-par16，单prover时限分别30/5/3/5秒、内存1024MiB。精确hash、sourceguard、命令、global/controls raw和日志在各核attempts/0003及full-result.json。

GEMM额外找到了ROOT10注解与当前内联方式的状态绑定问题：内联后root86的Pre引用wrapper入口尚未初始化的local w_19/nc_17/kc。parse-only的proof-analysis/inlined.c保留了直接证据。entry-scope-v2使用真实ghost入口label后只直接通过snapshot（1/4）；entry-scope-v3显式携带入口值/完整权重范围validity作为外/内循环invariant，且检查全部established/preserved，得到9/12实际目标及20/20 global。origin和entry-validity两个cut已过，但outer validity建立、outer值关系保持和next_w_frame_0仍未过，不能将两个条件性cut当作前件全闭合。所有原公开输入范围和完整packed-weight范围均保留。

entry-scope-v4-tactics独立冻结TIP+Z3/CVC5，仅加标准Wp.filter（anti=false）与通用memcpy Wp.havoc，12个语义目标不变。300秒预算取消，没有最终main raw；日志显示Tactics2对outer validity仍Unknown，不能宣称改进。旧结果和策略失败均保留，推荐后续从有完整raw的v3分析三个具体债。

下一步分别是：GEMM先闭合入口validity/值关系的真实前件和copy frame；IGEMM闭合行/表/权重frame再接输出；QC4补真实量化helper合同及body证明（DS已有正确结构可继续移植），不把缺assigns当纯函数；SPMM补当前安全模型中的合法地址步进/frame桥，不添加无限offset与有限指针的冲突公理。这些是未完成证明或模型兼容问题，本轮没有证实kernel有数值错误。
