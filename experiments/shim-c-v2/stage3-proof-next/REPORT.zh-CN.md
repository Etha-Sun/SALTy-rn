# 第三阶段九项：后续 proof 与独立审核

## 2026-10-19 最新闭合的局部链（ROOT02）

- QD8 r7 用有定义的等式 predicate 保留被前端提前化简的 nested shift 项，没有新增断言数量或假设。完整移位 helper **38/38**，连同真实 vsll body **64/64**，原移位溢出义务闭合。r8 新 AND helper **4/4**；真实 AND 调用链仍在验证。
- IGEMM r3 给真实循环补 kc 保持不变量，新增10项与原 k 建立/保持共 **12/12**；原16项加新增10项扩展回归 **26/26**。新完整库存 **771 = 762 body + 9 globals**（另30 CFG）；完整尝试已启动，不能将26/26作整核结果。
- DWCONV r18 去掉投影 helper 的 valid 前件，完整 helper **2/2**，caller **2/5**，原三个物理字段关系仍未证。r19 新增按值 ext_same 传递 helper **2/2**，正在验证 caller；完整库存850，新增两个helper义务。
- GEMM40 helper **5/5**、选定组 **10/24**，新valid通过，但原14个未证关系未改善。GEMM41在循环状态改变后重新实例化投影helper，helper **5/5**，选定组仍在跑；完整库存1249且新增一个wrapper assigns分支，不能漏验。
- `audit15` 与 contracts 覆盖 **101 个候选、30169 个外部锁条目**，原C/spec/checker一致，无新增requires。后续r19/r8等候选还需下一轮审计。

证据索引 `PROGRESS-ROOT02.json` 固定已完成结果的SHA。Bytes/IEEE v14/v15 memory **29/34**，比v11闭合了variant；三个预设false和两个真目标仍未证，模型仍未认证、未用于任何kernel。v14 adapter审查发现未知输出命令及证据碰撞风险，保留记录；独立v15收紧命令白名单和输出。v16更强子任务尝试仍在实验；所有原模型/锁保持。

以上依然 **0/9 新整核通过，无push**。运行中的结果不计入本节。

## 2026-10-19 后续实测（整核仍为 0/9）

只在原九项及其共享依赖内推进，未 push。以下局部结果不组成整核验收，`verified/manifest.json` 未变。

- QD8 nibble-r3 的两个算术 helper 完整 raw **784/784**，包含 256 个互斥 byte case、default 覆盖、全部后置条件和函数体义务，输入 SHA 前后相同。r4 的 bits_i8/shift/and 三个真实 body 为 **42/47**；未证为 bits_i8 后置条件、memcpy valid_src/separation、shift 溢出、and 前缀保持。caller 全选组 300 秒、仅命名组 180 秒均缺最终 raw，不能声称调用闭包。r5 新 shift helper 与真实 vsll 合跑 300 秒也未完成；r6 正以实际 nested-shift 归一断言继续尝试，没有新增 requires。
- GEMM candidate35 projection helper **8/8**，但 caller 571 项选择组 300 秒缺 raw。candidate36 删除未证 seed 后，八个标量 frame 独立 **8/8**。candidate37 新 projection 与 seed **0/2**。candidate34 的 `-wp-unfold-assigns -1` 对四个公式逐字不变，未重复耗用 solver。candidate39 将一条四 lane forall 不变量等价展开成四条标量不变量，相关完整组 **9/23**：仅 lane0 建立与八 frame 通过，七个新建立/保持及七个原 acc 关系仍未证；不能以公式归一化改善冒充 proof 闭合。其完整分母 **1243 = 1231 body + 12 globals**，另 32 CFG。candidate38 是子工具排队后晚到的同思路 none 候选，没有 solver 成绩。
- DWCONV 小型真实 loader 诊断 probe12 **20/21**，唯一未过是预设 false post。r13 prestate 关系 **0/1**；r15 的逻辑 let 投影产生同一物理字段公式，未重复求解。r17 无 requires 的投影 helper **2/2**、带中间 ensures 的真实 loader **13/13**；caller **2/6**，仅 bias address 与 by-value predicate 关系通过，局部有效性、原物理字段 prestate/local/normalized 仍未证。新完整库存 **849 = 840 body + 9 globals**，另 44 CFG，caller 全部 frame/RTE/callee requires 清单保留。
- CONV r4 完整 body 尝试运行 **3500.288 秒**后预算结束：完整 2328 库存中 **493 valid、68 已尝试未证、1767 无完成结果**，没有最终 raw/normal-exit，故不能验收。随后串行 globals **6/6** 单独记录，不拼入 full 通过数。证据在 `dwconv/conv-cursor-inline-r4/FULL-ROOT01-STREAM.json`。
- `root-review/audit13.json` 与 contracts 审核核对 **93 个候选、30169 条外部锁记录**，原 C/spec/checker 引用及许可的固定模型版本一致，无新增 requires；之后的新候选另需审核。

共享 Bytes/IEEE 实验仍**未认证、未用于任何 kernel**。v8 增加已由真实 body 与 Why3 标准 rewrite 检查的 store/read 触发形式；v9 的实例化没有匹配局部 let，v10 展开该 let 后实际 store 与别名最后写入控制通过，memory 从 26/34 提升到 **28/34**。v11 加 frame 触发及既有内存引理实例化后仍 28/34；剩三个真目标（邻接 frame、循环数值保持、variant）与三个预设假 post。v12/v13 的 solver 配置对照退化且预算结束缺 raw，未采用。旧锁不改，native IEEE/BV 定义未替换成 Real；上述支持不构成模型资格。

本地分支 `feat/shim-c`，阶段检查点 `c729f55`，后续工作继续。只处理原第三阶段九项及其真实依赖。原 C/shim、公共 spec/wrapper、已冻结模型/锁和旧 checker 不变。用户未授权 push。**新增整核通过仍为 0/9**，没有新的 kernel 反例。

## 完整尝试与完整分母

下表只统计各自 full 运行的流式结果，不拼接不同运行。均因 1200 秒预算结束，缺最终完整 raw，不能严格验收。CFG 自动项另列于 inventory，不计入逻辑分母。

| Kernel / 候选 | 逻辑分母 | valid | 已尝试未证 | 无完成结果 |
|---|---:|---:|---:|---:|
| f32-gemm-minmax / candidate05 | 1199 | 359 | 23 | 817 |
| f32-dwconv-minmax / r4 | 827 | 431 | 32 | 364 |
| f32-dwconv-minmax / r6 | 840 | 408 | 16 | 416 |
| f32-spmm-minmax / cuts-v4 | 764 | 427 | 34 | 303 |
| f32-maxpool / cursor-r3 | 1239 | 301 | 18 | 920 |

maxpool 未证为 17 timeout + 1 unknown。dwconv r6 的另次 globals 9/9 不拼入 full 的 408。证据分别见对应 `INVENTORY.json`、`FULL01-STREAM.json`、`FULL-ROOT01-STREAM.json`、SPMM `REPORT.json` 的 `full_only_counts`。服务器曾严重拥塞；超时只表示预算内未证。

新 proof 会产生新义务。GEMM candidate09 的完整分母是 1218（1206 body + 12 global），candidate13 是 1225（1213 body + 12 global）；不得沿用 candidate05 的 1199 或把选定组几十项当整核分母。

## 九项实际 proof 进展

以下均为局部结果。被调用合同、上游断言或不变量仍有未证义务时，下游绿色不能单独组成整核证明。

| Kernel | 实际新增证明与现状 |
|---|---|
| f32-gemm-minmax | candidate09 helper 2/2、选定组 36/38，边界和两次加载关系通过，两步 acc 未证。candidate12 浮点 helper 4/4、主组 38/43，新增 ground 断言仍有债务；三个关键断言提高到 120 秒仍 0/3。candidate13 为 40/44。candidate16 完整 struct-copy body 10/10；candidate19 两个真实广播 body 21/21、主组 41/48，相对18确闭合两个 dup-current。candidate20 真实 load body 26/26，但主组退化38/48，未采用；22为39/49。23单步frame0/1；独立普通C真实load+copy/frame重现25为29/29，故不能称该单步关系在模型内不可表达。26入口snapshot小组2/3，frame仍未证。 |
| f32-igemm-minmax | cursor-r2 helper 3/3、主组 15/16；仅该组选定的 k 建立未证，实际 WP 涉及局部槽更新前后的分离。其它数值/内存义务保留。 |
| qd8-f32-qc4w-gemm-minmax | round-r2 实际 round_up_po2 body 6/7；四个后置条件依赖未证 mask_half，不能称 helper 完成。r3 helper6/7；r4范围/偶数切分加受限bit策略后完整8/9，剩shift_mask。独立审计发现bit tactic机器int高位掩码退化，修复与控制见下，尚无新kernel验收。 |
| f32-conv-hwc2chw | cursor-r1 10/15；r2 新 helper 4/4、RVV 游标组 11/13，仍有实际 store/rebase 关系；NEON width 的旧债务保留。r3展开真实signed-index相关body、补loop frame后15/16，旧两个cursor目标均闭合、剩新signed-add循环保持。r4真实successor helper2/2、相关四目标4/4、扩大cursor回归16/16；其余内联义务仍必须完整覆盖。 |
| f32-dwconv-minmax | r6 helper 6/6、权重组 15/15、扩大回归 37/37、global 9/9、控制接受。完整尝试仍未完成，见上表。r7对RVV bias/FMA/store添加8个值切分点，实际完整0/8，不能据下游合同声称改善。 |
| f32-dwconv2d-chw | height-r1 真实 doz 与 helper 3/3、主组 11/14（RVV 高度子组 7/7）。独立 inline 实际 doz body 诊断 13/14，仍一项未证；不是旧 checker 的正式验收。r3追加真实mask/reinterpret body内联，helper14/14；24项组600秒无最终raw。原before单组随后正常2/2（NEON/RVV各一），仍不能跳过24组的内联新债务。新完整正常分母1653（1647 body+6 globals），另44 CFG-only，均已none生成但不是证明通过。 |
| f32-maxpool | cursor-r3 两个 helper 4/4、主组 18/18、控制接受、独立同伴审核。完整尝试见上表。 |
| f32-argmaxpool | index-r1 helper 6/6、主组 5/8、控制接受；channel 保持和两项索引游标未证。r2 给四个真实 u32 helper 补循环范围/写入范围/前缀证明，独立 inline 实际 body，待验。r2选定组尝试900秒无最终raw，仍未通过。固定独立 unary 修复模型，不能偷换普通 frontend。 |
| f32-spmm-minmax | cuts-v4 helper 2/2、主组 14/14、独立复验及控制接受。column-v2 30/36、v3 map 4/5，剩局部分离等债务；inline prefetch 单独无改善。neon-frame-v5 为原先未注释的七个真实 NEON 循环补写入范围及范围/游标不变量，40 个新 invariant VC 已 28/40；272 个 equivalent assigns 尝试 900 秒后无最终 raw。v6 内联真实 vld2q_dup_f32 后入口 range 2/2，不能将窄写入范围当假设。v6全部新invariant为29/40；v7 frame74项900秒无完整raw。v8新索引helper2/2但18项组300秒无raw。v9入口cut2/4属于债务迁移；v10新无前提算术helper2/2、入口组3/4，剩原uintptr保持，建立债务已与helper一起闭合。 |

## 冻结与证据审核

`root-review/audit12.json` 与 `audit12-contracts.json` 核对 81 个候选，冻结文件/模型配置及 public spec 一致，没有新增 requires，30169 个外部锁条目校验通过（含不同锁的重复文件）。后续候选还需新一轮审核。静态 guard 不等于 proof 解析或断言成立。

所有 ghost/helper 合同必须由真实 body 证明；不添加外部无 body 合同或假设。独立 inline 执行诊断保留真实函数定义，并记录执行配置和 SHA；不能直接作为旧执行器的整核验收。

## 位表示桥的独立工具实验（未资格认证）

旧 Typed canonical_nan 的 memcpy 字节/浮点视图连接未证。原生 IEEE FMA 的真实 helper 已 NEON22/22、RVV21/21；不能以旧短预算结果宣称FMA缺body。

`byte-fp-prototype/`、`../stage3-byte-fp-front-v1/` 至 v6 是独立实验，**未用于任何kernel**。新源码以native IEEE/BV定义及每次store的新鲜NaN位选择替换旧Bytes+float三个不健全codec公理；旧Bytes+float仍禁用，旧模型/锁未改。

- 原v1 canonical切分14/14；全codec397目标900秒无最终raw；zero组31/34。
- 位逆关系的真实body依赖已逐个闭合：BV逆32/64、int32，int64由固定CVC5原生BV实例证明；接口32/64、compose32/64各6/6。固定NaN逆关系和false的原Z3负控制实际SAT。另一个64位CVC5 native FP负控制只返回Unknown/incomplete，不冒称SAT。
- root新增有body的decode单射32/64各1/1；v4新share完整依赖重放24/24。再推导负零唯一位表示32/64各1/1，v5控制组33/34：两个零ensures闭合，但64位copy-word断言未证，故整组及模型资格均未完成。
- CVC5 1.2.1不支持fp.to_ieee_bv。v3起adapter仅在不支持的真实SMT上返回unknown，否则原文件原参数调用原CVC5；不改写表达式。v4/v5 CVC5 driver仅移除指定已证支持假设以加强目标，保留已证decode单射/负零推论；不得将unsupported当负控制成功。
- v2 canonical退化7/14，在同源v1及恢复CVC5的v3/v4为14/14；七个pure-byte失败与移除CVC5有关，不归因全称事实。v9导出对照只删除4指定支持假设，其余goal/上下文字节一致，但原/删后Z3各5秒均timeout；删后CVC5也30秒timeout，尚无该删除带来零控制改善的结论。

所有模型版本及支持引理均保留真实依赖、失败记录和SHA；尚需全部正反语义控制、内存/别名/分支循环/IEEE-FMA回归、独立锁及完整checker复验。正式manifest不变。

## uintptr 与高位 tactic 的独立诊断

SPMM `address-bridge01/typed-root01` 全10raw为7通过：真实typed步进及原址uintptr往返通过，uintptr加16字节再转换的关系未证，两个人为错误关系未通过。有限ground片段展示原址可逆不蕴含仿射编码；它不是完整WP模型反例，更不是kernel反例。原保持债务不能靠添加未经证明的地址公理关闭。

GEMM27删除多余A aggregate后5/7，保留A load及两轮dup current/ref全部通过，仍两项acc-before。这是减少辅助债务，不改公开输出关系。DW bias-r8首加载分解2/3，仍有真实聚合复制关系未证。

`bitwised-audit01` 实际OCaml4.14.2/int_size63对照：旧bit62掩码为负、bit63为0。独立 `stage3-bitwised-front-v1` 只改一行使用大整数幂，源码10894文件仅此一文件变动、旧10056锁项一致，编译安装完成。高位正反控制完整raw5/10：五个assigns通过，两个真post虽bit子goal已化true但未记录Qed而仍pending；三个假post均未过且真实高位反例义务保留。不能用策略日志“proved”替代完整raw验收，也无旧tactic不健全结论。

## Typed 内存块编号审查（独立候选，尚无因果结论）

只读审查发现旧 MemTyped 中 UInt128/M_f32 都使用 rank 9，SInt128/M_f64 都使用 rank 10，compare=0 与结构相等不一致。独立 `stage3-typed-rank-front-v1` 只调整后续编号为 11..15，旧锁/source/binary 不变。当前普通 struct-copy 诊断失败是否由此导致尚待正反控制，不能提前声称修好模型；也不能据此无证据宣称历史 kernel 有误。10894 个源码文件只一处文件变化的审核已记录，独立编译完成后对同一 struct-copy body 的实际复验仍 5/9，与旧版相同，故不能把此修复称为当前 float-only 复制证明的解决方案。

## 后续独立复验：仍未完成整核验收

- bitwised v2 在仅修大整数掩码与真实 trivial/Qed 结果记录后，高位正反控制 raw7/10，恰好两个真post和五assigns通过、三个假post未证。重新编译未改observer以匹配新Wpo ABI，保留首次ABI不匹配失败。QD8实际round_up_po2与ghost调用组正常18/18，pending空、SHA不变；这是辅助函数调用组，不是QD8整核。
- 同一独立v2标准模型锁下：unary raw/typed各17/19，IEEE23/26，builtin/cast16/18，实际fmaf融合/非融合与特殊值62/66；逐项未证均为预定假post。唯一已通过f32-vadd整核回归在新freeze r2正常571/571、complete与全部严格guard/control/coverage通过；根逐项核验10060模型输入后另存QUALIFICATION-ROOT01.json，允许该固定独立Typed/IEEE版本继续九项工作。首次误用低层runner导致未知alt-ergo；其次发现复制checker路径不满足正式入口固定路径，两次均保留为入口/准备错误，未修改旧锁掩盖。原锁/旧元数据的pending文字保留，当前资格以独立根验收记录为准，不改旧SHA。
- Bytes v6 新增有body的 `Read64Bytes.checked_read64_equal_bytes`，原型原body1/1且新share重放1/1。相同冻结普通C，仅补已检查unsigned字节断言后，zero42/42、numeric82/82全部通过。其余正控制247/248，仍partial-byte-frame未证；补充别名/分支/循环控制正在审查，故未资格认证，也未用于kernel。
- GEMM29递归clear300秒缺raw；30单次匹配正常0/1，不能称解决frame。DW bias-r9真实loader16/16但kernel1/3，较r8的2/3退步，明确不采纳。
- CONV r4完整库存正常分母2328（body2322+global6），另55CFG-only；完整控制接受，唯一full-root01已启动，尚未完成。DWCONV2D r3库存1653仍仅表示覆盖分母。

正式manifest仍无变更，新增整核0/9。所有局部诊断、工具资格控制、完整尝试分别保留，不拼接为整核成功。

新GEMM31标量snapshot首次真实load后frame正常1/1，尚需四lane及全部新ghost/原acc义务；30trace明确策略匹配失败，不应称clear执行后仍超时。DW frame-r10为3/6；Bytes v6内存扩展26/34（含三个预定假post和五个真义务未证），partial-frame proof切分28/30，仍两初始字节断言债务，模型资格未过。

后续实际结果：GEMM33为8/11，未证seed、原acc_before_0、原acc_first；8个frame在带未证seed的上下文中，不独立算整条关系成立。31无此seed的首frame1/1仍有效。DW scalar-r11三目标0/3，原cut全部保留。QD8 nibble-r1 180秒预算缺raw；none公式揭示ghost局部类型界丢失，r2改proof变量类型并新增checked byte helper，正在完整调用组验证。

Bytes v6额外IEEE控制23/26且恰三个预定假post未证；负codec五函数合跑600秒缺最终raw。独立v7尝试用已证内存read/write/frame加IEEE store/read组合（五个新share body义务重放5/5），但memory组仍26/34，未解决五个真义务。首次CVC5 driver把theory关键字写成module，原错误与锁保留，另配置02修正并重放；未宣称模型资格。对实际SMT仅改mbqi搜索选项仍超时；尝试显式触发的另body内存耗尽，均保留失败，不把这些当新公理导入。
