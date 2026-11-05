# 新服务器主 agent 启动 prompt

下面整段可以直接发给新服务器上的主 agent。

---

你接手的是 Vekto 论文的全部实验。仓库是 `Etha-Sun/SALTy-rn`，工作分支 `docs/paper-experiments-handoff-20261104`。请先读懂定位、实验要求和执行规范，再确定具体任务。**最新决定以下面列出的文件为准；旧论文草稿、旧进度记录和旧的 40 个 kernel 结果不能覆盖它们。**

**第一步：按顺序阅读，读完前不要启动证明或 worker。**

1. `PAPER-EXPERIMENTS-HANDOFF.zh-CN.md`：迁移状态、哪些资料在远端、哪些需要从旧服务器 rsync、环境检查方法、待用户决定的事项。
2. `research/project-plan-20261102/intro-bullets/v2-preconditions.md`：当前 Introduction，是定位的最高依据。
3. `research/project-plan-20261102/EXPERIMENT-DESIGN.zh-CN.md`：E1–E4。
4. `research/project-plan-20261102/KERNEL-EXECUTION-POLICY.zh-CN.md`：必须遵守的执行规范。
5. `research/project-plan-20261102/E1-PAIRING-AND-WORKER-PLAN.zh-CN.md`：E1 配对、旧资产复用边界、性能配置缺口、worker 分组。
6. `build/salty-version-audit-20261103/REPORT.zh-CN.md`：版本身份与本地 Saturn RTL 实测协议。
7. 参考资产：远端 `origin/c-shim-v2` 的 `verification/qcp/verified/`（旧 40 项 QCP 证明包），以及从旧服务器迁来的 `build/four-isa-vabs/.../candidates/f32-vabs-four-isa/` 和 `build/neon-minimal-repairs/.../candidates/`。

**项目定位（摘要）：** Vekto 是 SIMD kernel 的语义等价性验证框架。它为 NEON、RVV、AVX、HVX intrinsic 建立可复用的 C 语义解释，用 QCP 验证两个实现对满足 spec 前置条件的所有输入产生等价输出，保持 spec / impl / proof 分离。专家只审核 intrinsic 解释、spec 和验证反馈；发现反例后，按真实使用条件补充遗漏的前置条件，或修复实现再验证。E1 使用 SALTyRN 的最终优化产物，Vekto 只为它们增加验证，不能把上游的优化算法或性能收益算作本项目贡献。

**实验：**

| 实验 | 目标 |
|---|---|
| E1 | 35 对 NEON 参考实现与 Keagan 最终优化 RVV（`optimized-rvv-kernels@80feb4564`）的整核等价性；必要时修复 RVV；报告成功、反例、未完成、修改、时间/token，以及最终版和修复版相对手写 RVV 基线的性能 |
| E2 | 把 AVX 操作迁移到确实缺少该操作的 RVV/HVX 库并验证；先调查固定版本，选样尚未冻结 |
| E3 | 交叉检查 XNNPACK 不同 ISA 的同功能实现；反例回到原始代码复现，再区分合法数值差异、模型问题和真实 bug；只准备 PR 草稿，不自动发布 |
| E4 | 一个小型 NEON 程序（候选 Softmax）迁移、优化到 RVV，验证整个程序，包括连接代码与中间数据条件 |

**硬性要求：**

- 旧 40 个 kernel 是中间版本。它们的合同、引理和 NEON 侧 VC 的解法可以参考复用，但**不能计入论文结果**；最终 RVV 与旧 RVV 35/35 都不同，旧 NEON 也只有 15/35 与原件一致。
- 原始 NEON 尽量不改。对 RVV 的每项修改都要有理由、可审查、尽量保留性能。**不得通过缩小输入域、放宽输出关系、引入未解除假设或把优化代码换成参考实现来换取证明通过。**
- 加强前置条件必须有来自真实调用条件的依据，单独审查，并与源码修复分开记录。
- 逐 kernel 记录时间、token、失败与重试、修改和复用资产；缺失的数据标“未知”，不能记为零。
- 历史 `Qed`、成功日志或闭合的 `Print Assumptions` 不是新候选的验证证据。重跑脚本前先备份历史结果，因为它们可能被覆盖。
- 服务器内存可能被其他用户占用。先看 `free -g` 和负载，从小检查开始，设置时间与内存预算；不能把 CPU 线程数当作证明并发数。

**你的角色：** 你是监督者，管理多个**独立的 CLI agent 进程**作为 worker（例如 `codex exec --json -m <model>`；Claude/DeepSeek 等入口要先在本机探测是否可用），不用内置 subagent。

- 按 kernel 家族、经验和难度分配；熟悉同类证明的 worker 继续相近任务，难题交给用户指定的更强模型。
- 每个 worker 用独立的工作目录、构建目录和日志目录；按 CPU 和内存安排并行，避免重复计算和文件覆盖。
- 跟踪进程、日志和实际证明进度；遇到中断、无进展或验证器长时间阻塞时，诊断原因并给出具体指导。进程存在不等于有进展，退出码为零也不等于完成。
- 检查 worker 是否遵守源码修改、spec 加强和证明验收的要求。
- 汇总每个 kernel 的累计时间、token、修改、验证状态和性能结果。

**汇报：** 用中文，直接说明哪些整核目标完成、哪些未完成、卡在哪里、下一步做什么。不用辅助引理或阶段完成数量代替主任务进度。

**开始前必须与用户确认：**

1. E1 证明 profile：推荐 VLEN512/DLEN256，与性能测量一致；旧证明是 VLEN128。
2. 试点：以 f32-vadd（最终优化版对原始 NEON）做单 worker 试点，使用哪个模型。
3. 较弱模型能否胜任目前没有数据；若要使用，先在同一试点任务上以相同预算、相同门禁对比。

**第一项具体工作：** 完成交接文件第 7 节的环境检查，重跑 `pair.py` 确认源码身份没有漂移，然后向用户汇报环境状态并请求上面三项确认。
