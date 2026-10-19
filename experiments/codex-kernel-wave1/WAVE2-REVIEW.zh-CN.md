# 第二轮补证与主审记录（进行中）

本轮优先收尾 qs8-vcvt、qs8-vlrelu，并给八项原先较薄的核心证明补实际循环不变量和指令 helper 证明。未使用 DeepSeek。正式收录仍以 `verified/manifest.json` 为准；本文的局部数字不能算整核通过。

## 冻结与验收

- 分支 `feat/shim-c`，已有提交 `6b94085` 已推送。其两项转换 kernel 不属于本轮新通过结果。
- `audit/wave2-source-recheck03.json` 复查 6754 个原跟踪文件，变化仅为此前授权收录带来的 manifest；八项核心的 150 个冻结输入全部相符。
- 每项 proof 独立版本、一个 `proof.patch`。普通 C、公开 spec、shim、wrapper 均保持原冻结输入。旧失败版本保留。
- 新 helper 必须检查真实函数体、所有调用前提、内存访问、frame 和终止条件；global lemma 也须实际检查。局部筛选、缺少最终 raw 的超时和 0/0 均不算整核成功。
- 完整验收包括同源码真假控制、全部函数/global/call 覆盖、冻结输入/模型哈希和主审独立复验。禁止新增 axiom、收紧公开输入域或依赖未证 helper。

## 已实际推进的共享证明

- 整数字节解包：固定低字节的 ghost 归纳及原 reinterpret/store 语义已补；`integer/unpack-signed-probe09.json` 为 39/39。
- 实际 store 的前缀 frame：`integer/qs8-vcvt-modular-v23/prefix-frame02.json` 相关 post/invariant 81/81；主 kernel 三个旧输出 frame cut 为 3/3。
- 尾部直接语义点和阶段边界：qs8-vcvt v25 的 named cuts 全过，但部分循环保持性仍未闭合。
- 将相同前缀 forall 等义命名，并检查单元素扩展引理：qs8-vcvt v27 两个 global 为 2/2；同源码真假控制 3/4，唯一未证为 false。151 项局部归纳/新 cut 中 148 通过，尚有三个新增切口，不能算完成。更简洁的 v28 正验证。
- v24 完整检查已结束：1313/1330，17 项未证均为 NEON 尾部相关，全部源/模型哈希、真假控制和函数/global 覆盖门禁通过。它不是整核通过；后续版本另存。
- v28 NEON 实际 body 为 300/316，filter 策略未能完成 prefix 切口，未收录。v30 以标准 `Wp.lemma` 显式实例化已经实际证明的 Step 后，五个 prefix-next 切口实际 5/5，通过报告为 `prefix-apply01.json`；出口 forall 和源值仍需完整检查。

## 三个数值核心的独立复验

| 核心 | agent 结果 | 主审实际复验 | 边界 |
|---|---|---|---|
| maxpool 九项树形/顺序归约 | helper 110/110，global 10/10 | 同样全部通过 | 尚未证明整核循环、地址和 wrapper |
| QC4 GEMM 单步/两步累加 | 2/2，全部 global 11/11 | 同样全部通过 | 实际 packed 读取、累加循环和输出仍需连接 |
| exp 求和尾部 | 3/3，全部 global 10/10 | 同样全部通过 | reinterpret、实际循环和 final sum 尚需连接 |

复验在 `audit/maxpool-tree-root01`、`audit/numerical-core-root01`、`audit/numerical-globals-root01`。maxpool 固定 NaN 构造函数的真实 body 由 agent 新补至 9/9，其余 helper 闭包继续检查。

maxpool v13 的 19 个实际数值 helper body 子树已由 agent 和主审各完整检查为 321/321。主审原始记录 `audit/maxpool-numeric-subtree-root01`。这仍不包含 memory helper、kernel 或 wrapper 全部义务。浮点 store 前缀 frame 不能直接把整数 `==` 公式照搬；当前保留 `ext_same`、物理 word/byte 保持性的实际待证切口，没有增加 NaN payload 假设。

## 必须保留的真实问题

### conv 右边界数值差异

NEON 在奇数宽度最后一列跳过右侧九个 FMA，RVV 原版仍执行 `0 * Inf`，可以得到 1 与 NaN 的不同输出。主审独立编译、实际执行反例及 1260 组扫参：原版 248 组不同，单独修复 target 后为 0；ASan/UBSan 未报错。

原版未改。经此前用户授权，仅另建修复 target 并重新冻结，修复 SHA `b7f391a5b367d0dfa57ea07438510612caf491257afdf8d18bc50e79c2fa24d7`。修复只对右边界 dx=2 使用已有横向 mask 保留原 accumulator；不能把回归通过说成形式验证通过。主审记录为 `audit/conv-right-padding-root01/review.json` 和 `audit/conv-right-edge-fix-root01/review.json`。

复杂地址/ABI 问题另行处理。`fp_index.c` 原 proof 为空，正在补原真实 helper 的精确指令合同与 body；未混入未经审查的 flat ABI 模型。

目前 fp_index 的六个 unsigned/index/mask helper 已实际 73/73，两个 strided-load helper 已实际 41/41（repaired-v10 / v12 原始报告）；11 个函数中的 8 个闭合，三个 signed/word reinterpret helper 仍未闭合。主审已独立重跑这八个真实函数体，114/114（81.856 秒），记录 `audit/index-eight-root01/`。修复卷积的四项真实 mask/FMA/merge/VL cut 实际 4/4，但仍依赖未完整闭合的 body，不能算整核验证。

### argmaxpool 公开内存域不足

`pixels=1,k=10,channels=1` 时，公开 spec 仅要求一个 index 元素有效，但 NEON 第二 chunk 的 tail 会读取四个 index。该结论来自源码/调用语义检查，未声称有动态内存反例。当前冻结公开输入域下无法证明全部 C 内存安全；不能偷偷增加 index padding 前提。它是 spec/读取足迹不匹配，不能直接归为算法数值错误。见 `audit/argmax-index-domain-review.json`。

## 模型边界

使用已独立审查的纯整数 Bytes 前端，以及保守的 native32 Bytes + 既有 FMA driver 组合；新前端的修改只修复 WP 已有 trivial-child 的统计归档。新模型均独立锁定并保留负控制，未覆盖旧模型。float64 codec 和 NaN payload/跨 typed-copy 精确位关联并未因此全部解决。Bytes32+FMA 与 flat ABI 的组合尚未批准。

自动审批曾拒绝一个以 prev/next 数值关系作为条件的空 ghost helper，命令未执行，未绕过重试。后续改为实际 C 调用处的 checked cuts 和独立检查的纯 global 引理；详细记录 `core-address-wave2/audit/ghost-helper-rejection.json`。

## 当前阶段连接检查

- qs8-vcvt v32 的 tail4 源值 cut 经标准 WP 0..3 有限 lane 分解实际 1/1；总输入长度仍为任意合法长度。
- v33 删除 v29 无效策略，加入等义前缀 Point 引理、分支内阶段出口和 ghost memory 循环的只读 vector invariant。冻结 SHA `4ad16c105ade105562a0887be39ab501560c14ed46b2e48363c04c573cc42aeb`；prepare02 源码 guard 通过。四个 global 4/4，同源码真假控制 3/4，仅 false 未证（预期）。阶段切口、最终出口和完整 NEON body 仍在实际检查，尚不能收录。prepare01 是 GNU patch 临时文件 owner 权限的环境失败，相关早期 global01 0/0 明确不予采信；prepare02 提权完成后另跑 global02 4/4。
- `audit/wave2-proof-screen01.json` 对 166 份候选 proof.patch 新增行作关键字检查，没有 axiom / assume / admit / false 前提或后置；此筛查不替代源码 guard、调用闭包及真实目标证明。

- exp v24 的真实 `vreinterpretq_f32_u32` memcpy helper：agent 26/26；主审独立重跑 26/26（105.944 秒），全部 global 15/15（38.176 秒）。记录 `audit/exp-typed-copy-root01/results.json`。检查包括 Here→Pre 物理 source frame 与 typed-layout cuts，保留全部 NaN 域及 ext_same；不代表整体 exp 已证。
- WP 默认 auto-depth=5 实际也限制显式策略深度（冻结 ProverScript.ml 中检查），现以同源独立 local command 增至 30 作资源对照；并未修改语义/VC/模型，所有 tactic 子目标仍须检查。原失败和默认资源版本保留；若正式采用，需另冻结 resource checker 并重跑同 profile 控制。

## 主审新增独立复验（保留整核门禁）

- `audit/index-signed-root01/review.json`：三个真实 signed/index helper106/106、全部global18/18、正反控制44/48，准确仅4个wrong/false post未证。与已独立复验旧八个114/114组成共享11个index函数支持证据；原输入/模型不变，不能替代kernel caller证明。
- `audit/qc4-support-root01/review.json`：v26同一候选20个真实函数的三个不重叠组128+132+66=326/326，全部global21/21，controls52/55，准确仅3个wrong/false未证。主审fresh dry复验。
- `audit/exp-value-root01/review.json`：v65原exp_lanes164/164，八数值support120/120，合计9函数284个不重复VC；全部global32/32、controls16/18准确仅wrong/false未证。它仍依赖剩余repr16/outer/main等，未宣称整核正确。
- v37 qs8-vcvt采用稳定ghost shift_count，并实际检查其等式；两个count与此前未过tail2_vector_stage/restore四项4/4（98.48s）。v33完整NEON实际338/343，非通过；v34、v35、v36失败/无终报均保留。oldvector joins仍需完整检查。v40仅移动现有assert8到assert10之后、加入标准actual-path split；所有原公式和C/spec不变，正在实跑。
- `audit/wave2-source-recheck04.json`：150核心冻结输入全部相符，6754原跟踪文件仍仅此前已提交的manifest变化。正式数量仍13，本轮新增整核0。

### 额外模型域条件待审

exp v36 inline日志364-376明确打印WP对 `__fc_errno` 与input/output/sums的额外separated hypotheses，公开spec没有这些文字。目前verified日志搜索未出现这类记录。它作为未来exp收录的独立域门禁保留：不能仅凭所有VC绿就忽略，也不能偷偷加入公开pre。须检查其与C有效类型/接口的关系，或明确保留条件性结论；当前没有改模型或补隐藏前提。

## 独立模型域审计更正

独立审计实际读取 ignored 日志后，发现两个已收录包也打印了额外模型条件：qs8-rsum `logs/separated.log:59`、qu8-rsum `logs/final02.log:59` 要求 input 与内部 static const onemask_table 分离，公开spec并未显式提供。此前普通rg搜索无结果不能作为不存在的证据，现明确纠正。13是历史收录包数量，其中2项额外模型域仍待复核，不宣称13均已证明原公开域。旧spec/impl/proof/results均保留。

冻结WP源码显示MemoryContext将这类条件打印成requires，默认并不为外部入口额外证明；`-wp-check-memory-model`也主要检查调用，单独打开不能自动消除入口义务。在旧Rseg建模上assert separated可能由模型直接化成true，不能冒充公共spec蕴含。已授权隔离小诊断仅用标准 `-wp-alias-vars` 将常量表作为实际Bytes地址建模，是否消除条件须实测，不改公开pre或模型axiom。详细独立报告在 `audit/model-hypotheses-independent01/`。


## Root独立复验：rsum表alias配置

2026-10-19：root审读隔离full.py后另启independent03实际重放：qs8-rsum 579/579（188.746s），qu8-rsum 567/567（182.975s）；各33个body、全部原goal ID精确覆盖，同源真假控制3/4且仅false未证，源/model前后哈希相同。标准`-wp-alias-vars test_neon_onemask_table`使额外内存分离假设消失，无spec/proof/C修改。独立证据见`audit/model-hypotheses-independent01/root-independent03-review.json`。旧正式包和旧记录未覆盖，原记录的条件性与新配置的复验要区分；正式manifest尚未更新。


## 两项整数收尾的最新实测

- qs8-vlrelu v29 完整NEON body：418/421（890.154s）；未证仅tail4_old_frame、tail4_new_value、tail2_new_value。v31两条new_value通过既有forall的标准显式实例化实际2/2（23.753s），还未算整核完成。
- qs8-vcvt v42 oldvector10：default30单目标360s无raw保留；相同源default5/debug另名实际1/1（182.613s）。默认solver在策略中间节点的重复尝试耗时与数学难度须区分。
- qs8-vcvt v41整轮default30/par2预算结束exit124，1866.609s，无最终raw，不能把0/0当通过。v43保留default30/par8完整对照，v44相同proof、标准default5/par8完整对照仍运行。
- root独立v44两个真实乘法helper全body30/36；v45仅filter仍30/36；v46标准Wp.array分解后32/36（61.567s），闭合两个RVV数组更新preserved。
- v47增加纯数学S16ProductBound（两个有符号16位整数乘积在±2^30范围）并实际检验：全部global5/5（19.857s）；两个真实乘法helper全部36/36（51.297s），包含此前4项溢出检查。没有关闭RTE、收紧参数前提或改普通C/spec/model。仍须和vext/tail策略合并后整轮验收，不能由这些局部数字宣称整核通过。


## check lemma组织试验与真实全量结果

- qs8-vcvt v43完整实际1207/1219，1031.807s；source/model/controls/global/body覆盖门禁均正常，所有NEON/RVV/wrapper目标通过。12待证只在helper：vwmul4、vqrdmulh2、vext2、proof_unpack4三个lane与一个RTE。v44 default5实际1203/1219，578.07s，多出4个资源敏感项，未收录。
- v47真实完整NEON body345/345，789.388s；新乘法数学界没有破坏主核，但这仍不替代全helper闭包。
- v48加强unpack filter/30s仍33/39，101.783s；保留失败。
- v50将四个Prefix新proof lemma改为标准check lemma（同公式、仍需逐项检验、不会自动进入无关函数假设）。真实globals5/5（20s），unpack三body39/39（17.194s），原vext精确body16/16（5.874s），无需复杂Vext策略。
- 但WP标准TacLemma.find只查已编译注册定理，不能直接lazy导入check lemma；v50 old10单独检查虽raw1/1，仍因Expected string参数/lookup错误exit1，明确失败。包含全部5global+old10的另名检查同样遇到lookup错误，不能冒领。v51改用标准Wp.unfold原predicate定义及forall实例化；正在检查5个prefix-next+old10+全5引理，禁止改模型前端绕过。
- `checker-v11`仅将所有必需global的声明kind精确映射到lemma_/check_lemma_ raw名字；未删任何检查。`resource-v15`仅在v14基础上导入该新版checker。conversion_proofs独立读diff/复算hash确认门禁不变；审查与删除每个必需property的拒绝控制见`audit/check-lemma-checker-v11/review.json`。
- v49仅为未执行的分组草稿；现有guard禁止axiomatic，故该草稿明确NOT-RUN，不修改或绕过禁令。它不是证明结果，也未被任何完整验收采用。


## 直接定义证明的闭合结果

- v51粗选hyp的11项诊断360s无raw，保留失败。v52采用完全同heap/参数的旧P(K)先展开、再展开目标P(K+1)，以及精确点等式选择。11项实际9/11（214.227s,exit0）：5global、3Memory Next、oldvector10全过，只有2Vector Next待证。没有check lemma lookup错误。
- v53只把Vector Next展开后的child换为既有VectorLiteralPoint，实际2/2（76.289s,exit0）：明确实例化旧prefix forall于fresh goal index；普通C、数学公式、输入域、模型均不变。v52与v53分别保存完整验收，不能拼局部结果宣称整核完成。
- Lrelu v38精简check版6个真实helper92/92（31.062s）和globals5/5，3Memory Next先通过；v40对应同一实例化改动后5Step全部5/5（80.346s），其正式全量已启动，尚未收录。
- exp新alias配置v72实际重证7个store/callee103+9个exp_lanes/numeric284=387个互不重叠body VC，全部global36/36、repr控制34/37准确仅wrong×2与false未证。v79在真正公开equivalent中inline两体，load/value/store三个main点联合3/3（38.14s）。它仍有outer/tail/acc/post待证，不能算整核完成。
- QC4新独立worker在qc4-main-wave2从v45冻结底座推进：真实K为wrap32整数乘加，FMA仅后处理，不改旧reference为浮点K fold。v03共享支持40真实函数648/648、35global，后续v05又补实际signed shift63/63；K的init/preserved/外层输入保持/rounded K偶性合计11/11，但其中preserved仍依赖尚未闭合的真实MAC/pair cuts，明确不能算主K-loop已完整证明。


## 最后慢目标与libc边界复核

- Cvt v53实际完整1217/1220（574.538s），仅旧NEON输出prefix保持、RVV只读保持、u32原post待证。v54只给旧invariant命名并针对性30s/实例化已有pack32 forall：11项globals/慢目标11/11（25.72s），真实u16+u32完整88/88（24.968s）；完整验收正在跑，不拼局部结果收录。conversion_proofs独立审读delta确认普通C/spec/公式/模型不变；LLVM54普通与注释版完全相同。
- root以同一完整分析范围、prover none导出生效libc合同（audit/cvt-libc-effective-root02）：memcpy明确requires valid/nonoverlap，terminates true、exits false、copied_contents、result_ptr、限定写dest。外部无body，因此这些是TCB；scope单独选u32未生成默认条款的false目标不能被当作kernel反例。导出只有义务清单，不是新的证明。
- Lrelu v40完整1543/1547（617.27s），4慢目标在v41同源局部全过，正式整轮仍待结果。分类校正：330 loop invariant、88 loop variant、24terminates、24exits；后面136项均通过，不把invariant误数为variant。
- exp公开spec原本就允许errno写，排除output-only assigns怀疑；源码到硬件intrinsic的errno效果对应、Bytes有效类型与alias域仍待审查。spec/C/model均不修改。

- QC4 v09同unit全部38global、43真实support body711/711由agent完成；新7个真实后处理cut与packed-byte连接已由root另名独立复验8/8（44.492+74.482s），同unit控制3/4准确仅false未证，源/模型前后hash相同。记录audit/qc4-v09-main-cuts-root01/review.json。局部callee完整支持与caller cuts不同；测试仍打印5条与errno分离的额外模型前提，必须保留，主MAC/外层及公开caller未闭合，未收录。
- exp v86公开inline RVV 7条loop invariant共14个init/preserved实际8/14；remaining/input_offset/output_offset闭，grouping/values初始化闭，four_accumulators和input_readonly init/preserved、grouping/values preserved仍待证。没有只跑空骨架；v87继续同公式实际实例化。
- 八core冻结源码去重68份的重新hash检查全部相同（audit/wave2-source-recheck05.json）；全tracked基线仍仅先前转换收录的manifest变化。


## Cvt 首个完整通过候选

v54 full01真实1220/1220（603.497s），43真实/ghost函数、全部5引理、19terminates+19exits+68variant，源/模型/真假控制/全body覆盖门禁全通过；日志无额外内存模型前提。root另存audit/cvt-v54-full-root-review01/review.json绑定当前proof/manifest/raw哈希。root-independent01已在全新目录并行运行，canonical尚未做，正式收录数量仍13。Lrelu v41真实1546/1547，仅旧rvv_bulk_old_frame的5秒波动；新v42只给此旧公式30秒，局部1/1，完整与独立两轮并行中，尚未通过收录门禁。


## 收录阻断：旧Bytes全局地址范围law的矛盾

两项canonical也全部green（Cvt1220/1220,575.412s；Lrelu1547/1547,613.915s），但没有加入manifest。Root随后定位旧Bytes理论组合：无界addr={base:Int,offset:Int}、base0恒static、∀static addr编码落uint64有限域、∀static addr逆向恢复原addr。限定base0/自然数offset已推出无限集合向有限集合的单射矛盾。Root独立Lean4.29.1+Std theorem range_inverse_conflict已检查（仅propext/Quot.sound，无sorry或新用户axiom）；conversion_proofs独立审源码映射并复编译确认。actual Cvt SMT完整复制在audit/pointer-range-consistency-root01/；Lrelu实际VC同样含law。

这是冻结旧模型的逻辑问题，不是agent修改C/spec/引入proof hack，也不是solver将假命题误判。旧全绿只保留为在该不合格理论下的历史工具记录，不支持收录结论。正式数量仍13，13项采用Typed/Typed+float，不能未经核查推断同一law存在。新的整数v4仅删除MemBytes的ranges定义及注入共11行，不增加任何axiom，不改MemAddr/Cint/codec/proof/C/spec；完整qualification与全量/独立重放仍必需，删除此冲突不等于全部模型一致性证明。

本次续跑里程碑：qs8-vcvt在integer-v4新模型下v55两次1220/1220（584.597s/585.385s），打包verified/qs8-vcvt-bytes-v4后canonical01再次1220/1220（579.358s）；全部goal ID、43函数/5globals、公开spec/普通C、LLVM identity和无额外memory model前提均复核。旧v54/旧包保留隔离，新包加入manifest，当前14项。Lrelu v44仅为最后frame添加已有30s策略，单项1/1后两次完整重放中。新增源复核06检查366份冻结manifest、55个去重源/driver版本，0变化。

Root04共享整数NaN桥21/22（仅false反例未证）已给agent独立审读，整合完整原word/special控制后的184目标179/184（仅5原反例未证）；未删失败/新增cut义务。新native-v6与FMA-v6锁各34305/34307个文件由root独立重hash零差异，源码唯一差异仍删除11行range公理。root完整独立资格重放进行中；允许核心worker在新独立config-only candidate做v6诊断，但验收门禁不放行，旧模型局部绿色不计新增整核。

Native-v6 root资格已完成：独立完整combined179/184（109.599s）仅5原反例；FMA18/20（19.398s）仅2原反例；book6/8、repr11/14、NaNloop51/52均精确预期。合并原C/注释proof的root host LLVM IR逐字相同。来源审计、所有子断言/ghost helper/callpre/RTE与旧版保留均复核，允许新独立冻结candidate，但不是剩余理论一致性证明，不能移用旧v5绿色计数。新maxpool、GEMM、exp已开始v6独立迁移及实际重放，冻结时间的pending说明保持历史原样。

第二个收尾完成：qs8-vlrelu v44新integer-v4模型候选完整1547/1547（616.799s）、root独立1547/1547（620.687s）、verified/qs8-vlrelu-bytes-v4 canonical01 1547/1547（618.813s）。57函数与5global完整、全部goal ID相同、无额外memory前提、source/model/controls全部通过，两侧original C逐字不变，LLVM相同。入manifest后当前15条目、22待证、3缺target。两新case每个只有一个proof.patch（1231/1494物理diff行），不是额外helper文件；同名旧包保留隔离。
