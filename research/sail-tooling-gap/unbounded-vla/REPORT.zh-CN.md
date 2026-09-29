# 跨 ISA、固定宽度到 VLA：实际验证尝试与研究判断

日期：2026-09-23。**没有完成 NEON/RVV 真实机器码的端到端等价证明。**

完成的是：由本次 agent 编写、Lean 内核检查的任意长度抽象循环与字节内存证明；从原有 Sail 生成代码中原样抽取的 VL 辅助函数证明；以及真实 ISA 工具链的构建和符号执行实验。下面严格区分这些证据。

## 1. 决定

**值得继续研究，但应把问题定位为“如何从真实 ISA 得到可复用、可检查的向量块摘要，并让 agent 完成跨 ISA 的任意长度证明”。目前不能认定某个现成工具加 LLM 已经只剩薄薄的适配工作；也不能据本次失败断言需要新的关系式逻辑。**

本次实验反而削弱了一个过大的 novelty claim：对于逐元素 kernel，固定宽度到动态分块的循环数学本身，可以用普通归纳和精确内存不变量完成。Agent 已经实际完成了这一层，且不在已通过证明的 TCB 中。真正尚未接通的是这些摘要与两边真实 ISA 执行的联系。

如果项目目标只是有限几个 kernel 的专家式证明，现有理论加较重的证明工程仍是合理的解决方案。若项目目标是持续验证优化器产生的新程序，值得研究的指标是 ISA 连接能否自动证明、摘要能否复用、不同分块/归约能否稳定处理，以及每个新程序需要多少人工介入。本次不是成功率基准测试，不能提供可靠的 agent 成功概率。

## 2. 被验证的对象与前提

原始文件：`examples/s8-vmax-to-lean/neon.c` 与 `rvv.c`；NEON 的真实编译结果已保存在上级 `experiments/s8-neon.disasm`，RVV 汇编为 `examples/s8-vmax-to-lean/rvv-output.s`。

- 原 NEON 接口要求 `batch > 0` 且 `batch % 16 == 0`。我们量化所有满足接口的长度，没有选一个固定 batch。抽象定理还额外允许零长度。
- 原 RVV 汇编使用 `vsetvli a5,a0,e8,m8,ta,ma`，每轮实际处理 `vl` 个字节。
- 沿用已有 `examples/s8-vmax-to-lean/SEMANTICS.md` 的内存契约：输入输出不重叠，或完全原地重合；参数独立且稳定；普通、可访问的内存；不考虑并发修改、MMIO 和执行异常。
- 部分重叠不能被默默接受。该文档先前已记录反例；本次在抽象内存模型中把这一反例变成了 Lean 检查的定理，并非声称新发现。
- 目标观察量为最终内存，包括输出区以外的 frame。真实机器上的返回、寄存器约定、异常和地址不溢出仍属于未完成的连接义务。

“任意长度”指归纳证明所有合法长度，不是输入超过真实地址空间。抽象自然数定理更强；机器实例还必须证明参数可表示和地址计算不溢出。

## 3. 实际完成的 Lean 证明

代码：[Chunked.lean](Chunked.lean)、[Memory.lean](Memory.lean)。仅依赖 Lean 的标准逻辑公理，没有用 `sorry` 或 `native_decide` 验收这些定理。这里实际只需要 Lean/Std 与提取辅助函数所用的 Sail runtime，不依赖 mathlib。

### 动态分块与终止

`Policy` 要求每次剩余长度为正时，选择的块长满足 `0 < k ≤ remaining`。不要求 `k` 是 16 的倍数，不要求两边逐轮同步，也不固定输入长度。

- `chunkLoop_exact`：任意这种 policy 的抽象循环，结果恰好是逐元素映射。
- `neonLoop_exact`：忠实于“不足 16 就退出”的抽象 NEON 循环，在长度为 16 的倍数时处理全部元素。
- `fixed_to_vla`：即使左右 lane 函数写法不同，只要证明它们逐元素相等，就得到最终输出直接相等。
- `Execution` 还允许每一步重新选择块长；`execution_exact` 对所有有限合法执行成立。
- `schedule` 是按剩余长度严格递减定义的全函数；`schedule_sum` 证明处理总量恰为输入长度。
- `no_infinite_progress` 单独排除正剩余量无限下降的执行。没有把“存在有限执行的后置条件”冒充终止性。

这些不是有限展开：循环通过 Lean 接受的良基递归与归纳证明，输入长度没有实验上界。

### 非对齐的合法 VLA 例子

实现并证明了 balanced VL 策略满足自然数形式的 RVV 长度选择约束。`VLMAX=256`、`n=528` 时，块长序列为：

```text
NEON: 16, 16, ..., 16    （33 轮）
RVV:  256, 136, 136      （3 轮）
```

136 不是 16 的倍数。Lean 检查了该序列，通用定理无需为它添加特殊的轮次配对规则。此 balanced 策略对应规范允许的中间 AVL 区间选择，但不是当前配置为 `vl_use_ceil=false` 的 Sail 快照实际选用的策略。[RVV 规范：Constraints on Setting vl](https://docs.riscv.org/reference/isa/v20260120/unpriv/v-st-ext.html#_constraints_on_setting_vl)

### 精确字节内存

`Memory = Nat → BitVec 8`，`writeChunk` 从写入前的内存读取整个块，再写输出块。`executeBlocks` 连续执行这些块，实际会读取之前的写入结果；没有用一份永远不变的输入列表偷偷排除别名问题。

`write_prefix` 证明：在不重叠或原地条件下，每次块操作保持已完成前缀、未读输入和输出区外内存的精确关系。

**`s8max_memory_fixed_to_vla` 直接证明两边整份最终内存相等**，量化任意初始内存、地址、合法长度、signed-byte threshold 和动态 policy。NEON lane 用有符号比较，RVV lane 用整数 max 再转回 8 位；其相等性也被证明。

这里使用的共同函数完全确定每个输出字节以及 frame，并非“两边都满足输出非负”一类弱规格。但 `writeChunk` 和两个 lane 函数仍是手写抽象；它们不是从真实 ISA 经过已证明的 lifting 得来的。

### 负向控制与 TCB

[NegativeControls.lean](NegativeControls.lean) 证明四类具体反例：max 换成 min、signed 换 unsigned、漏写最后一个字节、忽略部分重叠限制。复现脚本把这些不等式改成等式，Lean 对四个错误命题均明确报告为 false。它们检验的是抽象层，不能宣称能自动找出任意机器码变异。

[verification.json](results/verification.json) 记录 21 个命名声明的公理依赖。只允许 `propext`、`Classical.choice`、`Quot.sound`；没有 `sorryAx`、新增外部事实或 native evaluation 公理。成功结果的含义是 **LLM 不在这些抽象定理的证明 TCB 中**。检查器仍不替代对定理范围与 ISA 对应关系的审查。

## 4. 与真实 Sail 模型接上了多少

### 原样抽取的纯函数：已证明

[extract_vl.py](extract_vl.py) 从既有生成模型 `VextVsetInsts.lean` 原样复制 `vl_use_ceil` 和 `calculate_new_vl` 两个声明，保存来源行号、文件与片段哈希，得到 [SailVLExtract.lean](SailVLExtract.lean)。没有手写替换它们的函数体。

[SailVLProof.lean](SailVLProof.lean) 证明当前 `vl_use_ceil=false` 配置下：

```text
calculate_new_vl avl cap = min avl.toNat cap
```

并证明正 AVL 与正 cap 时的进度和上界，以及自然数长度小于 `2^64` 时转入 64 位 AVL 的关系。

这比手写一个想当然的 `min` 实现前进了一步，**但仍不包括 vsetvli 解码、配置合法性、CSR 更新、寄存器状态和 execute 的连接**。文本抽取也不是已经验证过的通用 lifter。原始 Sail 到 Lean 的翻译属于另一个需要明确的信任边界。

### 生成的 RVV 模型：进行了实际修复诊断

未修改模型重新构建失败，见 [isa-model-build.log](logs/isa-model-build.log)。错误主要是依赖类型的参数丢失与打印语法。

为了避免把容易修复的问题夸大成 research gap，[diagnose_model.py](diagnose_model.py) 在隔离副本中按 Sail 源文件修复参数/类型条件，并移除一个失效的 namespace open。修改完整保存为 [diagnostic-model.patch](results/diagnostic-model.patch)。

- 修复后 `Rv64Kernel.VextVsetInsts` 及其 35 个构建任务通过，该阶段约 104 秒（已有前一阶段构建缓存），见 [diagnostic-model.json](results/diagnostic-model.json) 与 [构建日志](logs/diagnostic-model-build.log)。
- 继续构建完整 `Rv64Kernel.Kernel`，进一步在 `Vmem.lean` 遇到 `satp_mode` 类型/名称问题以及递归终止证明失败；见 [diagnostic-Kernel.json](results/diagnostic-Kernel.json) 与对应日志。
- 该已有 `Kernel` loader 来自以前的 qu8-rsum 实验；这里用它探测共享 RVV ISA 依赖的构建情况，**没有把它当成 s8-vmax 的机器码输入**。
- 隔离修复没有语义保持证明，因此没有把修复后的模型自动纳入已验证成果。编译通过也不等于模型语义正确。

这些证据支持“后端兼容性有可解决的工程障碍”，不支持“跨 ISA 等价需要新理论”。本轮没有构建完整 Arm Lean 模型，也没有复现 Katamaran 或 s2n-bignum 的完整证明环境。

### Isla 的动态 VL 路径

使用此前已固定版本的真实 RVV ISA 快照，`VLEN=256, SEW=8`，对 `vmax.vx` 的 `vl` 取符号值：

| 配置/方法 | 实际结果 |
|---|---|
| 原目标 LMUL=8，`1 ≤ vl ≤ 256`，未改写，4 worker | 180 秒超时，没有输出完整 trace |
| 同上，线性化 `init_masked_result` | 60 秒超时 |
| 同上，部分线性化 `init_masked_result` | 约 1.6 秒报 `Variable GENSYM not found` |
| 缩小寄存器组为 LMUL=1，`1 ≤ vl ≤ 32`，未改写 | 约 25.4 秒成功，生成 32 条 trace |

结果保存在上级 `results/rv-vmax-vla-*.json`。超时是未知，不是证明不可能；线性化错误是实现问题，不是逻辑不健全结论。LMUL=1 是定位规模效应的诊断，不能替换原程序的 LMUL=8。

对 LMUL=1 的全部输出 trace，[check_m1_traces.py](check_m1_traces.py) 保留路径条件，分别检查路径可满足，以及所有 active lane 是否符合 signed max。**32 条路径均得到 `sat`（可满足）和 `unsat`（不存在 active-lane 不等），路径中的 VL 可满足见证遍历 1…32**；结果见 [m1-trace-check.json](results/m1-trace-check.json)。该 SMT 检查没有独立证明证书，也没有 trace 完备性定理；脚本翻译不是已验证连接。因此不把它接成 Lean 主定理的已证前提。

固定硬件配置下分析所有有限 `vl` 值，本身不等于对整个程序做 bounded checking。真正的任意输入长度来自外层循环的归纳。这里缺少的是把两层可靠地组合起来。

## 5. 仍然必须完成的桥接义务

1. Arm 真实 load–smax–store 与一个 16 字节 `writeChunk` 对应，包含指针、内存和控制流。
2. RVV 的 vsetvli–load–vmax–store 与长度为实际 `vl` 的 `writeChunk` 对应，包含 LMUL 寄存器组、vstart、tail/mask 和内存效应。
3. 两边的循环分支/长度更新与抽象 schedule 对应；正常返回和寄存器约定得到证明。
4. 机器字地址与自然数地址对应，访问合法、不溢出，配置条件在每个可达状态保持。
5. 从真实二进制到证明入口的程序绑定，以及所选 Sail 后端/Isla 路线的信任边界。

这些义务没有被写成公理以“让总定理通过”。当前所有结果均显式标记 `cross_isa_machine_code_equivalence_proved=false`。

## 6. 对 research gap 的判断

本轮不能支持以下贡献表述：

- “首次对任意长度向量循环证明等价”：已有循环关系式验证，本实验也用常规方法做到了抽象层。
- “首次处理两个循环不同步”：现有关系统方法已有此能力。
- “Sail 生成代码编译失败，所以这是新的研究问题”：这是工程诊断，不能作为方法新颖性的证据。

更值得检验的研究问题是：

> 在两套真实 ISA 语义上，agent 能否生成携带可检查证明的向量块摘要，使固定分块/VLA 变换的任意长度等价证明可以跨 kernel 复用，并显著降低逐程序人工证明成本？

该方向的最关键产物是 **ISA→摘要的证书和组合流程**，而不是让 LLM 猜一个语义相似的循环。Agent 可以猜摘要、状态关系和证明策略，但摘要错误必须被正式连接义务拒绝。

现有工作的对比必须保留：[s2n-bignum 的关系式机器码逻辑](https://arxiv.org/html/2505.14348v1) 已经展示向量化与循环优化证明；[Katamaran](https://github.com/katamaran-project/katamaran) 已有双程序基础设施。详见上级 [DIRECT-EQUIVALENCE.zh-CN.md](../DIRECT-EQUIVALENCE.zh-CN.md)。本次没有证明它们加 agent 做不到，不应把“没有在本次完成”写成“已有工作不能完成”。

**立项建议：继续，但采用可证伪的候选课题。** 先完成本例的真实 ISA 桥接，再检查摘要和组合引理能否复用到包含归约/重排的不同 kernel。以“现有关系逻辑＋通用 coding agent＋人工提示”为基线，记录新摘要数量、人工介入、证明时间、成功率及错误程序拒绝率。若只是接好模型后同一套简单模板即可稳定解决，应承认主要贡献是工程；若自动生成并验证可复用摘要明显降低了成本，才有实证依据主张方法贡献。

## 7. 复现

从本目录运行：

```bash
python3 replay.py
python3 check_m1_traces.py
python3 diagnose_model.py --target Rv64Kernel.Kernel
```

第一个命令重建并检查所有正向定理、公理依赖和四个拒绝用例，通常只需数秒（首次构建取决于缓存）。第二个只重查已有的 LMUL=1 trace。第三个是隔离诊断构建，预期可能失败；不是证明成功的必要步骤。

`results/RejectedClaims.lean` 是故意错误的负向测试，不能作为库构建目标。上级 README 记录 ISA 快照、Isla、Sail runtime 和外部 solver 的来源。Lean 固定为 4.29.0。
