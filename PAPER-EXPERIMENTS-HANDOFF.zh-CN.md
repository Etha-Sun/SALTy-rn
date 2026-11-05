# Vekto 论文实验：新服务器迁移与交接指南

整理日期：2026-11-04。分支：`vekto`，论文实验主线（基于 `feat/assembly-reduction-lean@978bc31b8`）。

本文件取代 [SERVER_HANDOFF.zh-CN.md](SERVER_HANDOFF.zh-CN.md) 作为**当前工作的入口**。旧文件写于 2026-10-02，描述的是 Sail/Islaris 汇编层 reduction 研究；那条线保留为历史与背景，不是论文主线。现在的主线是 **Vekto：在 C 层用 QCP 验证 SIMD kernel 的跨 ISA 等价性**，并完成论文全部实验 E1–E4。

## 0. 一句话现状

- 论文定位与 Introduction 以 V2 为准，实验规划已写定，执行规范已写定。
- **四组实验都还没有合格的论文结果。** E1 的 35 个最终优化 kernel 一个都没有整核等价性证明；只完成了源码配对和资产核对。
- 旧的 40 个 kernel 证明属于 Keagan 的中间版本，**只能作为参考**（合同、引理、NEON 侧 VC 的解法和经验），不能计入论文结果。

## 1. 新 agent 的阅读顺序

按顺序读，前面的文件优先级高于后面的旧文件：

1. **[intro-bullets/v2-preconditions.md](research/project-plan-20261102/intro-bullets/v2-preconditions.md)**：当前 Introduction 逻辑链，是写作和定位的最高依据。版本历史见同目录 `CHANGELOG.md`；V3/V4 只是历史。
2. **[EXPERIMENT-DESIGN.zh-CN.md](research/project-plan-20261102/EXPERIMENT-DESIGN.zh-CN.md)**：E1–E4 的目标、设置与审稿关注点。
3. **[KERNEL-EXECUTION-POLICY.zh-CN.md](research/project-plan-20261102/KERNEL-EXECUTION-POLICY.zh-CN.md)**：**必读**。源码修改边界、前置条件加强的审查要求、成本台账、并行与监督方式、验收与汇报格式。
4. **[E1-PAIRING-AND-WORKER-PLAN.zh-CN.md](research/project-plan-20261102/E1-PAIRING-AND-WORKER-PLAN.zh-CN.md)**：2026-11-04 的 E1 配对结果、旧资产能复用到什么程度、性能配置缺口、worker 工具实测和分组方案。
5. [KEAGAN-FINAL-SOURCE-INVENTORY.json](research/project-plan-20261102/KEAGAN-FINAL-SOURCE-INVENTORY.json)：35 个最终文件的 blob 身份。
6. [build/salty-version-audit-20261103/REPORT.zh-CN.md](build/salty-version-audit-20261103/REPORT.zh-CN.md) 与 [simple-kernels-extension/REPORT.zh-CN.md](build/salty-version-audit-20261103/simple-kernels-extension/REPORT.zh-CN.md)：A/B/C/D/E 各版本身份，以及本地 Saturn RTL 的已测周期和协议。
7. [PAPER-POSITIONING-AND-METADATA.zh-CN.md](research/project-plan-20261102/PAPER-POSITIONING-AND-METADATA.zh-CN.md)：系统名称、作者元信息、与 SALTyRN 的贡献边界、性能平台。其中写作安排已过时，Introduction 以 V2 为准。
8. 案例证据：[final-minmax-reproduction](research/project-plan-20261102/final-minmax-reproduction/README.zh-CN.md)（vmax/vmin NaN 反例）、[vmax-performance](research/project-plan-20261102/vmax-performance/REPORT.zh-CN.md)（修复代价）、[xnn-minmax-crosscheck](research/project-plan-20261102/xnn-minmax-crosscheck/REPORT.zh-CN.md)（E3 雏形）。
9. QCP 机制：[QCP-MODULAR-VERIFICATION.zh-CN.md](research/project-plan-20261102/QCP-MODULAR-VERIFICATION.zh-CN.md)（spec/impl/proof 链条、`equivalent` 的真实含义、门禁）。
10. 研究想法：[research/ideas/README.zh-CN.md](research/ideas/README.zh-CN.md) 与 001–006。这些是开放问题，不是已采纳的决定。

本目录其他旧文件（`PROJECT-PLAN`、`DECISION-AND-TASKS`、`FOUR-ISA-PILOT-PLAN`、`SUBAGENT-HANDOFF-PROMPTS`、`README.zh-CN.md` 等）是历史记录，**不能覆盖上面 1–4 的最新决定**；其中的配额停止线已被用户撤销。论文草稿 `vekto-paper-draft-20261103/`、`vekto-ecoop-draft-20261104/` 中的数字来自模拟预览，不是结果。

## 2. 用户已经确定的事项

- Vekto 是 SIMD kernel 的语义等价性验证框架。核心贡献是验证的可靠性与可扩展性，性能体现应用价值。
- 为 NEON、RVV、AVX、Hexagon HVX intrinsic 建立可复用的 C 语义解释，用 QCP 验证，保持 spec / impl / proof 分离。
- E1 只验证 Keagan 的最终产物 `keaganchern/optimized-rvv-kernels@80feb4564cb470de301062109b6f89db672bdf9d`，不重跑优化。不能把上游的优化算法或性能收益算作本项目的贡献。
- 原始 NEON 尽量不改；对 RVV 的每项修改都要有理由、可审查、尽量保留性能；**绝不能通过降低等价性要求换取证明通过**。
- 出现反例时，先回到真实调用条件检查是否可行；只有有依据时才加强前置条件，并单独审查。
- 逐 kernel 记录时间和 token，包括失败与重试。
- 组织方式：主 agent 作为监督者，管理多个**独立的 CLI agent 进程**（不用内置 subagent 作为 worker）。按家族、经验和难度分配；难题交给更强的模型。
- 用户已撤销“quota 至少剩余 50%”的要求，但成本仍要如实记录。
- 与用户交流优先用中文；汇报整核目标是否完成、修改是否必要、性能代价和实际阻塞，不用辅助引理或阶段数量代替主任务进度。

## 3. 尚待用户决定（不要自行假定）

1. E1 证明 profile：推荐 **VLEN512/DLEN256**，与性能测量一致；旧证明用的是 VLEN128。
2. 是否启动 f32-vadd 单 worker 试点，以及使用的模型。
3. E2 的 5 个 AVX 操作选样尚未冻结（Introduction 中数量为 TBD）。
4. E4 的应用对象：Softmax 是候选，尚未冻结。
5. 是否以及如何联系 Keagan，索取 Autocomp RVV backend、FireSim 配置、计时 harness 和每个最终文件的实际 baseline。

## 4. Git：哪些在远端，哪些只在旧服务器

| 内容 | 位置 | 新服务器如何获得 |
|---|---|---|
| 本交接、实验规划、执行规范、Intro V2、E1 配对、vmax/minmax 证据、ideas 003–006、版本审计报告与身份账本 | 本分支 `vekto` | `git clone` 后 checkout 本分支 |
| QCP C-shim 框架、40 个旧 kernel 证明包（`verification/qcp/verified/`，基线 `821969733`） | 远端 `origin/c-shim-v2`，已推送 | 为它建 worktree，作为**参考资产** |
| f32-vabs 四端候选（NEON/RVV/AVX 完成，HVX 与四端等价未完成） | 旧服务器 `build/four-isa-vabs/verification/qcp/candidates/f32-vabs-four-isa/`，**未提交**（约 36 MB 源码 + 构建产物） | rsync（见第 6 节） |
| NEON 最小修复候选与审计（多项 NEON VC 解法） | 旧服务器 `build/neon-minimal-repairs/verification/qcp/candidates/`，**未提交**（约 610 MB，不含 `.build`） | rsync |
| Saturn RTL 模拟器、chipyard、工具链（xPack GCC 15.2、Zig/Clang 20、QEMU、cvc5、spike） | 旧服务器 `research/sol-pipeline-comparison-20261030/round2/hardware/`（7.7 GB）、`.../tools/`（1.9 GB） | rsync；或按 chipyard `973f8732` 重建 |
| QCP 2.1.4 发行包 | 旧服务器 `.local/qcp/`（290 MB） | rsync，或从官方 release 重新下载 |
| QCP 使用的 opam root（Coq 8.20.1，switch `qcp820`） | 旧服务器 `build/rocq-editor/`（2.0 GB，已加入 `.gitignore`） | 保持同一绝对路径 rsync；路径改变就重建 switch |
| 其他未跟踪实验（`research/agent-*`、`frama-c-*`、`vst-*`、`rvv-*` 等） | 旧服务器，未提交 | 整个工作区备份即可，不是当前主线 |

本次**刻意没有提交**的本地文件：`kernels/target/f32-gemm-minmax.c` 的本地 NaN/FMA 修改（不属于 E1 身份，E1 一律用上游冻结副本）、根目录的录音转写 txt、`.frama-c/`、各种 `.elf`/`.zip`/运行目录。它们仍在旧服务器上，整个工作区备份会包含。

## 5. 新服务器：克隆与 worktree

```bash
REPO=$HOME/verus            # 可改；若要直接复用旧 opam root，见第 6 节
git clone https://github.com/Etha-Sun/SALTy-rn.git "$REPO"
cd "$REPO"
git fetch origin --prune
git switch vekto
git worktree add build/qcp-kernel-framework origin/c-shim-v2
git submodule update --init --recursive --jobs 4   # XNNPACK 867d5a34、chipyard 973f8732、autocomp d477d05、zephyr
```

E1 的上游源码要重新克隆并固定提交：

```bash
E1=$REPO/build/e1-source-pairing
mkdir -p "$E1/upstream"
git clone https://github.com/keaganchern/optimized-rvv-kernels.git "$E1/upstream/optimized-rvv-kernels"
git -C "$E1/upstream/optimized-rvv-kernels" checkout 80feb4564cb470de301062109b6f89db672bdf9d
git clone https://github.com/keaganchern/SALTy-rn.git "$E1/upstream/salty-rn-upstream"
git -C "$E1/upstream/salty-rn-upstream" checkout be16280c7812a7459c26c3ce82a47339a3d07718
python3 -I "$REPO/research/project-plan-20261102/e1-pairing-20261104/scripts/pair.py" "$E1" "$REPO"
diff <(python3 -m json.tool "$E1/pairing-raw.json") \
     <(python3 -m json.tool "$REPO/research/project-plan-20261102/e1-pairing-20261104/pairing-raw.json")
```

重跑结果应与已提交的 `pairing-raw.json` 一致，用来确认身份没有漂移。`local_*` 字段反映本仓库 `kernels/` 的状态，可能因本地修改而不同，这不影响上游身份。

## 6. 迁移 Git 之外的资料

旧服务器路径：`/zp_vegeta/scratch_sb/ycsun/verus`。QCP 的 `env-exec.sh` 和 opam root **把这个绝对路径写死了**。最省事的方式是在新机上建立相同路径；做不到时，就需要重建 opam switch，只改环境变量不够。

```bash
OLD=ycsun@OLD_HOST:/zp_vegeta/scratch_sb/ycsun/verus
NEW=/zp_vegeta/scratch_sb/ycsun/verus          # 尽量保持同一路径
# 1. 必需：候选证明工作（未提交）
rsync -aH --info=progress2 "$OLD/build/four-isa-vabs/"        "$NEW/build/four-isa-vabs/"
rsync -aH --info=progress2 "$OLD/build/neon-minimal-repairs/" "$NEW/build/neon-minimal-repairs/"
# 2. 证明环境
rsync -aH --info=progress2 "$OLD/.local/qcp/"          "$NEW/.local/qcp/"
rsync -aH --info=progress2 "$OLD/build/rocq-editor/"   "$NEW/build/rocq-editor/"
# 3. 性能环境
rsync -aH --info=progress2 "$OLD/research/sol-pipeline-comparison-20261030/round2/hardware/" \
                           "$NEW/research/sol-pipeline-comparison-20261030/round2/hardware/"
rsync -aH --info=progress2 "$OLD/research/sol-pipeline-comparison-20261030/tools/" \
                           "$NEW/research/sol-pipeline-comparison-20261030/tools/"
# 4. 完整私有备份（可选，保留所有日志与运行记录）
rsync -aH --info=progress2 "$OLD/" "$HOME/verus-backup-20261104/"
```

注意：`build/four-isa-vabs` 等是 git worktree，`.git` 文件指向旧仓库的绝对路径。在新机上若路径不同，用 `git worktree repair` 修复，或新建 worktree 后只拷贝 `verification/qcp/candidates/`。`build/pr-sum` 有未提交的讨论笔记和图（见旧交接第 6 节），需一并备份。

## 7. 新机上的最小检查（先小后大）

先检查可用内存和负载，再执行以下检查。不能用 CPU 线程数决定并发：旧机曾因大型 RVV 证明消耗数百 GiB。

```bash
free -g; nproc; uptime
.local/qcp/env-exec.sh coqc --version         # 期望 Coq 8.20.1
cat .local/qcp/README.zh-CN.md .local/qcp/installation.json   # 安装身份与已做检查
```

然后在 `build/qcp-kernel-framework/verification/qcp/verified/f32-vadd/` 按其 README 重跑一个小 kernel 的完整门禁。历史记录中 QCP 约 186 秒，coqc 有 88 条命令、累计约 1238 秒。**重跑前先备份该目录的 status/日志**，因为现有脚本可能覆盖历史记录。

性能侧：用 `simulator-chipyard.harness-GENV512D256ShuttleConfig` 跑 `build/salty-version-audit-20261103/simple-kernels-extension` 里的一个已测程序，核对 cycles 与 `raw-cycles.csv` 一致，并记录 simulator SHA256（期望 `ebcb231c…`）。

## 8. Worker 工具（旧机 2026-11-04 实测）

| 入口 | 状态 |
|---|---|
| `codex exec -m gpt-6-astra` / `-m gpt-6.1-sol` | 可用 |
| `claude -p`，litellm 配置 | `error_during_execution`，当时不可用 |
| `claude -p`，timesniper 配置（GLM-5.1 / gpt-5.x） | 超时，当时不可用 |
| DeepSeek | 未配置 |

在新机上重新探测。较弱模型能否胜任，目前**没有本任务上的数据**；应在同一试点任务上用相同预算和相同验收门禁对比后再决定，不同模型的验收标准不能放宽。

## 9. 下一步（按执行规范第 9 节）

1. 完成第 7 节环境检查，区分环境失败与证明失败。
2. 用户确认 VLEN profile 后，以 f32-vadd（Bopt 对原始 A）做单 worker 试点，检验目录隔离、成本台账、整核验收、中断恢复。
3. 再扩到 G1/G2 的同类 kernel，逐步增加并行度。vmax/vmin 直接进入反例与修复流程。
4. 并行推进 E2 选样调查（固定目标库版本，确认确实缺少该操作）和 E3 配对清单；它们不依赖 E1 的证明。
