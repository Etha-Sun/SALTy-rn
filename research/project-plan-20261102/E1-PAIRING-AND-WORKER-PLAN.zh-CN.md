# E1 源码配对、spec 资产、性能配置核对与 worker 方案

2026-11-04。状态：**核对完成，没有启动任何证明、worker 或性能测量。** 本文不宣称任何 E1 kernel 已验证。原始数据与脚本：[e1-pairing-20261104/](e1-pairing-20261104/)（`pairing-raw.json`、`signatures.json`、`proof-assets.json`、`scripts/`）。上游克隆位于旧服务器 `build/e1-source-pairing-20261104/upstream/`，未修改，也未提交；新服务器按第 1 节的提交号重新克隆。

## 1. 源码身份（A / B0 / Bopt）

| 角色 | 固定来源 | 结论 |
|---|---|---|
| Bopt 最终优化 RVV | `keaganchern/optimized-rvv-kernels@80feb4564` | 35 个文件，与[清单](KEAGAN-FINAL-SOURCE-INVENTORY.json) blob 一致 |
| A 原始 NEON | `keaganchern/SALTy-rn@be16280c7`，`kernels/source/<k>.c`，入口 `test_neon` | 35/35 按文件名找到，参数类型与 Bopt 一致 |
| B0 优化前 RVV | 同提交 `kernels/target/<k>.c`，入口 `test_rvv` | 35/35 存在；作者 `optimize/bridge.py` 以它作为 Autocomp baseline。**它是公开 catalog 的翻译 baseline，尚未证实就是生成每个最终文件时的实际起点**（与 `build/salty-version-audit-20261103` 结论一致） |
| D 手写 RVV 基线 | SALTy-rn 子模块 XNNPACK `867d5a344` | 按家族选候选；与旧论文柱子的绑定缺失 |

配对特殊项：

- 两个文件名不同：`dwconv2d-chw.c` 对应 `f32-dwconv2d-chw`，`x32transpose.c` 对应 `x32-transposec`。
- `x32transpose.c` 的入口名是 `xnn_x32_transposec_ukernel__8xv2_rvv`，不是 `test_rvv`，harness 需要重命名适配，并记录这项修改。
- 没有任何 Bopt 与 B0 字节相同。
- 22 个 Bopt 带 `__restrict__` 或 `XNN_OOB_READS`，A 本身也多处带这些标注，所以不是全部新增。但个别 Bopt 的 `restrict` 出现次数多于 A 和 B0（例如 u8-vclamp：Bopt 5、A 1、B0 0；f32-vmul：5/1/1），可能有局部变量或额外参数被加上了不别名标注。`restrict` 在 C 语义上给调用者增加了不别名的义务，需要逐参数核对；若 Bopt 加强了别名前提，必须在 spec 中显式写出并审查，不能悄悄当成已有条件。
- 本仓库 fork 没有 `be16280`（“adding 4 missing kernels”）：本地 `kernels/target/u8-vclamp.c` 为空，`f32-gemm-minmax.c` 有未提交的本地 NaN/FMA 修改。E1 一律使用上游 `be16280` 的冻结副本，不读本地工作树版本，也不改动这些本地文件。

## 2. 可复用的 spec / 证明资产

历史 QCP 包 `build/four-isa-vabs/verification/qcp/verified/`（基线 `821969733`，即 E 冻结修复）对 35 个名字都有 `spec.c`，但：

- **旧 RVV 与 Bopt 对 35/35 都不一致**（去注释和空白后比较）。旧 RVV 只在 13 项与 B0 一致。因此没有任何一项可以继承旧证明结论，只能复用合同、引理和方法。
- **旧 NEON 与上游原始 A 只在 15 项一致。** 其余 20 项有差异，从 2 行到 516 行（conv-hwc2chw、dwconv2d-chw、packw、argmaxpool、maxpool 较大）。其中部分是历史上的 NEON 修复，例如 argmaxpool 的 size_t→int 和尾读修复。E1 以原始 A 为准：若这些修复确属 A 的真实错误，按执行规范单独提出并逐项确认，不能静默沿用。
- 旧包固定 **VLEN128**。Bopt 是为 Saturn 的 VLEN512/DLEN256 优化的，且有多处硬编码块宽，例如 gemm 的 `vsetvl_e32m2(8)` 和 qd8-gemm 的 `vsetvl_e32m4(16)`。这类代码可能要求 VLMAX 不小于某个块宽，所以证明 profile 必须单独决定（见第 5 节）。
- 观察关系按 kernel 不同：vadd 等用“数值相等或双方 NaN、±0 视为相同”，argmaxpool 用“精确位，保留 payload”。E1 需要统一审阅每项的观察关系，不能沿用后不说明。

## 3. 性能配置

- 已有可用的本地平台：Verilator Saturn RTL `GENV512D256ShuttleConfig`、chipyard `973f8732`（与上游子模块一致）、GCC 15.2 O3、AVL=0 重置、64 字节对齐。已有 13 类 kernel 的 A/C/D/E 实测（`build/salty-version-audit-20261103/`）。这些测的是 C=Bopt，可作为 Bopt 的现成性能数据；修复版另测。
- **论文协议无法从公开来源恢复。** `bridge.py` 依赖 `autocomp.hw_config.SaturnHardwareConfig` 和 RVV harness，但固定的 Autocomp `d477d05` 中没有 RVV/Saturn backend。FireSim 配置、`kernel_cycles()` 和出图源码都缺失。这是需要找 Keagan 获取的外部阻塞；在此之前，只报告本地一致协议，不称“复现”。
- 默认参数也不一致：SALTy-rn 翻译默认 VLEN256，Autocomp 默认 VLEN512/DLEN256。

## 4. 服务器资源（2026-11-04 19:04 实测）

128 线程，总内存 1.1 TiB，但**可用内存只有约 92 GiB**，load 约 100：另一用户的大批 klee 进程每个占 12–14 GiB。本账户下已有十余个长期运行的交互式 codex 进程，不能干扰。在这种负载下，起步建议 2 个证明 worker，每个限 32 GiB，GEMM/conv 类再单独限流；RTL 性能测量与证明分开串行进行。

## 5. Worker 工具和模型的实测可用性

| 入口 | 结果 |
|---|---|
| `codex exec -m gpt-6-astra` | 可用（最小探测返回 OK） |
| `codex exec -m gpt-6.1-sol` | 可用 |
| `claude -p` + litellm 配置（路由到 gpt-5.5） | `error_during_execution`，当前不可用 |
| `claude -p` + timesniper 配置（GLM-5.1 / gpt-5.x） | 90 秒超时，当前不可用 |
| DeepSeek | 本机没有任何 key、CLI 或 provider 配置 |
| cursor-agent | 已安装，未探测账户与模型 |

能力判断（证据与推测分开）：

- **证据**：旧 40 项与 vabs 四端都由 astra/sol 级模型完成，仍然多次遇到工具阻塞、长时间证明和需要撤回的“已完成”判断。单个 f32-vadd 的历史记录中，QCP 符号执行约 186 秒，coqc 有 88 条命令、累计约 1238 秒。
- **推测，未测**：较弱模型在复用现成合同和引理的逐元素 kernel 上可能可行，但在新不变量、VLA 与固定宽度对应、GEMM/conv 和工具阻塞诊断上大概率不够。目前没有本任务上的对照数据。
- **建议**：只在同一试点任务上，以相同预算、相同验收门禁做受控对比，再决定是否把简单 kernel 交给便宜模型。监督者对所有模型执行同一套验收，弱模型不能降低门禁。

## 6. 任务分组（35 项；按家族与难度）

| 组 | Kernel | 建议模型 | 备注 |
|---|---|---|---|
| G1 f32 逐元素 | vadd vsub vmul vdiv vsqrt vrndne vlrelu vmulc vcmul vmax vmin | sol | vmax/vmin 已有确切 NaN 反例（QEMU 与 bounded 检查都复现），进入反例与修复流程，不算待证 |
| G2 整数/转换 | u8-vclamp s8-vclamp qs8-vcvt qs8-vlrelu qs8-vadd-minmax qu8-vadd-minmax qs8-vmul-minmax-fp32 qs8-f32-vcvt qu8-f32-vcvt f32-f16-vcvt | sol | 量化舍入与饱和；`restrict` 合同 |
| G3 归约 | qs8-rsum qu8-rsum qs8-rdsum qu8-rdsum | sol，必要时升级 astra | 求和顺序与溢出域 |
| G4 池化/搬运 | f32-argmaxpool f32-maxpool x32-transposec x32-packw-gemm-goi | astra | OOB 读、指针表、transpose 入口名适配 |
| G5 卷积/GEMM | f32-dwconv-minmax f32-dwconv2d-chw f32-conv-hwc2chw f32-gemm-minmax f32-igemm-minmax qd8-f32-qc4w-gemm-minmax | astra | 最难；硬编码块宽依赖 VLEN |

## 7. 下一步（按执行规范第 9 节）

1. **单 kernel 试点：f32-vadd，Bopt 对 A。** A 与旧包一致，旧 spec 可直接审阅复用；Bopt 与 B0 差 62 行，有优化结构；使用一个 `codex exec --json` sol worker、独立目录和明确预算。试点用来确认目录隔离、token/时间台账、主目标验收、中断恢复和监督检测，然后才扩展到 G1/G2。
2. 需要用户决定：证明 profile 用 **VLEN512/DLEN256**（与性能测量一致，推荐）还是沿用 VLEN128（复用更多，但验证版本与测量配置不一致）。
3. 向 Keagan 索取 Autocomp RVV backend、FireSim 配置与计时 harness，以及每个最终文件的实际 baseline。
4. 若要评估弱模型：先配置 DeepSeek 等入口，修好 Claude 代理，再做第 5 节的受控对比。
