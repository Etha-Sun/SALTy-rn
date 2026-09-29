# Reduction 人工翻译与单 Spec proof 实验

本实验选取真实的 `qu8-rsum`，不是重新写一个数学求和 toy program。
源代码不变，人工补上当前 element-wise compiler 尚不能生成的 Lean value model，
只公开一个最终等价命题，再交给独立 LLM 生成 proof。

**本次完整等价证明成功**，独立检查记录见 [ProofResult.json](ProofResult.json) 和
[Lean 检查日志](ProofResult.log)。编译成功、有限测试通过、完整等价证明成功是三个
不同的结论，本次三项均已完成。本目录不冒充现有 compiler 自动产生的
`verified(value)` 发布链，不改变主项目的 toolchain 或 canonical intrinsic registry。

## 0. 先看实际 proof 生成结果

| 项目 | 本次结果 |
|---|---|
| 人工模型 | 159 行，保留 NEON/RVV 各自的真实 lane 与 loop state |
| 公开 Spec | 15 行、恰好 1 个命题，没有把中间正确性作为假设 |
| LLM proof | 615 行、45 个辅助定理 + 1 个最终目标 |
| 生成方式 | 一个独立 proof agent，得到建模阶段的文字 invariant 提示，结合 Lean 报错迭代 |
| 生成耗时 | 约 15 分钟；agent 记录的写入/修复区间约 13 分 18 秒 |
| 编译迭代 | agent 报告 14 次直接 Lean 编译，12 次中间失败后修复、2 次成功 checkpoint；不是 one-shot |
| 独立重检 | 全新目录重编 Models、Spec、Proof，并检查目标类型及全部 46 个定理的公理依赖；约 4.9 秒 |
| 公理 | 最终仅 `propext`, `Classical.choice`, `Quot.sound`；无新增公理、`sorry`、`native_decide` |
| 冻结完整性 | Models、Spec、两份原 C 的 SHA-256 与 proof 生成前一致 |
| C／Lean 对照 | 1,242/1,242 通过，另有 `_tu` 丢失的负对照 |

编译次数/生成耗时来自本次 agent 的工作记录，不是统计性 benchmark，也不表示换一个
kernel 或无提示就有相同成功率。机器可读摘要见 [GenerationRun.json](GenerationRun.json)。

最终目标的 proof 很短：

```lean
theorem completeValueEquivalence : completeValueEquivalenceClaim := by
  intro input overread oldOutput vlmax chunks _ hpadding hschedule
  rw [neon_value_eq_byteSum input overread oldOutput hpadding,
    rvv_value_eq_byteSum input oldOutput vlmax chunks hschedule]
```

但这不是把困难藏进假设：前面的两个 normalization theorem 都是这个 LLM 在同一个
Proof.lean 中证明的，分别连接独立的 NEON/RVV 实现与 proof-only `byteSum`。
Spec.lean 不定义或假设这两个 theorem。

建议读 proof 的顺序：`vadd_tu_sum` → `rvvLoop_conservation` →
`rvv_value_eq_byteSum`，再看 `neonInner_invariant` → `neonOuter_summary` →
`maskedTail_summary` → `neon_value_eq_byteSum`。不必一开始就读所有 BitVec 辅助引理。

实际卡点主要不是“找不到任何 invariant”，而是：

- Std 没有部分 mathlib tactic，第一次写法需改为基础 tactic；
- BitVec 的 0/1 与位宽归一化使泛化的 simp 不匹配，需要显式 typed lemma；
- 不能为证明自动展开 128 次具体循环；先证明通用 inner summary，再用它组合 outer；
- tail 需要精确地重写局部表达式，不能误把 batch 在整个目标中一起替换。

## 1. 找到了哪些之前的讨论

当前 checkout 是 `feat/elementwise-verification@7ea7bf3`。
更早的 `origin/feat/elementwise-compiler@ba5b341` 保留了后来清理掉的工作笔记。
其中 `notes/memory/DISCUSSION_LOG.md` 的“从二十个扩到三十六个”讨论明确指出：

- 公开 Spec 逻辑上只需要最终 observable-value equality；
- element/block/loop/phase 等命题可以是 proof agent 内部的分解；
- 简化 Spec 不会自动补齐 accumulator、memory layout 和控制流模型；
- reduction、transpose 等适合做小范围、纵向打通的后续实验。

可直接读历史，无需切换分支或恢复旧笔记：

```sh
git show ba5b341:notes/memory/DISCUSSION_LOG.md
git show ba5b341:notes/PROJECT_PROGRESS_OVERVIEW.md
```

历史记录中的阶段性成功数量不是当前最终发布结果，不在这里沿用。
另有 2025 年的 `f25fcfb`（“finished rsum”），但那是 C++ symbolic/有限执行验证，
不是这里要的任意长度 Lean invariant proof。

当前 [architecture](../../notes/elementwise-compiler/ARCHITECTURE.md) 和
[compiler README](../../src/workflow/verification/elementwise_compiler/README.md)
仍以 `map` / `zipWith` 和正分块为基础。现有 intrinsic Lean 库没有直接提供本例所需的
`vpadalq_u8` / `vpadalq_u16` / integer `vredsum` 组合。

## 2. 为什么先选 qu8-rsum

| 例子 | 与 element-wise 相似的部分 | 真正增加的义务 |
|---|---|---|
| 本次 `qu8-rsum` | 顺序输入、固定块/尾部、RVV strip mining | 跨轮 accumulator、16→32 widening、最终 scalar store |
| `qs8-rsum` | 结构几乎相同 | signed widening；最终 C `*output += vacc` 的 signed-overflow 定义域 |
| `qu8/qs8-rdsum` | 每个 channel 可以看成独立结果 | rows 内层 reduction、252/7 分组、7 个地址和 zero 替代、stride |
| `f32-raddstoreexpminusmax` | exp 变换部分是 element-wise | 数组与 sum 双输出；浮点累加分组、FMA、unordered reduction |

选无符号版本不是避开 reduction 的核心问题：它完整保留三段 NEON 处理以及 RVV
全宽 `_tu`。只是先不把 signed C UB 或 FP 非结合律混进第一轮 proof 搜索。

本例的数学解释是：

```text
newOutput = oldOutput + Σ zeroExtend32(input[i])   (mod 2^32)
```

这只是理解/证明时的候选摘要。**Models 中两边并没有直接定义成这个表达式。**

## 3. 人工翻译与之前生成代码的对应

文件分工与原有输出习惯一致：

| 文件 | 内容 | proof LLM 可修改？ |
|---|---|---|
| [Models.lean](Models.lean) | 两份独立实现、intrinsic 语义、完整相关状态 | 否 |
| [Spec.lean](Spec.lean) | 一个 `completeValueEquivalenceClaim` | 否 |
| [ProofTask.json](ProofTask.json) | 冻结哈希、目标名字、允许的公理 | 否 |
| [PROOF-PROMPT.md](PROOF-PROMPT.md) | 实际提供给 proof LLM 的任务和 invariant 提示 | 否 |
| [Proof.lean](Proof.lean) | LLM 生成的 ghost definitions、invariants、引理和 proof | 是 |
| [ProofResult.json](ProofResult.json) | 独立检查后的准确结论 | checker 写入 |

沿用 `SALT.Corpus.qu8rsum` namespace、`let vt_0` / `vacc_1` 的局部 SSA 风格、
`neonValueLoopWithOverreadFromIntrinsics` / `rvvValueLoopFromIntrinsics` 的观察函数。
不同点是明确标注 **hand-translated**，不伪造 parser manifest 或 capability 审批。
逐段源码位置和人工折叠决策另见 [ManualTranslation.json](ManualTranslation.json)。

### NEON 对应表

源文件：[kernels/source/qu8-rsum.c](../../kernels/source/qu8-rsum.c)。

| 原 C 的部分 | Lean 定义 | 没有被省略的行为 |
|---|---|---|
| `vacc0 = vmovq_n_u32(0)` | `neonRun` 初始化 | 4 个 BV32 lane、旧 output |
| 2048 字节 outer for | `neonOuter`, `neonFullBlock` | 每组重置 8 个 BV16 accumulator |
| 128 次 16 字节 inner for | `neonInner`, `neonLoad16` | pairwise widening、input += 16、current_batch -= 16 |
| `vpadalq_u16` | 同名语义函数 | 相邻 BV16 lane 扩宽、累加到 4 个 BV32 lane |
| 剩余完整 16 字节块 | `neonRemainderLoop` | 这里减的是 batch，不是 current_batch |
| 1–15 字节尾部 | `neonTail`, `maskedTail` | 先读 16 字节，乘 0/1 mask；不移动 input，不减少 batch |
| `vaddvq_u32` 与 `*output += vacc` | `neonRun` 收尾 | 横向 BV32 reduction + 旧 output |

`neonOuter (input.length / 2048)` 等是对固定递减 loop 的人工计数翻译，
不是有限 fuel 截断：任意输入长度都执行相应数量的组。**这个 C-loop→递归函数的
对应本身是人工建模边界，尚未有 C frontend lowering theorem。**

mask table 被折叠为 `batch` 个 1 和 `16-batch` 个 0；原表固定且尾部范围 1–15。
仍然使用任意非零 padding 的实际读取结果，而不是提前把尾部输入补零。
BV8 乘法、BV16 累加、BV32 累加分别保留位宽。

### RVV 对应表

源文件：[kernels/target/qu8-rsum.c](../../kernels/target/qu8-rsum.c)。

| intrinsic | 本实验的语义 |
|---|---|
| `vsetvlmax_e32m8` | 参数 `vlmax=M`，初始化 M 个 accumulator lane |
| `vsetvl_e8m2(batch)` | 从已给定 schedule 取下一 vl；约束见下节 |
| `vle8` | 读取当前输入前 vl 个 Byte |
| `vzext_vf4` | 每个 BV8 零扩展为 BV32 |
| `vadd_vv_u32m8_tu` | 更新前 vl 个 lane；保留 accumulator 的其余 lane |
| `vredsum(..., vlmax)` | 加种子后遍历整个 M 个 lane，不只最后一次 vl |
| `vmv_x_s` + `*output +=` | 提取 reduction 的 lane 0，加到旧 output |

两份模型都返回完整状态，再投影 `output` 做 observable equality。params 没有读取
效果，未添加无意义的 params 数学参数。`input` 保存未读物理后缀；NEON 包含 padding。
寄存器外不可观察的 local 生命周期、物理指针地址、CSR、异常/调试 assert 中止行为
不是这层 value state。

## 4. sum_1 / sum_2 / sum_3 应当怎样统一

要区分三件事：

1. **同一寄存器的 SSA 版本**：例如 `vacc_0`、`vacc_1`，跨 loop 用 `state.vacc`
   携带最新版本；局部基本块内部仍可保留 SSA 名称。
2. **不同真实累加寄存器**：例如本例 `vacc16` 和 `vacc0`，位宽、lane 数、生命周期
   都不同，不能因为都叫 sum 就合并；多个同类型寄存器可表示为 register bank 或列表。
3. **证明里的共同摘要**：定义 `sum32(state.vacc)` 等 ghost 表达式，用守恒 invariant
   与“已经消费的输入前缀”联系。统一的是观察/证明语言，不是抹去执行状态。

例如输入 `[1,2,3,4,5,6]`、M=4、初始 accumulator 全零：

| chunks | 最终 RVV accumulator | 横向和 |
|---|---|---|
| `[4,2]` | `[6,8,3,4]` | 21 |
| `[3,3]` | `[5,7,9,0]` | 21 |
| 六个 `[1]` | `[21,0,0,0]` | 21 |

状态不相等，观察值可以相等；这正是 relational invariant 发挥作用的地方。
这几项也在 [Tests.lean](Tests.lean) 中有 Lean 内核检查的小实例。

## 5. 单 Spec 到底要求什么

公开目标只有：

```lean
∀ input overread oldOutput vlmax chunks,
  0 < input.length →
  15 ≤ overread.length →
  ScheduleOK input.length vlmax chunks →
  neonValueLoopWithOverreadFromIntrinsics input overread oldOutput =
    rvvValueLoopFromIntrinsics input oldOutput vlmax chunks
```

没有把“NEON 等于 sum”“RVV 等于 sum”“某个 invariant 成立”放进假设。
如果 proof 采用这些中间结果，必须自己证明。

`ScheduleOK` = `0 < M`、chunks 总和为输入长度、每个 chunk 满足 `0 < vl ≤ M`。
这是有意的 **value-level overapproximation**，不是宣称 ISA 能随意选 vl。
例如 AVL=6、M=4 时，原调用允许 `[4,2]` 或 `[3,3]` 两种合法机器策略，
但全 1 是改变软件请求后的策略，不是原 AVL=6 调用的合法硬件返回。

整数同宽模加法有结合律，因此本例适合证明所有上述分块结果相同。
浮点加法没有这个性质；本实验不把这个结论推广到 FP reduction。
精确合法 vsetvl 策略→本 schedule 条件的接入也尚未做机械化证明。

## 6. 真正需要的 invariant

以下是建模阶段提供给 LLM 的候选结构，不是作为公理添加的条件。本次对应的守恒、
shape、计数、范围及 tail 引理已经在 Proof.lean 中完成，并通过独立审计。

### RVV：一层循环

假设已经消费 p 个字节：

```text
inputOffset = p
batch = original.length - p
input = original.drop p
vacc.length = M
sum32(vacc) = byteSum32(original.take p)
output = oldOutput                         // 收尾 store 之前
```

一轮更新需要的关键等式：

```text
sum32(vadd_tu(acc, widenedChunk))
  = sum32(acc) + sum32(widenedChunk)       (mod 2^32)
```

前提是 `chunk.length ≤ acc.length`。这解释了为什么 reduction 不能不加分析地
复用原先“不带 M 的任意 PositivePartition”：除了正长度还必须约束 active lanes
不超过 accumulator 宽度。

### NEON：inner + outer + tail

一次 `vpadalq_u8` 给每个 BV16 lane 最多增加 `255+255=510`。
处理 t 个 16-byte 块后：

```text
0 ≤ t ≤ 128
每个 vacc16 lane 的自然数值 ≤ 510*t ≤ 65280 < 65536
```

这条范围 invariant 是 **16-bit→32-bit 扩宽保持求和** 的关键。
只证明“在 BV16 下模 65536 相等”不够：如果中间溢出，扩宽以后丢掉的进位回不来。
例如 129 次全 255 更新会让单 lane 的 65790 回绕为 254；真实代码每 128 次就提交
并重置，恰好避免这种情况。不是为了让 proof 方便才凭空加了 128 上界。

还需要：

- inner 已消费输入与 lane 总和的对应；
- `vpadalq_u16` 提交后 BV32 总和的对应；
- outer 对完整 2048-byte 前缀的累计守恒；
- tail mask 把任意 overread 字节贡献消成零；
- 全局 32-bit 和、横向 reduction、旧 output 的模加法重组。

所以“只需把 state 传完整”是**正确的建模起点**，但不足以自动完成证明。
后续 proof automation 应优先积累这些可复用引理，而不是继续加 kernel 名称 pattern。

## 7. 如何复现

本机使用已经安装的 Lean 4.29.1；原项目 pin 没有修改。只依赖 Std 和系统 C compiler。
其他机器可以设置 `LEAN_BIN` 指向同版本 Lean，无需安装本项目的全部依赖。

```sh
cd /srv/home/yuechunsun/tools/lean/research/reduction-demo
python3 run_tests.py --sanitize --result TestResult.json
python3 check_proof.py --result ProofResult.json
```

第二条只有真正证明了唯一目标才退出 0；partial proof 会退出 1 并明确记录 partial，
即使所有已完成的 helper 都通过 Lean。

测试共 23 种长度 × 6 种宽度 × 3 种分块策略 × 3 种数据模式 = **1,242 组**。
含 2047/2048/2049、4095/4096/4097、8193；全 0、全 255、变化值；任意非零
padding；oldOutput 接近 2^32，因此覆盖最终 unsigned 回绕。

原 C 通过 [host facade](original_c_test.c) 原样 include。
对照输出与 Lean 执行结果逐行比较；双方另与标量 unsigned 参考值比较。
ASan/UBSan 用来检查本次 host harness 的执行；LeakSanitizer 在受限环境下禁用。
M=1/3/7 等包含抽象模型的测试点，不全部对应实际 e8m2/e32m8 硬件配置。

负对照把 `_tu` 错改为丢弃 tail：输入 `[1,2,3,4,5,6]`、M=4 时结果变成 14，
而正确值是 21。说明测试至少能够抓住这个具体的跨轮 state 丢失错误。

## 8. 边界与建议

本次在 `research/` 内隔离实施，没有改主 compiler、原 C、intrinsic registry、
已发布的 elementwise results，也不自动提交/push。

需要继续明确的信任边界：

- 人工 C→Lean 翻译及局部 intrinsic 定义仍需要审查/后续 ISA bridge；
- padding 长度是假设的 logical readable stream，不是 C allocation/provenance 证明；
- load 使用 List.take，短列表会截断；应通过 shape/域义务排除非法 load，不代表
  越界 C 读返回空列表。奇数 pairwise input、短 accumulator 等总化行为也不对应合法 intrinsic 调用；
- input/output 用独立逻辑输入和旧标量 output 观察，不声称完整 alias/memory theorem；
- counters 使用 Nat，是值层 loop index，尚未证明 size_t/指针转换；
- 128、2048、mask-table 折叠是保留原结构的人工翻译，不是新的通用 parser；
- 一次有 invariant 提示的 LLM 运行不能推算自动证明成功率。

比较具体的下一步是：把已有 `map` block API 扩成 `State → Chunk → State`，
让状态投影/observation 独立；把 loop 的归纳证明放进通用库；由 Proof.lean 建立本例
自己的 invariant。不要把“能找出 invariant”作为新 parser 的硬编码识别条件。

对目前 compiler 来说，最小的工程拆分建议是：

| 部位 | 本次暴露出的必要改动 | 不应采用的捷径 |
|---|---|---|
| AST/effect 提取 | 保留 loop 的 typed live-in / live-out、变量更新和嵌套作用域 | 只按 `sum_*` 名字找 accumulator |
| 状态生成 | 把 loop-carried 变量变成 state 字段；在 loop header 连接上一轮的新值 | 每个 block 从零重新计算、丢弃旧 lane |
| intrinsic 能力 | 审查 pairwise widening、integer horizontal sum、`_tu` 等精确变体 | 把所有 add/reduce 都换成无限精度加法 |
| memory/value view | 常量 mask table、padding、最终标量 read-modify-write | 只寻找每轮数组 store，漏掉最终 `output +=` |
| Spec/proof 接口 | 保留一个 observable equality；允许 proof 私有的 invariant 和分解引理 | 把未证明的 invariant 作为 spec 前提 |

这个任务并不要求先实现完整 C compiler；但从“循环次数的识别”升级到“状态化 loop
语义”是实质变化。能否自动生成这些模型应单独验收，不能因为人工版 proof 成功就
把当前 element-wise recognizer 宣布为已经支持 reduction。

## 9. 外部规范依据

- [Arm ACLE Neon intrinsics](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html)：
  `vpadalq_u8/u16` 对应 UADALP（pairwise widening add-and-accumulate），
  `vaddvq_u32` 是横向整数相加。
- [RVV 1.0 specification](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc)：
  integer reduction、tail-undisturbed、vsetvl 约束。
- [RISC-V integer reduction intrinsic API](https://docs.riscv.org/reference/vector-c-intrinsics/overloaded_intrinsic_funcs/05_vector_reduction_operations.html)：
  reduction 的输入向量、种子与 vl 参数。

本报告对代码的具体判断以本地冻结的 source 和 target 为依据；外部文档支持的是
intrinsic/ISA 语义，不代替对本项目手工模型的证明。
