#### 周报：RVV → Lean 与 Sail 路线

##### 1. 自建 RVV → Lean 原型

**流程：**原始 RVV intrinsic C → GCC 汇编 → 19 条 Lean 指令 → 手写 `Machine.lean` → 证明。

`Machine.lean` 定义小型 RVV 机器：标量/向量寄存器、字节内存、`vl`、单步执行和正常返回。它解释汇编，不解释 ELF 字节。

```lean
-- Machine.lean 节选；省略的构造子和字段见原文件。
inductive Instr where
  | vsetvli (rd rs : Reg) (sew lmul : Nat) (tail : Tail)
  | vle8 (vd base : Reg)
  | vzextVF4 (vd vs : Reg)
  | vaddVV (vd vs1 vs2 : Reg)
  | vredsumVS (vd vs seed : Reg)

structure State where
  pc : Nat           -- 指令序号
  x : Array XWord    -- 标量寄存器
  v : Array Byte     -- 向量寄存器的物理字节
  mem : Array Byte   -- 字节内存
  vl : Nat           -- 活动 lane 数
```

对应源码：[Machine.lean](assembly-reduction/Machine.lean)。

实际 `Impl.lean` 的部分指令（省略了标量指针更新）：

```lean
.vsetvli 15 10 32 8 .undisturbed  -- 选择 vl，保留未活动 lane
.vle8 2 11                        -- 读输入字节
.vzextVF4 16 2                    -- 扩展 8 → 32 位
.vaddVV 8 8 16                    -- 累加
.branch .ne 10 0 3               -- 还有输入则循环
```

对应源码：[Impl.lean](assembly-reduction/proofs/qu8-rsum/Impl.lean)；原始 [kernel.s](assembly-reduction/proofs/qu8-rsum/kernel.s)。

`Correct` 的含义：对所有合法配置与初态，**正常终止 + 输出为“旧值 + 输入字节和”（模 2³²）+ 其他内存及 ABI 寄存器不变**。`Proof.lean` 证明指令路径、循环不变量与终止、最终写回，再得到 `Kernel.correctness`。

| 证明结果 | 数值 |
| --- | --- |
| 汇编证明 | 通过；Lean proof 1,412 行；仅标准公理 |
| 交叉检查 | 1,512 个 Lean 用例；252 个 QEMU 对照 |
| proof 生成时间 / token | 这个汇编证明**未记录** |

定理相对于手写 `Machine.lean` 成立；与真实 ISA 的对应仍待证明。

**NEON 呢？** 这套 `Machine.lean` 没有 NEON 汇编版本。另一个**人工翻译的高层实验**分别建立原始 NEON/RVV C 的 Lean value model：

```lean
-- 这是值模型，不是汇编语义。
neonLoad16 : NeonState → NeonState    -- 16 字节加载、扩宽求和
rvvStep   : Nat → RvvState → RvvState -- 动态 vl、tu 累加
```

对应源码：[Models.lean](reduction-demo/Models.lean)。

该高层等价证明通过：615 行；agent 自报生成**约 15 分钟**，直接 Lean 编译尝试 14 次。**token 用量未记录。** 这些时间不属于汇编证明。

##### 2. Sail 路线：intrinsic C → Lean ISA 模型

```text
原始 NEON/RVV C → wrapper → Clang/GCC → .s → .o → ELF
RVV ELF → Kernel.sail 的地址/编码表
上游 RISC-V Sail ISA + Kernel.sail → 生成的 Lean ISA + kernel 入口
```

流程文件：[RVV wrapper](sail-binary-reduction/kernel-rvv.c)、[NEON wrapper](sail-binary-reduction/kernel-neon.c)、[ELF 适配器](sail-binary-reduction/elf_to_sail.py)、[Sail 生成脚本](sail-binary-reduction/generate_model.py)。

RVV ELF 函数为 **60 字节、19 条混合 16/32 位指令**。`Kernel.sail` 将真实字节地址映射到上游解码器；`kernel_step` 调用上游 `execute`：

```sail
// Kernel.sail 节选；补充了说明注释。
0x00000000800001bc => Some((encdec(0x0d307757), 4)),
0x00000000800001c4 => Some((encdec_compressed(0xcd01), 2)),
// kernel_step 读 PC → 解码 → execute(ins) → 正常退休后提交 nextPC。
```

对应源码：[Kernel.sail](sail-binary-reduction/artifacts/formal/Kernel.sail)。

汇编在生成的 **`Rv64Kernel/Kernel.lean`** 中表现为地址分派，以及对生成的 ISA 语义的调用：

```lean
-- 生成的 Kernel.lean 节选；补充了说明注释。
| 0x00000000800001BC => pure (some ((← encdec_backwards 0x0D307757#32), 4))
| 0x00000000800001C4 => pure (some ((← encdec_compressed_backwards 0xCD01#16), 2))
-- kernel_step 调用 execute ins；各指令的含义由 ISA 模型定义。
```

对应源码：生成的 [Kernel.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/Kernel.lean)；ISA 指令函数在 [InstsEnd.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/InstsEnd.lean)。

| Sail→Lean 产物 | 结果 |
| --- | --- |
| 规模 | **135 个文件；122,173 行；合计 22.4 MB** |
| kernel 入口 | `Kernel.lean` 241 行；ISA 执行文件 `InstsEnd.lean` 47,699 行 |
| 生成耗时 | **72.5 分钟**（4,352.5 秒） |
| 当前状态 | 已生成源码；**尚未通过 Lean 类型检查或执行，没有二进制证明** |

另一路 RVV Sail→Lem 约 **299 秒**生成，通过 Lem 类型检查并导出 Isabelle 源码；Isabelle 尚未检查。NEON Sail 生成尝试超时。NEON QEMU 和 RVV Sail 模拟器的有限测试，与生成模型中的证明是分开的。

##### 相关文件

| 内容 | 文件 |
| --- | --- |
| 自建模型与证明 | [Machine.lean](assembly-reduction/Machine.lean)、[Impl.lean](assembly-reduction/proofs/qu8-rsum/Impl.lean)、[Correct 契约](assembly-reduction/proofs/qu8-rsum/ReductionContract.lean)、[Proof.lean](assembly-reduction/proofs/qu8-rsum/Proof.lean)、[checker](assembly-reduction/check_proof.py)、[证明结果](assembly-reduction/proofs/qu8-rsum/ProofResult.json) |
| NEON/RVV 高层模型与生成时间 | [Models.lean](reduction-demo/Models.lean)、[GenerationRun.json](reduction-demo/GenerationRun.json) |
| Sail 输入与适配器 | [RVV C](../kernels/target/qu8-rsum.c)、[NEON C](../kernels/source/qu8-rsum.c)、[RVV wrapper](sail-binary-reduction/kernel-rvv.c)、[NEON wrapper](sail-binary-reduction/kernel-neon.c)、[elf_to_sail.py](sail-binary-reduction/elf_to_sail.py)、[Kernel.sail](sail-binary-reduction/artifacts/formal/Kernel.sail) |
| 生成的 Lean 与状态 | [Kernel.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/Kernel.lean)、[InstsEnd.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/InstsEnd.lean)、[生成结果](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/Result.json) |
