# SALTy-rn 新服务器配置与项目交接

整理日期：2026-10-02。适用目标：Ubuntu 22.04.5 LTS、x86_64 / AMD64、Linux 5.15.0-191-generic、AMD EPYC 9554（64 核 / 128 线程）。这些目标机器信息由用户提供；新服务器的内存、磁盘、用户名和安装路径尚未核实。

当前工作是 NEON → RVV kernel 的跨 ISA 验证研究。完整研究归档和两条新 idea 在 **`feat/assembly-reduction-lean`**；后续整理的可独立构建 Coq 证明项目在 **`proof/sum`**。两条分支都要保留，默认 `main` 较旧。GitHub 能恢复已提交的研究资料，但本地工具链、完整日志、编译缓存和工作树需要另行搬迁。

## 1. 仓库与迁移起点

| 项目 | 值 |
| --- | --- |
| 用户 fork | <https://github.com/Etha-Sun/SALTy-rn> |
| SSH remote | `git@github.com:Etha-Sun/SALTy-rn.git` |
| HTTPS remote | `https://github.com/Etha-Sun/SALTy-rn.git` |
| 当前工作分支 | `feat/assembly-reduction-lean` |
| 已发布的 Coq 整理分支 | `proof/sum`，提交 `3e3ec07d3ccb73dbbb6d7d06843d927fd15ac915` |
| 本交接整理前的源码基线 | `033d8c3de6186f99ae4a45b9a3451aa5a590c21a` |
| 基线的内容 | 2026-09-28 证明检查点、其余研究归档、2026-10-02 两条 idea 卡片 |
| 整理时远端 `main` | `94e88f4390810849f22612c5363778a5ae0fb803` |
| 旧服务器仓库路径 | `/srv/home/yuechunsun/tools/lean` |

交接文件本身会位于基线之后的提交；新服务器应获取工作分支最新提交，而非退回基线。上述远端分支已在整理时核对。

在新服务器执行，`SALTY_REPO` 可按需更改；如果要直接复用旧 opam 二进制环境，优先保留旧绝对路径：

```bash
SALTY_REPO=/srv/home/yuechunsun/tools/lean
mkdir -p "$(dirname "$SALTY_REPO")"
git clone --branch feat/assembly-reduction-lean \
  https://github.com/Etha-Sun/SALTy-rn.git "$SALTY_REPO"
cd "$SALTY_REPO"
git fetch origin --tags --prune
git submodule sync --recursive
git submodule update --init --recursive --jobs 4
git status --short --branch
git log -3 --oneline
git branch -r
git submodule status --recursive
git merge-base --is-ancestor 033d8c3de6186f99ae4a45b9a3451aa5a590c21a HEAD
```

不要加 `--depth` 或 `--single-branch`：这里要保留远端各分支的可达历史和 tags。其他分支会显示为 `origin/...`，不必全部建立本地工作树。需要推送时可将 `origin` 改为上表的 SSH 地址，并在新机器配置自己的 GitHub 认证。

子模块为 XNNPACK、autocomp、zephyr、chipyard；固定提交见 [environment.json](research/migration/environment.json)。当前旧工作区的四个子模块都未初始化，因此新机的递归下载可能明显大于旧机目录体积。Git 克隆也不包括 GitHub Issues、PR 讨论、Actions 工件或其他平台的聊天记录。

## 2. 从哪里了解当前进展

按以下顺序阅读，可避免把早期实验的状态当成最新状态：

1. [CHECKPOINT.md](research/sail-tooling-gap/CHECKPOINT.md)：当前 Sail 验证结果及边界。
2. [presentation/README.md](research/sail-tooling-gap/presentation/README.md) 与 [STATUS.md](research/sail-tooling-gap/presentation/STATUS.md)：汇报材料和准确的完成状态。
3. [kernel-e2e/README.zh-CN.md](research/sail-tooling-gap/kernel-e2e/README.zh-CN.md)：真实工作源码、证明依赖与实验经过。
4. [共同规格 idea](research/ideas/001-cross-isa-spec-interface.zh-CN.md) 与 [小 vl 参考 idea](research/ideas/002-rvv-small-vl-reference.zh-CN.md)：用户原话、已澄清目标、调研证据、疑问及候选实验。
5. [WORKTREE_ARCHIVE.md](research/WORKTREE_ARCHIVE.md)：哪些只是归档实验；大 trace 的恢复方法。
6. 另一分支的 [Coq 项目 README](https://github.com/Etha-Sun/SALTy-rn/blob/proof/sum/coq/neon-rvv-reduction/README.md) 和 [verification.json](https://github.com/Etha-Sun/SALTy-rn/blob/proof/sum/coq/neon-rvv-reduction/verification.json)：2026-10-02 的整理与复查成果。该目录不在当前研究分支，应建立 `proof/sum` 工作树后阅读。

仓库还有原始 LLM 翻译/编译/测试/有界验证流水线（`src/workflow/`）、逐元素 C→Lean 工作（`src/verification_bw/lean/`）、手写机器模型的汇编 reduction 实验（`research/assembly-reduction/`），以及 Sail 生成后端的探索（`research/sail-binary-reduction/`）。它们有不同的语义来源与证明范围，不能合并计算为当前 Sail kernel 已完成的证明。

## 3. 目前究竟证明到哪里

共同数学目标是：对合法输入字节序列 `xs` 和调用前输出初值 `old`，返回时输出等于 `(old + sum(xs)) mod 2^32`，输入内存保持不变。

下表概括研究分支 2026-09-28 检查点；随后发布的证明包见表后说明。

| 对象 | 当前证据与限制 |
| --- | --- |
| NEON 简化 kernel，20 条指令 | 任意合法总输入长度的部分正确性已通过历史 Coq 检查 |
| RVV 简化 kernel，19 条指令 | 已提取真实 Sail/Isla 指令语义；完整结论仍有条件 |
| RVV 扩宽、向量加法 | VL=0..8 的合同已有成功记录 |
| RVV 最终归约 | 使用 VL=8 的合同 |
| RVV `vle8.v` 加载 | VL=0、1 的合同通过普通 `coqc`；VL=2..8 尚未完成 |
| RVV 循环、kernel、共同规格 | 已检查，但显式依赖通用加载合同 **`Hload`** |
| 最终 NEON ↔ RVV 程序等价性 | **未完成** |

当前 RVV kernel 工作固定 **VLEN=256、SEW=32、LMUL=1、VLMAX=8**。早期 `islaris-reduction/` 指令 demo 使用 LMUL=8、64 lanes，不能把其参数套到当前 kernel。

合法域还有对齐、内存权限、地址范围、不重叠和架构环境条件。NEON 输入要求 16 字节对齐，输出 4 字节对齐；当前 RVV 合同另要求 7 字节有效 padding。这是合同要求，不意味着指令必然读取全部 padding。跨 ISA 顶层必须对齐两侧合法域，具体以 Coq 定理前提为准。

任意总输入长度不代表任意硬件 VLEN。当前合同是部分正确性，尚无独立的完整终止性/整机 adequacy 定理，也未证明原始 C kernel 与这里的简化汇编等价。`Print Assumptions` 显示闭合不会消除定理的显式参数 `Hload`。

**2026-10-02 的后续进展：** `proof/sum` 将完成的证明整理到 `coq/neon-rvv-reduction/`，保留 131 个 Coq 源模块、20+19 条程序指令 trace 和 4 条桥接 trace。其 `verification.json` 记录了全部 131 个模块的重新编译、启用 VM conversion 的递归 `coqchk` 成功，以及 35 个导出定理的闭合假设报告。这个包包含 VL=0/1 加载证明，因此其检查证据比早期研究记录更完整。它保留了 NEON 完整程序的部分正确性和已完成的 RVV 局部合同，**不包含完整 RVV 程序定理**；带 `Hload` 的历史条件性程序证明仍在研究分支。

两份记录需按分支和日期区分：2026-09-28 研究记录中的 VL=0 额外独立检查曾超时，VL=1 未单独独立检查；2026-10-02 整理包已有全模块递归检查。所有这些仍是既有证据，本次迁移整理没有重跑数小时的证明。两条分支均未验证从空 opam root 安装完整外部依赖，最终跨 ISA 目标仍未完成。

## 4. 用户的研究方向与协作方式

用户希望把零散、不确定的想法持续整理，并结合项目背景和原始资料讨论其可行性。保存时要区分用户原话、助手解释、已证事实、待验证假设和下一步候选，不要把候选方案写成已经决定的路线。

**Idea 1：共同的确定性输入—输出规格。** 两个 ISA 分别证明符合共同规格，顶层只组合接口结论，避免同时展开完整模型。用户已明确主要目的在顶层，并追问：直接联合验证也能模块化，总难度是否真的降低？目前结论是架构合理但总成本收益未证实；应和直接关系证明在相同 kernel、合法域、观察与未解除假设下比较。仅有各自确定性不能推出输出相同。

**Idea 2：小 vl 参考执行。** 探索一般 RVV 程序与 vl=1 或至多 2 的参考版本等价，再做输出层面的验证。一般的小规模充分性不成立；受限逐元素程序和模整数 reduction 的可复用分块定理值得探索。老师指出新增证明义务，用户希望认真评估而非直接放弃。官方资料没有提供通用 vl=1/2 截断保证；相关规范、issue 和浮点反例已写入 idea 卡片。当前暂按改变每轮处理长度理解，是否也想缩小硬件 VLEN 仍待用户澄清。

接手后的候选工作：先恢复环境并核对一个小证明；继续研究加载 VL=2..8 的阻碍及合法域衔接；两条 idea 分别建立可测量的对照实验。它们是建议，不是用户已确定的优先级。

## 5. 环境配置

完整的非敏感版本清单、工具文件哈希及来源在 [environment.json](research/migration/environment.json)。

| 层次 | 当前配置 / 恢复入口 |
| --- | --- |
| 主 Python 包 | `pyproject.toml` 要求 Python ≥3.11；旧系统 `python3` 实测为 3.10.12 |
| Lean | `src/verification_bw/lean/`、`unbounded-vla/` 固定 4.29.0；`assembly-reduction/`、`sail-binary-reduction/` 固定 4.29.1 |
| Coq / OCaml / Dune | 8.19.0 / 4.14.2 / 3.9.1 |
| opam | 2.5.2，独立 root：`research/sail-tooling-gap/vendor/islaris-opam`；switch：`islaris-demo` |
| Islaris | `c978e10f50db5c40f0fdf113f5f76a779782c6f9`，位于 `vendor/islaris-main` |
| Isla | 既有审计记录固定 `e9b5d945394277656593a0d429466d7fa0a2b4b3`；二进制哈希已在本次记录 |
| 汇编工具 | 系统 LLVM 14；本地 xPack RISC-V GCC 15.2.0-1 |
| Sail / 模拟器等 | [tools.lock.json](research/sail-binary-reduction/tools.lock.json) 与 [lem-tools.lock.json](research/sail-binary-reduction/lem-tools.lock.json) |

新机基础系统包，可由有 sudo 权限的用户安装：

```bash
sudo apt-get update
sudo apt-get install -y git curl ca-certificates rsync build-essential \
  pkg-config m4 unzip xz-utils bzip2 bubblewrap libgmp-dev libz3-dev \
  clang-14 llvm-14 lld-14 cmake python3 python3-venv
```

运行 Python 主流水线时，先按 [uv 官方说明](https://docs.astral.sh/uv/getting-started/installation/) 安装 uv，再在仓库根目录执行：

```bash
uv python install 3.11
uv venv --python 3.11
uv pip install -e '.[dev]'
.venv/bin/python --version
```

这会按 `pyproject.toml` 解析依赖，仓库没有该主环境的精确依赖锁；它不会安装 Coq、Lean 或 ISA 工具。仅阅读资料不需要安装这些环境。

Lean 使用 elan，并遵循各目录自己的 `lean-toolchain`。安装入口见 [elan](https://github.com/leanprover/elan)。不要统一改成某个最新 Lean 版本。需要重建本地 Sail 工具时，现有入口是：

```bash
python3 research/sail-binary-reduction/bootstrap.py --verify-archives
```

该脚本有下载哈希校验，但它**不会**安装 `sail-tooling-gap` 的 Islaris/Coq 环境。

### Coq 环境：同路径搬迁或重新构建

若目标是复现**已完成的证明包**，优先在 `proof/sum` 工作树使用现有 `coq/neon-rvv-reduction/scripts/setup.py`、`Makefile` 和 `scripts/check.py`。安装并初始化 opam 后，在该项目目录的干净环境中执行 `python3 scripts/setup.py`、`opam exec -- make -j2`、`opam exec -- make check`。设置脚本包含固定依赖及 Islaris 的准备步骤；首次空环境安装仍待验证，完整检查可能耗时很长。可先运行只读的 `python3 scripts/verify_inputs.py` 核对源码和 trace。

下述路径和环境导出对应**原研究工作区**，用于继续全部实验及条件性 RVV 证明。

已有 [env-exec.sh](research/sail-tooling-gap/islaris-reduction/env-exec.sh) 负责设置独立 `OPAMROOT` 和 `OPAMSWITCH`。日常命令都通过它运行。优先搬迁整个 `sail-tooling-gap/vendor/` 和 `sail-binary-reduction/vendor/`，保持旧绝对路径，再用第 7 节的命令核对。

如果路径改变，应在新位置重建 switch；只改环境变量不足以修复 OCaml 编译器中嵌入的旧路径。本次已从实际环境导出 [islaris-switch.export](research/migration/islaris-switch.export)，包含全部已安装包的元数据。`--freeze` 因 Dune 源归档缺少 checksum 被拒绝，因此这里保存的是成功的 **`--full` 导出**，不能称为完全冻结、已验证可重建的锁文件。

在一个尚未存在 opam root 的干净恢复目录，准备 opam 2.5.2（可从旧机复制 `vendor/islaris-tools/opam`）后，恢复入口如下：

```bash
SALTY_REPO="$PWD"
SALTY_OPAM="$SALTY_REPO/research/sail-tooling-gap/vendor/islaris-tools/opam"
SALTY_OPAM_ROOT="$SALTY_REPO/research/sail-tooling-gap/vendor/islaris-opam"
"$SALTY_OPAM" --root="$SALTY_OPAM_ROOT" init --bare --no-setup -y
"$SALTY_OPAM" --root="$SALTY_OPAM_ROOT" repository add coq-released \
  https://coq.inria.fr/opam/released --all-switches --set-default -y
"$SALTY_OPAM" --root="$SALTY_OPAM_ROOT" repository add iris-dev \
  git+https://gitlab.mpi-sws.org/iris/opam.git --all-switches --set-default -y
"$SALTY_OPAM" --root="$SALTY_OPAM_ROOT" switch import \
  "$SALTY_REPO/research/migration/islaris-switch.export" \
  --switch=islaris-demo --jobs=4 -y
```

export/import 用法见 [opam 官方 FAQ](https://opam.ocaml.org/doc/FAQ.html#Can-I-get-a-new-switch-with-the-same-packages-installed)。此导出不包含 Islaris/Isla 源目录、Sail IR、二进制或手工构建的 GMP。旧机曾在独立 prefix 构建 GMP 6.3.0 PIC 静态库，相关日志位于 `islaris-reduction/logs/gmp-*.log`。这里的重建入口尚未在新机执行，不能承诺一次成功。

恢复外部源文件时必须保持固定版本和哈希：当前 NEON kernel 使用 `islaris-pinned-aarch64.ir`，RVV 使用旧 `riscv64.ir`；`armv9p4.ir`、`rv64d.ir` 是其他实验的模型，不能按“更新版本”替换。

## 6. 迁移 Git 之外的本地资料

旧机实测：`.git` 约 72 MB，`research/` 约 15 GB，`build/` 约 1.1 GB；其中两处主要 vendor 分别约 4.4 GB 和 2.7 GB。它们不是新机的完整空间预算；递归子模块与后续构建还会增加用量。

| 内容 | GitHub 是否覆盖 | 迁移方法 |
| --- | --- | --- |
| 已提交源码、研究文档、精选证据、idea 卡片 | 是 | 完整 clone 当前工作分支 |
| 两处 `research/.../vendor/` | 否 | 连同源码、opam、模型和工具整体复制 |
| 日志、`.vo`、`.olean`、本地诊断目录、原始 trace | 大量未覆盖 | 私有工作区备份保留；编译产物仍需检查兼容性 |
| 四份大型历史 trace | 压缩版已覆盖 | 按 [trace-archive.json](research/sail-tooling-gap/bridge-audit/trace-archive.json) 校验并恢复 `.isla.gz` |
| `build/pr-sum` 额外 Git worktree | `proof/sum` 提交已发布；另有未提交笔记/图片 | 备份整个原目录，使用时重新建立 worktree 并恢复未提交资料 |
| `~/.elan`、仓库外工具、聊天会话 | 不在本仓库内 | 按需另行导出或重装；聊天历史不会因 clone 自动迁移 |

整理开始时，主工作树唯一未跟踪源码是 `islaris-reduction/vsrocq-exec.sh`，用于编辑器的 Coq load path。本次交接将它一并纳入版本控制，内容保持不变。当前主工作树没有根目录 `.local/`、`notes/memory/` 或 `.venv/`，但 **`build/pr-sum/notes/memory/` 实际存在**，包含先前讨论和计划。

`build/pr-sum` 中已确认有以下未提交资料，GitHub clone 无法恢复其本地版本；本次未改动或代为提交它们。逐文件哈希已记入 `environment.json` 的 `additional_worktrees`：

- 已修改：`notes/memory/DISCUSSION_LOG.md`、`PLAN.md`、`PROJECT_STATE.md`。
- 未跟踪：`notes/neon-sum-proof-structure.md`，以及 `notes/diagrams/neon-sum-proof-structure.{dot,png,svg}`。

这些资料补充了 2026-10-02 对 NEON 全部 20 条指令如何组合成求和定理的说明与图示。下面的整个工作区备份会包含它们。

要保留整个本地工作区，在新机执行以下备份模板，先替换 `OLD_SERVER`。使用单独的私有备份目录，可保留忽略文件和 Git 元数据供对照：

```bash
OLD_SERVER=old-user@old-host
SALTY_BACKUP="$HOME/salty-migration-20261002"
mkdir -p "$SALTY_BACKUP/workspace"
rsync -aH --info=progress2 \
  "$OLD_SERVER:/srv/home/yuechunsun/tools/lean/" \
  "$SALTY_BACKUP/workspace/"
rsync -aHnci \
  "$OLD_SERVER:/srv/home/yuechunsun/tools/lean/" \
  "$SALTY_BACKUP/workspace/"
```

备份前停下写入该目录的实验；第二次命令用 checksum 做只读差异检查，文件仍在变化时不能视为一致快照。备份可能含本地配置，保留在私人存储，不要把整个备份上传公开仓库。新机账号应自行配置认证。

把备份补充到第 1 节的新 clone 前，确认旧机备份和新 clone 的分支、HEAD 一致，且新 clone 没有待保留改动，再执行：

```bash
rsync -aH --exclude=/.git/ --exclude=/build/pr-sum/ \
  "$SALTY_BACKUP/workspace/" "$SALTY_REPO/"
git -C "$SALTY_REPO" status --short --branch
```

旧仓库还登记了 `build/pr-sum` worktree。需要恢复它时，在该目标目录尚不存在的前提下，从主仓库执行 `git worktree add -b proof/sum build/pr-sum origin/proof/sum`；不要直接使用备份中指向旧 `.git/worktrees/...` 的链接。然后从备份的 `workspace/build/pr-sum/` 恢复上面七份本地文件，并核对记录的哈希。其余编译产物和 `deps/` 也保留在备份中，使用前检查版本和链接路径。

如还需要一份可搬运的 Git 历史文件，可在旧机运行 `git bundle create /tmp/SALTy-rn-all.bundle --all`，随后 `git bundle verify /tmp/SALTy-rn-all.bundle`。bundle 不包含未提交文件、忽略文件或子模块的对象库，不能代替上述工作区备份。

## 7. 新机验收与继续工作

先做不启动大型证明的检查：

```bash
cd "$SALTY_REPO"
git status --short --branch
git fsck --full
free -h
df -h . /tmp
research/sail-tooling-gap/islaris-reduction/env-exec.sh coqc --version
research/sail-tooling-gap/islaris-reduction/env-exec.sh ocamlc -where
research/sail-tooling-gap/islaris-reduction/env-exec.sh dune --version
```

预期 Coq 8.19.0、OCaml 4.14.2、Dune 3.9.1；`ocamlc -where` 应指向实际恢复且可用的目录。再核对 `environment.json` 中的文件 SHA-256。`proof/sum` 的复查使用其自己的 Makefile/README；原研究目录的复查按以下步骤进行：

1. 若 Islaris 库未构建，先恢复其 source 与 switch，再按 `islaris-reduction/replay.py` 的构建入口准备库。该 replay 只检查早期指令 demo，不能作为当前完整 kernel 验收。
2. 当前 kernel 的检查入口是 `kernel-e2e/check.py FILE.v --timeout SECONDS`，独立检查入口是 `independent_check.py MODULE --name RUN_NAME --timeout SECONDS`。`coqchk` 需要已有 `.vo`；依赖必须先于使用者编译。
3. 创建相应 `logs/`、`results/` 目录。已有脚本会覆盖同名日志和结果 JSON；复跑前备份这些记录，新结果另存并注明机器、版本、源码哈希与日期，不要将环境缺失误写成历史证明失败。
4. 从 `KernelSpec.v` 等小模块开始（先满足其导入依赖），逐步扩大；每项设置有限时间和资源预算。原研究目录的全量复现顺序仍需依据源码导入关系和历史 command 记录整理；`proof/sum` 已提供整理后的构建入口，但没有覆盖全部历史实验。

128 线程不代表应同时启动 128 个 Coq 检查。历史上一个失败的加载尝试在约 35 分钟达到 300 GiB；条件 kernel 的一次 `Qed` 约 1174 秒，独立 `coqchk` 约 3523 秒。详见 [性能记录](research/sail-tooling-gap/kernel-e2e/NOTES-proof-performance.md) 和 kernel README。先核实新机内存，再决定并行度。不要通过删路径条件、换弱规格或加入公理来绕过困难。

## 8. 可直接交给新服务器助手的接手说明

> 这是我的 fork `Etha-Sun/SALTy-rn`。请完整克隆并使用 `feat/assembly-reduction-lean`，保留所有远端分支历史和递归子模块，并为 `proof/sum` 建立独立工作树。先读根目录 `AGENTS.md`、`SERVER_HANDOFF.zh-CN.md`，再读 `research/sail-tooling-gap/CHECKPOINT.md`、`presentation/STATUS.md`、两条 `research/ideas/` 卡片，以及 `proof/sum` 中 Coq 项目的 README 和 verification.json。旧 `build/pr-sum` 还有七份未提交笔记/图示，须从私有备份恢复。
>
> 请先报告当前 HEAD、环境恢复情况、已证明范围和剩余义务。NEON 简化 kernel 已有部分正确性证明；研究分支的 RVV 完整结果仍依赖 `Hload`，加载 VL=2..8 和最终跨 ISA 等价性未完成。`proof/sum` 记录了 131 个模块的递归检查，但没有完整 RVV 程序定理。不要把历史检查记录说成新机复跑结果。
>
> 我希望继续整理和讨论不确定的研究想法，结合项目背景、官方资料及实验来判断，不要直接把候选方向当成定论。两条想法分别是共同确定性规格隔离顶层 ISA 模型，以及受限程序类归约到 vl=1/2 参考执行；都要评估额外证明义务和总体成本。恢复时保留旧日志、失败实验及未提交资料，先做小范围检查，再决定后续实验。
