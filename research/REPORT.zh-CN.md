# SALTy-RN、neon2rvv 与通用循环验证调研

审计日期：2026-09-06（Asia/Seoul；用户时区为 2026-09-05）。
本文用 **Confirmed** 表示源码或本次实验确认，**Inference** 表示从证据推导，**Proposal** 表示尚未实现的建议。

结论：可以把 neon2rvv 用作保守的初始 RVV 候选生成路径，再优化 RVV；但当前版本不适合直接作为“NEON 翻译必然正确”的可信依据。建议验证 `NEON ≈ baseline RVV` 与 `baseline RVV ≈ optimized RVV` 两条边。语义底座采用有状态、带内存的结构化 imperative IR，NEON/RVV 保留各自的 intrinsic 语义；现有 element-wise 模板作为证明自动化继续使用。这样支持什么程序不再由 `map/zipWith` 模板决定。

## 1. 仓库与分支：最新工作究竟是什么

**Confirmed**：仓库克隆在 `/srv/home/yuechunsun/tools/lean`，当前 checkout 为 `feat/elementwise-verification`。所有 origin 分支已随 clone 获取。参考仓库位于相邻的 `neon2rvv-reference`。没有推送、改写 kernel、修改原有证明或改动 toolchain pin。大型 submodule 未初始化；下文没有把其记录的契约证据当作本次重新审计过的上游代码。

| origin 分支 | commit | 提交时间（原时区） | 经核实的定位 |
|---|---|---|---|
| `main` | `94e88f4` | 2026-07-15 -0500 | 原有运行 pipeline + 早期 Lean/IR 研究；不是最新 element-wise 状态 |
| `rfc/typed-neon-rvv-lean` | `e384374` | 2026-08-06 -0500 | typed integer IR、synthetic clamp、边界与验证收紧 |
| `feat/neon-rvv-to-lean` | `f6ff9c4` | 2026-08-24 -0500 | 真实 C pair 的 restricted Clang frontend、独立 Lean value models、部分任意长度证明 |
| `feat/dashboard` | `890d2b5` | 2026-08-29 -0500 | artifact/verification dashboard；历史中已有 element-wise 工作 |
| `feat/elementwise-compiler` | `ba5b341` | 2026-08-30 12:45 -0500 | 通用化的 element-wise artifact compiler，保留较多审计与研究材料 |
| `feat/elementwise-verification` | `7ea7bf3` | 2026-08-30 19:32 -0500 | 最新整理发布分支：精简 tooling/notes，集中公布验证结果链，并增加全局 capability 检查 |

最新分支是 compiler 分支后续的发布整理；不能因为它删掉大量 dashboard、审计和 memory 文件，就认为这些研究从未发生。早期 `main/notes/memory` 中“没有 C-body emitter”等结论已经过时，不能移用到 8 月分支。当前分析以完整 SHA `7ea7bf35317eb5434341c2f4f3b72776a1a5deae` 为准。

### 实际有两条不同的 pipeline

**Confirmed：运行与优化主线。**

```text
prepared NEON C（test_neon）+ prompts / intrinsic docs
  → LLM 生成 RVV C（test_rvv）
  → 编译 + Spike differential gate ↔ 编译/执行错误修复
  → symbolic C++ harness → SMT bounded equivalence ↔ 反例驱动修复
  → 可选 autocomp beam search（性能测量 + correctness harness）
  → optimized RVV C
  → 再次与原始 NEON 做 bounded verification
```

证据：[`pipeline.py`](../src/workflow/pipeline.py) 的 `translate_kernel`、`_run_formal_verification`、`_optimize_and_reverify`，以及 [`optimize/bridge.py`](../src/workflow/optimize/bridge.py)。autocomp 需要明确的 `prob_id` 和对应 harness，不能仅凭给一个任意 kernel 自动完成性能评价。

两份 C 被放进同一个 C++ harness，intrinsic shim 构造符号表达式；数值输入可符号化，但循环按照当次具体 batch、维度、VLEN 执行。断言输出不同后得到 UNSAT，只覆盖对应有界配置。默认 `auto` 是纯 BV→Bitwuzla、FP→cvc5 的路由，Bitwuzla 不可用时降到 cvc5。源码注释的“unbounded batch sweep”指在时间预算内不断增加 batch，不是对任意自然数 batch 的归纳证明。`PARTIAL` 且已验证 batch 非零也可能被运行 pipeline 记为 verified；应保留最大 batch 与具体 domain。[实现](../src/workflow/verification/orchestrator.py)

**Confirmed：最新 element-wise 验证主线。**

```text
显式 NEON C + 显式 RVV C + 两侧 parse facade / target / 函数名
  → Clang typed AST / calls / definitions / controls
  → exact intrinsic capability + scalar layout + schedule recognition
  → ExternalCondition + ProgramManifest
  → 独立生成 Models.lean → 冻结 Spec.lean
  → phase / scalar edge counterexample search
  → ProofTask → Proof.lean → Lean / hash / theorem / axiom policy checks
  → Result.json → curated published results
```

这里的 “compiler” 是 **C pair→验证 artifact 的编译器**，没有负责 NEON→RVV 程序生成。它接收已经存在的两份 C。原运行入口仍调用 bounded verifier；没有发现自动将该新验证路径串进 `salty-rn --optimize` 的集成。

证据：[`compiler.py`](../src/workflow/verification/elementwise_compiler/compiler.py)、[`README`](../src/workflow/verification/elementwise_compiler/README.md)、[`ARCHITECTURE`](../notes/elementwise-compiler/ARCHITECTURE.md)。

### 当前结果的准确含义

**Confirmed**：40 个 source，37 个同名 target 文件，其中 `u8-vclamp.c` 为空，所以可读的非空 pair 是 36 个。缺 target 的三个是 `qd8-f32-qc8w-gemm-minmax`、`qd8-f32-qc8w-igemm-minmax`、`qs8-qc8w-gemm-minmax-fp32`。

Corpus scanner 找到 20 个 element-wise-shaped pair：19 个 scalar-lane，另有 `f32-vcmul` 因 grouped/planar complex layout 延后。19 个的公布状态是：

| 状态 | kernel |
|---|---|
| `verified(value)`，2 个 | `f32-f16-vcvt`、`f32-vrndne` |
| 浮点反例，9 个 | `f32-vadd`、`f32-vdiv`、`f32-vlrelu`、`f32-vmax`、`f32-vmin`、`f32-vmul`、`f32-vmulc`、`f32-vsqrt`、`f32-vsub` |
| phase equality 反例，1 个 | `s8-vclamp` |
| `external-condition-missing`，7 个 | `qs8-f32-vcvt`、`qs8-vadd-minmax`、`qs8-vcvt`、`qs8-vlrelu`、`qs8-vmul-minmax-fp32`、`qu8-f32-vcvt`、`qu8-vadd-minmax` |

来源：[`CorpusReport.json`](../verification/elementwise-results/CorpusReport.json) 及各程序 artifact。8 个程序的 external condition 缺失与 7 个最终 blocked 不矛盾：S8 clamp 也缺参数域，但它已有 phase 反例。

必须区分：S8 已发表的命题是 `¬ neonPhaseFunctionsEqualClaim`，不是完整 C pair 不等价定理。`min=5,max=0,x=0` 时两种 clamp 顺序分别给 0 和 5，说明不能无条件把两 phase 合成一个元素函数；它没有证明真实 XNN caller 会传入这个参数。9 个浮点反例则否定各自 `completeValueEquivalenceClaim`。

**Confirmed：本次重放。** 7 个基础 Lean 模块、2 份正向 proof、10 份 counterexample 全部在本机 Lean **4.29.1** 编译。2 份正向定理的 transitive axioms 只有 `propext / Classical.choice / Quot.sound`；10 份反例包含 `native_decide` 生成的 native axiom。因此反例的检查还信任 native 编译/执行。仓库 pin 是 4.29.0，本次不冒充原 toolchain/policy 的完整再认证。[结果](lean-replay.json)；[重放脚本](replay_lean.py)

**Confirmed：FP 并未成为纯 bit-level IEEE 形式模型。** 当前 [`FP32.lean`](../src/verification_bw/lean/SALT/Intrinsics/FP32.lean) 的 NaN 分类、payload、invalid case 等已显式区分，但正常加减乘除仍经 `Float32.add/sub/mul/div` 的 host-backed 运算。`BitVec 32` 输入输出并不自动意味着中间算术已纯形式化。证明可以利用两边共享运算而成立；这不构成该共享运算符合 Arm/RVV 的独立证明。

## 2. neon2rvv：原理、落地可行性与 TCB

参考版本：`howjmay/neon2rvv@2abbe36cc3c52d4616f854f88894e5be11b96580`，提交时间 2026-04-25。

### 它是不是逐行翻译

**Confirmed**：它是 header-only API compatibility layer。替换 `#include <arm_neon.h>` 后，NEON 类型映射为 RVV 类型，原 NEON intrinsic 名称变成 `static inline always_inline` 的 RVV 实现。普通 C 的赋值、if、for、while 仍交给 C 编译器处理。没有源到源转换器逐行读取并输出一个 RVV `.c` 文件。[项目说明](https://github.com/howjmay/neon2rvv)

例如固定 16 个 8-bit lane 的加法包装为：

```c
vaddq_s8(a, b)  → __riscv_vadd_vv_i8m1(a, b, 16)
vld1q_f32(p)   → __riscv_vle32_v_f32m1(p, 4)
vst1q_f32(p,v) → __riscv_vse32_v_f32m1(p, v, 4)
```

对应本地 [header](../../neon2rvv-reference/neon2rvv.h) 第 269、13619、13867 行。`vget_low_s8` 直接返回相同的 RVV value，后续操作用较短 active length 限制可观察部分；`vzipq_s8` 则需要 widen、multiply-accumulate、reinterpret、slide 和 tuple create/get 的多条操作。因此是 **每个 API 一个实现配方，可能一对多**，不保证一 intrinsic 一 RVV 指令。

**Inference**：它适合初始机械 baseline：控制流和固定块宽基本保持原状，很适合第一条局部 simulation proof。它不会自动把 `i += 4` 升级成任意 VLEN 的大块 strip-mining。编译器会优化内联表达式、安排 `vsetvli`，但不能预期它自动完成所需跨循环优化。若优化器需要显式 RVV C/IR，还需另建 wrapper expansion / lowering 并绑定产物；C preprocessor 的 `-E` 仅展开宏，并不把普通 inline 函数调用自动展开为目标 C。

### 本次实际发现的适配与语义缺口

**Confirmed**：审计脚本去除注释、固定 `XNN_ARCH_ARM64=1` 后，在 40 个 source 中找到 178 种 NEON call spelling；header 有定义的为 176 种。缺失 `vzip1q_f32`、`vzip2q_f32`，该版本仅有注释声明，实际被 `f32-conv-hwc2chw` 使用。跨所有文本预处理分支计数是 190 种，二者口径不同。**名称覆盖不是编译通过率，更不是语义覆盖率。**[完整库存](corpus-audit.json)

| 核实项 | 证据与影响 |
|---|---|
| tuple 表示 | header 将 `uint32x2x2_t` 等 typedef 为 RVV built-in tuple；SALT 的 `f32-spmm-minmax`、`x32-packw-gemm-goi`、`x32-transposec` 直接读写 `.val[]`。需改用 tuple get/set 或独立适配层，不能原样 include 即兼容 |
| VLEN | README 仍描述初期 VLEN=128；当前源码 gate 接受 `__riscv_v_min_vlen` 为 128/256/512。这个宏是编译期 minimum，不能据此声称所有实际硬件 VLEN 都已经验证 |
| `vmlaq_f32` | header 第 1246 行使用 `vfmacc`；ACLE 给出的操作是乘法后加法。允许/禁止 contraction 的编译 profile 必须固定；在 separate-rounding profile 下两者不等价 |
| `vrndnq_f32` | 第 1702 行先 float→signed int32 再转 float；例如 `2^40` 本来已是整数，应保持自身，此路径饱和到 int32 上限后转回约 `2^31`。NaN、无穷、负零也需要检查。这是库级缺口，当前 SALT `f32-vrndne` 并没有调用该 intrinsic |
| `vmaxq_f32 / vminq_f32` | 当前 q 版本已有 NaN mask + `NAN` 合并，不能误报成简单 `vfmax`。但它没有逐位保留任意 Arm NaN payload；64-bit vector 的 `vmax_f32 / vmin_f32` 又是直接 RVV max/min，需要分别验证。SALT SpMM tail 使用后一组 |
| 预处理路径 | 在 RISC-V 编译时 XNN 的架构宏可能选中不同 `#if` 分支。必须绑定 baseline 对应的预处理结果，不能把“同一文本”误当作“同一个程序” |

Arm 官方表明确区分 `vmla` 和 `vfma`，`vrndnq_f32` 对应 FRINTN；RISC-V vector min/max 使用 minimumNumber/maximumNumber，浮点转换有超界饱和行为。[Arm ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html)，[RVV 1.0 官方规范源](https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc)

**Confirmed：本次运行了有限正常数 FMA 公式反例。** `a=-1,b=1+2^-23,c=1-2^-23`，先乘再加给 `0x00000000`，fused 给 `0xA8800000`。脚本是 host binary32 公式实验，不是 ARM/RVV 指令执行实验。它直接说明在 separate-rounding profile 下采用该 wrapping recipe 不安全。`f32-vcmul` 的虚部真实使用 `vmlaq_f32`，因此与 corpus 有直接关系。[源码](fma_witness.c)

本次未运行 neon2rvv 的 RISC-V 全套测试或 40 个 kernel 的 RISC-V build：本机默认 Clang 14 没有所需现代 RVV API 环境，也未部署 Spike/QEMU 与该库匹配的交叉工具链。不将静态审计包装成这些实验已经成功。

**Confirmed**：库的 `tests/impl.cpp::test_vmlaq_f32` 使用 `validate_float_error(..., 0.0001f)`，而不是 bit equality。因此即使该测试通过，也不能推出 SALT 所要求的逐位相等；测试 oracle 与目标 claim 必须对齐。[测试实现](../../neon2rvv-reference/tests/impl.cpp)

### 能不能作为 TCB

TCB 是“若它有 bug，结论仍可能错误而验证器不知道”的部分，不是对库可靠性的认证。

| 用法 | 可以声称什么 | 信任代价 |
|---|---|---|
| 直接信任 neon2rvv，证明 `B≈O` | 优化保持 neon2rvv baseline 的语义 | 可以形式上把库放入 TCB，但 `N≈B` 是未证假设；上述缺口使这个选择不适合作为严格 NEON 正确性结论 |
| untrusted candidate + 每个 pair 检查 `N≈B`、`B≈O` | 所选 domain 内原 NEON 与优化 RVV 对齐 | 推荐：库、LLM、优化搜索都不必成为等价证明的可信实现 |
| 给所用 wrapper 建 reviewed lowering certificate | 一组被验证过的局部翻译组成整体翻译 | 中长期推荐：仅覆盖实际 reachable wrapper closure，而非先证明 18k 行全库 |

**Proposal**：冻结一组 reviewed intrinsic denotation，并证明局部关系：

```text
OperandRel(neonArgs, rvvArgs) ∧ EnvContract
  ⇒ ResultRel(execNeon(op, neonArgs), execRVV(recipe(op), rvvArgs))
     ∧ compatible memory effects
```

输入输出只对 live NEON lane 与相应 RVV lane 建关系，不要求整个物理寄存器相等。对 load/store 要包含 footprint；对 permutation 必须证明所读 lane 已定义；对 rounding 必须包含 mode、shift、饱和规则。然后用共同控制流的 sequence/branch/loop simulation 组合 `N≈B`。

第二条边 `B≈O` 在 RVV IR 内做 relational proof / translation validation，可复用相同 RVV denotation。优化器提出程序和 certificate，检查器固定 semantic definitions、契约和观察对象。重新证明到原 NEON 仍可作为最终交叉检查。

这条链至少还信任或证明：C/Clang→IR extraction、内存/UB model、intrinsic 与 ISA 的对应、IR→实际输出 C 的对应。若最终声称 binary correctness，还要加 C compiler/assembler 的桥。一个 `.json` hash 证明的是“产物绑定”，不是转换的语义保持。

### 如何优化这个 baseline

**Proposal**：先固定 VLEN=128 的可检查 baseline，随后分别引入更宽 LMUL、减少冗余转换/重复 load、合法的跨 intrinsic 融合、动态 strip-mining、tail elimination、布局变换与循环变换。每类变换产出证明义务，不用“RVV 语法看起来更短”代替正确性和性能测量。

浮点 reassociation、FMA contraction、reduction 分组改变不能作为默认恒等式；无掩码 load 后 merge 也不能当作 masked load。benchmark 对比固定输入分布、硬件 VLEN/DLEN、编译器和 flags，记录 cycles；baseline 能运行与 baseline 达到性能目标是两件独立的验收项。

## 3. program + proof 一起生成：已有先例与本项目定位

**Confirmed**：这是成熟形式化研究路线中的常见结构，近年的 LLM verified code generation 也广泛研究。不能仅以“同时生成程序和证明”作为新颖性；但它还不是通用低级 SIMD 程序上已经解决的自动化问题。

| 路线 / 原始来源 | 实际做法 | SALT 可借鉴之处 |
|---|---|---|
| [Translation Validation，Necula，PLDI 2000](https://people.eecs.berkeley.edu/~necula/papers.html) | 检查每次编译结果是否保持输入语义 | 不必证明 LLM 或优化搜索算法总是正确 |
| [Extensible proof-producing compilation，Myreen](https://www.cl.cam.ac.uk/~mom22/extensible-compilation.pdf) | 编译产出代码，再产生可检查的正确性定理 | code generation 与可信 checker 分离；证明可依赖反编译/语义摘要 |
| [CompCert](https://compcert.org/man/manual001.html) | 对各编译 pass 的语义保持证明进行组合 | 通用 IR、内存与 control semantics 的分层；不是每次都让 LLM 从头证明 |
| [Fiat Crypto，IEEE S&P 2019](https://people.csail.mit.edu/jgross/personal-website/papers/2019-fiat-crypto-ieee-sp.pdf) | 领域内正确构造的代码生成与编译 | 把位宽、低级操作和优化证明做成可复用基础设施 |
| [LLMLift，NeurIPS 2024](https://proceedings.neurips.cc/paper_files/paper/2024/file/48bb60a0c0aebb4142bf314bd1a5c6a0-Paper-Conference.pdf) | LLM 先产生 target DSL summary，再产生 loop invariants；规则式 parser 和 SMT 验证 | “program+proof” 可指程序 + 可检查 invariant/certificate，不一定直接是 Lean proof term。论文明确不支持 pointers/objects，不能直接接 SALT 指针 kernel |
| [VERINA，2025](https://arxiv.org/abs/2505.23135) | 分开及组合评测 code、spec、proof generation | 当前已有 Lean verified-code-generation 基准；应冻结可信 spec，避免程序和 spec 一起偏离原任务 |
| [P³，2026-08 预印本](https://arxiv.org/abs/2608.09277) | joint program-and-proof planning | 更直接说明“共同规划程序和证明”已有公开研究；尚需区分论文框架与本项目低级语义贡献 |

**Proposal**：SALT 的研究定位可落在“带实际 C/ISA 边界的 SIMD translation validation / certifying optimization”：处理固定宽 NEON 与动态 RVV、memory footprint、跨 ISA 浮点差异，以及结构化循环关系。不承诺每个 general while 都能自动找到证明。

候选程序与 proof 可以联合搜索，但可修改边界要严格：先冻结源 IR、操作语义、契约和观察定义；每个目标候选有自己的 hash 与固定等价命题；proof 失败可换程序，不可偷偷改源语义或削弱条件。条件变化需要独立 caller evidence，而不是生成器自己宣布输入不会发生。

### “都把语义建模到 RVV”是否合理

需要区分两种意思。

**Inference：把 RVV 作为主要优化 IR 是合理的。** baseline 建好并通过桥接后，后续都做 RVV→RVV，可以避免重复构造两套优化器。RVV 的 `vl / SEW / LMUL / mask / tail` 等必须显式存在。

**Inference：把 NEON 的含义直接定义为 neon2rvv 的输出，会丢掉待验证问题。** 若 `semNEON(op) := semRVV(recipe(op))`，再证明翻译正确，初始桥变成定义相等；库里 FMA/NaN 的错误也被写进“源语义”。

**Proposal**：共同 imperative state/control/memory 底座，加两个明确架构标签的 intrinsic dialect；底层可以共享纯 BV/IEEE 基础算法，架构 wrapper 仍独立。把所有程序最终 lower 到 RVV 是编译策略；保留独立 NEON denotation 是验证策略，两者可以同时成立。

```text
NEON C → NEON-intrinsic imperative IR ── bridge proof ──→ RVV baseline IR
                       │                                     │
              共同 state/memory/control                 优化 + proof
                       │                                     ↓
                       └───── relational semantics ──── RVV optimized IR
```

## 4. 40 个 kernel 推导出的最小建模 subset

### 审计方法与准确范围

**Confirmed**：使用本次新增 [audit_corpus.py](audit_corpus.py)，给原 C 补充 audit-only XNN 宏/注释中参数结构，使用真正的 Clang 14 `arm_neon.h`，以 `aarch64-none-elf` 生成 `test_neon` JSON AST。40/40 解析成功；这独立于现有 restricted recognizer，因此可以检查 recognizer 之外的结构。facade 不是完整 XNN translation unit，这个结果只证明结构库存的可复现性。

源程序最大循环嵌套深度分布：1 层 22 个、2 层 9 个、3 层 9 个。AST 中 54 个 for、25 个 do-while、7 个 while、230 个 if；没有 break、continue、switch、goto、显式 return。28/40 使用 FP；17 个出现 pointer↔integer addressing；5 个有指针表；3 个直接访问 NEON tuple `.val[]`。宏展开引入的 ternary/StmtExpr 属于审计 facade/编译头语法，不应据此扩大核心语言。

目标程序也必须考虑：`f32-conv-hwc2chw` 的 RVV 版本有 `output_y → c → ow → dx → c_in → ky` **6 层**循环。不能把“当前源最大 3 层”写成 IR 的硬上限。

### 逐 kernel 核实表

表中 E=scalar elementwise，G=grouped element，R=reduction，M=矩阵/卷积，P=pool，L=layout；这只是说明义务的分类，不是建议硬编码 kernel family allowlist。深度是 Arm64 source 的最大 loop nesting。`有` 表示非空 target，非表示已验证。

| # | kernel | 类别 / source 深度 | 主要新增语义义务 | target |
|---|---|---|---|---|
| 1 | f32-argmaxpool | P / 3 | pointer table；带副作用 ternary；跨 pass 读回 output；value+index 双输出；tie policy | 有 |
| 2 | f32-conv-hwc2chw | M / 3 | 上下边界分支；多输出 alias；窗口/zip；复杂 stride；目标深度 6 | 有 |
| 3 | f32-dwconv-minmax | M / 2 | 间接输入指针、零填充替代、FMA、channels tail | 有 |
| 4 | f32-dwconv2d-chw | M / 2 | 滑动窗口、跨块 lane、行状态、空间 tail | 有 |
| 5 | f32-f16-vcvt | E / 1 | f32 bits→u16 output、8/4/tail phases、NaN/sign/rounding | 有，value proof |
| 6 | f32-gemm-minmax | M / 2 | loop-carried FMA accumulator、packed weights、多个行指针/输出 alias | 有 |
| 7 | f32-igemm-minmax | M / 3 | 间接 A 指针表、kernel-position loop、FMA | 有 |
| 8 | f32-maxpool | P / 3 | 指针表、条件取指针、多个 pass 读写 output、min/max | 有 |
| 9 | f32-raddstoreexpminusmax | E+R / 1 | 多项式/位运算/FMA、output 与 sum 双输出、精确 reduction tree | 有 |
| 10 | f32-spmm-minmax | M / 3 | nnzmap 决定循环次数、dmap 决定地址、tuple、FMA/非 fused 差异 | 有 |
| 11 | f32-vadd | E / 1 | binary FP、tail、NaN payload | 有，反例 |
| 12 | f32-vcmul | G / 1 | planar real/imag 成组、输出双 plane、FMA contraction | 有，layout deferred |
| 13 | f32-vdiv | E / 1 | 除法、NaN/inf/zero、tail | 有，反例 |
| 14 | f32-vlrelu | E / 1 | FP 比较+mask/select、scale、tail | 有，反例 |
| 15 | f32-vmax | E / 1 | Arm FMAX 与 RVV maximumNumber、NaN | 有，反例 |
| 16 | f32-vmin | E / 1 | Arm FMIN 与 RVV minimumNumber、NaN | 有，反例 |
| 17 | f32-vmul | E / 1 | binary FP、NaN payload、tail | 有，反例 |
| 18 | f32-vmulc | E / 1 | scalar broadcast 参数/输入、FP、tail | 有，反例 |
| 19 | f32-vrndne | E / 1 | magic-bias 加减、bit-select/sign、tail；并非 vrndn wrapper | 有，value proof |
| 20 | f32-vsqrt | E / 1 | sqrt、负数/NaN/有符号零 | 有，反例 |
| 21 | f32-vsub | E / 1 | binary FP、NaN payload、tail | 有，反例 |
| 22 | qd8-f32-qc4w-gemm-minmax | M / 2 | 4-bit packed weight 解包、widen MAC、FP scale、8/4/2/1 tail | 有 |
| 23 | qd8-f32-qc8w-gemm-minmax | M / 2 | int dot、quantization 参数、FP scale、packed memory | 缺 |
| 24 | qd8-f32-qc8w-igemm-minmax | M / 3 | 上述义务 + 间接指针/position loop | 缺 |
| 25 | qs8-f32-vcvt | E / 1 | i8→i32→f32、zero point/scale、外部参数域 | 有，blocked |
| 26 | qs8-qc8w-gemm-minmax-fp32 | M / 2 | integer MAC、FP requantize、饱和/rounding、尾部 | 缺 |
| 27 | qs8-rdsum | R / 3 | 行×channel、252/7 累加、防 i16 overflow、零指针替代、输出累加 | 有 |
| 28 | qs8-rsum | R / 2 | 2048/16 分组、pairwise widening、静态 mask table、读取旧 output 后加 | 有 |
| 29 | qs8-vadd-minmax | E / 1 | binary widen、multiply、rounding shift、saturate、16/8/tail | 有，blocked |
| 30 | qs8-vcvt | E / 1 | qrdmulh、signed rounding、narrow、参数域 | 有，blocked |
| 31 | qs8-vlrelu | E / 1 | signed compare/mask、两个 multiplier、rounding/narrow | 有，blocked |
| 32 | qs8-vmul-minmax-fp32 | E / 1 | int product + f32 scale + integer saturation | 有，blocked |
| 33 | qu8-f32-vcvt | E / 1 | u8 widening、signed zero point、FP scale | 有，blocked |
| 34 | qu8-rdsum | R / 3 | unsigned reduction、252/7、零替代与动态地址 | 有 |
| 35 | qu8-rsum | R / 2 | unsigned pairwise reduction、静态 mask table、旧 output | 有 |
| 36 | qu8-vadd-minmax | E / 1 | unsigned inputs + signed intermediate/shift、参数域 | 有，blocked |
| 37 | s8-vclamp | E / 1 | 64/8/tail clamp 顺序、4/2/1 partial stores、padding | 有，phase 反例 |
| 38 | u8-vclamp | E / 1 | 同上，unsigned 参数截断/顺序 | 空 |
| 39 | x32-packw-gemm-goi | L / 3 | g/n/k 三层、nullable bias if/else、tuple lane 更新、带洞输出 | 有 |
| 40 | x32-transposec | L / 2 | 两维地址映射、tuple/deinterleave、部分行列、精确 store footprint | 有 |

### 建议的核心：结构化、无递归、带类型和内存的 imperative subset

**Proposal**：最小化的是语义构造数量，不是只允许一种循环长相。核心只需下面几种节点；其组合可以任意嵌套。

```text
Type  ::= Bool | BV(width, signedness) | FP(format)
        | Ptr(region, pointee) | FixedVec(elem, lanes)
        | RvvVec(elem, SEW, LMUL) | Mask | Tuple(types)

Stmt  ::= Skip
        | Let/Assign local value
        | Load local address accessDescriptor
        | Store address value accessDescriptor
        | Intrinsic result? exactDescriptor arguments
        | Seq Stmt Stmt
        | If pureBool Stmt Stmt
        | While testBlock pureBool body

State ::= locals + memory + permissions/initialization + architecture environment
```

`testBlock` 是每轮判断前执行的有状态小块，最后产生纯 boolean。这能保留 `while (--n != 0)` 的求值和副作用。也可用显式配置/continuation 的 small-step semantics 实现同等结构。

需要的 C 表面语法可归约如下：

```text
for (init; test; step) body
  ↦ init; While(lower(test), result, body; step)

do body while(test)
  ↦ body; While(lower(test), result, body)
```

降解要保持局部变量作用域和每轮生命周期。当前 kernel 没有 break/continue，因此这两条变换不需要跳转 completion；未来加入 continue 时，必须跳到 for 的 step，不能直接套用上述简写。

`?:`、`&&`、`||` 要保留短路。尤其 argmaxpool 的 `1 < k ? *id++ : i0`：不能先执行两边再 select；否则会多读指针表、改变 `id`、可能越界。条件表达式 lower 为分支，各分支结果在 join 合流。可以先采用 mutable locals 的 store semantics，减少引入完整 SSA 的第一步成本；未来若换 SSA，必须有 phi/block arguments 和 back-edge，而不只是递增 DefinitionFact.version。

scalar/vector 数学表达式保留精确 type、cast、literal bit pattern、operand order。statement-level assignment/load/store 的模式识别只依赖语法构造，**不判断它是否属于预期 map 模式**。未出现的 switch/goto、递归、堆分配、并发/atomic/volatile/inline asm 可在第一版拒绝；有调用的 helper 需要精确白名单 denotation，不能普遍当作无副作用。

### 内存模型是 40 个 kernel 的必要下限

**Proposal**：使用有 allocation/region 证据的 byte-addressed memory，外加 read/write permission、alignment、initializedness、类型与 layout metadata；可从参数绑定静态对象和局部常量数组。不能只用 `input : List` 和 `output : List`。

必须表达：

1. 多个输入输出 region，标量 load/store、连续/strided/segment vector load/store、lane store、reinterpret；按实际可达 target intrinsic 再加入 indexed access。
2. 只读参数 record/union 的字段布局、静态 mask table、packed weights 中连续出现 i8/i32/f32 的不同片段。
3. pointer table load、nullable pointer、byte stride、负地址增量、base pointer 重新指派。`uintptr_t` 往返需要固定 ABI/address/provenance 合同或有证明的 ptr-add lowering，不能无条件视为数学整数加法。
4. 读取旧 output、原位更新、多个 output alias 与写入顺序。例如 convolution 把 `output1=output0`，尾 channel 也会复用输出地址；只在函数输入间加 disjoint 不会消除这些内部 alias。
5. full-width tail overread 与 partial store：padding 必须来自 readable allocation；只写合法 output footprint；其余内存满足 frame。mask 后丢弃一个值，不会撤销已发生的 read。
6. 原始 C signed overflow、越界、无效移位、implementation-defined narrowing 与 pointer arithmetic 的定义域。Intrinsic 的 modular arithmetic 和 C `int` 的 UB 不得混为一谈。例如 reduction 的 `*output += vacc` 是 scalar signed C 操作，需要范围义务；`int r = rows` 也不能在任意 size_t 上默认为精确转换。

**Confirmed 的警示代码**：[`target/f32-conv-hwc2chw.c`](../kernels/target/f32-conv-hwc2chw.c) 第 87 行附近构造向前偏移的 base，第 136 行附近用无掩码 `vlse32` 后 `vmerge`。**Inference**：是否能访问那些被 mask 排除的地址取决于真实 allocation/padding 合同；目前 value theorem 无法回答。不能仅凭看到 mask 就认为内存安全，也不能在未拿到 caller allocation 时断言所有调用必然出错。

### RVV、整数与浮点的最小 semantic modules

**Proposal**：先用固定 64-bit little-endian C ABI；数值层至少包括 BV8/16/32/64、signedness、widen/narrow、saturating arithmetic、rounding shift、compare、bitwise mask/select、extract/concat/zip、pairwise与horizontal reduction。f32 必须为第二个明确模块；f16 输出在本 corpus 的 conversion 中常以 16-bit encoding 表示，不等于必须先支持完整 f16 arithmetic。

RVV model 显式记录 `VLEN / SEW / LMUL / vl / vstart / tail&mask policy`，并描述每条 intrinsic 的 active lane、结果依赖及 memory effects。保留 `vxrm / frm`；是否观察 `vxsat / fflags` 由 API claim 决定。可不比较最终 flags，但影响结果的 rounding mode 不能删除。

当前 PositivePartition 定理是任意正分块的抽象：

```text
N > 0 ⇒ 0 < chunk ≤ remaining；所有 chunk 的总和 = N
```

这个集合比真实 `vsetvl` schedule 更大，证明其上正确可以很有用，但仍要证明 ISA trace 落在其中。RVV 1.0 的关键条件是 `AVL≤VLMAX` 时 `vl=AVL`，中间区间有允许范围，`AVL≥2·VLMAX` 时取 VLMAX；不是简单“任取正数”或在所有情况下唯一 `min(AVL,VLMAX)`。[规范](https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc)

inactive/agnostic lane 应建成允许的未确定值或证明适用的过近似，不要直接补零。若 slide/gather/reinterpret 随后使它进入 active output，需要额外 definedness 证明。FP reduction 必须保留运算顺序、rounding 和 FMA 区别；`sum` 的数学结合律不能直接用于 binary32。更宽向量若改变 reduction tree，可能确实无法满足 bit equality；这时需要另行评审误差型 spec，不能悄悄改等价定义。

### 如何证明 if、nested for 和 while

**Proposal**：语言接受一般结构化循环；验证器使用归纳 invariant 和终止变元，不靠固定次数展开。

单个 while 的最低义务是：入口建立 invariant；`I ∧ guard` 下 body 安全且保留 I；退出得到 postcondition；循环状态上的 well-founded variant 严格下降。counter 类型仍按 C/BV 解释，variant 可以是自然数度量，通过 guard 和范围引理建立关联。

NEON 和 RVV 每轮处理量不同，不能要求它们 lockstep 一步对一步。用 cutpoint 之间的 stuttering simulation，或双方 refine 同一个独立检查的摘要。关系 invariant 常包含：已经处理的逻辑 index/prefix、剩余量、accumulator 对已处理数据的关系、指针位置、已写 footprint、未修改内存。

| 可复用 proof summary | 验证所需 witness | 对应 corpus |
|---|---|---|
| element map/zip | 相同 index 的 lane function equality + footprint | 现有 scalar element-wise |
| fold / segmented fold | accumulator invariant、widen 不溢出域或精确 modular 关系、reduction order | rsum/rdsum |
| nested loop / tensor region | outer region invariant + inner fold invariant + stride/address relation | gemm/conv |
| arg-reduction | value 与 index 的配对 invariant、tie/NaN policy | argmaxpool |
| data-dependent counted loop | 来自 nnzmap 的次数、有效 dmap 路径、有限 ranking、accumulator | SpMM |
| layout permutation | input/output coordinate bijection 或分片关系、frame | transpose/pack |

SpMM 已经超出纯 affine loop：`nnz=*nnzmap++` 决定 inner loop 次数，`diff=*dmap++` 决定下个 input 地址。它仍是从有限整数开始递减的结构化循环。第一版可支持这样的 data-dependent bounded while；对将来任意复杂 while，要求提交可验证 invariant/ranking，找不到就明确 proof-search-failed，而非声称普遍自动判定终止或等价。

现有 `map/zipWith/fixed-tail` lemma 应升级为上述语义上的 verified summary，加速能识别的情况；识别失败后仍可解释 IR、产生通用 proof obligation。这样 pattern matching 决定自动化效率，不决定整个语言的表达能力。

## 5. 建议的实现顺序与验收标准

以下为 **Proposal**，本次没有擅自实现 compiler 重构或修复 target。

1. **先保留已有成果并固定 claim。** 独立 NEON/RVV semantics；选择 C-intrinsic observational equivalence；固定参数合同与是否观察 FP flags。保留当前 artifact/hash/frozen theorem policy。修复发布分支现存的能力注册测试回归，再以它作开发基线。
2. **构建通用 control/memory 核心。** 用 `s8-vclamp` 验证 sequence、if、两段 loop、tail、overread/frame；参数顺序由明确 caller domain 证明，不从反例中反向发明输入限制。加入同算术不同循环写法的等价 fixture。
3. **第一组非 element-wise 实例。** 用 `x32-packw-gemm-goi` 覆盖真正 if/else、三级 loop、tuple/nullable bias/带洞输出；用 `qs8-rsum` 覆盖 loop-carried reduction 与旧 output。这两类都能先做整数语义。
4. **验证 neon2rvv 的最小 reachable closure。** 初始选少量 integer load/store/compare/clamp wrapper；证局部翻译与组合定理；将 baseline 固定到明确工具链/profile。后续加缺失 zip 与 tuple adapter 时各有证明与编译测试。
5. **在 RVV 内接优化。** 第一批做 memory-safe 的冗余操作消除和 strip-mining。每个候选产出固定 `B≈O` obligation 与可检查 witness；保留实际性能测量。若 opt candidate 改写的是 C，必须重新从实际 C 提取 IR，而不只证明一个未绑定的建议 IR。
6. **再扩展到 FP 与间接访问。** `f32-gemm-minmax` 处理 nested accumulator；`f32-argmaxpool` 加 pointer table+双输出；SpMM 加数据决定的 while/address；最后 convolution 覆盖深循环、窗口和 alias。建立 IEEE/ISA bridge 后再提升 claim。

最低验收：所有被接受语句都有执行语义；未知结构 fail closed；supported mutation 生成不同 IR 而非被答案模板过滤；同时证明 source safety、target safety、结果观察等价、终止和 frame；hash 绑定实际源/目标/flags/headers；正向 proof 的 exported axioms 严格检查。解析通过、公式搜索无反例、Lean 定理通过、C correspondence、机器码正确性分别报告。

## 6. 本次复现与限制

```sh
# 从 lean 根目录执行；库存输出为 JSON。
python3 research/audit_corpus.py research/corpus-audit.json

# 使用明确已安装版本做诊断重放；不改仓库 pin。
python3 research/replay_lean.py /absolute/path/to/lean-4.29.1-toolchain

clang -O0 -ffp-contract=off research/fma_witness.c -lm -o /tmp/saltyrn-research-fma-witness
/tmp/saltyrn-research-fma-witness
```

测试结果与进一步核实记录在同目录 `VALIDATION.md`。完整 inventory 保留每个 source SHA、intrinsic names、AST controls/operators/casts、缺失 target 和参考库 commit；重放 JSON 保留定理的 transitive axioms。这里的 subset 是基于真实 corpus 的可实施设计，尚未实现其 interpreter、VC generator 或 40 个全程序 proof，因此不声称已经形式证明该 subset 完整覆盖了全部 C/ISA 行为。

**Confirmed：最新发布分支另有独立的可复现测试问题。** 在明确使用本机 4.29.1 排除缺失 toolchain 的影响后，选取的 65 个 compiler/capability/schema/recognizer/contracts/intrinsics/width 测试为 **60 passed、5 failed**。5 个都在 `verify_capability_refs` 拒绝测试注入的自定义 intrinsic：`compile_pair(intrinsic_index=...)` 可以先解析这些 descriptor，但发布分支新增的全局 registry 校验不接收它们。失败发生在相关 Lean width proof 前，不是已经证明 width 模型不正确。应收敛正式的 capability onboarding/测试注册接口，不能靠删掉全局检查来解决。原 compiler 分支尚无这次新增的 `verify_capability_refs` 调用；本次未修改该行为。[验证记录](VALIDATION.md)
