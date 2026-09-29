# NEON ↔ RVV：接入、类型与规格映射实验

本轮交付针对双方真实 reduction 二进制，完成指令盘点、代表性指令接入、类型差异分析和两种映射路线的小实验。**没有完成任意长度的 kernel 等价性证明。** 固定 16 字节的小块用于定位问题，不是项目最终要求的替代品。

建议先读 [结论与路线判断](REPORT.zh-CN.md)，再看 [双方规格对照](SPEC-COMPARISON.zh-CN.md)和 [逐条覆盖表](COVERAGE.zh-CN.md)。

## 可以直接查看的文件

| 文件 | 它具体说明什么 |
|---|---|
| [neon-kernel.dump](neon-kernel.dump)、[rvv-kernel.dump](rvv-kernel.dump) | 从现有 ELF 校验的 42 条 NEON / 19 条 RVV 指令 |
| [NEON uadalp Isla](generated/neon_uadalp8/a2105bc.isla)、[Coq](generated/neon_uadalp8/a2105bc.v) | 字节成对扩宽、16 位累加的真实模型表示；[行为定理](NeonPairProof.v)与[第一 lane 的类型映射](NeonLaneBridge.v)均已检查 |
| [NEON 16→32 位累加](NeonWordProof.v)、[加载证明](NeonLoadProof.v) | 两种实际指令的完整结果契约，保留后续执行需要的系统寄存器；加载要求明确的 RAM 范围及 16 字节对齐 |
| [NEON addv Isla](generated/neon_addv/a2105dc.isla)、[Coq](generated/neon_addv/a2105dc.v)、[行为证明](NeonProof.v) | 对任意输入寄存器值，四个 32 位 lane 模加，结果写入 v0，其他向量寄存器不变 |
| [RVV 扩宽 Isla](generated/rvv_widen/a800001d2.isla)、[Coq](generated/rvv_widen/a800001d2.v) | 8→32 位扩宽，VLEN=256、vl=16、m8、tu；已证明目的组预置零时第一 lane 的结果 |
| [RVV 加法 Isla](generated/rvv_add/a800001d6.isla)、[Coq](generated/rvv_add/a800001d6.v) | 在同一配置下的向量加法；导入成功 |
| [RVV 符号地址加载](generated/rvv_load_symbolic/a800001ca.v)、[NEON 对应加载](generated/neon_load_ram/a210604.v) | 明确 RAM/平台/对齐前提下的真实加载 trace，均已导入；NEON 对齐加载已有行为契约，RVV 尚未证明 |
| [RVV 动态 vl 加法](generated/rvv_add_allvl/a800001d6.v)、[扩宽](generated/rvv_widen_allvl/a800001d2.v) | VLEN=256、e32/m8/tu 下，符号 vl 覆盖 0…64；已导入，未证明整个循环 |
| [NEON 局部求和规格](NeonBlockSpec.v)、[八 lane 映射](LanePacking.v)、[四 lane 映射](WordPacking.v) | 从 ISA 已证结果函数转换到整组模加总和；明确要求 u16 不溢出；尚未组合实际控制流 |
| [TypeBridge.v](TypeBridge.v) | 基于两种寄存器布局的观察函数，以及已检查的 bv 8/16/32 扩宽引理和溢出反例 |
| [Mapping.v](Mapping.v) | Coq 检查的算术映射：shared spec 和直接关系两种证明，以及去掉范围约束的反例；尚未与整个 ISA kernel 组合 |
| [SMT 小块比较](compare_blocks.py)、[结果](results/block-comparison.json) | 基于真实 trace 的算术组合比较；5 项得到预期结果，1 项 `unknown`；不是 Coq 认证的转换器 |
| [Coq 重放结果](results/replay.json)、[独立复核](results/coqchk-bridge.json) | 27 项重放检查通过；十一份 NEON/数学证明额外通过 coqchk；包含源文件散列 |
| [RVV 已完成证明](RvvProof.v)、[运行结果](results/attempt-RvvProof.json) | 第一 lane 的扩宽性质，目的寄存器预置零；原版 coqc 在 5564.047 秒后通过，Qed 完成、无额外公理；不等于全部 lanes 或整个 kernel 已证 |

之前的 RVV [vsetvl 定理](../islaris-reduction/VsetProof.v)、[64-lane vredsum 定理](../islaris-reduction/InstructionProof.v)继续作为已有成果；本轮没有把它们扩大成完整循环证明。

## 在当前工作区重放

使用已经安装的 `../islaris-reduction/env-exec.sh`、Coq 8.19、Islaris 核心库和 Isla。路径由脚本按工作区定位；部分底层工具链配置仍依赖本机已安装位置。这是当前工作区可复现包，尚未做容器化的全新机器安装包。

```bash
# 重放已完成的 Coq 检查；包括 13 个 trace 导入、十一份证明、独立复核和负例。
python3 research/sail-tooling-gap/bridge-audit/replay.py --coqchk

# 重新提取双方算术与 NEON 加载。使用 ELF 中的数字 opcode，不重新汇编。
python3 research/sail-tooling-gap/bridge-audit/probe.py \
  neon_addv neon_uadalp8 neon_uadalp16 neon_load neon_mul rvv_widen rvv_add

# 重放 SMT 诊断。含一个已知 unknown，退出码 1 是对未全通过的如实报告。
python3 research/sail-tooling-gap/bridge-audit/compare_blocks.py

# 使用修正后的平台配置，提取符号地址加载和动态 vl 加法。
python3 research/sail-tooling-gap/bridge-audit/probe.py \
  rvv_load_symbolic neon_load_ram rvv_add_allvl rvv_widen_allvl --timeout 7200

# 重跑已通过的原始 RVV 扩宽证明；本机约 93 分钟，每 30 秒记录 CPU/内存。
python3 research/sail-tooling-gap/bridge-audit/continue.py --timeout 7200

# 更新逐条覆盖表。
python3 research/sail-tooling-gap/bridge-audit/audit.py
```

RVV 原版使用标准 Coq 内核完成检查；独立 coqchk 的十一份文件不包含这份长时间证明。

新提取会覆盖相应产物，应在之后重跑 `replay.py` 和 `audit.py`。`replay.py --attempt-rvv-proof` 另外尝试当前 RVV 扩宽证明，默认预算 7200 秒（可用 `--proof-timeout` 修改）；默认检查不把长时间 RVV 检查是否成功与已完成定理混在一起。`--compare-smt` 可一并执行 SMT 实验，但其结果仍独立列出。

## 模型与信任边界

- ARM 使用原版 [isla-snapshots 的固定 aarch64.ir](https://raw.githubusercontent.com/rems-project/isla-snapshots/b58da9170470a422c9396983ac8f87f0a63ba6f8/aarch64.ir)，存于 `../vendor/islaris-pinned-aarch64.ir`；没有修改 ISA 实现。配置从本地 Islaris 的 `etc/aarch64_isla_coq.toml` 派生，打开 SIMD、修正工具链路径。
- RVV 使用之前已验证实验的原版 `../vendor/riscv64.ir`，快照提交 `d8b31014643035a3b11071e56ef30001de3f52ab`；固定探针将 vl 设为 16、vtype 设为 `0x93`，保留 tu 行为；另有 vl=0…64 的符号配置。RVV load profile 补齐普通 Sail 函数读取的平台寄存器，未修改 ISA IR；详见报告。
- Isla/Islaris 走原有前端、`--no-model-reg-init --executable`，沿用之前的 `-s` 前端选项。Coq 文件是 trace 数据；行为定理另外证明。
- Coq 完成的定理没有额外公理；这不等于 Sail→Isla 整条翻译链已经在 Coq 内验证。ISA 模型、提取器/其 SMT 使用、前端及相应语义关联仍属于这一工作流的信任边界。
- `compare_blocks.py` 是本轮编写的诊断 harness，未经 Coq 认证。它保留所选 trace 的寄存器约束，拒绝内存和分支事件；为逐指令调用恢复 Sail 在 trace 起点之前做的内部 `SEE` 重置；把 fresh read 变量用等值 `let` 绑定以减少大位向量求解。**不能把该 harness 的 UNSAT 当成最终“LLM 不在 TCB”的端到端证明。** 最终需要把映射和组合义务交给证明检查器。

ELF 字节、地址和 SHA-256 由 `probe.py` 对照现有元数据及 ELF 的可执行 PT_LOAD 段核对。检查时的模型、trace、Coq 与脚本散列记录在 `results/replay.json`；最终交付文件散列见 `results/manifest.json`。

`attempts/` 下的 `Abort` 探针和尚未通过的 `Rvv*Proof.v` 诊断变体不属于已完成证明；请以重放结果列出的文件及其散列为准。
