# Sail 路线：NEON → RVV 验证能力与研究缺口

调研与实验日期：2026-09-23。版本和输入哈希见 [source-audit.json](results/source-audit.json)，运行方式见 [README.md](README.md)。

后续修正：见[直接等价专题调研](DIRECT-EQUIVALENCE.zh-CN.md)。s2n-bignum 已有直接机器码等价、NEON 向量化及循环变换的实际证明；Katamaran 当前主线也已有双程序逻辑与 adequacy 证明。后续目标应明确为两边 ISA 行为的直接关系，不能仅凭“两边满足同一个规格”宣布等价；通用关系式证明方法也不能作为新的 research gap。

## 1. 回答我们最关心的问题

**现有工具已经能完成底层语义提取，并且只需一个小型比较程序，就能完成固定配置下的 NEON/RVV 局部运算等价检查。此次没有核实到可以直接接收这两个完整 kernel、自动证明其等价的现成方案。** 后一句是本轮证据的边界，不是“全世界不存在”的结论。

本轮实际跑通了 `s8-vmax` 中 NEON `smax` 与 RVV `vmax.vx` 的符号比较，并用 `vmin` 替换生成反例。没有完成整个 kernel 的证明，也没有在 Lean 内完成此比较。结果支持继续研究“如何组合已有能力”，暂不足以宣称发现了论文级 research gap。

最值得进一步核实的候选方向是：**从 Sail ISA 语义获得可复用的向量操作摘要，并用它们自动证明具有不同分块方式的 NEON/RVV 循环等价。** 必须与已有的指令语义提取、验证过的语义简化和程序逻辑区分贡献。

## 2. 我们到底要证明什么

目标是两个已编译 kernel 的可观察行为等价。对于满足同一前置条件的任意输入，两边均正常终止、输出一致，并满足约定的内存修改范围。寄存器布局、指令数量和每轮处理的元素数可以不同。

第一例选工作区原有 `examples/s8-vmax-to-lean/{neon,rvv}.c`。NEON 每轮处理 16 字节；RVV 每轮处理 `vsetvl` 返回的 `vl` 字节。适合先用如下明确契约：`batch > 0` 且为 16 的倍数，输入与输出内存有效且互不重叠，参数区有效且不受写入影响，不考虑并发修改。对任意有符号 8 位输入及阈值，输出的第 i 个元素为二者的 signed max。允许原程序更广的别名情形需要另行证明。

这与“随机输入模拟结果一致”不同。本轮实现的是更小的子目标：固定 RVV 配置下，**一个指令对的低 128 位结果，对所有 16 字节输入和所有 8 位阈值一致**，条件是所选 Sail 模型和 Isla trace 正确，并满足记录的架构初始化条件。

## 3. 已有工具离目标有多近

| 工具／工作 | 可复用能力 | 对本任务还缺什么 | 本轮证据强度 |
|---|---|---|---|
| [Sail](https://github.com/rems-project/sail) | ISA 规范、执行及定理证明器后端 | 不是输入两个 kernel 就返回等价结论的验证器；C intrinsic 到指令的编译关系另有边界 | 文档；使用已有生成模型 |
| [Isla](https://github.com/rems-project/isla) | 对 Sail ISA 符号执行，输出寄存器、内存事件和 SMT 条件 | 输入状态对应关系、内存语义组合、循环关系、结果比较 | **编译并实际运行 NEON/RVV** |
| [Islaris](https://github.com/rems-project/islaris) | 基于 Isla 的 Coq/Iris 机器码验证，已有程序证明和部分 trace 到 Sail 的验证连接 | 当前向量模型适配；为两边建立规格及循环不变式；没有核实到自动跨 ISA kernel 等价入口 | 论文、源码、其指定旧 ISA 快照；**未运行 Coq/前端** |
| [riscv-lean](https://github.com/opencompl/riscv-lean) | 将 Sail 语义化简为适合位向量求解的语义，并证明对应关系 | 支持表是 RV64I、M、若干 B 扩展；未列 V，也不提供 NEON 一侧 | 当前源码与支持表；未编译其完整项目 |
| [Katamaran](https://github.com/katamaran-project/katamaran) | μSail 上的半自动契约验证；可借鉴规格和证明自动化 | 不是直接接入完整 Arm/RVV Sail 模型就验证这对 kernel 的工具 | 官方仓库与论文 |
| [CGO 2026 指令选择合成](https://home.cit.tum.de/~engelke/pubs/2602-cgo2.pdf) | Sail → Isla → SMT；包括 AArch64 NEON，生成 LLVM 指令选择规则 | 论文的 RISC-V 实验是 rv64imafd；没有展示 RVV 跨架构完整循环等价 | 论文 |
| [Sailor](https://www.usenix.org/conference/usenixsecurity25/presentation/kalani) | 用 ISA 语义分析上下文切换需要保存的状态 | 目标性质不同，不能据此视作 kernel 等价验证器 | 作者论文／项目介绍 |

尤其不能把以下内容直接当创新点：Sail 指令语义提取、SMT 局部比较、一般性的 lifting、在证明器中证明简化语义与 Sail 对应。CGO 2026 与 `riscv-lean` 已经覆盖这些方向的重要部分。

[Islaris 论文](https://people.mpi-sws.org/~dreyer/papers/islaris/paper.pdf)及其 `sail-riscv/` 源码还有一项重要先例：对部分 RISC-V 指令，将 trace 验证连接到 Sail 生成的 Coq 模型。因此“给提取结果补一层可检查证明”也需要明确超出现有工作的具体贡献。

当前项目上游 [SALTyRN 的说明](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/)已经提供固定边界下的高层符号验证基线。接入 ISA 语义的价值需要在更强的保证、减少手写语义或扩大参数范围上体现。

## 4. 实验结果

### 4.1 固定配置的真实指令比较：通过

NEON 指令来自本轮用 Clang 14 编译原 `neon.c` 后的 [反汇编](experiments/s8-neon.disasm)。wrapper 只补类型、头文件及关闭 C 断言，不修改运算和循环体；这不是编译器正确性证明。RVV opcode 对应工作区已有 `s8-vmax` 汇编／ELF 实验中的 `vmax.vx v8,v8,a4`。

使用官方 `isla-snapshots` 的 Arm v9.4 和 RISC-V `rv64d.ir`，未手写 `smax` 或 `vmax` 的语义。RVV 设置 `VLEN=256`、`SEW=8`、`LMUL=8`、`vl=16`、`vstart=0`，使能 V 扩展和向量状态，并把向量寄存器初始化为符号值。完整配置见 [rv-v256-reset.toml](experiments/rv-v256-reset.toml)。

[compare_traces.py](compare_traces.py) 将两个指令的输入低 128 位绑定到同一个符号变量，将 NEON 阈值向量绑定到重复 16 次的符号字节，将 RVV 标量输入绑定到该字节的 64 位符号扩展，然后检查输出低 128 位是否可能不同。

| 检查 | 结果 | 首次测量 |
|---|---|---|
| NEON `smax v1.16b,v1.16b,v0.16b` trace 提取 | 2 个 trace | 9.29 秒 |
| RVV `vmax.vx v8,v8,a4` trace 提取 | 1 个 trace | 1.25 秒 |
| 全部 2×1 trace 对：可行性／输出不等 | 每对 `sat / unsat` | 求解分别 1.84、1.63 秒 |
| RVV 换为 `vmin.vx` | 每对 `sat / sat`，发现反例 | 求解分别 0.14、0.13 秒 |

反例非常直观：16 个输入字节全为 0、阈值为 1。signed max 应得到 1，signed min 得到 0。完整 SMT 和 solver 输出保留在 `experiments/`、`logs/`，结构化结果见 [正例](results/smax-vmax.json)和[负例](results/smax-vmin-negative.json)。重跑耗时会改变。

比较程序保留 trace 的全部定义和显式 `assert`／`assume`，比较所有已输出的 trace 对。寄存器事件用于识别输入输出；不会独立解释 `assume-reg` 中的复合状态。它拒绝内存事件及不支持的事件，而不是把它们当作已验证。每个配对额外检查可行性，防止简单的不可满足前置条件造成假通过；这不是全输入覆盖或 trace 完备性的独立证明。

**信任边界：**目前依赖 Sail 快照、Isla 符号执行、Z3 和本轮 Python 比较程序；没有 Lean／Coq proof certificate。上层寄存器状态、未激活 lane、内存、异常行为以及指令串联均不在此结论内。Isla 启动时有缺少若干 primop 的告警，原文保留在 `.err`；本轮所执行路径完成，不代表模型中的所有路径都可执行。

### 4.2 内存与归约指令：能提取，尚未证明组合

| 探针 | 实测 | 范围限制 |
|---|---|---|
| RVV `vle8.v`／`vse8.v`，vl=16 | 分别产生 16 次读／16 次写，约 1.47／1.40 秒 | 固定有效地址；未与 NEON 内存效果比较 |
| NEON `ldr q1`／`str q1` | 成功；load 两条 trace 共 4 次读，store 一条 trace 2 次写，约 8–9 秒 | 架构内存访问粒度不同，不能逐事件直接配对 |
| `s8-vmax` 的 `vsetvli` | 3 条 trace，约 1.07 秒 | 请求长度为符号值；没有串联后续循环 |
| `qu8-rsum` 的 `vzext.vf4`、`vadd.vv`、`vredsum.vs` | 各 1 条有效 trace，约 1 秒 | 每条单独执行，选定 e32,m8,vl=16；不是原 kernel 全部配置转换与归约的证明 |

`qu8-rsum` 的 opcode 来自现有 `research/sail-binary-reduction/artifacts/rvv-disasm.log`。探针 `rv-vsetvli` 使用的是该归约程序的 e32 配置；`s8-vsetvli` 才是 e8 的对应探针，不能混用标签。

### 4.3 失败与边界：哪些有研究意义

1. **默认配置下的假成功风险。** `rv-vmax-default` 返回 0，但没有寄存器写入；默认未使能向量扩展。使能后又遇到动态向量寄存器的 Poison 问题，用现有 `registers.reset` 机制解决。属于配置工程，不能称为 RVV 不受支持，也不能仅凭退出码宣布验证成功。
2. **符号 vl 的扩展性尚未解决。** 保持固定 VLEN，将 vl 改为符号值，分别限制在 1…256 与 1…16；两次均在 60 秒超时，未输出完整 trace。固定 vl=16 则约 1.25 秒。尚未定位根因，未尝试完整优化组合。[Isla 手册](https://github.com/rems-project/isla/blob/e9b5d945394277656593a0d429466d7fa0a2b4b3/doc/manual.adoc)说明默认路径分叉不合并，也提供有适用限制的 linearization；不能从此次超时推断任何工具都无法处理符号 vl。
3. **现有 Lean 生成产物没有通过构建。** 对已有 `rv64_kernel` 模型复制隔离后，使用其固定 Sail runtime，在 Lean 4.29.0 和 4.29.1 下均于 `Rv64Kernel.Defs` 失败：未绑定的 `k_v`、`is_sv32_mode(k_v)` 语法等。日志见 [4.29.0](logs/lean-build-4.29.0.log)与 [4.29.1](logs/lean-build.log)。只改本地依赖路径，未修补生成语义。这证明该产物不能直接作为本轮证明基线；不证明 Sail Lean 后端普遍不可用。应先作为生成／版本兼容问题处理。
4. **Islaris 需要适配评估。** 其 README 指定的旧 RISC-V 快照中，没有本实验所需的 RVV opcode、向量寄存器和 vtype 标记；当前快照具有这些定义。另外，当前内存 trace 使用 record payload，而旧前端源码匹配旧式 `ReadMem/WriteMem` 参数。由此推测直接替换快照会有接口适配工作；未实际运行旧前端，不能断言具体失败方式或工作量。“框架理论上不能支持 RVV”的说法没有证据。

## 5. 候选 research gap 与否证标准

| 候选点 | 为什么值得研究 | 什么结果会削弱它 |
|---|---|---|
| Sail 对应的向量操作摘要，复用于不同 vl／VLEN | 当前直展固定 vl 容易，符号 vl 实测遇到扩展性问题；目标是可检查、可组合的摘要 | Isla 现有配置／优化就能稳定解决代表性 kernel，摘要只节省少量时间 |
| NEON 固定分块与 RVV 动态分块循环的自动关系证明 | 一轮对一轮未必对应；还要处理内存、尾部 lane 和归约累积状态 | 使用 Islaris 现有逻辑加少量通用规格即可批量完成，新增方法有限 |
| 从 ISA 到摘要再到 kernel 结论的自动、可检查连接 | 减少手写 intrinsic shim 的可信负担 | 仅复现 Islaris 的 trace validation 或标量 Sail→Lean 简化，没有向量／自动化上的增量 |

最强的候选贡献可能是前两项的结合。第三项应成为保证可信度的设计要求，单独作为创新点证据不足。修复生成代码、更新 parser、添加少量指令支持，首先按工程工作计算。

## 6. 下一步只有一个主要对比

**在同一对真实 kernel、同一契约上比较：现有 Sail＋Isla／Islaris 加薄适配，究竟还要多少工作，才能完成整段等价证明？** 不先建设新的 DSL 或完整验证框架。

先以 `s8-vmax` 做决定性实验：组合 load–max–store，随后证明任意合法 batch 下不同分块循环的关系。先固定 VLEN，明确区分“固定输入长度但输入值任意”和“长度任意”；再评估跨 VLEN 泛化。若这一例仍需大量特制方法，再用 `qu8-rsum` 检查是否可复用，避免把一个例子的困难包装成通用问题。

记录四项：手写规格／不变式／适配代码数量、每个新 kernel 需要的修改、长度与 VLEN 变化后的耗时、证明结论及其信任边界。比较中使用相同语义契约和相同负例。

如果现成工具加薄适配就能稳定完成，结论应是“已有路线基本够用，主要剩工程集成”。如果在不同分块、符号向量长度或可复用归约证明上持续需要新方法，再据此提出研究问题。

本轮已完成工具审查、真实指令正反例实验、内存／归约覆盖探针和已有 Lean 产物构建检查。**完整 kernel 等价证明、Islaris 当前模型移植、Lean 后端修复及创新性最终确认尚未完成。**
