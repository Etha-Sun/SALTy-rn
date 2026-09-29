# 简化 reduction kernel：NEON 与 RVV

本目录按“可以简化，但仍须是有意义的完整循环”的要求推进。
**两边的完整简化程序都已经通过真实 Sail → Isla → Coq 的提取和导入。
NEON 已通过从入口到返回的整段程序部分正确性证明。
RVV 和整段 kernel 的跨 ISA 等价性证明尚未完成。**

## 程序及目标

- [neon-simple.S](neon-simple.S)：20 条指令。16 字节向量循环，逐字节尾部，最后写回。
  每轮清零临时半字累加器，使用 `uadalp` 扩宽；去掉原实现的 2048 字节分块和掩码表。
- [rvv-simple.S](rvv-simple.S)：19 条指令。把原实现的 LMUL=8 改为 LMUL=1，
  保留每轮 `vsetvli`、动态加载、扩宽、tail-undisturbed 累加和最后的 `vredsum`。
- 两份 `.elf` 由这些汇编实际生成；提取用的机器码逐条核对了 ELF 的可执行段。

本轮针对这些简化汇编，不包含“原始优化 C kernel → 简化汇编”的等价证明。

目标输出是精确的函数，而非某个近似范围：

```
output_after = (output_before + sum(input[0:n])) mod 2^32
```

输入内存应保持不变，输出与输入分离。当前 NEON 版本要求输入地址 16 字节对齐；
输出地址 4 字节对齐。NEON 不需要尾部 padding，也不要求 n 是 16 的倍数。
当前 RVV 加载提取的地址前提统一预留了 8 字节 RAM 地址空间，因此在 RAM 顶端
比实际只读取 `vl` 字节的指令更保守；这项前提必须在程序证明中兑现。

当前 Sail 配置为 VLEN=256、e32/m1，所以一次最多处理 8 个字节，`vl` 是 0..8 的
符号值。这**不是**把输入长度固定为 8，也没有把 kernel 展开为固定轮数。
它也**不是**“对所有硬件 VLEN 的统一证明”：硬件 VLEN 参数化仍未完成。
输入长度受合法地址空间约束，不以一个测试展开上限定义证明范围。

## 文件与证据

| 文件 | 内容及证明范围 |
|---|---|
| [NeonKernel.v](NeonKernel.v) | **已检查：整段 20 指令程序，从入口到返回，任意合法长度，精确求和写回、输入内存保持** |
| [NeonProgram.v](NeonProgram.v) | 已检查：从实际程序地址表导出上述整段合同，逐条核对指令位置 |
| [NeonByteSpec.v](NeonByteSpec.v) | 已检查：直接以统一的字节求和函数作为整段 NEON 程序的输出规格，适合从这里阅读最终定理 |
| [NeonRegisters.v](NeonRegisters.v) | 已检查：完整程序的向量状态变换保持 v3..v31 不变 |
| [KernelSpec.v](KernelSpec.v) | 已检查：将块加后缀的输出公式转换成单一字节列表上的精确求和规格 |
| [simple/generated/neon/Kernel.v](simple/generated/neon/Kernel.v) | 全部 20 条 NEON trace 的地址表，包含循环与尾部 |
| [simple/generated/rvv/Kernel.v](simple/generated/rvv/Kernel.v) | 全部 19 条 RVV trace 的地址表，动态 vl 未固定 |
| [Programs.v](Programs.v) | 使用 Islaris `addr` 类型的两份程序表，可用于操作语义 |
| [NeonSequence.v](NeonSequence.v) | 已检查：真实加载、清零、两级扩宽累加的四指令组合，保留内存和寄存器资源 |
| [NeonSequenceSpec.v](NeonSequenceSpec.v) | 已检查：四指令结果恰好增加 16 个字节的和，以及结构化组合的求和定理 |
| [NeonLoop.v](NeonLoop.v) | 已检查：真实机器分支控制的任意多个 16 字节块循环；后置条件给出精确累加器、指针、剩余长度及原内存 |
| [NeonLoopSpec.v](NeonLoopSpec.v) | 已检查：将实际机器循环后置状态与全部块的字节和关联 |
| [RvvSimpleVset.v](RvvSimpleVset.v) | 已检查：任意剩余长度的 vl 选择，覆盖首次进入与循环回边两种旧 vtype，保留后续状态资源 |
| [RvvProgress.v](RvvProgress.v) | 已检查：该 vl 选择对任意正剩余长度满足 `0 < vl <= remaining`，每轮严格减少；已用于以加载合同为前提的完整机器循环组合 |
| [RvvReduce.v](RvvReduce.v) | 已检查：真实 `vredsum` 对任意数据按模 2^32 累加 seed 与全部 8 个 lanes，并保留后续状态资源 |
| [RvvPacking.v](RvvPacking.v) | 已检查：65536 位存储中的 8×32-bit 打包/解包对应关系，可供后续数据表示转换使用；本身不是 kernel 证明 |
| [RvvVset.v](RvvVset.v) | 同类证明，针对原 LMUL=8 配置 |
| [StructAssume.v](StructAssume.v) | 已检查的自动化补充：从整个结构寄存器读取字段条件，不改 ISA 语义 |
| [NeonTail.v](NeonTail.v)、[NeonTailEntry.v](NeonTailEntry.v) | 已检查：真实字节循环及零长度分支 |
| [NeonEdges.v](NeonEdges.v)、[NeonFinalize.v](NeonFinalize.v) | 已检查：清零入口、水平归约、写回及返回 |
| [RvvWidenShared.v](RvvWidenShared.v)、[RvvAddShared.v](RvvAddShared.v) | **已检查：原始指令 trace，全部 `0 <= vl <= 8`、任意数据的扩宽和累加，保留非活动 lanes** |
| [RvvWidenAdd.v](RvvWidenAdd.v) | 已检查：两条真实向量指令的组合合同 |
| [RvvInitialize.v](RvvInitialize.v)、[RvvLoopControl.v](RvvLoopControl.v)、[RvvControl.v](RvvControl.v) | 已检查：入口清零、动态 vl 设置、计数/指针更新和分支控制 |
| [RvvFinishShared.v](RvvFinishShared.v) | **已检查：循环退出到返回的 9 条真实指令，包括归约、标量加法和内存写回** |
| [RvvStepMath.v](RvvStepMath.v)、[RvvSharedSpec.v](RvvSharedSpec.v) | 已检查：一次向量更新增加本轮字节之和；输出数学函数与 NEON 统一规格一致。尚未闭合 RVV 机器循环 |
| [RvvMemory.v](RvvMemory.v)、[RvvWindow.v](RvvWindow.v) | 已检查：输入数组拆分/合并和动态长度窗口的接口 |
| [RvvLoopConditional.v](RvvLoopConditional.v) | 已检查：以加载合同为前提，按输入列表长度归纳的实际机器循环，无固定展开次数 |
| [RvvKernelConditional.v](RvvKernelConditional.v)、[RvvProgramConditional.v](RvvProgramConditional.v)、[RvvByteSpecConditional.v](RvvByteSpecConditional.v) | 已检查：以加载合同为前提，从实际 19 条指令表推导入口到返回的精确合同；不是无条件 RVV 成功结果 |
| [KernelMemoryBridge.v](KernelMemoryBridge.v) | 已检查：NEON 的 64 位块及字节后缀内存，与同一平坦字节数组的分离逻辑等价关系 |
| [RvvLoadInlineCase0.v](RvvLoadInlineCase0.v)、[RvvLoadDeferredCase1.v](RvvLoadDeferredCase1.v) | 已检查：原始加载 trace 的 `vl=0` 和 `vl=1` 分支，任意输入数据、旧向量及合法地址；尚缺 `vl=2..8` |
| [RvvLoad.v](RvvLoad.v) | 加载的原始长时间检查；优化版本和逐次结果见 logs/results，尚未接受加载正确性合同 |
| [STATUS.json](STATUS.json) | 源码哈希对应的机器可读检查状态，明确区分导入、局部证明、完整等价证明 |

`NeonLoop.v` 的归纳量是输入的块列表，不是预设的展开次数。它已经调用
`NeonSequence.v` 的四指令证明，并检查比较、条件分支、减计数及回跳。
`NeonKernel.v` 进一步组合了入口、尾部、归约、最终写回及返回。

`NeonSequenceSpec.v` 中的结构化递归本身不替代机器循环证明。
`NeonLoopSpec.v` 已把数值结论接到真实机器后置状态，整段结论在 `NeonKernel.v`。
后者以任意数量的 16 字节块及 0..15 字节后缀表示输入，结论是精确的
`initial + block_sum bs + byte_sum suffix`（模 2^32）。输入与输出通过分离逻辑保持不重叠。
`NeonByteSpec.v` 已将该结论改写成 `byte_reduction_spec initial (flatten_blocks bs ++ suffix)`，
并通过 Coq 检查；这一步与实际指令表连接，不只是两个纯数学公式的比较。
合同还保留了完整向量状态及 R8/R9 的精确最终值；`NeonRegisters.v` 证明 v3..v31 不变。
整段合同没有 `Admitted` 或新增公理，`Print Assumptions` 为 `Closed under the global context`。
独立 `coqchk NeonKernel` 也已接受（168 秒，包括依赖复查）。
这是实际 trace 的 Islaris 合同；尚未额外实例化一次完整机器启动/ELF 装载的 adequacy 证明。

## 当前仍缺少的证明

1. NEON：整段部分正确性合同已完成；尚未补独立的操作语义终止性定理。
2. RVV：动态加载尚未通过；扩宽、加法（包含非活动 lanes 保留）、入口和归约写回已通过。
   单轮、任意长度循环、入口到返回以及实际指令表的组合已通过，但都显式以加载合同为前提。
   必须消掉这个前提，才能称为完整 RVV 程序证明。
3. RVV 的完整规格精化、调用边界的内存保持性，以及两边终止性的最终闭合。
   已有 Iris `instr_body` 结论不能单独当作 total-correctness 或跨 ISA 等价定理。

`RvvLoad.v` 当前尝试用连续 8 字节的内存所有权支持任意 `vl <= 8` 的加载合同。
如果沿用这个合同，最后一轮可能需要最多 7 字节可读 padding；这是该证明接口的限制，
并非指令实际会读取所有 padding。该加载合同尚未证明。
RVV 的底层寄存器在当前 IR 中使用 `bv 65536` 存储，即使硬件 VLEN=256；
加载 trace 还逐次构造并更新寄存器。这是当前证明展开的主要性能疑点，
不能据此宣称 RVV 无法验证或整个问题已被证明是新 research gap。
本轮未优化的加载证明达到 1200 秒限额，采样内存约 18.6 GiB，仍停留在展开阶段；
未优化的扩宽证明在同一限额下停留在 `Qed` 阶段；加法证明在 1800 秒限额下
也停留在 `Qed` 阶段。这些均不计为已证明。
`RvvWidenFast.v` 和 `RvvAddFast.v` 根据每个 trace 分支的条件确定该分支的 `vl`，
而不再次枚举规格里的条件；两者均在约 3 分钟内走完策略，但最终 `Qed` 检查
在各自 900 秒限额内仍未结束。没有足够证据说明这一改动改善了总检查耗时。

## 2026-09-28 长时间并行检查的进展

用户给定的五小时窗口为 07:14:27–12:14:27 UTC。原始加载与多种优化版本并行运行，
每个进程单独记录计时和内存。中途结果不能视为最终成功；源码和结果哈希见 `STATUS.json`。

本轮已解决扩宽与加法原先的长 `Qed`：把反复出现的 65536 位常量共享为 Coq 定义。
`RvvCompactWiden.v`、`RvvCompactAdd.v` 和 `RvvCompactLoad.v` 用 `reflexivity` 证明新旧
trace 完全相等；最终指令合同仍针对原始 trace。没有修改 Sail IR 或机器码，也没有缩小 vl 范围。
扩宽约 96.6 秒、加法约 99.9 秒通过；两指令组合约 7.1 秒通过。
这些合同与写回、单轮算术关系已通过独立 `coqchk`（约 300.6 秒，包含依赖）。
9 指令收尾组合约 540.8 秒通过，其中 `Qed` 约 529.2 秒。

机器循环和整段组合也已推进：`RvvLoopConditional.v` 在增大本机 OCaml 栈上限后通过，
`Qed` 约 139.8 秒；独立 `coqchk` 约 2000 秒通过。`RvvKernelConditional.v` 的
`Qed` 约 1173.9 秒后通过，独立 `coqchk` 也已通过（3523.3 秒，包括依赖）；
`RvvProgramConditional.v` 把它接到实际指令表。
这三个结果仍显式接受 `Hload` 参数。`Print Assumptions` 显示闭合全局上下文，
**不代表这个定理参数已经被证明**。当前实际缺口是提供该参数的加载正确性证明。

`KernelMemoryBridge.v` 证明两边不同的输入内存表示可以精确转换：
`input_memory p blocks suffix` 与 `p ↦ₘ∗ (flatten_blocks blocks ++ suffix)` 等价。
转换遵守小端字节顺序，包含地址范围前提；它不增加新的 ISA 语义假设。
该桥接模块及依赖已通过独立 `coqchk`。`RvvByteSpecConditional.v` 已将实际 RVV
程序的输出合同改写成与 NEON 相同的 `byte_reduction_spec`，仍保留显式的 `Hload` 前提。

加载还涉及逐字节更新后的整寄存器重构，仅共享常量并不足够。
一个版本在约 35 分钟达到 300 GiB 内存并持续增长，已停止该版本，保留其他长任务。
`RvvChunkedLoad.v` 把 trace 拆为共享后缀，并证明与原始 trace 完全相同；
这项表示转换已经检查，但不能据此把尚未完成的加载合同标为已证明。
诊断文件中带 `Abort` 的策略分析只用于定位性能，不属于正确性证明。

具体性能诊断和本次 `Load` 续接脚本的问题见 [NOTES-proof-performance.md](NOTES-proof-performance.md)。
该续接问题属于本次驱动脚本，不是 Sail/Islaris 的语义限制。
不使用动态 `Load` 的 `RvvLoadInlineCase0.v` 已完整编译成功（1654.7 秒，`Qed` 814.8 秒），
对应 `vl=0`、任意旧向量和合法地址。`RvvLoadDeferredCase1.v` 也已完整编译成功
（2205.1 秒，`Qed` 366.1 秒），证明 `vl=1` 时对任意输入字节的真实加载，保持输入内存。
它使用延后展开 trace 的策略；`vl=2..8` 仍未通过，尚不能闭合通用加载合同。单字节读取规则、活动字节更新和
逐个 vl 的向量重构数学引理已通过独立 `coqchk`（73.0 秒），但仍不能替代整条加载指令的证明。

## 五小时窗口结束时的结论

已通过：RVV 全动态 vl 的扩宽与累加、循环退出到返回、任意长度循环及整段程序的条件性组合、共同字节规格和内存表示转换。通用动态加载仍缺 `vl=2..8`，因此**无条件 RVV 整段证明和完整跨 ISA 等价性尚未完成**。

加载的 `vl=0` 与 `vl=1` 已通过标准 Coq 完整编译。`vl=1` 有两个独立脚本版本通过：
`RvvLoadDeferredCase1.v` 用时 2205.1 秒，`RvvLoadFastSideCase1.v` 用时 1961.6 秒。
后者使用了用户五小时预算内的超时延长，记录见 `results/RvvLoadFastSideCase1-deadline-extension.json`。
`vl=0` 的额外独立 coqchk 达到 1650 秒限额，不能计作独立复查成功；其标准 coqc 结果仍有效。
所有尝试的结果、超时和源码哈希均保留在 `results`、`logs`、`STATUS.json`。

这次证据表明延长等待和并行检查有实际收益，同时也暴露了证明策略和资源处理上的工程问题。
它不能单独证明不存在现成工具链，也不能单独构成论文新颖性结论。硬件 VLEN 仍固定为 256；
任意输入长度的循环证明不等于对任意硬件 VLEN 的证明。

## pre/post 与 lemma

pre/post 是程序规格；证明程序满足这个规格才得到 lemma。
不必为每一条指令单独手写一个 lemma，但若把已经检查的规格当作组合接口，
可以避免反复展开很大的 Sail trace。这不会减少最终的证明义务。
例如本次四指令组合约 48 秒、机器向量循环约 59 秒通过标准 Coq 检查，
不能据此推断 RVV 全 kernel 的耗时也相同。

已完成的检查可以分开复用，下面不是一次干净构建的总耗时：

| 检查 | 本次耗时 |
|---|---:|
| NEON 四指令向量块 `NeonSequence.v` | 47.6 秒 |
| NEON 任意块数的机器循环 `NeonLoop.v` | 59.2 秒 |
| NEON 入口到返回的组合 `NeonKernel.v` | 18.3 秒（依赖已编译） |
| NEON 整段证明及依赖的独立 `coqchk` | 168.0 秒 |
| RVV 动态 `vl` 选择 `RvvSimpleVset.v` | 37.0 秒 |
| RVV 最终向量归约 `RvvReduce.v` | 134.4 秒 |
| RVV 寄存器打包/解包引理 `RvvPacking.v` | 66.4 秒 |

## 可执行检查（与形式证明分开）

`python3 research/sail-tooling-gap/kernel-e2e/smoke.py` 检查 135 个组合：
15 个长度（含 0、8/16 边界、尾部及 1025）、三种字节模式、三个初始输出值（含溢出）。
同时检查输入不变及输出两侧的 canary。NEON/QEMU 已通过；
RVV/Sail C++ 模拟器在 VLEN=128、256、512 上均已通过。
测试 ELF 中 kernel 的逐字节内容与提取所用 ELF 相同，地址可以因测试链接而不同。
结果见 [smoke/result.json](smoke/result.json)。Sail 模拟器是另一个已安装快照，
不能将这些有限测试当成当前 Isla trace 的语义正确性证明或所有 VLEN 的证明。
早期 270 个较大用例在 RVV 模拟器上达到 180 秒运行限额，保存在
`smoke-large-diagnostic`；NEON 那次检查通过，RVV 那次不计为成功。

## 重现

在本目录的父工程及既有工具链完整的环境中：

```sh
python3 research/sail-tooling-gap/kernel-e2e/build.py --extract
python3 research/sail-tooling-gap/kernel-e2e/check.py StructAssume.v RvvArithmetic.v RvvVset.v RvvSimpleVset.v RvvProgress.v RvvDefs.v RvvReduce.v RvvPacking.v NeonZero.v NeonSequence.v Pointer.v NeonLoop.v NeonSequenceSpec.v NeonLoopSpec.v NeonTail.v NeonTailEntry.v NeonEdges.v NeonFinalize.v NeonKernel.v NeonRegisters.v KernelSpec.v Programs.v NeonProgram.v NeonByteSpec.v
python3 research/sail-tooling-gap/kernel-e2e/audit.py
```

未完成的证明使用单独命令尝试，不能纳入成功的重放列表：

```sh
python3 research/sail-tooling-gap/kernel-e2e/check.py RvvDefs.v RvvWiden.v RvvAdd.v RvvLoad.v --timeout 1200
python3 research/sail-tooling-gap/kernel-e2e/check.py RvvWidenFast.v RvvAddFast.v --timeout 900
```

本次没有修改两个 Sail IR。RVV 的 `platform_write_mem_ea` 地址通知 hook 按
Sail C runtime `lib/rts.c:349` 配成返回 unit；真正的 `platform_write_mem` 仍生成写内存事件。
上游 Islaris 也为这个通知 hook 配置了常量。本目录的所有这种平台/体系结构前提
都在 `simple/configs`、`simple/dumps` 和相应 trace 的 `Assume` 事件中可见。

Coq 检查接受的证明不依赖 LLM 的判断。Sail、Isla 提取及配置的可信边界仍须单独看待，
不能把“Coq 能导入一份 trace”说成“Coq 已证明这份 trace 与整个 Sail 实现等价”。

原优化 kernel 的提取诊断、最初 19 指令的 `uaddlp` NEON 变体以及失败尝试保存在
`diagnostics`、`simple-uaddlp-diagnostic` 和根目录 `logs/results`，不属于当前简化 demo 的成功结果。
