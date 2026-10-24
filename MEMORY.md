# QCP 工作记忆入口

最新：QS8 RDSUM 两侧修复版完整验收并收录，当前 **19/40**，目标至少31。35实际C单元/60函数体/1590 C字段，685本地源+18接口/假设/最终模块共703普通Coq，1771项Print含181数学支持，仅11个既有框架假设。完整SHA `2e2a0ec244b319c124397ae785513c9e523a61e6395999b66b9165f32b1864cd`。保留全部正uint64行数、同一RDMap中的stride0/行重叠/zero别名，输入每行channels+7、zero条件、非回绕地址footprint与可写输出分离；固定VLEN128/VLMAX32，不宣称真实ISA对应或终止性。clean发布再次核35 CPP/60body/703源及全归档，34实际C单元独立UBSan/实际16GiB cgroup ASan均11664case/269730lane/side，helper101376case/1579776lane，wrong-one/both均拒绝；发布审计不计第二次证明。


上一项收录：QS8-VLRELU 两侧取负 UB 修复版已完成全64位统一验收，收录 `verification/qcp/verified/qs8-vlrelu/`；当时有效 **18/40**，包含 U8 clamp。34实际C单元/85函数体/2192 C字段+15策略，296依赖源+最终门禁共297次普通Coq，2207项最终假设报告仅既有14项；完整SHA `67e148d97ca3901fe4a6e265c1110bf2fb36df5de629b039e6433b7c684e870d`。公开四个raw int32参数和64位长度域均保留，原四项INT32_MIN反例、补丁与旧32位失效记录归档。干净发布目录重核34 CPP/85函数体和全部源日志，31实际字段provider及公开caller的ASan/UBSan各17940用例、7187700 lane/side，共错负控拒绝；发布检查不计第二次形式化证明。继续 QS8/QU8 加法、FP16 转换及多行归约。

类型宽度更正已完成：旧 QS8 转换准入因 QCP UInt32/native64 不符而撤回；本次使用明确 unsigned64 类型，八个实际 sizeof C 函数及完整26单元/1672 C字段+15策略字段重新生成，240次 fresh 普通 Coq、1687项最终假设审计全部通过，不复用旧32位 C 对象、不缩长度域。已恢复到 `verification/qcp/verified/qs8-vcvt/`。原失效记录与本次 resolution 均保留；QLR 的相关64位重验也已完成，ADD 继续推进。这一段记录恢复QS8转换时的17/40。

先读本文件，再读 [PROGRESS.md](PROGRESS.md) 和 [.build/memory/STATE.json](.build/memory/STATE.json)。
机器状态由 `python3 .build/memory/checkpoint.py` 刷新；重要变化另加 `--event '简单说明'`。
旧状态保留在 `.build/memory/history/`，事件只追加到 `.build/memory/events.jsonl`。
`.build/` 是本机私有工作记录，不是已发布证明；源码另有 `.build/private-source-backups/`。

## 用户当前要求

- 2026-10-23 最新统一边界：intrinsic 无需另建或证明 C implementation；可直接用与原始 NEON/RVV spec 对应的公开合同和 Coq 定义，逐项保留官方版本/配置/语义台账供最终人工审核。实际 kernel/循环/内存/普通 helper/caller 仍完整证明，不增未证Coq公理，不隐去spec信任边界；详见 `verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md`。旧必选intrinsic-body规则被覆盖，live/frozen/已发布证据保持原状。

- 用户最新将目标提高为：从当前 19/40 推进到至少 **31 个完整 verified kernel**。这取代原先的至少 21 个目标；不可在 21 个时宣称本轮目标完成。从简单到难，积极并行推进。
- 用户已提高后续资源：新批次默认 **32 并发，普通任务 16 GiB、重型任务 32 GiB**；长生成最多 6 小时，通常每个证明 2 小时、重型证明 4 小时。按整机可用内存协调，现有 live/frozen 批次保留原设置和记录。
- 可主动修改实现，参考 Frama-C 与 Arcadia-y 修复，无需再批准；保留原因、原始身份、补丁和相关反例，证明修复后的等价性。
- 完整验收后先 fetch，直接提交并 push 到 **`c-shim-v2` 的 `verification/qcp/verified/`**；不开 PR，不 force push。
- 大进展用简单语句更新 PROGRESS 和已验证列表。零件/数学/条件 caller 通过都不能单独增加 kernel 数。
- 保留全部相关源/目标/日志身份，不引入 axiom/Admitted，不暗中限制 NaN/Inf/零、移除内存条件或放松观察关系。

## 工作区和分工

- 我们的主工作树：`/srv/home/yuechunsun/tools/qcp-simple-kernels`，分支 `codex/worker-simple-kernels`。
- 专用发布工作树：`/srv/home/yuechunsun/tools/qcp-simple-integration`。fetch 后核对实际 HEAD，保留别人的新增提交。
- `/srv/home/yuechunsun/tools/lean` 和 GEMM/ENV 其他工作树保持原样。
- `neon_kernel_resume`：f32-vrndne 已交付并正式收录，独占 f32-f16-vcvt。
- `minmax_repair_finish`：qs8-vcvt 全案已交付；独占后续 qs8-vadd-minmax、qu8-vadd-minmax。
- `rvv_kernel_resume`：完成两项 rsum 后，独占 qs8-rdsum、qu8-rdsum；qu8-f32-vcvt 已完整发布。
- root：qs8-vcvt 与 qs8-vlrelu 全64位验收已完成；帮助独立数学义务，统一归档、发布、progress/memory。
- worker-server 已拥有 u8-clamp 整案和 `u8-tail-memory`，只读复用并通过 PR1 协调，禁止重复领取。

## 证据和恢复

当前正式数量以 [verified/manifest.json](verification/qcp/verified/manifest.json) 为准；先核对它引用的 status 哈希。
2026-10-23 当前已验收 **18/40**；此前 VLReLU 直接发布为 `bf106ba73e3c0b417c1d0532d13c32cd4108ceb0`（VLReLU）。

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
