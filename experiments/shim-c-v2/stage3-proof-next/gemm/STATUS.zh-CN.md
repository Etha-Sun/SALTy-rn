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


13 selected01 已完整结束 exit0，40/44，输入不变。新增有完整body的 predicate实例化与 ground_eval 实际通过；剩 ground_dup、ground_acc、acc_first、acc_second。纯FMA实例化有进展，但这四项依赖未闭合，不构成整核通过。

14 helper01 为5/9，四个copy lane assert未证；返回ensures依赖这些断言，不可算完整copy链。helper-raw01关闭Qed/clean仍5/9。AST确认copy=v真实存在；raw WP保留Load_S5聚合相等，正常优化后该假设消失。generate-copy-raw02实际生成Why3定义：Load_S5正确构造Array_float32，array access公理已引入，但触发器要求array-get，而结论直接读取Mf32。尚未确认具体优化/实例化根因。rank唯一性独立新binary对照由root执行仍5/9，不能把rank碰撞当作此float-only copy问题的直接修复。全部属于工具/模型/证明表达调查，非kernel反例。

15保留09全称循环不变量并增加4个固定lane不变量，共8个建立/保持新债务；root执行中。16独立copy诊断加入完整body predicate next_vec_same和一个aggregate cut，保留原4lane assert及4ensures，总10项helper债务，尚无求解结果。

14 helper-nofilter01关闭filter-init仍5/9，未改善；不能把初始化假设缺失简单归因此选项。09 print-unfold-acc01使用-wp-unfold-assigns -1，none诊断exit0/SHA不变，真实next_acc_first仍为多级Mf32 memcpy/undef链。源码该参数只传入check_assigns检查写区域，不控制havoc；没有新的求解通过结论。16正常print-copy01保留聚合初始化等式和新predicate假设，真实helper求解由root执行中。

16 helper01在旧冻结模型和原Qed默认配置下完整10/10，inputs_unchanged=true，真实copy helper全链闭合！定义有body的聚合predicate使Load_S5初始化等式保留，并提供array projection触发；无需模型修复或新前提。此为独立copy局部证明，尚不代表kernel循环。17从09应用同方法增加聚合A-load、vdup、acc前后cuts及acc循环不变量；共新增11债务，49项组交root执行。

15 selected01完整exit0，30/46；新增ground lane不变量方案发生求解退化，16项pending，不能作为09改善替代。具体raw verdict保留原样。

17完整盘点已完成：1217 body+12 globals=1229 logical，另32 CFG；body/global exit0/normal/final一致，SHA不变。selected49由root运行中，新aggregate invariant建立/保持及A聚合cut已有timeout，完整成绩待run结束。18独立将predicate改固定2/4lane合取并以loop入口body cut替代新增loop invariant，保留原forall；新增10债务，48项组，静态guard及none解析通过，尚无通过结论。

18完整inventory1228逻辑（1216body+12globals）与32CFG，均exit0/normal/final一致且input SHA未变。19在18基础移动完整splat定义到现有guarded header，给真实vdupq_n_f32和vdupq_lane_f32追加等价aggregate post，原合同/普通C不变。19 helper01已完整21/21，exit0/input不变，包含新post、原body义务、RTE；可作为已证callee合同采用，caller aggregate cuts与原两个acc仍待实跑，不能把callee通过当kernel通过。

19完整inventory1230逻辑（1218body+12globals），另32CFG，前后所有输入SHA一致。20仅继续为实际调用的vld1_f32/vld1q_f32增加等价typed read post，明确读Pre输入，不改变任何原requires/assigns/ensures；新增完整predicate位于现有guarded header。static guard与none两新post解析通过，完整body独立验算交root。

17 selected01完整exit0，36/49，inputs_unchanged=true，13pending，不能当作09的改善。20 helper01完整exit0，26/26（另4 CFG不计逻辑分母），两个load真实body的新typed Pre-read post全部通过，输入SHA不变。仍需20调用点组实跑确认新post能闭合哪个链。

20完整inventory1232逻辑=1220body+12globals，另32CFG，body/global均exit0/normal/final一致、全输入SHA不变。

18 selected01完整39/48，exit0/input不变；pending9项（A aggregate、两dup current、两acc before/after、原两acc）。21准备时包含两处frame cuts，后root限定只第一处，已冻结21不改且不执行，标为prepared-only；22精确实现限定：在20基础仅将A aggregate放在已有scalar forall之后，并用入口ghost label增加第一FMA前纯struct frame cut，自身VC须验证。

22完整inventory1233逻辑=1221body+12globals，另32CFG；exit0/normal/final匹配、SHA不变。该版本只多第一FMA前frame一项，自身VC纳入selected49。20目前见旧w_frame_2/3/4求解退化，不能只摘新callee或新cut的绿色统计进展；最终按完整raw及依赖闭合判定。

19 selected01完整41/48，相对18精确新增闭合两dup_current，支持来自已证21/21真实vdup body。20 selected01完整38/48；已证26/26 load新合同未闭合A aggregate，还出现旧w_frame_2/3/4退化，因此不作为19净改善。23回到19分支，无新增load合同，给第一FMA前8load+4dup的纯acc frame增加12步切分；原before/after与A aggregate全部保留，none60条清单完整。第一frame实际WP仅是不同局部tmp写后acc struct值保持，不含FMA参考递归。

23 frame-first01实际完整0/1、输入SHA不变；未启动60项重复求解。23完整inventory1242逻辑（1230body+12globals）与32CFG，完整marker/final/SHA检查通过。

24最小ghost caller复现被Frama-C ghost:bad-use拒绝：ghost函数不能调用原非ghost vld1_f32；exit1和冻结保留，这是新增proof输入形式错误，不是环境错误/target反例。未关闭该检查。为真实body复现，frame-reproducer25/probe.c使用独立普通C诊断函数include冻结16 unit，原callee合同不变，无requires，局部2float输入来自任意float4参数；不作为kernel候选/额外发布helper。manifest记录该必要性与probe SHA；runner守护原unit/model/proof和probe。none解析与AST成功，确认真实vld1返回局部和copy初始化存在。全body诊断交root，kernel未证状态不变。

普通C reproducer25全body实际29/29（含真实vld1原body），exit0/input不变，pending空。说明当前声明模型能表达并证明一次局部返回写后的struct frame；23的大kernel失败不能定性为模型表达缺失，可能是嵌套heap/上下文触发负担。26按19基线仅添加loop入口ghost struct snapshot，以当前两struct的关系替代旧label跨heap frame；5新cut与原before/after均保留，none selected通过，实际focus与完整新assigns/RTE清单核对中。

### candidate27/28：减少额外债务与独立 checked 过滤策略

27仅从19删除新增 `next_a_aggregate`，保留原标量 Aload 与所有真实 C/合同。root `focus01` 正常结束 5/7，pending 仅 `next_acc_before_0/1`；Aload 及两轮 dup current/ref 共5项通过。未证明整核或完整循环。

28从23独立冻结，只增加内置 `Wp.filter` 策略（删除无关假设，再交 z3/cvc5），原证明义务保持。`print01` none解析 exit0、SHA不变；solver由root执行。本配置与原求解配置分别记录；若策略子目标被内置结果记录短路而raw仍pending，严格保留raw状态，不据策略提示改绿。

26 的 `snapshot-first01` 正常2/3：入口snapshot copy/ref两项通过，跨第一次真实vld1的 `next_snapshot_first_frame` timeout；不能因前两项通过认为frame成立。26完整无solver清单1235项（body1223+globals12，另CFG32），均正常结束、SHA未变。

22 的 `selected01` 正常39/49；其中 acc_before_0 依赖未证纯frame而变绿，不能独立计改善。对照普通C重现25在冻结16上下文中真正调用原vld1，17个重现函数义务+原vld1的12义务=29/29；由此只能判真实kernel上下文/求解仍需处理，不能把当前frame超时称为已证模型表达缺陷。

28 `filter-first01` root实际正常0/1、SHA不变。session保存了两层真实 Wp.filter tactic及各solver timeout，故策略实际执行；session未输出前后假设清单，不能凭此断言具体删除了哪些假设。

29独立从23增加 Wp.clear 策略：逐项删除整数量词假设及 next_vec4_acc 数值假设，保留目标不变；均是内置checked删除操作，只强化子目标。sourceguard与none print01通过，root负责实际run及selector匹配确认。27仍是较低辅助债务分支，29仅frame诊断而非采用其更多cut。

29 `clear-first01` root300秒退出124、无raw，日志仅到1goal scheduled，尚无删除假设的证据。源码Pattern.psequence只选择第一个匹配，因此不能把本次停顿归因为匹配排列组合爆炸。30为非递归单次next_vec4_acc删除对照：none解析/sourceguard/SHA通过，待root执行。独立trace30.py启用原内置strategy与script:allgoals日志，可记录每次匹配与tactic子目标；不改变模型及策略语义。

31 scalar-first01：root实际1/1、exit0、SHA不变。局部成功是第一次真实vld1前后 lane0 的标量ghost snapshot frame，不能替代原acc关系。完整库存1230（1218body+12globals，CFG32另计），逐property与19比较见INVENTORY-DIFF.json。33基于27扩为4scalar snapshot；9新增cuts全部选入，连同原acc_before_0/acc_first共11项供root实际验收。

33完整无solver库存1238=1226body+12globals，另CFG32；两阶段正常exit0、final计数吻合、SHA保持。相较19精确新增9项（seed、4first、4full），删A aggregate 1项；无额外隐藏ghost初始化/assigns/RTE新增项。全部新增9项均在scalar-chain01的11项验收集合中，剩2项是原acc_before_0/acc_first。

33 root实际正常8/11，未证seed、原acc_before_0、原acc_first。8个frame在含未证seed的背景下通过，不算独立链闭合。34以4项原vacc lane/gacc ground替换seed，完整库存1241（1229body+12global，CFG32）；新增12项全在14项focus中。35用4个真实body、无requires ghost投影helper替代裸ghost读取，typed predicate全部有定义，helper先验。36从33删除未证seed，独立复验8frame，避免依赖未证新假设；静态/none已通过，待root求解。
