# 原始 u8 尾部调用的共享内存能力

本包检查原 u8-vclamp 中两种嵌套调用：`vreinterpret_u32_u8`→`vst1_lane_u32(...,0)` 和对应u16版本。真实 C 实现、合同、策略及完整证明依赖都可从源重放。**41/41条C VC＋2策略已在公开工作树重新生成并普通Coq检查通过，135.19秒；不是完整u8 kernel证明。** [实际结果](proof/evidence/fresh02/result.json)、[实际命令](proof/evidence/fresh02/commands.json)、[完整日志](proof/evidence/fresh02/all-command-logs.txt)。

## 审查入口与精确行为

先看[interface.json](interface.json)、原始[NEON](reference/testNEON.c)/[RVV](reference/testRVV.c)及[src/adapter.c](src/adapter.c)。原尾部并非scalar uint32解引用；它把8-byte向量reinterpret成word视图，再只存lane0。

adapter的word视图保留8个uchar字段，reinterpret真实body复制8字节。store从低4/2字节计算little-endian word，再调用[le_store.c](src/le_store.c)的真实逐字节写入body。输入每个byte可为0..255，输出只需4/2个分离的可写未初始化byte；不增加对齐要求。原两种嵌套调用执行token不变，宏对向量表达式和输出指针各求值一次。

这是经审查的特定C表示，只支持当前原调用的lane0模式；独立word-vector算术、非零/非立即lane不会按此模板接受。寄存器byte表示到真实NEON ISA/ABI的形式对应仍开放，不能从C body证明推出该层已证。[语义台账](semantics.json)明确列出这些边界。未改原kernel、未弱化输入或用spec-only代替本包真实C body。

## 证明闭包

41条由19条helper义务（含14条LEStore）和22条新适配/原嵌套调用义务构成。14条旧LEStore证明从本包源码重新编译，并针对新目标精确类型检查；没有载入旧project `.vo`。公开runner重新生成adapter、LE helper和策略目标，要求与已保存目标逐字一致，再检查所有源依赖。

[manifest](proof/manifest.json)列出原来源/SHA、12个基础及支持模块的顺序。10个C-body闭包模块＋2个数学模块＋[TailCapabilityGate](proof/TailCapabilityGate.v)共13次普通Coq检查；gate实际实例化两个完整 `VC_Correct`。另一服务器的FastFrame从仓库已审查VMULC源码按SHA复用并在本次重新编译，不复制另一份实现。

[Checked.log](proof/evidence/fresh02/TailAdapter.Checked.log)有全部41份Print Assumptions；[两策略](proof/evidence/fresh02/TailAdapter.u8_copy_strategy_proof.log)也有报告。继承的字段地址、sizeof和函数外延等框架假设保持可见，策略还依赖命题外延；没有新增项目公理或Admitted，不称所有定理全局无公理。外部QCP/Coq库复用，未建立其source→vo构建历史，也没有新增recursive coqchk。

独立的[RegisterModel](proof/coq/TailReview/RegisterModel.v)证明低32/16位packed结果，3条lemma均Closed；[ByteMemoryBridge](proof/coq/TailReview/ByteMemoryBridge.v)证明对齐4地址上的4个uchar cell可合并为uint，继承函数外延。[相应报告](proof/evidence/fresh02/TailReview.ByteMemoryBridge.log)。**该scalar uint桥的对齐条件没有加入intrinsic byte-store合法域。** 它可供mixed packed内存后续复用，不能把它当全部量化kernel已证。

这是共享能力，没有伪造恒return1的equivalent wrapper，也不作为新kernel加入verified。整u8的循环、其他intrinsic与真实比较caller由单独case继续检查。

## 公开重放

依赖公开[环境PR5](https://github.com/Etha-Sun/SALTy-rn/pull/5)。在含本包和集成基线的checkout中运行：

```sh
QCP_HOME=/path/to/QCP QCP_COQC=/path/to/coqc-8.20.1 QCP_LAYOUT=in-place \
  python3 verification/qcp/candidates/u8-tail-memory/proof/check.py \
    --name fresh-new --native \
    --environment-tools /path/to/PR5/verification/qcp/tools
```

PR5已合入同一checkout时可省略路径参数。必须使用新的name；每次从本包源文件和固定仓库FastFrame源码建立新编译目录，COQPATH清空，不借用私有flags或旧项目object。原C、模型、目标身份变化或未知调用模式直接失败。没有一般编译器/DSL。

本次小能力检查单进程AS16GiB、CPU300s、wall310s；最慢Coq模块79.65秒，全部完成。ASan/UBSan需要较大的虚拟shadow地址范围，native阶段不设该AS上限，外层仍可限制实际内存。后续困难整核已另行提高到64GiB/小时级预算，不通过缩小本包语义获取成功。

[native.c](native.c)在本次公开重放实际通过每种store131072组输入、非对齐byte输出/canary和单次求值检查；它不计入形式证明。[历史错误shim负控](proof/evidence/historical/negative-result.json)将一个byte复制改错后，原proof与native均拒绝；历史记录不冒充本次再跑。第一次仅私有不完整导出缺少仓库FastFrame源码，尚未执行QCP/Coq；最终验收在真实独立worktree进行，没有偷偷提供旧 `.vo`。
