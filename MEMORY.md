<!-- CURRENT_VERIFIED35_PACKW_20261025 -->
当前完整已验证 **35/40**，目标 **40/40**。新增 x32-packw-gemm-goi：13个实际C单元、312条C义务、14个普通函数体、295次源码fresh Coq编译、325命令全0、444最终假设报告；12个原生intrinsic视图人工审核仍pending。SPMM@2239bcf90属于外部贡献。本聊天22+外部8+原有5。QS8/DW全门禁继续，Argmax/Exp/HWC仍为candidate。

Packw status288301a24.../manifestae58.../H91fc21.../full9f243...；root独立writer dry-run、integration13CPP/14body relocation和私有副本UBSan/实16GiBASan各41184次公有caller/case/83232864bytes都通过，签发原件未修改。Packw已发布cd2f274e4，原qs8-rdsum漏跟踪780日志依原清单SHA恢复89df8ddaf；35包45036清单项均跟踪。当前Q full-t6pyqowb8slots+D full-ex7thbdj6slots、Neon6/112GiB、HWC6/96GiB、Argmax新尾组件6/96GiB，共32actual。Q/D重型可升32GiB，root按最坏448GiB、全队752GiB地址空间cap保留；外部矩阵pool512GiB，host1505GiB，保守余量241GiB。真实额度半小时检查，严格>95%收尾；16:00:04Z读数33%，以live状态为准。所有证明边界详见各案spec/VERIFIED，无ISA/ABI/compiler或termination结论。

以下保留历史记录。

2026-10-25 matrix worker：F32 SpMM完整修复/兼容版：4实际C/788义务/19策略/835同环境fresh模块/956假设报告，递归coqchk及32并发准入通过。完整M/N/稀疏循环、NEON4/2/1与全部合法RVV VL；全binary32，循环打包与显式容量，固定VLEN128/e32m8，数值相等或同为NaN。原件保留，两侧表达式兼容改写，RVV另修复FMA/NaN。intrinsic人工语义审阅pending，无形式ISA/ABI或完整终止性定理。 当前34/40，完整包 verification/qcp/verified/f32-spmm-minmax。用户恢复额度后继续矩阵相关核；QS8与SpMM已完成。HWC→CHW仍为候选，已有原生回归与共享组件，尚未完成整核证明；勿沿用旧阶段停止指令，勿重复其他owner工作。下文保留原日期与作者归属。

当前完整33/40，目标40；新增Maxpool857 actual C/310 fresh Coq/1020最终Print已完整闭合。外部矩阵worker QS8-QC8W GEMM@37685e527另计其贡献；不得覆盖或重复计数。半小时额度检查/严格>95%收尾继续。以下保留历史记录。

# QCP 工作记忆入口

2026-10-25 matrix worker：QS8-QC8W GEMM FP32完整修复版：4实际C/1531义务/16策略/3051同环境fresh模块（续跑谱系明确）/1874假设报告，递归coqchk及32并发准入通过。原NEON保持，RVV恢复ARM NaN优先级；公开容量内正N/K，全binary32参数，固定VLEN128，精确int8输出。intrinsic语义人工复核pending，无形式ISA/ABI或完整终止性定理。 当前32/40，完整包 verification/qcp/verified/qs8-qc8w-gemm-minmax-fp32。用户恢复额度后继续矩阵核，下一SpMM，勿沿用旧“全部当前核完成即停止”的阶段指令。

2026-10-25（洛杉矶）：**x32-transposec 修复/兼容版完整通过并收录，正式31/40，目标40/40。** 8实际C单元/381字段/13普通body、116源码fresh普通Coq、489最终假设报告；11既有框架假设、9项公开intrinsic spec视图，人工规格审核pending。干净发布目录核对全部591清单文件、8 CPP/全部源日志及依赖闭包，双san各8808矩阵/1006296word/side、127014公开caller与独立oracle/共错负控复查通过；发布复核不计第二次形式化重放。原件、原反例及精确修复补丁保留。

2026-10-25（洛杉矶）：用户将目标提高为 **40/40**，已启用新的持续工作 goal。设置goal时正式 **30/40**；每1800秒检查真实额度，严格超过95%开始收尾，未完成不得标达成。继续复用现有代码与证明、并行完成候选；完整验收后正常直接提交c-shim-v2。intrinsic-spec边界与完整kernel/helper/caller/fresh门禁标准保持。下文36等旧目标及历史额度保留原时间含义。

2026-10-24（洛杉矶，UTC 2026-10-25 06:27）：用户明确要求继续，当前账户实际额度 **0%**，已归档并解除旧97%收尾锁，恢复推进至少 **36/40**；半小时检查、严格超过95%收尾的规则保留。当前正式 **30/40**，新组件不增加计数。

继续路线：Maxpool全案fresh门禁 → Argmax/QS8Mul/DWCHW实际主核；root新隔离候选x32-transposec参考Arcadia修复，并评估x32-packw旧布局证明的迁移。先证明普通适配器，再绑定主核；旧投影及已生成目标不算整核。详见根PROGRESS。

2026-10-24 matrix worker交付：正式清单 **30/40**，新增[QD8-F32-QC4W GEMM](verification/qcp/verified/qd8-f32-qc4w-gemm-minmax/README.zh-CN.md)，5实际C/1531字段、12策略、1610fresh模块及1567假设报告完整通过，32并发；仅14继承假设，无新公理。NEON原C、RVV NaN修复，45intrinsic spec人工语义审核pending。该worker按其用户最新要求完成已开工矩阵核后停止，不扩展新kernel；这不宣称其他owner的36目标完成。详细续接见包内CONTINUE_PROMPT.zh-CN.md；下文带日期的记录保留历史来源。

2026-10-24 UTC16:38:51 实际额度97%，wind_down_requested=true。按用户条件收尾：停止新增kernel/验证/集成批次，保留现有效有限任务自然完成；仅归档终态，不自动续开下一步。当前正式29/40，目标36未达。恢复需先读 `.build/memory/STATE.json`、quota/state及各owner当前handoff；组件、私有目标和预检不能算整核。

2026-10-24 用户最新规则：目标至少 **36/40**；每 **30 分钟**读取一次当前账户实际额度，任一有效窗口的已使用比例 **严格超过 95%** 时开始收尾：停止新增 kernel/验证批次，保存证明、日志、已验证清单和恢复记录，汇总可交付结果；已启动的有效有限任务优先自然完成。读数不可用时明确记录未知，不编造百分比。此规则覆盖旧的31目标及“取消额度阈值”约定，不能将收尾视为36目标已完成。

最新：正式 **29/40**，目标至少36。其他 worker 新完成 QD8 QC8W IGEMM：6实际C单元/1381字段+15策略、1398普通Coq、1409假设报告；根代理核对全部1444清单文件、60份完整证据、编译和最终记录，不声称重新运行其形式化证明。QD8 QC8W GEMM 的策略绑定修订也核过1493清单文件及1455普通模块、1941报告。两案均保留公开 intrinsic spec 边界，人工规格审核尚待进行。

新增 QU8 VADD-MINMAX 两侧修复版完整收录：31实际C单元/109函数体/3151C字段+15策略、416普通Coq全fresh、3344最终假设报告（含178数学报告），仅14既有框架假设。H `032d7da4af4a14a08de76a01898648c4835c0350eaeb90cf9142337b475c977c`，full `4b35c1cee449c15040f473d90bbb9eb2234f60e427b3ff90106f1855307e2013`。所有raw int32控制参数（含INT_MIN）、int16输出零点、无序clamp、64位长度与N+7 padding保留，固定VLEN128/VLMAX32；原件、补丁、原始UB/数值反例保留。发布复核31CPP/109body及全部冻结输入一致；UBSan与实际16GiB/swap0 ASan各21472公开调用/2665773lane/side，共错负控拒绝。发布身份与有限重放不计第二次形式化证明。

F32 IGEMM 已由其他 worker 完整验证并发布；根代理核对732清单文件、69完整证据文件、687普通Coq成功记录及604最终假设报告，不冒充再次形式化重放。目标仍至少36。

QS8乘法NEON完整528字段已通过，主RVV生成仍未闭合。DWConv已完整验收：11实际C/15普通body/487字段+9策略，179源码fresh普通Coq及501 Print全部通过；H d1060258305f07010f760cd6ad2eb549d0772c33e8e3405572de493f13dec4ef，full 2ad49538f530374493974fcda27d4d25de7ac9f3a2817bb05a933cb9716a8f1e。干净发布11CPP/15body与全部归档身份核对，UBSan及真实16GiB/swap0 ASan各18720case/1544400lane/side；独立oracle与同错负控通过。保留24 intrinsic 公开spec边界，人审/ISA/ABI/终止性未建立。原冻结发行器有清单文件路径错误，保留全部257输入原字节，V2发行器仅修正元数据路径；失败、精确补丁和SHA见ADMISSION_REPAIR.zh-CN.md，不声称第二次形式化重放。
Maxpool NEON442及RVV218非内存/50内存组件均通过，新版NaN数组普通helper70项完整typed+70Print已在私有新目标闭合；原两次Inv缺少VL恒等/hidden Ptr资源的拒绝记录保留。正式stem迁移为已启动有限任务，公开安装/新native/H/fresh整核尚未开始，收尾后不续开。DWCHW完成真实9次FMA顺序数学、171普通helper字段和公开调用入口6项C/4项程序数学；完整VC_Correct含既有maps/output策略，3新ordinary及6Print通过，公开入口双san各128520case/12247200lane/102816alias通过。两侧actual main仍在有效6h生成，未计整核。Argmax v4已修复计数截断和NEON尾部未初始化padding读取；当前两侧native与独立oracle、原2^31计数反例重放、普通reader4、存储caller34和lane-insert caller12通过，新增公开两核调用入口6项真实C/6Print及17源码fresh模块全部通过，任意不同初态的写入位值和索引通过显式地址对应关联；实际入口UBSan与16GiB/swap0 ASan各4320case/197640lane/side通过，共错oracle拒绝。两侧主C证明仍在生成，未计整核。以上局部结果不增加完整计数。

此前25/40里程碑：**25/40**，目标至少36。QU8 RDSUM 两侧大行数修复版完整门禁、归档和干净发布复核通过：37实际C单元/62函数体/1854字段/893普通Coq/2034最终Print（含180数学报告），11既有假设，无新项目公理。H SHA `62f174d2cbd87f37904ac0c8d51dfdb6dbe44077505547f63db41320baae0251`，full SHA `6a9ef4f083644351a0a2ace6a8e94b97937f4e60853a0c19839c94c9efe4d977`。32工作槽配置、16GiB普通/32GiB重型，978冻结输入身份核对；完整64位行数、stride零及输入/zero只读别名域保留，VLEN128/VLMAX32和非回绕内存契约下部分正确性。发布复核37CPP/62body，UBSan与实际16GiB/swap0 ASan各11664case/269730lane/side，独立列求和与helper oracle、两侧同错负控均通过。原件、逐侧patch、反例和更强intrinsic C-body证据保留。QUADD仍完整重放中，Argmax/Maxpool/DWConv/QS8mul组件不计数。

上一里程碑（24/40）的记录：，目标至少31。F32→F16 `compatible-exact-decimal-literals` 完整通过并收录：56实际C单元/119函数体/2672 C字段，13策略组36字段，87BASE+269本案+17typed/audit+Final=374普通Coq全fresh，2708最终Print仅14既有假设，完整463外部对象/373fresh源加载路径已核。H SHA `7bf0317bbc4edb23fd7786f6b8de8adb5f885e5009a5200f3906bb8a3ba62a0d`，full SHA `5ddd4a92b774abefa1f5c340f48ed1d26e3bee200fd8a479fd3e8df673712855`；369源输入全匹配。仅两种浮点literal每侧各两处改成编译器/Coq确认的精确同值十进制，非数值bug修复，不称原token不变。公开全部FP32、正64位N、输入N+3/ushort输出N且仅2字节对齐、nullable params、half输出位相等；固定VLEN128/e32m8/e16m4/VLMAX32、VL=min(AVL,32)，不宣称IEEE16抽象规范全域精化/ISA/ABI/终止性。原48intrinsics/51providers精确定义台账保留，既有C-body完整边界未因新规则跳过。干净56 CPP/119body/全部源日志归档核对，83递归native输入（8共享头按原相对路径拷贝）零漂移，UBSan与实际16GiB/swap0 ASan各2304case/295775lane/side，独立GCC12 _Float16 RNE oracle与共错负控通过；发布复核不计第二次证明。root继续ArgmaxPool，agent继续DWConv/Maxpool/QS8mul；QU8 RDSUM与QUADD仍live，不能在旧21目标处结束。


此前：正式 **23/40**，目标至少31。原始 F32 VSQRT 在公开 intrinsic spec 边界下完整通过并直接收录：9实际C单元/262 C字段/15 ordinary bodies，7项spec-only intrinsics明确不计C-body信用；11策略组/28字段、210次普通Coq（87BASE+105本案+17typed/audit+Final）、290最终Print；仅14既有框架假设。H SHA `5ffef5c6e546ebe45056ceddd29118105353090c43670a5e570f6da36d076f45`，full SHA `6c3dd2608ef012636058d293c94b10927bd6c1e005c089ad63982a58546eb758`；463外部对象与209fresh源对象身份核对。全FP32、正uint64 byte-batch可整除4、输入padding3、输出恰N、unused params可NULL、全部合法VL；RNE/DN0/FZ0/FIZ0/AH0，数值相等或同为NaN。7spec exact合同/FQ定义/源版本台账公开，人审及正式ISA对应pending。干净9CPP/15body/源日志身份及UBSan和实际16GiB/swap0 ASan，各49536case/3219840lane/side/32VL模式、独立sqrtl oracle和共错负控通过。初次隔离native副本缺少相对共享头的环境失败已保留，按固定hash复制共享依赖后重跑通过，不改proof身份。FP16另一路完整56/2672/374门禁刚通过，root继续准入；QU8 RDSUM和QUADD仍live，neon agent新接独占f32-dwconv-minmax。


此前：正式清单 **22/40**，目标至少31。fetch 后接入其他 worker 的 `qd8-f32-qc8w-gemm-minmax`（3c334f710）与 `f32-gemm-minmax`（a8baa14c2）；两案全部1112/1491清单文件哈希、完整通过标记和注册表status哈希已核对，人工intrinsic规格审核仍pending，不声称本机重新运行它们的证明。新增 QS8 VADD-MINMAX 修复版：27实际C单元/103函数体/4300 C字段+15策略、492普通Coq全fresh、4496最终假设报告。full SHA `b9c6fda5551c663164d7c5b89956357e533fde1abd8d32008f3542889b35a93e`，H `cd3e965b1bc42daeda1935495b995d450cbfee1cb5d209b0310888d1863bc027`。原件/补丁/反例完整保存；45intrinsics/38模型定义公开，保持既有C-body证明边界。干净发布核对27 CPP/103body/全部源与归档，UBSan和实际16GiB/swap0 ASan各21472次公开caller/2665773lane/side、共同错误负控拒绝；发布检查不计第二次形式化证明。


此前：QS8 RDSUM 两侧修复版完整验收并收录，当前 **19/40**，目标至少31。35实际C单元/60函数体/1590 C字段，685本地源+18接口/假设/最终模块共703普通Coq，1771项Print含181数学支持，仅11个既有框架假设。完整SHA `2e2a0ec244b319c124397ae785513c9e523a61e6395999b66b9165f32b1864cd`。保留全部正uint64行数、同一RDMap中的stride0/行重叠/zero别名，输入每行channels+7、zero条件、非回绕地址footprint与可写输出分离；固定VLEN128/VLMAX32，不宣称真实ISA对应或终止性。clean发布再次核35 CPP/60body/703源及全归档，34实际C单元独立UBSan/实际16GiB cgroup ASan均11664case/269730lane/side，helper101376case/1579776lane，wrong-one/both均拒绝；发布审计不计第二次证明。


上一项收录：QS8-VLRELU 两侧取负 UB 修复版已完成全64位统一验收，收录 `verification/qcp/verified/qs8-vlrelu/`；当时有效 **18/40**，包含 U8 clamp。34实际C单元/85函数体/2192 C字段+15策略，296依赖源+最终门禁共297次普通Coq，2207项最终假设报告仅既有14项；完整SHA `67e148d97ca3901fe4a6e265c1110bf2fb36df5de629b039e6433b7c684e870d`。公开四个raw int32参数和64位长度域均保留，原四项INT32_MIN反例、补丁与旧32位失效记录归档。干净发布目录重核34 CPP/85函数体和全部源日志，31实际字段provider及公开caller的ASan/UBSan各17940用例、7187700 lane/side，共错负控拒绝；发布检查不计第二次形式化证明。继续 QS8/QU8 加法、FP16 转换及多行归约。

类型宽度更正已完成：旧 QS8 转换准入因 QCP UInt32/native64 不符而撤回；本次使用明确 unsigned64 类型，八个实际 sizeof C 函数及完整26单元/1672 C字段+15策略字段重新生成，240次 fresh 普通 Coq、1687项最终假设审计全部通过，不复用旧32位 C 对象、不缩长度域。已恢复到 `verification/qcp/verified/qs8-vcvt/`。原失效记录与本次 resolution 均保留；QLR 的相关64位重验也已完成，ADD 继续推进。这一段记录恢复QS8转换时的17/40。

先读本文件，再读 [PROGRESS.md](PROGRESS.md) 和 [.build/memory/STATE.json](.build/memory/STATE.json)。
机器状态由 `python3 .build/memory/checkpoint.py` 刷新；重要变化另加 `--event '简单说明'`。
旧状态保留在 `.build/memory/history/`，事件只追加到 `.build/memory/events.jsonl`。
`.build/` 是本机私有工作记录，不是已发布证明；源码另有 `.build/private-source-backups/`。

## 用户当前要求

- 2026-10-23 最新统一边界：intrinsic 无需另建或证明 C implementation；可直接用与原始 NEON/RVV spec 对应的公开合同和 Coq 定义，逐项保留官方版本/配置/语义台账供最终人工审核。实际 kernel/循环/内存/普通 helper/caller 仍完整证明，不增未证Coq公理，不隐去spec信任边界；详见 `verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md`。旧必选intrinsic-body规则被覆盖，live/frozen/已发布证据保持原状。

- 用户最新将目标提高为：从当前 29/40 推进到至少 **36 个完整 verified kernel**。这取代原先的21及31目标；不可在旧目标处宣称本轮完成。从简单到难，积极并行推进。
- 用户已提高后续资源：新批次默认 **32 并发，普通任务 16 GiB、重型任务 32 GiB**；长生成最多 6 小时，通常每个证明 2 小时、重型证明 4 小时。按整机可用内存协调，现有 live/frozen 批次保留原设置和记录。
- 可主动修改实现，参考 Frama-C 与 Arcadia-y 修复，无需再批准；保留原因、原始身份、补丁和相关反例，证明修复后的等价性。
- 完整验收后先 fetch，直接提交并 push 到 **`c-shim-v2` 的 `verification/qcp/verified/`**；不开 PR，不 force push。
- 大进展用简单语句更新 PROGRESS 和已验证列表。零件/数学/条件 caller 通过都不能单独增加 kernel 数。
- 保留全部相关源/目标/日志身份，不引入 axiom/Admitted，不暗中限制 NaN/Inf/零、移除内存条件或放松观察关系。

## 工作区和分工

- 我们的主工作树：`/srv/home/yuechunsun/tools/qcp-simple-kernels`，分支 `codex/worker-simple-kernels`。
- 专用发布工作树：`/srv/home/yuechunsun/tools/qcp-simple-integration`。fetch 后核对实际 HEAD，保留别人的新增提交。
- `/srv/home/yuechunsun/tools/lean` 和 GEMM/ENV 其他工作树保持原样。
- `neon_kernel_resume`：f32-vrndne 已交付并正式收录，F16和sqrt均已交付，DWConv已交付并完整发布，现独占Argmax两侧主C/程序模型；root完成尾部修复、普通helper、数学观察与统一准入。
- `minmax_repair_finish`：qs8-vcvt 全案已交付；QS8 加法已交付；QU8加法完整交付后冻结，独占 f32-maxpool。
- `rvv_kernel_resume`：完成两项 rsum 后，已交付 qs8-rdsum、qu8-rdsum（root重放），现独占 qs8-vmul-minmax-fp32 并开展 f32-dwconv2d-chw；qu8-f32-vcvt 已完整发布。
- root：qs8-vcvt 与 qs8-vlrelu 全64位验收已完成；帮助独立数学义务，统一归档、发布、progress/memory。
- worker-server 已拥有 u8-clamp 整案和 `u8-tail-memory`，只读复用并通过 PR1 协调，禁止重复领取。

## 证据和恢复

当前正式数量以 [verified/manifest.json](verification/qcp/verified/manifest.json) 为准；先核对它引用的 status 哈希。
2026-10-24 当前已验收 **29/40**；此前 VLReLU 直接发布为 `bf106ba73e3c0b417c1d0532d13c32cd4108ceb0`（VLReLU）。

已通过的全案证据（保持源和历史记录不变）：

- VCMUL 已通过：`verification/qcp/verified/f32-vcmul/.build/full-_e5udkje`，原始实现，旧批次 jobs4；11 C 单元/629 字段，123 本地源 + 最终门禁。完整 661 项 Assumptions 已归档。
- FMin 已通过：`verification/qcp/verified/f32-vmin/.build/full-xlbp0zhc`，RVV 修复版，jobs16；12 C 单元/1188 字段，140 本地源 + 最终门禁。1216 项 Assumptions 已归档。
- FMax 已通过：`verification/qcp/verified/f32-vmax/.build/full-wghluc3i`，RVV 修复版，jobs16；12 C 单元/1188 字段，146 本地源 + 最终门禁。1216 项 Assumptions 已归档。

恢复时检查真实进程和 run/status.json，不因历史 `passed`、单项 Qed 或模块比例推断全案完成；超时/环境错误与反例分开。
已配置工具 PATH：`.build/simple-kernels-bootstrap/bin:/tmp/qcp-coq820-install/bin:$PATH`；Coq 配置 `.build/simple-kernels-bootstrap/coq-flags.json`。
VADD 已完成的独立依赖重放：`verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq`。
所有编译在私有 `.build/.../jobs/`，不写共享库、工具链或其他 worker 的缓存。

QS8 完整验收已通过并收录 verified，修复了原 NEON 的 INT32_MIN 求负 UB。S8 修复无序 bounds 的 bulk/tail 顺序差异，完整验收已通过并收录 verified。QS8 的表达式 short cast 存在已记录 QCP 窄化丢失问题，真实 narrow callee 模块化实现已通过；不能改 wrap 模型或加和差范围前提。具体组件/run 读最新 STATE。

全案真正通过后：先由 root 运行该 case `proof/record_status.py`，检查最终全部 Print Assumptions；归档完整目标/CPP/日志/组件状态。
然后执行 `proof/audit_relocation.py`，移动到 verified 后重新核对 live CPP/已编译源身份并跑 native。
`.build/prepare_direct_case.py <kernel>` 可在已 fetch 且干净的发布工作树准备复制/身份/native/清单更新；它不会 commit/push。
S8/QS8 使用新的 `.build/prepare_integer_publication.py <kernel>`；它另存原始证书，核对完整证明身份，并做当前源码闭包的有限 UBSan 回归。发布审计不算第二次形式化证明。
审查具体结果，再普通 commit/push，确认远端 SHA，更新 PROGRESS 和 checkpoint。

Arcadia 只读来源：`refs/remotes/arcadia-y/verification`，固定 `4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca`。
它的 `verification/REPAIRS.md` 和 Lean 规格可供参考；其 S8Clamp Entry 有 ordered 条件，不得把该结论解释为覆盖无序 bounds 的 QCP 证明。

QU8→FP32 已完成；其全 int32 零点域保留，没有沿用旧 Frama-C 排除 `INT32_MIN` 的条件。NEON 求负 UB 已修复，RVV 逗号 for-step 为显式兼容改写；二者的原件、独立／组合补丁及原反例或工具缺口证据全部保留。

QS8 全案证据：`verification/qcp/verified/qs8-f32-vcvt/.build/full-adz1c3m4`，26 实际 C 单元/1337 字段、49 函数体、30 策略字段、631 普通 Coq 模块；1367 项最终假设报告已核为既有 14 项继承假设。完整证书 SHA256 `e4413308b1b41def5a57ce37f819be15164332b7253b3373451af6b021ef36ac`。修复、原反例、首次辅助模板失败与修复历史均保留。

S8 全案证据：`verification/qcp/verified/s8-vclamp/.build/full-r8b58urd`，12 实际 C 单元/2060 字段、41 函数体、16 策略字段、249 普通 Coq 模块；2076 项最终假设报告已核对通过。完整证书 SHA256 `45f3dd5b2088152a2f0f8d666f212025df282cfb56e369e309867f67c44e9124`。两侧原件、RVV 修复补丁及原始 6420 个有限回归差异保留。

上一轮 10+ 目标已达成；本轮已收到继续到至少 21/40 的指令。后续继续沿用 16 并发/每进程16GiB、有限任务时限、主动 repair、全案通过后 fetch/直接提交 c-shim-v2 的约定。

本轮直接发布提交：QS8 `598bf3976f1a4f20dd36c536b851706026ce6c75`；S8 `3d40082c1aeae15894d0926929eb793cbb5b5768`。两案迁移与发布后的源码/CPP 身份审计通过，并分别完成有限 UBSan 回归；这些发布审计不算第二次形式化证明。公有 manifest 的全部源和原始证明日志均已显式入 Git，不含 `.build` 或 `.vo`。上一轮两案已完成；新一轮已领取上述十项非 GEMM 路径，按实际难度调整推进顺序，不增加未通过的计数。

本轮恢复策略：先读 `.build/memory/GOAL_POLICY.json` 与最新 STATE。新目标至少21，默认16并发/每进程16GiB，核对可用内存后可同时运行多个批次；旧prompt的全局32与必须PR要求均由最新用户政策替代。原先qu8只读评估已转为实际任务；不能继续引用上一轮“无活动任务”的历史状态。

QU8→FP32 全案证据：`verification/qcp/verified/qu8-f32-vcvt/.build/full-kb8mmn44`；31 个实际 C 单元、1476 个 C 字段、61 个函数体，10 组策略／30 字段；646 个本地源加最终门禁共647次普通Coq，1506 项最终假设核对均通过，仍为既有14项继承假设。完整证书 SHA256 `4d07d60a3b0b43357ac87e2bea08baada92c2313cb4cfcbbea089c8ce07643d4`。发布身份审计再次核对全部31个CPP、647个编译源和完整归档，62个递归C输入的UBSan回归通过；发布审计不是第二次形式化证明。

当前 RSUM 分工：root 的 QS8 已恢复真正126字段的完整 NEON 接口，并额外用 fully-qualified Module 别名及126项 Print 实际检查；完整 RVV46 也已通过。此前汇总脚本把117字段的部分模块写入完整模块文件，最终门禁真实拒绝，错误状态/源码/失败运行均已明确保留并撤销，不增加计数。修复后重新执行全部 C/Coq 门禁。QU8 RSUM由rvv subagent继续。组件不计verified；目标21尚未完成。

QU8→FP32 在无私有旧缓存的已配置环境重放前，先运行 `python3 verification/qcp/verified/qu8-f32-vcvt/proof/restore_dependency_receipts.py`。它只按冻结审计中的SHA恢复一份历史UnsignedModel源码／普通编译日志，不恢复.vo，不重放旧证明；随后完整runner仍重新生成并编译所有当前目标。原发布证书保存在pre-replay-support历史中，全案证明本身不变。

QS8→QS8 转换修复版本次正式收录 `verification/qcp/verified/qs8-vcvt/`：25实际C单元/1664字段/64函数体，5策略组15字段，237实际依赖源+Final共238次普通Coq，1679项最终报告只含既有14项继承假设。全案SHA256 `e89ddf39a1d24fa195d990d51428ebd008efc1822e063d0b5a8722f02f1c62f9`。修复INT32_MIN求负和RVV先倍增32位溢出；原件、精确零fuzz补丁、原语义反例都保留。旧ByValue尾部适配产生的重复内存前件已拒绝，新borrowed-copy实际C/13VC和6数组桥均 checked，未把不可满足前件当通过。发布另在干净工作树独立编译真实字段C闭包，两个前端各27496次公开调用/1998725输出元素，双侧共错的临时scalar负控由独立128bit oracle拒绝。发布审计不是第二次形式化证明。

Root 新建 qs8-vlrelu 独立命名空间 Qs8Lrelu：原两侧正/负 multiplier 的4项INT32_MIN UB反例已复现，保留全4个raw int32参数域；GNU精确补丁修复两侧取负。当前仅源码蓝图、数学/有限native阶段，尚无完整kernel证明，不计数。参考157个具体helper源码均须重新生成目标、从源编译；未复用旧对象或验收信用。

QU8-RSUM 本次收录 `verification/qcp/verified/qu8-rsum/`：21实际C单元/890字段/34函数体、2策略字段、257次普通Coq、892项最终Print、既有14项继承假设及463个外部依赖身份核对通过。全案SHA256 `70ec8101e4d27b20f05796657397970b0a2ec5d50d9d926d4d58186bf113d043`。具体全域/内存与repair边界见case中文README；当前NEON语法兼容版，不把parser兼容失败虚构成语义反例。独立clean publication对21实际单元/35递归输入再做990用例/每侧1075860 lane的16GiB UBSan检查，并将两侧首输出同时翻转，确认两侧仍相同而独立scalar oracle拒绝。发布重查不算第二次形式证明，旧路径归档脚本失败和旧writer均保留。

QS8-RSUM 本次收录 `verification/qcp/verified/qs8-rsum/`：21实际C单元/890字段/34函数体、2策略字段、256次普通Coq、892项最终Print、既有14项继承假设及463个外部依赖身份核对通过。全案SHA256 `aae7d4ade922424b268900966a775c9a271eba890e6206ec8e2699cf7f585362`。具体全域/内存与repair边界见case中文README；当前两侧模32溢出修复版，不把parser兼容失败虚构成语义反例。独立clean publication对21实际单元/35递归输入再做990用例/每侧1075860 lane的16GiB UBSan检查，并将两侧首输出同时翻转，确认两侧仍相同而独立scalar oracle拒绝。发布重查不算第二次形式证明，旧路径归档脚本失败和旧writer均保留。

F32-VRNDNE 本次收录 `verification/qcp/verified/f32-vrndne/`：28实际C单元/1560字段/71body，10组策略30字段，231本地源+Final共232次普通Coq，1590项最终假设仅既有14项。原始实现/全FP32/RNE/3个float padding/固定VLEN128 e32m8 VLMAX32/nullable且unused params，观察关系为数值相等或两侧均NaN；不额外声称ISA/ABI、终止性或对抽象RNE规格的全域精化。全案SHA `84a792232793d615668c55b909446f8c38151663e29f83c88ad4ce15d20cc9a1`。干净目录再核28 CPP/232 compiled源/71body，52原生输入重编，UBSan16GiB地址空间与ASan真实16GiB cgroup各6300用例/378600元素；双侧同错仍相等而独立nearbyintf oracle拒绝。旧native无可核16GiB记录，补充证据明确独立。最初ASan负控因early return泄漏未过，保留失败；只在私有负控harness加free/flush后实际通过，没有改冻结程序或证明。

U8-vclamp 由独立worker完成，root核对458份实际普通编译源、archive/log身份、13实时CPP/17 RVV helper绑定及当前锁定输入，重做迁移检查与封存。原版939C字段，可选controller版本973C字段，共31策略字段，不相加、不重复计kernel。该case明确报告16个既有框架依赖（较此前14个多LE_dot_field_congr和addr_of_arrow_field，均来自原QCP地址/field模型），不是新加项目axiom。接口采用显式unsignedlonglong size_t。当前15项有效旧结果+新U8共16；旧QS8转换是撤回项，不可重复算成17。

2026-10-23 最新收口：有效18/40、目标至少31。QS8 RDSUM full-x8f7acjj已35当前实际C生成0，32并发从源重编中，H冻结不可改。FP32→FP16 valid115 RVV的5memory全ordinary/typed/Print通过，root两文件已冻结交回neon agent；memory-closure-k_yacv1w不是整案信用。QU8 RDSUM root工具真实prepare-only37TU/1854VC/62body，ASan36TU及13字段真实sizeof/unsigned64投影通过；unsigned域+8padding/zero40正确记录，25intrinsic ledger和两数学根ordinary0；两侧完整组件齐全前不冻结不计数。
