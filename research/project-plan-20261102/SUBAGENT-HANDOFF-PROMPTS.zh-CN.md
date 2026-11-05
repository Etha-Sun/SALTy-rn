# 两项子任务续跑提示词

**历史任务提示词，勿直接作为当前派工：** 新任务遵循[执行规范](KERNEL-EXECUTION-POLICY.zh-CN.md)与[新实验方案](EXPERIMENT-DESIGN.zh-CN.md)。旧配额停止规则已撤销；不可行反例允许按新规范补全并审核前置条件；后续 worker 使用独立 CLI 进程。本页不代表当前运行状态。

2026-11-02。当前已由根代理调度原四端agent及新增NEON修复agent。优先接续现有任务，避免两个agent写同一目录。以下可复制到新的子任务；先确认原任务已停止。

## 公共约束

模型使用用户指定的 `gpt-6.1-sol`。旧Astra任务已停止，Sol任务已接续同一工作树；新接管前确认当前写入者已停止。

汇报只围绕完整任务结果、尚未完成部分、需用户决定事项。中间helper/VC/阶段完成写内部日志，不向用户反复报告，也不得计作完整kernel成果。可以投入充分时间，不因局部困难就换题、缩域或仅交一份计划；额度触线/未知时如实交接。四端只关心四端是否完整证完；NEON任务只关心确证错误及最小修复、完整等价验证状态。

工作根目录 `/zp_vegeta/scratch_sb/ycsun/verus`。先读 AGENTS.md、SERVER_HANDOFF.zh-CN.md 和 `research/project-plan-20261102/DECISION-AND-TASKS.zh-CN.md`。用户决定保持原 C-shim/QCP 架构，暂不实施增量验证框架。

用户已撤销百分比配额保留与相应缓冲停止规则。按新执行规范记录逐 kernel 和监督成本，遵循实际任务预算及账户限制，不因额度读数未知自动停工。

严格 spec/impl/proof 分离；原始源码/合同/profile/模型/工具哈希与实际生成VC绑定；不缩小输入域、不改规格来获得通过、不添加公理或Admitted、不用手写模型替代真实C。普通C helper须有body证明；intrinsic按公开语义边界列明。历史通过与新检查分开，组件通过不算完整kernel。保留失败日志与所有未完成义务。不push、不修改正式verified清单。

## 提示词A：四端vabs

继续完成 f32-vabs 的 NEON/RVV/AVX/HVX 四端等价验证。先读主树 `research/project-plan-20261102/VABS-FOUR-ISA-STATUS.zh-CN.md` 与 `FOUR-ISA-PILOT-PLAN.zh-CN.md`，再读隔离工作树 `build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/RESUME.zh-CN.md`、`proof/status.json`。实际分支 `codex/four-isa-vabs-20261102`，821969733基线；XNNPACK固定23dd5070fa002ef0b124817798ae090fa29f9653。

保留四份原始kernel及helper源码。全部binary32，最终输出数值相等或同为NaN，忽略输出payload和±0，不合并输入/中间值。逐端证明共同spec，再组合六对等价；同时检查完整调用闭包、内存义务及最终门禁。HVX的Q6_V_vstu_variable在此版本是普通C polyfill，不能当可信原生intrinsic跳过。NEON已有若干helper通过、原主函数49VC已生成；确切新进度以状态文件为准，不重做已完成的无关工作。RVV注释入口历史失败、AVX/HVX未完整完成，均如实处理。

单进程、有限内存和时间，复用当前统一QCP/Coq环境，不改旧证据。持续更新根状态与RESUME；完整通过或提供准确阻塞及可执行接续说明。

## 提示词B：全部确证NEON最小修复

审查原40项中的全部条目，找出NEON本身有充分错误证据、且能微小修复的完整集合；然后依简单、证据明确、可复用既有证明的顺序实施候选并验证与对应RVV的契约/等价。先读主树 `research/project-plan-20261102/meeting-audit/` 的README、ALL-40、kernel-triage.csv及NEON diff。再读固定821各verified包的repair说明、原始源码和反例。若已有 `NEON-MINIMAL-REPAIR-STATUS.zh-CN.md`，先接续其结果。

工作树 `build/neon-minimal-repairs`、分支 `codex/neon-minimal-repairs-20261102`（若不存在再从821创建），禁止写另一个vabs工作树。主树只更新 `NEON-MINIMAL-REPAIR-STATUS.zh-CN.md`；详细候选与证据在自己的工作树独立candidate目录。

覆盖全部40并分类：确证NEON小修复／仅RVV错／语法兼容或证明重构／大改或不确定。优先核对 signed取负/移位、累加溢出、计数截断、ceil、tail读取、prefetch指针；务必检查整数提升与公开参数域，不能把非法输入算真实bug。qs8-f32-vcvt、qu8-f32-vcvt、qs8-vcvt、qs8-vlrelu、qs8/qu8-vadd、qs8-rsum、qs8/qu8-rdsum、maxpool/argmaxpool、qd8-qc8w-gemm只是线索，不是已判定结果。

从原始kernel制作必要最小patch，不把821的helper化或语法改动全部带入；保持原循环、指令、调度。若旧源码在某输入有UB，不宣称与旧UB程序全域等价：证明修复满足预期契约，并说明旧定义域行为保持及与RVV对齐。逐项记录是否历史已修、原合法域、可重现反例、最小patch、源身份、新proof结果与边界。不同包已有的观察合同不可默认放宽。不能快速在原结构上完成则如实交接，不迁就工具继续改代码。

先报告审计清单，再实施确证项。完整C/helper/caller/最终门禁通过才标整核完成。交付全集分类和每项可恢复命令，明确尚未修复/尚未证明者。
