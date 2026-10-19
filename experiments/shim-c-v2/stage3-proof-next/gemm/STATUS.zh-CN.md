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

10 selected01在600.712秒后exit124，无normal_exit/raw，输入不变；因此不能把50 scheduled当完整50项结果，也不替代09。print-eval01（none）完整导出真实eval0_0/dup0公式：当前acc在目标中为局部struct-copy展开后的Mf32_undef读取，而已有归纳关系经memcpy内存映射表达；需区分实例化和frame。11从09派生，仅加入首lane的ground dup/acc/recursive-step/eval四个切分，全部自身VC纳入42项selected，静态guard已通过，待root实际运行。

11 selected01完整37/42，输入SHA不变；ground_step已证明，ground_dup/ground_acc/ground_eval及原两步acc仍未证。print-ground01完整none打印表明递归展开可证；浮点congruence实例化和struct-copy/frame关系分别仍是proof债务，未证不等于target错误。当前最佳局部候选维持09（36/38+helper2/2）；正在补09独立完整inventory，不能沿用05分母。

09完整inventory已完成：body 1206逻辑+32 CFG，globals12，逻辑总分母1218；两部分exit0、normal_exit与final数一致、输入SHA不变。candidate09/INVENTORY.json保留事件SHA；该分母不与05 full成绩混合。

12新增纯float空body/no-requires ghost helper next_fma_actual，以实际三个操作数为参数、conditional post只实例化FMA congruence及ext_same对称/传递；frame与acc未证cuts保留。静态guard通过，等待root实跑helpers完整body与43项selected，尚无新通过结论。

12 helper01完整raw4/4（另4 CFG-only），selected01完整38/43；新增helper自身通过，但与11同样5项pending，尚未减少调用点债务。最佳仍09。focus12.py另备3个ground目标的120秒direct solver诊断，RTE/模型保持，尚未执行；不同策略诊断不能当完整43项验收。

12 focus01已结束：exit0，0/3，3个ground在direct z3/cvc5各120秒仍未证，输入不变；这是独立诊断配置，不替代原组结果。13将完整congruence条件封装为有body predicate并增加ground predicate实例化；helper01已4/4，selected由root运行中。13完整inventory为1213 body+12 globals=1225逻辑，另34 CFG，均exit0/normal/final一致/SHA不变。

14从09独立派生，仅增加真实ghost structcopy诊断：by-value struct输入、真实局部copy与return、4个ground lane断言和4个return ensures、无requires；未在kernel调用。静态guard通过，等待root完整helper body检查，不声称循环frame已修复。
