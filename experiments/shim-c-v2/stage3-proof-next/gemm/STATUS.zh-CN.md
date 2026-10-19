# GEMM 本轮证明状态

当前整核新增通过：0。原 C、公共 spec、shim、冻结模型与 checker 均未修改。

candidate05 增加实际 body 检查的两步 FMA 展开、读内存中间断言、6 个 packed-weight frame 断言及算术/替换引理。selected01 实跑 16/20；剩 b0/b1 读取及两步累加关系 4 项。下游通过依赖这些尚未证明的中间断言，不独立计为原循环闭合。

candidate06 增加 6 个索引、广播和累加器中间断言，selected01 实跑 18/26，仍有 8 项未证（包括新增索引自身）。分母不同，不替代 candidate05；共享服务器拥塞下的 timeout 差异不证明逻辑退化。详细对照见 LOCAL-COMPARISON.json。

candidate05 完整 inventory：body03 1187 个逻辑目标及 30 个 CFG-only，globals01 12 个逻辑目标，合计 **1199**；两次 exit0、normal_exit 数与 final 数一致、全部输入 SHA 不变。body01 启动中断、body02 命令行错误保留。修正版独立 inventory06.py 使用 `-wp-prop=-@lemma`，未修改旧脚本。

candidate05 full01 实际全量尝试 1200.382 秒后 exit124，无完整 raw 或 normal_exit。仅将本次流式结果精确映射到 1199 分母：359 valid、23 timeout、817 无完成结果，未映射项 0；不混用 selected 结果。输入不变，complete=false。control05 独立真假控制 accepted=true（3/4：真目标通过，假目标未通过）。见 candidate05/{INVENTORY.json,FULL01-STREAM.json} 与完整 logs。

candidate07 从05派生：增加标量 t 范围及固定4lane具体索引/读取切分，共17个新assert；没有限制符号输入长度。静态guard通过。selected01 因子agent sandbox拒绝 Why3 Unix socket连接而中止（exit-9，输入SHA不变，无raw），属于执行环境错误；root已用相同候选/模型在可用环境完成selected02：33/37；剩余依赖见下文，未获得整核通过。每条新增断言必须自身实际证明，不能仅依赖其假设报告后续目标通过。

已知完整链仍包括 canonical_nan 的 Typed 字节/浮点桥缺口及外层地址/输出关系等未证目标。这不是 kernel 反例，不以普通乘加替换 FMA，不放宽浮点合法域。

07 selected02 已完整结束：33/37，输入不变。剩 bound_0_0、bound_1_0、acc_first、acc_second；各lane读取与其余bounds的通过依赖前置首bounds，尚未闭合整条读取链。08在07基础上增加空body、无requires的ghost next_bounds；条件post与assigns须单独完整检查，当前仅静态guard通过。

08 helper01完整2/2；selected01完整35/38，剩bound_0_0与两步acc。print-bound01准确显示helper forall缺少算术实例化触发，输入未变。09将helper的lane改为显式参数0，无requires、真实空body；helper01完整2/2，selected01完整36/38，仅剩acc_first/second。此时两组packed界和load链已在所选组全部闭合，仍非整核证明。见CHAIN-PROGRESS.json。

10从09派生，未新增helper或lemma，仅在真实FMA前增加8个精确FMA表达式切分和4个广播/旧累加器切分；静态guard已通过，实际50项selected由root启动，当前尚不报告通过。
