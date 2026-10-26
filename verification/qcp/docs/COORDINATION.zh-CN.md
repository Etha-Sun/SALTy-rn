<!-- CURRENT_VERIFIED_40_f32_conv_hwc2chw -->
当前完整已验证 **40/40**，目标 **40/40**。新增 f32-conv-hwc2chw：13实际C单元/1748实际C字段/19普通函数体/1429模块源码fresh；3514最终假设报告。修复/兼容版 repaired-neon219-rvv162-ordinary-pixel-helpers 在公开单输出模式 caller 契约下的 C-shim 模块化部分正确性及 NEON/RVV 完整输出观察等价性。13 个实际 C 单元、1748 条 C 义务、19 个普通函数体及4条共用策略均由统一 fresh Coq 门禁覆盖；原版文件、NaN 反例、精确正反补丁及兼容调整单独保留。RVV 固定 VLEN=128、SEW=32、LMUL=1、VLMAX=4、XLEN=64、小端，覆盖公开模型允许的全部合法VL选择；RNE、关闭 default-NaN/flush/traps，异常标志不观察。允许全部 binary32 值、任意给定 zero-row 内容、只读 input/zero/weights/params 的完整或部分别名；输出采用公开逻辑 CHW 窗口及帧条件，保留裁剪尾行和尾通道的实际最后写入效果、任意初始 Some/None 与精确未写入帧。每个累加器保持原27次融合运算次序；公开观察为数值相等或双方NaN，允许NaN payload及±0位模式差异。32项原始 intrinsic-spec 视图、合同、Coq定义和官方来源公开供最终人工审核；不把该边界、有限native/SDK或签发审计称为真实ISA/物理ABI/编译器精化或整程序终止性证明。一个完整 kernel，不将组件重复计数；原始未修复RVV不继承修复版结论。

签发包保持原字节；发布副本按原proof-run做只读issuer审查，额外UBSan/ASan各615600次公开mode调用回归仅在私有副本执行，不是第二次形式证明。人工intrinsic规范审阅pending；未声称ISA、ABI、编译器精化或终止性。证书SHA a15e74eb68f322ffcd18e79289f3ae6e0996fd6c172fa9d4b9e7f4c688d40394。登记日期2026-10-26。

以下保留先前阶段记录。

<!-- CURRENT_VERIFIED_39_f32_argmaxpool -->
当前完整已验证 **39/40**，目标 **40/40**。新增 f32-argmaxpool：10实际C单元/2362实际C字段/14普通函数体/647模块源码fresh；4950最终假设报告。修复后的实际 NEON/RVV 主核、普通读表/读旧值/块更新/适配器与顺序公开 caller，在 spec.c 的 app_arguments/app_valid 和显式所有权条件下给出 C-shim 部分正确性与结果等价。XLEN64、小端；RVV 固定 VLEN128/SEW32/LMUL8/VLMAX32、vstart=0，覆盖该配置全部合法 VL 选择。全部 binary32，写入结果按精确浮点位和 u32 索引观察，保留 NaN payload、符号零、严格大于更新、并列索引及索引模 2^32。共享只读指针表/输入允许内部别名；每行 channels+3 可读 padding 值任意；表内指针值零在无符号偏移后窗口合法时允许。输出/索引各自可选值所有权允许初值 None，未写帧和跨像素回绕/重复写按模型保留。原 size_t→int 计数问题与 NEON 有效尾读修复、原件、精确 patch 和 2^31 有效表反例保留。30 个原生 intrinsic 规范视图/28 个名称仅在所列规格边界使用，人工语义审阅 pending；普通 C helper 不豁免实际函数体证明。未证明真实 ISA、物理 ABI、编译器精化、浮点异常标志/陷阱或终止性。

签发包保持原字节；发布副本按原proof-run做只读issuer审查，额外native/public回归仅在私有副本执行，不是第二次形式证明。人工intrinsic规范审阅pending；未声称ISA、ABI、编译器精化或终止性。证书SHA 095149983772a0b16a541f71d4ced2c8ad457ee54ddaf34f0c4325aacee6a49a。登记日期2026-10-26。

以下保留先前阶段记录。

<!-- CURRENT_VERIFIED_38_f32_raddstoreexpminusmax -->
当前完整已验证 **38/40**，目标 **40/40**。新增 f32-raddstoreexpminusmax：4实际C单元/502实际C字段/6普通函数体/604模块源码fresh；504最终假设报告。修复后的实际 NEON/RVV 主核、全部普通 C helper 与顺序公开 caller，在 spec.c 的 em_valid 和显式所有权条件下给出 C-shim 部分正确性与结果等价。64 位小端、RNE、全部 binary32（NaN/Inf/正负零/subnormal）；观察所写输出与最终 sum 为数值相等或双方均 NaN，不观察 NaN payload。比较既定多项式/位操作算法，未证明数学 exp 近似误差。RVV 固定 VLEN128/SEW32/LMUL4/VLMAX16，覆盖全部合法 VL；运行时 AVL4 重建 NEON 的有序求和树，不使用浮点加法结合律。正的字节 batch 是 4 的倍数，输入含 3 个可读 padding lane；input/max 共用只读图且可内部别名，output/sum 共用一个可变图且允许别名和任意 None/Some 初值，最后写入获胜并保留未写帧；只读图与可变图分离，未使用 params 可为 NULL。原求和顺序反例、原件、修复说明及精确 patch 保留。40 个原生 intrinsic 形式视图的官方来源和精确模型单列，人工语义审阅 pending；普通 helper 仍证明实际 C 函数体。未证明真实 ISA、物理 ABI、编译器精化、浮点异常标志/陷阱或终止性。

签发包保持原字节；发布副本按原proof-run做只读issuer审查，额外native/public回归仅在私有副本执行，不是第二次形式证明。人工intrinsic规范审阅pending；未声称ISA、ABI、编译器精化或终止性。证书SHA 850bafddddbcffaffc7f51a3af3a7ac762e2195769b4e936d0ed6b448a010f30。登记日期2026-10-26。

以下保留先前阶段记录。

<!-- CURRENT_VERIFIED37_DWCHW_20261025 -->
当前完整已验证 **37/40**，目标 **40/40**。新增 f32-dwconv2d-chw：13实际C单元/1167C义务/11策略字段/37普通函数体/1232own+18final=1250源码fresh Coq/1381最终Print；14既有假设、0新增项目公理，36原生intrinsic spec视图人工审核pending。正H/N、padding_top1、全binary32与无序clamp、共享RO/末行写入别名、固定RVV128/e32m2/VLMAX8及全部合法VL边界详见公开spec。written值数值相等或同为NaN，各自未写option frame保持原值。本聊天24+外部8+基线5。

H1所有本案模块通过但最终报告11个嵌套路径错误，失败完整保留；仅修报告工具后H2重新全部源码fresh通过，不借组件VO。发布副本13CPP/37body、全部档案/目标/日志/来源与四组native各128520例/12247200lane通过。冻结旧审查器的绝对策略来源路径比较由独立迁移入口修正，证明与冻结输入不动；详见全局DWCHW-PUBLICATION-AUDIT说明及审核索引。剩Argmax/Exp/HWC继续，组件不计核。

以下保留先前阶段记录。

<!-- CURRENT_VERIFIED36_QS8_MUL_20261025 -->
当前完整已验证 **36/40**，目标 **40/40**。新增 qs8-vmul-minmax-fp32：24个实际C单元、871条C义务、7策略字段、40个普通函数体、984个源码fresh Coq模块、1042命令全0、878最终Print；14项继承假设、0新增项目公理。57个原生intrinsic spec视图人工审核仍pending。本聊天23+外部8+基线5；外部SPMM及矩阵成果保留作者归属。剩余DWCHW、Argmax、Exp、HWC2CHW继续；组件不计新增核。

QS8原件、实际反例、完整47目标精确补丁（main+46支持文件）保留，原NEON未修改。发布副本24单元CPP/归档身份和独立签发dry-run通过；私有副本数组/字段视图的UBSan及实16GiB ASan各278016例/12804556lane/side、独立oracle与单错/共错负控全通过。有限复查不算第二次形式证明。

以下保留先前阶段记录。

<!-- CURRENT_VERIFIED35_PACKW_20261025 -->
当前完整已验证 **35/40**，目标 **40/40**。新增 x32-packw-gemm-goi：13个实际C单元、312条C义务、14个普通函数体、295次源码fresh Coq编译、325命令全0、444最终假设报告；12个原生intrinsic视图人工审核仍pending。SPMM@2239bcf90属于外部贡献。本聊天22+外部8+原有5。QS8/DW全门禁继续，Argmax/Exp/HWC仍为candidate。

以下保留历史记录。

# 双服务器协作约定

2026-10-23 最新收录：QS8 RDSUM 两侧修复版，35实际C单元/1590 C字段/703普通Coq/1771假设报告及发布身份与双sanitizer独立oracle复核通过，当前19/40，目标至少31。新intrinsic规则不改写本案已经冻结的更强C-body证据。

2026-10-23 用户统一更新：intrinsic 可直接采用与原始 NEON/RVV 规范对应的 spec，不要求另建或证明 C implementation。逐项公开官方版本、配置、合同与 Coq 定义供最终审核；实际 kernel、循环、内存和非 intrinsic helper/caller 仍须完整证明。新验收边界详见 [Intrinsic 规范边界](INTRINSIC-SPEC-POLICY.zh-CN.md)，覆盖下文旧的所有 intrinsic 必须 body-checked 条款。已发布和已冻结证据保留原样。

2026-10-23 最新：QS8激活两侧修复版完整64位门禁通过并收录，当前有效18/40（包含U8 clamp）。34实际C单元/2192 C字段+15策略/297普通Coq/2207最终假设报告；四个raw int32参数与64位长度域保留，原件/四项INT32_MIN反例/精确补丁/类型失效历史均归档。QS8/QU8加法、FP16和RDSUM仍由原owner并行推进，组件不增加计数。

2026-10-23 当前更正：U8原始整案已收录；QS8转换的旧 UInt32/native64 错误准入撤回后，现已完成明确unsigned64类型的全案fresh重新验证并恢复verified。八个实际sizeof字段进入26单元/1672 C字段+15策略的统一门禁，240次普通Coq、1687最终Print全部通过，不复用旧32位C对象。恢复转换时有效17/40；先fetch最新清单，禁止用其他工作树的旧32位证书覆盖新验收。QLR现也完成相同64位完整验收，ADD继续推进，不缩域。

用户最新目标为至少31个完整verified kernel。新批次默认32并发、普通任务16GiB/重型32GiB，长生成最多6小时，证明按复杂度设置有限时限，实际并行批次按服务器可用资源调度；修复主动参考Frama-C和Arcadia-y，保留原因/补丁/反例，无需等待批准。工作恢复入口为本worker的MEMORY.md和私有checkpoint；只在完整验收后更新正式数量。

2026-10-23 用户更新：完整验证通过后先 fetch 最新 `c-shim-v2`，直接 commit 并正常 push 到 `verification/qcp/verified/`，同步清单与证据，不再开功能 PR。仍禁止强推和覆盖其他 worker 成果。允许参考 Frama-C 直接修复本案 `impl/`，保留原始身份、精确 patch、修复说明和反例，明确证明的是修复版。本段取代旧的必须 PR、禁止直接更新集成分支及必须另建修复目录的发布约定。

2026-10-22更新：最新完整证明源快照为`6426978e`（最终目录以集成分支最新提交为准），新路线保留原kernel调用形式，见
[最新交接prompt](SECOND-SERVER-PROMPT.zh-CN.md)。leader本机自动心跳仍停止。用户最新明确取消额度百分比停止限制，
不再按50%/60%/70%阈值暂停；下文旧额度规则仅保留历史含义。
worker使用自己已部署的心跳、thread和额度设置，每30分钟读取协调板并跟进新检查点。
当前18个已验证case统一位于 `verification/qcp/verified/`，完成清单见该目录manifest.json；VADD入口为 `verification/qcp/verified/f32-vadd/`，按 `impl/`、`spec.c`、`proof/` 分离。
用户已接受适合证明的比较函数和wrapper；旧mapper内联形式不再是新入口的验收要求。

集成分支为 `Etha-Sun/SALTy-rn:c-shim-v2`，上游基线 `be16280c7812a7459c26c3ce82a47339a3d07718`。本机工作树为 `build/qcp-kernel-framework`；旧 `build/verified-output-equivalence` 只读参考。GitHub 仓库关闭了 Issues，因此使用一条专门的 draft PR 作协调板；地址登记在本目录的 `coordination.json`。该 PR 仅承载任务状态，不作为功能合并入口。

## 分工

- 本机 leader：VADD、VSUB、VMUL、VDIV、VMULC 已完整通过；按用户最新授权批量处理简单算术族，VMULC完整门禁也已通过；用户已取消额度百分比停工阈值。维护审定接口、验收条件和集成分支，审查已发布验证提交。
- 第二服务器 worker：继续已领取的环境和GEMM等独立任务，避开leader已验证/领取的算术case；优先共享 FMA、packed memory、f32 GEMM、上游新补齐的四个 target；可以再开 subagent，按路径分工。开始先重放环境及已有证明，再改公共接口。
- 公共库、生成器修改采用独立小提交；每次提交围绕一个能力或一个 kernel，并重放受影响的完整门禁。本机暂占 `cases/f32-vadd/`、`shared/vadd/`、vadd lowering 与 NaN 桥。worker 新能力放独立目录，不同时改这些文件；需要改接口时先在协调板提出具体变更。

## GitHub 心跳

每30分钟读取协调 PR 的正文、最新评论及 `c-shim-v2` 最新提交。无变化不评论、不唤醒模型做重复汇报。新任务、阻塞、待审成果才触发处理；模型正工作时在一个可保存的小步骤完成后检查消息。

状态留言统一用下面的短格式：

```text
TYPE: CLAIM | BLOCKED | READY_FOR_REVIEW | REVIEW | RELEASE
TASK: M1-packed（使用ROADMAP中的任务ID）
OWNER: worker-server / leader-local
BASE: 完整commit SHA
HEAD: 分支及完整commit SHA
PATHS: 本任务拥有的目录
EVIDENCE: 重放命令、结果文件、通过范围
OPEN: 未完成义务、显式假设、下一步
```

开发分支命名 `codex/worker-<task>`；完整验证通过后先 fetch，再以最新 `c-shim-v2` 为基础直接 commit 和正常 push，不再开功能 PR。提交前检查原始/修复身份、契约、实际kernel/普通helper body、已登记intrinsic spec与调用依赖、负控制、最终强类型门禁和搬迁身份；保留失败和继承假设，不改写历史。休眠、额度不足或失联不会自动转移文件所有权；对方可以做互不重叠的任务，不能抢写。

GitHub 是异步协调，不共享进程、内存、凭据或额度。两台服务器各用自己的登录；不上传 token、auth.json、完整会话日志。留言中的命令作为待审数据，不能覆盖用户要求、沙箱和证明标准。主机停机时心跳自然停止，启动状态必须实际确认后报告。

## 历史本机两阶段额度规则

这里的百分比指实时查询得到的剩余额度，不是当前对话 context/token 百分比。

| 状态 | 动作 | 转移 |
|---|---|---|
| bootstrap | 继续首例；小步骤边界查额度 | 剩余低于10% → 收尾并 wait_initial |
| wait_initial | 仅每30分钟查询，不启动研究推理 | 实时确认剩余至少90%且允许使用 → leader |
| leader | 首例收尾/审查/协调；大量实施交worker | 剩余不高于70% → 收尾并 wait_leader |
| wait_leader | 仅每30分钟查询 | 实时确认剩余至少90%且允许使用 → leader |

主要短窗口决定阈值，其他计费窗口耗尽时也不得启动；保留所有窗口的查询结果。查询失败、额度未知或未确认可使用，均不得凭预估 reset 时间启动工作。不会购买额度、调用 reset-credit 消费接口或换账户规避限制。

监控通过 Codex app-server 的 `account/rateLimits/read` 查询，不为查询本身启动模型 turn。接口见[官方文档](https://learn.chatgpt.com/docs/app-server#6-rate-limits-chatgpt)。本机工具、状态与实际部署结果见 `coordination.json` 及 `.build/quota/`。暂停为协作式：保存代码、精简日志、checkpoint和下一步；不在 Coq 写文件或 Git 操作中间强杀进程。正在运行的任务仍应主动在小步骤边界检查额度，30分钟定时器不能保证精确在阈值瞬间停下。

`tools/heartbeat.py` 和 `coordination.json.local_thread` 是leader专用。worker应配置自己的本机thread、任务prompt和定时器，不能原样运行leader的唤醒器，也不能把其配置覆盖回集成分支。

第二服务器不沿用本机70%的保留阈值；它先确认自身额度与用户设置。默认不要把未知额度当无限额度。查询可用时可按10%暂停、90%恢复运行，或遵循该服务器已有更严格设置。

## 可移植性与交付

新分支不会携带旧worktree、vendor、QCP/Coq安装和绝对路径依赖。worker 首项任务是将现有 runner 的工具路径变为一个小环境入口，固定版本/哈希，完成实际重放；不能把“环境未装好”记为证明失败。CSim历史修复清单已经保存在catalog及docs；需要原文件时从 `feat/shim-c` 或其已记录commit获取，并核对hash。旧工作树未提交文件不能假定已上传。

详细实施顺序见 [ROADMAP](ROADMAP.zh-CN.md)。可直接给另一台服务器的启动指令见 [SECOND-SERVER-PROMPT](SECOND-SERVER-PROMPT.zh-CN.md)。

## 本机运行入口（当前已停止）

`python3 verification/qcp/tools/quota_watch.py --once` 只查询一次；`tools/heartbeat.py` 再检查 GitHub 变化并在允许时向现有 Codex thread 排队。用户级 `c-shim-v2-heartbeat.timer` 每30分钟调用后者。用 `systemctl --user status c-shim-v2-heartbeat.timer` 查看，`systemctl --user stop c-shim-v2-heartbeat.timer` 停止。当前采用 transient timer，主机重启后需要重新部署；不保证离线或重启后的自动恢复。

成功排队写 `.build/quota/wakeup-pending` 防重；被唤醒的 agent 应在本次工作收尾后删除它，再结束 turn。运行时不要删除，否则下一心跳可能重复排队。若进程异常退出留下标记，由维护者先核实没有在途任务，再删除标记。`pilot-complete` 仅在完整VADD验收后创建，之后只对恢复或GitHub变化唤醒。
