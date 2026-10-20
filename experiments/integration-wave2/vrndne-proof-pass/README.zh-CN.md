# f32-vrndne 有限 helper 补证 pass

本轮净关闭原有待证目标 **0 条**，不合并任何候选到正式版本。保留 v04。三个独立冻结候选和真实报告均在本目录；不是只重跑 baseline。

|候选|完整选中 helper 主报告|独立 globals|结果|
|---|---:|---:|---|
|v01|9/12|14/14|新增两 operand 实例 cut 未闭；store_join ensures 未闭|
|v02|9/12|14/14|定向 instance 模式未留下成功 tactic；同三缺口|
|v03|7/9|14/14|只选完整 vget2 helper；真实两次 instance 反复选 same_float 前件，漏掉第二个 same_value forall|

v01 的新增 vrndne_store_values cut 已真闭，但它不足以证明 helper postcondition。旧 vget2 两 join 虽显示 passed，依赖新增两个未证 cut，不能算净进展。

普通 C、public spec、shim 实现、native-v6 模型、driver 和 checker 均未改。三个 sourceguard 都是5609 tokens，与 v04一致；模型及冻结输入身份检查通过，负控制不被证明、正控制通过。每版仅一个 proof.patch。没有新增函数、private/public pre、ghost调用、循环、RTE/frame义务；vget2完整body所有ensure/assert/assigns在scope中。新增assert本身全部实查，失败保留。

明确搜索配置变化：原 v04 solver5s 改为30s上限，128并行、1024MiB、默认depth5，模型Bytes不变。既有 EqSMT20s提示保留；新instance策略30s。不同scope不能直接比较分母或称为整核进度。

精确 sequents 和命令在 sequent01/，导出使用 none，不算证明。它们显示同一mem_0下第二个 forall 的直接实例应足够：a[s+i] 与 unary(read(i_base,off+i))。v03实际 script（见 review.json）把第一个 same_float forall 连续实例两次，说明当前泛匹配策略不对；并未证明模型缺口，也没有发现 kernel 反例。下一步应精确选择第二个 forall，按真实正规形式 <=1、s+K 绑定，再检查全部依赖；此建议尚未执行，不继承成功。

各版 review.json 包含 raw SHA、sourceguard、controls 和未闭项。v01 ordinary-source-identity.json 核对全部冻结文件SHA。未触碰 root 的 VLRELU、其他worker或共享工具。所有本轮WP已结束。
