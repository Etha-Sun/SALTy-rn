# NEON 修复任务：新 thread 接续 prompt

**历史续跑模板：** 使用前按[当前执行规范](KERNEL-EXECUTION-POLICY.zh-CN.md)和实际状态更新。额度保留规则已撤销；有证据证明反例在原设定不可行时，应提出并审核最小前置条件补全，而非默认修改源码。本页不启动任务。

创建聊天时选择 `gpt-6.1-sol`。复制下方内容；不需要重做已完成的审计或证明。

---

请接续我的 NEON/RVV 数值 kernel 最小修复与形式化验证任务，直接执行，不停在计划。使用现有工作树，不重新开始。

工作根目录：`/zp_vegeta/scratch_sb/ycsun/verus`。
实际候选工作树：`/zp_vegeta/scratch_sb/ycsun/verus/build/neon-minimal-repairs`。
分支：`codex/neon-minimal-repairs-20261102`，基线 `821969733d7953a212c51839194add416fd5799b`。

先读：
1. 根 AGENTS.md 和 SERVER_HANDOFF.zh-CN.md；当前任务是 C-shim/QCP，不是早期 Sail 任务。
2. `/zp_vegeta/scratch_sb/ycsun/verus/research/project-plan-20261102/NEON-MINIMAL-REPAIR-STATUS.zh-CN.md`。
3. `/zp_vegeta/scratch_sb/ycsun/verus/build/neon-minimal-repairs/verification/qcp/candidates/neon-minimal-audit/RESUME.md`。
4. 同目录 `AUDIT.zh-CN.md`、`audit-40.json`。

原任务已审计40项，形成11项确证问题的最小候选。以状态文件的最新结果为准；交接时 `qs8-f32-vcvt` 已完成新完整 C-shim 部分正确性及 NEON/RVV 等价验证，其他10项未完成。`qs8-vcvt` 有一项已启动的证明运行，先核对交接中进程/PID、运行目录和结果，等待或接续它，不重复启动。旧聊天的 session ID 不保证可在新 thread 使用；应按实际进程及日志/最终状态确认，不凭“进程不见了”判通过。原 agent 保存交接后不再写入；先核实当前写入者和已有运行。

继续完成剩余候选：qu8-f32-vcvt、qs8-vcvt、qs8-vlrelu、qs8-vadd-minmax、qu8-vadd-minmax、qs8-rsum、qs8-rdsum、qu8-rdsum、f32-maxpool、f32-argmaxpool。目标是必要的最小语义修复及修复后真实程序的完整契约/等价证明。已完成项只核对来源与证据，除非有实际失效原因，不重复耗时重跑。

严格使用原有 spec、impl、proof 分离框架。保持原kernel的循环、指令及调度，不能为了证明引入大重构、标量替身或拆runtime helper；不缩小合法输入域、不弱化规格、不加公理/Admitted。普通C helper要验证实际body，intrinsic公开语义信任边界明确保留。旧源码在某输入有未定义行为时，不宣称旧新全域等价，应说明修复满足预期合同及旧定义域行为保持。正式完成必须包括真实C/CPP/VC、全部普通helper、两侧kernel、caller和最终门禁，绑定当前源与依赖；历史收录或有限测试不代替新候选完整证据。不要改正式verified清单、不要push，不碰四端vabs工作树。

错误证据已经保存。继续Coq/QCP证明与结果核对，不重复大规模内存诊断或新增错误触发实验。使用RESUME给出的统一QCP2.1.4/Coq8.20.1环境。单进程、有限内存与单命令时间；总任务可持续推进。一个case卡住时明确记录原因，并推进其他可完成case，不能用修改语义或只交计划绕过困难。

用户已撤销百分比配额保留与对应停止线。按当前执行规范记录每项时间/token（含失败重试），遵循实际预算与账户限制；不因额度读数未知自动停工。任务中断仍须保存工件、状态与续跑说明。

只向我汇报：哪些kernel已经最小修复并完成整核验证、哪些未完成、是否有需要我决定的事。中间VC/helper/阶段编号写内部日志，不拿它们当成果、不频繁报喜。没有完成就明确没有完成，在额度内继续认真做。更新主状态与RESUME，清晰区分最新状态和历史记录。
