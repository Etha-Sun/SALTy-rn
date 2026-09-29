# 从 Sail 到 Coq：RVV reduction 指令验证展示材料

整理日期：2026-09-24。建议讲解 10–15 分钟，按下面 7 页组织。

**本次展示的结论：已复现上游标量 RISC-V 示例，并基于真实 Sail/Isla trace 证明了 reduction 中的两条 RVV 指令。完整任意长度 reduction、任意硬件 VLEN 和 NEON↔RVV 等价性尚未证明。**

本材料整理既有检查结果；本次没有重新执行全部证明。状态来自 [replay.json](results/replay.json)，而非根据文件存在推断。

## 第 1 页：这条验证链做什么

```text
kernel 的机器码 + Sail ISA 模型 + 提取时的配置/约束
                         │
                         ▼ Isla 符号执行
                 .isla：符号 trace
                         │
                         ▼ Islaris 前端转换
                 .v：Coq 中的 trace 数据
                         │
                         ├── Islaris 已定义的执行语义和证明规则
                         └── 我们写的规格、引理和证明脚本
                         ▼
                 Coq 检查证明是否成立
```

讲解要点：`.isla` 是带变量的行为描述；生成的 `.v` 主要改变表示格式；`Proof.v` 才证明行为满足规格。数据未知时保留为符号，指令编码和配置确定的部分可以直接求值。

“证明通过”的含义是：在定理明确列出的前提下，提取的指令行为满足后置要求。我们的 RVV demo 没有另外证明 Sail→trace 的翻译正确性；仍沿用 Isla/SMT/前端等信任边界，LLM 不在证明的 TCB 中。

## 第 2 页：上游标量 RISC-V 小程序——最容易看懂的正例

**来源：Islaris 上游；我们已在本地编译检查通过。**

实际汇编见 [riscv64_test.dump](../vendor/islaris-main/examples/riscv64_test.dump)，共 5 条指令：

```asm
li   a0,0
addi a0,a0,1
sd   a1,8(sp)
ld   a1,8(sp)
beq  a0,a1,18
```

程序把 `a0` 设为 1，把 `a1` 存入内存再读回，然后比较两者。

| 展示内容 | 文件和定位 |
|---|---|
| 汇编及提取约束 | [riscv64_test.dump](../vendor/islaris-main/examples/riscv64_test.dump) |
| `addi` 的 Coq trace | [a4.v](../vendor/islaris-main/instructions/riscv64_test/a4.v) |
| 地址到 trace 的映射 | [instrs.v](../vendor/islaris-main/instructions/riscv64_test/instrs.v) |
| 程序规格与证明 | [riscv64_test.v](../vendor/islaris-main/examples/riscv64_test.v)：`riscv_test_spec`、`riscv_test`、`riscv_test_adequate` |
| 本地检查记录 | [replay.json](results/replay.json)：`scalar-smoke`，退出码 0，约 7.3 秒 |

证明内容：在内存有效、对齐和系统状态等前提下，执行不会陷入错误；终点事件由初始 `a1` 是否为 1 决定：为 1 对应 `0x10300018`，否则对应 `0x10300014`。两个终点在模型中标记为未提供指令的边界，规格用 `SInstrTrap` 表示；不要把它讲成实际硬件异常处理验证。

展示用途：说明这套工具已经能把多条指令、访存、分支串成一个程序证明。它不是 RVV 例子，也不包含循环。上游当前目录留有生成后的 Coq trace，未留这一例的原始 `.isla` 文件；现场展示 `.isla` 用下一例。

## 第 3 页：我们的 `vsetvli`——从真实 trace 到规格

**来源：我们的 RVV 接入与证明；已通过 Coq 检查。**

从 reduction ELF 地址 `0x800001c6` 提取指令 `0x093577d7`：

```asm
vsetvli a5,a0,e32,m8,tu,ma
```

本实验 VLEN=256、SEW=32、LMUL=8，因此 VLMAX=64；`a0` 中的剩余长度保持为任意 64 位值。

打开 [原始 Isla trace](generated-vset/a800001c6.isla)，找到以下实际片段：

```lisp
(declare-const v2 (_ BitVec 64))
(read-reg |x10| nil v2)
(define-const v3 ((_ zero_extend 64) v2))
(define-const v4 (bvsle v3 #x00000000000000000000000000000040))
```

这几行依次表示：声明未知值、读取剩余长度、零扩展、判断长度是否不超过 64。注释中的 Sail 源位置在此省略。随后 `cases` 保存各条条件路径。`assert` 是路径条件；`assume-reg` 是提取时的状态要求，需要在证明中满足。

打开 [生成的 Coq trace](generated-vset/a800001c6.v)，同一读取变成：

```coq
ReadReg "x10" [] (RegVal_Base (Val_Symbolic 2%Z)) Mk_annot :t:
```

两种形式内容接近，是因为这一步把 trace 编码为 Coq 数据，不是在自动发明规格。

打开 [VsetProof.v](VsetProof.v)，先看 `selected_vl`，再看 `vsetvl_arbitrary_remaining`，最后看 `Proof ... Qed`。

```coq
Definition selected_vl (n : Z) : Z :=
  if decide (n <= 64) then n else
  if decide (n < 128) then (n+1) `quot` 2 else 64.
```

定理的通俗含义：对于任意剩余长度 `n`，在指定 CSR 等前提下，执行该指令后 `vl` 和 `a5` 都等于 `selected_vl(n)`，`vtype` 更新为 `0x93`，`vstart` 清零，并续接到 `pc+4`。

**演讲时可用的例子：n=65 时，这份 Sail 快照选择 vl=33。** 这说明我们证明的是模型实际行为，而不是把它猜成 `min(n,64)`。这是选定快照的策略，不是所有 RVV 实现必须采用的策略。

规格和前提位于同一证明文件；并不是在生成的 trace 文件里写入预期答案。该定理也尚未证明循环每次都满足这里的 CSR 前提。

## 第 4 页：我们的 `vredsum.vs`——证明任意数据的归约结果

**来源：我们的 RVV 接入与证明；已通过 Coq 检查。**

从同一个 reduction ELF 地址 `0x800001ea` 提取指令 `0x0280a457`：

```asm
vredsum.vs v8,v8,v1
```

| 文件 | 含义 |
|---|---|
| [a800001ea.isla](generated/a800001ea.isla) | Isla 生成的原始符号 trace |
| [a800001ea.v](generated/a800001ea.v) | Islaris 转换成的 Coq trace 数据 |
| [InstructionProof.v](InstructionProof.v) | `sum64` 规格与 `vredsum_full64` 定理 |
| [BitsProof.v](BitsProof.v) | 打包位向量取低 32 位的辅助引理 |
| [WholeStruct.v](WholeStruct.v) | 寄存器与字段访问的辅助证明规则 |

先展示原始 trace 中的这两类内容（分别摘录，不连续）：

```lisp
(assume-reg |vl| nil #x0000000000000040)
```

```lisp
(declare-const v7 (_ BitVec 65536))
(read-reg |vr8| nil v7)
```

第一行说明本次把 `vl` 固定为 64；后两行说明源向量数据是符号值。`65536` 是旧 Sail 快照的寄存器存储表示宽度，不是本次选择的硬件 VLEN。

定理证明的核心结果，以下为数学解释而非完整 Coq 声明：

```text
对任意 seed 和源向量寄存器内容：
执行后 v8 的低 32 位
  = (seed 的低 32 位 + 64 个源 lane 的和) mod 2^32
```

这是单条归约指令的真实语义证明。没有证明之前的加载和累加循环，也没有证明完整函数的内存副作用、寄存器保持和终止性。

本地错误规格对照：把 `sum64` 的初始 seed 改为 0，保留真实 trace 和原证明脚本，Coq 检查失败并报告 `Unable to unify`。见 [负对照日志](logs/negative-wrong-seed.log) 和 `replay.json` 中的 `negative-wrong-seed`。这只是特定错误规格的检测演示，不是对证明系统健全性的额外证明。

## 第 5 页：完整 reduction 的规格——已经写出，但尚未接通实现证明

打开 [ReductionSpec.v](ReductionSpec.v)：

```coq
Definition reduction_result (old : Z) (xs : list Z) : Z :=
  (old + byte_sum xs) mod modulus.
```

`modulus = 2^32`。该规格还明确：输出以 little-endian 写入 4 字节；其他内存不变；正常返回；保留指定 ABI 寄存器。`total_contract` 另外表达终止和不陷入错误。

实际已证明的一个数学引理是：

```coq
Lemma common_spec_pointwise_equivalence before neon rvv output old xs :
  reduction_post before neon output old xs ->
  reduction_post before rvv output old xs ->
  forall a, neon a = rvv a.
Proof. intros Hn Hr a. rewrite Hn, Hr. reflexivity. Qed.
```

**这里的 `neon` 和 `rvv` 是最终内存函数的变量名，不是已经导入的两段 ISA 程序。** 它只证明：假如两份最终内存都满足同一个精确更新规格，则它们逐地址相等。两边机器码满足规格，仍是待完成的主要义务。

`legal_call` 目前表达 RVV 侧输入条件；NEON 尾部完整读取 16 字节所需的可读 padding，还必须放入最终共享输入域。具体 ISA 状态适配、访存权限及代码布局也尚未接通。

建议口头表述：“我们有精确函数契约，也有两条真实 RVV 指令引理；尚未把整个循环连接到契约。”

## 第 6 页：Islaris 上游已经做过哪些例子

以下不是我们的新增成果。除第一页展示的 `riscv64_test` 已由本地 replay 检查外，下列原作者案例本次仅核对论文和源码，没有重新运行其证明。

| 上游案例 | ISA | 展示它说明了什么 | 本地源码 |
|---|---|---|---|
| memcpy | Arm / 标量 RISC-V | 用不变量处理复制循环和内存 | [Arm](../vendor/islaris-main/examples/memcpy.v)、[RISC-V](../vendor/islaris-main/examples/memcpy_riscv64.v) |
| 二分查找 | Arm / 标量 RISC-V | 循环、数组、比较函数指针 | [Arm](../vendor/islaris-main/examples/binary_search.v)、[RISC-V](../vendor/islaris-main/examples/binary_search_riscv64.v) |
| UART 输出 | Arm | 轮询循环与内存映射 I/O 事件 | [uart.v](../vendor/islaris-main/examples/uart.v) |
| 非对齐访问 | Arm | 指定配置下的异常进入及状态更新 | [unaligned_accesses.v](../vendor/islaris-main/examples/unaligned_accesses.v) |
| C 内联汇编 rbit | Arm | 位反转机器码与功能规格的连接 | [rbit.v](../vendor/islaris-main/examples/rbit.v) |
| pKVM 异常处理片段 | Arm | 真实系统代码、重定位参数与系统寄存器 | 原论文 §6；未声称验证整个 pKVM |

来源：[Islaris 论文 §6 / Figure 12](https://people.mpi-sws.org/~dreyer/papers/islaris/paper.pdf)、[固定版本的上游 examples](https://github.com/rems-project/islaris/tree/c978e10f50db5c40f0fdf113f5f76a779782c6f9/examples)。这些先例没有给出本项目的 RVV reduction 等价性结论。

想展示“如何处理循环”，最推荐打开 `memcpy_riscv64.v` 的 `memcpy_loop_spec`：其核心关系是 `take i dstdata = take i srcdata`，即已经复制的前缀相同。循环体证明维护该关系；到循环出口得到整个目标数组与源数组相同。长度是规格参数，但受地址范围、内存资源等前提约束；不要将其说成已证明所有机器配置或自动得到终止定理。

补充历史边界：原论文 §5 还报告了 RISC-V memcpy 所用指令的 trace 对 Sail-generated Coq 的翻译验证，以及一个简单程序的组合结果。这个额外验证层没有在我们的 RVV demo 中完成。不能笼统说 Islaris 从未研究如何移除 Isla/SMT 的信任，也不能把上游该结果算到我们的 RVV 证明上。[论文 §5](https://people.mpi-sws.org/~dreyer/papers/islaris/paper.pdf)

## 第 7 页：我们完成了什么，剩下什么

| 项目 | 当前证据 | 可以声称的范围 |
|---|---|---|
| 上游标量 RISC-V 例子 | 本地 Coq 检查成功 | 复现既有程序证明 |
| `vsetvli` | 本地 Coq 检查成功 | 指定配置、任意 64 位剩余长度的指令性质 |
| `vredsum.vs` | 本地 Coq 检查成功 | 指定配置、64 lanes、任意数据的指令性质 |
| 错误 seed 规格 | 原证明被 Coq 拒绝 | 一个负对照 |
| reduction 精确 spec 和数学引理 | 本地 Coq 检查成功 | 契约定义、分块求和和共同规格推论 |
| 动态 vl 的 `vadd.vv` | 仅提取 trace | 无正确性证明 |
| 完整任意长度 reduction | 未完成 | 无完整函数定理 |
| NEON↔RVV / 参数化 VLEN | 未完成 | 无跨 ISA / 全 VLEN 定理 |

原始文件的实测大小和既有检查用时如下。KB/MB 采用十进制，Coq 时间是之前本机 replay 的记录，不是性能保证。

| 对象 | 原始 trace | Coq trace 源码 | 自写证明文件 | 证明检查时间 |
|---|---:|---:|---:|---:|
| `vsetvli` | 3,238 B | 4,633 B | 53 行 | 22.876 s |
| `vredsum.vs` | 120,392 B | 12,818 B | 52 行 | 253.573 s |
| 动态 vl 的 `vadd.vv` | 61,148,211 B | 未接入本次证明链 | 无 | 未证明 |

两份证明还依赖共 75 行的辅助规则/位向量引理；整个函数规格及数学引理为 122 行。总计 302 行，不能把单个 52 行文件当成全部验证基础设施。动态 vl 的 trace 大小提示提取成本，不能据此判定方法不可行或已有新研究贡献。

**61 MB 的进一步拆解（2026-09-24）：主要是文本表示膨胀，不能直接理解成同等规模的独立逻辑。** 旧快照使用 65536 位位向量表示寄存器；一个数值为 32 的 65536 位移位常量，以补齐前导零的十六进制形式打印，每次 16,386 字节，重复 3,640 次，共 59,645,040 字节，占文件约 97.54%。整份原始文件 gzip 后约 205 KB（仅内存中测量，未改动 trace）。这说明先应优化常量表示/共享；压缩文件并不能代替证明，也不意味着动态 vl 的证明已经容易。文件仍包含 64 个 `cases` 和 129 个 `trace` 节点。

## 现场文件打开顺序

推荐主线讲三个成功案例，另加一个负对照；循环案例作为答疑备用。

1. 上游小程序：`riscv64_test.dump` → `instructions/riscv64_test/a4.v` → `riscv64_test.v`。
2. 设置长度：`generated-vset/a800001c6.isla` → 对应 `.v` → `VsetProof.v`。
3. 向量归约：`generated/a800001ea.isla` → 对应 `.v` → `InstructionProof.v`。
4. 精确函数规格：`ReductionSpec.v`；强调两个 ISA-to-spec 前提还未证明。
5. 检查证据：`results/replay.json`，必要时展示错误 seed 日志。
6. 回答循环问题：上游 `examples/memcpy_riscv64.v` 的 `memcpy_loop_spec` 和 `memcpy_loop`。

可在仓库根目录提前运行已有复现脚本；无需为了 presentation 修改任何定理：

```bash
python3 research/sail-tooling-gap/islaris-reduction/replay.py
```

既有检查时间合计约 5 分钟，主要花在 `vredsum`；现场建议展示保存的日志，明确标注是此前运行结果。完整工具版本、快照哈希和提取方式见 [实验 README](README.zh-CN.md)、[provenance.json](results/provenance.json)、[extraction.json](results/extraction.json)。

一句话结束展示：**已有工具支持真实 ISA 语义上的程序证明；我们的实验确认能接入 RVV 指令。下一步是把动态长度循环与精确共同规格连起来，而不是宣称完整跨 ISA 等价性已经完成。**
