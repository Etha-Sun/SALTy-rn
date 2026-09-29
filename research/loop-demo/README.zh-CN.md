# 通用嵌套循环如何建模到 Lean：可运行 demo 与瓶颈分析

## 1. 结论先说

**任意有限层数的 for 嵌套，可以用一个递归的语句类型统一表示；不需要为两层、三层、六层循环分别写识别模板。**

但需要分清三个目标：

| 目标 | 难度与当前结果 |
|---|---|
| 表示并执行不同结构的嵌套循环 | 本 demo 已实现通用控制流核心，并运行矩形、三角形、动态上界、分支、while 和内存例子 |
| 证明一个具体循环对所有输入都正确 | 本 demo 已对任意 `rows`、`cols` 证明双层计数循环终止，且结果为 `rows * cols` |
| 自动翻译并证明任意 C／RVV 程序 | 本 demo 没有实现；需要源语言语义、内存、循环不变量及翻译对应关系，不能由支持嵌套语法自动得到 |

建议路线：**先建立保留控制流与状态的语义层，再把 element-wise 等模式作为可选的证明简化工具。不要继续把模式识别当成程序是否能够被表示的门槛。**

这份 demo 不修改 SALTy-RN 的现有 compiler、kernel、证明文件或工具链 pin。它是独立原型，不是已接入的生产功能。

配套的 [GEMM 与 vl 报告](../GEMM-VL-EXPLAINED.zh-CN.md) 解释了为什么通用循环状态还需要保留布局、指针步长和活动长度。

## 2. 如何运行，以及应该先看哪里

核心代码：[GeneralLoops.lean](GeneralLoops.lean)。只依赖 Lean 自带的 `Std`，不依赖 Mathlib，也不需要安装 SALT 的其他依赖。

本次使用已安装的 **Lean 4.29.1** 检查通过；仓库原项目 pin 是 4.29.0，本 demo 的成功不等于原项目在其 pin 下的发布认证。没有为此升级原项目。

在仓库根目录执行：

```sh
# 使用已有 Lean/elan，脚本默认选择 Lean 4.29.1：
python3 research/loop-demo/run_checks.py

# 或显式选择已经安装的二进制，避免 elan 尝试获取工具链：
LEAN_BIN=/path/to/lean-4.29.1/bin/lean \
  python3 research/loop-demo/run_checks.py
```

[run_checks.py](run_checks.py) 会调用 Lean，检查全部例子和定理，并审计六个核心定理的公理依赖。允许的依赖只有 Lean 标准的 `propext`、`Classical.choice`、`Quot.sound`，没有 `sorryAx` 或新增公理。

建议阅读順序：

1. 先看第 3 节的 C→语义核心对应关系。
2. 再看第 4 节的具体例子和第 5 节的双层循环证明。
3. 最后看第 7、8 节的仓库瓶颈与落地路线。

## 3. 具体建模方式：把程序变成语句树，而不是强制变成 map

### 3.1 只有五种核心语句

```lean
inductive Cmd (σ : Type) where
  | skip
  | atom (action : σ → Except Fault σ)
  | seq (first second : Cmd σ)
  | branch (guard : σ → Bool) (yes no : Cmd σ)
  | loop (guard : σ → Bool) (body : Cmd σ)
```

可以把 `σ` 理解成“程序当前全部状态”。它包含哪些字段，由所建模的程序决定。

| 语句 | 白话解释 |
|---|---|
| `skip` | 什么也不做 |
| `atom f` | 执行一个基本操作，成功得到新状态，失败给出明确错误 |
| `seq a b` | 先执行 a，将新状态交给 b |
| `branch g a b` | 根据当前状态判断，执行 a 或 b |
| `loop g body` | 根据当前状态判断，执行循环体，然后重新判断 |

`body` 本身又是 `Cmd σ`，所以它自然可以包含另一个 loop，再包含另一个 loop。**类型定义不需要知道嵌套深度。**

需要诚实说明：本原型的控制流是显式语法树，但 `atom` 和条件仍使用 Lean 函数。它是“深嵌入控制流＋浅嵌入表达式”的混合原型，还不是可序列化的完整表达式 IR。正式 compiler 应把这些函数替换或封装为类型明确的表达式／primitive 节点，并定义其解释函数。

### 3.2 普通 C for 只需要一次统一展开

```c
for (init; cond; step) {
    body;
}
```

对应：

```text
seq init
    (loop cond
          (seq body step))
```

代码中的定义就是：

```lean
def forC (init : Cmd σ) (guard : σ → Bool)
    (step body : Cmd σ) : Cmd σ :=
  .seq init (.loop guard (.seq body step))
```

这里没有假设步长是 1，没有要求循环上界是常量，也没有要求 body 是逐元素函数。条件每轮都根据最新状态重新计算。

但这条展开只适用于本 demo 明确支持的子集：**没有 break、continue、return，条件没有副作用**。特别是 C `continue` 要先执行 for 的 step，再重新判断；将它直接当成普通 while 的 continue 会错。

条件含 load、函数调用或自增时，未来应显式建模条件求值产生的状态与错误，例如 `test : State → Except Fault (Bool × State)`，而不是把它偷偷当成纯 Bool。局部变量声明的作用域和重名处理也应由前端显式保留或进行可靠的唯一命名。

### 3.3 任意循环的语义，不要求先证明它会终止

本 demo 同时提供两个层次：

**`Exec cmd start finish`：无 fuel 的成功执行关系。**

它用规则描述程序怎样从起始状态执行到结束状态。循环的规则是：条件为真，执行 body，再执行同一个 loop；条件为假就结束。这种归纳关系允许描述一般 while，而不需要先给解释器证明所有 while 都会终止。

**`eval fuel cmd state`：用于运行和调试的解释器。**

它返回三种不同结果：

```text
done(state)    成功结束
timeout        给定计算深度额度不足
fault(error)   非法内存访问等错误
```

fuel 限制的是递归求值深度，不是精确机器指令数；顺序语句会复用下降后的深度额度。它没有出现在通用正确性定理的规格中。

已证明 `eval_sound`：如果解释器返回 `done t`，则一定有 `Exec cmd s t` 的语义推导。这个原型没有另外证明解释器的完备性或 fuel 单调性。

**timeout 不等于已经证明无限循环，fault 不等于成功返回默认值。** 即使 `skip`，fuel=0 也会超时。这防止“运行次数不够”被误报为“程序正确”。

## 4. demo 中有哪些实际例子？

### 4.1 三层 for＋if/else＋写内存

`fill3D 2 2 3` 对应：

```c
for (i = 0; i < 2; ++i)
  for (j = 0; j < 2; ++j)
    for (k = 0; k < 3; ++k)
      out[(i * 2 + j) * 3 + k] =
          ((i + j + k) % 2 == 0) ? 10 : 20;
```

得到：

```text
[10,20,10, 20,10,20, 20,10,20, 10,20,10]
```

它展示矩阵／卷积常见的多维循环与扁平索引，不声称已经实现完整 GEMM 或 RVV 指令解释。

### 4.2 内层上界依赖外层：三角形循环

`triangle 4` 对应：

```c
count = 0;
for (i = 0; i < 4; ++i)
  for (j = 0; j < i + 1; ++j)
    ++count;
```

结果是 `1+2+3+4=10`。这不要求迭代空间是一个矩形。

### 4.3 上界在 body 中变化，步长也不是 1

`changingBound` 对应：

```c
limit = 7;
for (i = 0; i < limit; i += 2)
    limit -= 1;
```

每轮结束状态依次为 `(i,limit)=(2,6),(4,5),(6,4)`，随后退出。测试检查最终 i=6、limit=4。

这个例子特意不采用进入循环时就固定好的 `List.range limit`，否则会丢失上界变化的语义。`forRange` 只是便捷构造器；基础的 `forC` 并不受它限制。

### 4.4 五／六层嵌套，以及任意有限层语法生成

`arbitraryNest depth` 递归构造 depth 层 for，每层迭代两次，最内层增加计数。各层使用不同变量编号，不与计数器冲突。

测试 `depth=5` 得到 `32`，`depth=6` 得到 `64`。语法构造器本身对任意 Nat 深度定义；**并没有宣称已经证明所有深度都得到 `2^depth`。**

六层具体计算检查将局部 `maxRecDepth` 提高到 4096，因为函数式变量环境会积累较深的更新表达式。这是 Lean 具体化简的资源限制，不是语义只能支持六层；也提示我们不能靠完整展开所有迭代替代不变量证明。

### 4.5 while、do-while 与超时

- `countdown`：对任意自然数 n，执行 `while (n>0) n--`，已证明成功结束于 0。
- `doWhile`：即使条件一开始为 false，body 也执行一次；有计算检查。
- `while (true) skip`：给定有限 fuel 返回 timeout；并未把 timeout 视为数学上的不终止证明。

### 4.6 load/store 与别名

`forwardCopy` 相当于：

```c
for (i = 0; i < 3; ++i)
    mem[i+1] = mem[i];
```

输入同一块内存 `[1,2,3,4]`，结果是 `[1,1,1,1]`。因为每轮都读取上一轮已更新的内存，而不是对输入快照做 map。

这与前面讨论的 transpose、GEMM 地址问题直接相关：**循环状态必须包括内存；同一地址不能被不小心表示成两份互不影响的 List。**

还检查了合法块内越界、非法块号，以及由 store 引发的执行 fault。三层循环写入容量不足的内存会向外传播 fault；零次循环和未选中的 if 分支则不会执行其中的非法访问。

## 5. 不只是跑例子：双层循环的通用证明

对应程序：

```c
total = 0;
for (i = 0; i < rows; ++i)
  for (j = 0; j < cols; ++j)
    ++total;
```

### 5.1 部分正确性：如果成功结束，结果是什么？

外层不变量：

```text
i ≤ rows
total = i × cols
```

它的意思是：已经完整完成 i 行，每行执行 cols 次，因此总计数是 i×cols。

在固定外层索引 a 时，内层不变量：

```text
i = a
j ≤ cols
total = a × cols + j
```

它的意思是：前 a 行已经完成，本行又完成了 j 次。

内层结束时 `j=cols`，所以：

```text
total = a×cols + cols = (a+1)×cols
```

再执行外层 `i++`，就恢复外层不变量。整个循环结束时 `i=rows`，得到 `total=rows×cols`。

代码通过同一个 `hoare_for` 规则组合这两层证明，没有将 rows 或 cols 展开成某个固定整数。

### 5.2 终止性：不能只说“如果结束就正确”

通用 `loop_terminates` 规则要求：

1. 每次进入 body 都存在一次成功结束的 body 执行。
2. 不变量保持。
3. 某个自然数度量严格减小。

内层用 `cols-j`；外层用 `rows-i`。证明外层一步时，先调用内层的终止性定理，因此不需要人为把所有嵌套循环拼成一个复杂递归函数。

最终定理 `gridCount_total` 是：

```lean
theorem gridCount_total (rows cols : Nat) (s : Counter) :
    ∃ t, Exec (gridCount rows cols) s t ∧ t.total = rows * cols
```

它包含任意初始状态和零维度，且没有 fuel 参数。初始化会重置 i 和 total，内层会重置 j。

**这是所给双层计数程序的通用总正确性证明，不是任意程序的自动证明器，也不是三层内存例子的通用正确性证明。**

## 6. load/store 这次解决到哪一步？

当前选择一个小而明确的模型：

```text
Word   = BitVec 32
Memory = Array (Array Word)
Ptr    = { block : Nat, offset : Nat }
```

外层 Array 是已分配的块，内层 Array 是块里的 32 位单元。这里 offset 的单位是单元，不是字节。

- 同一个 `(block,offset)` 就是同一地址，能表达别名。
- load 检查块号与偏移，非法访问返回 Fault。
- store 同样检查边界，返回更新后的共享内存。
- 内存单元在创建时全部初始化。

它尚未覆盖：字节寻址、混合宽度访存、对齐、端序、指针来源、权限、分配释放、未初始化值、并发，以及完整 C 的未定义行为。`vars : Nat → Nat` 中的循环计数也暂时是数学自然数，不是 size_t 的模运算；不能因此宣称 C 溢出已建模。

这不是 CompCert 的完整内存模型实现。CompCert 将内存块、偏移、访问有效性和权限等纳入语义，可作为后续设计的权威参照；本 demo 只借用了清晰的块与偏移思路。[CompCert Memory 模块](https://compcert.org/doc/html/compcert.common.Memory.html)

此阶段可以暂缓完整 C 内存，但不建议再用“越界读默认给零”“任意两个参数默认互不影响”等隐含语义。应将暂未覆盖的保证变成明确前提或待完成的验证义务。

## 7. 当前 SALTy-RN 的主要瓶颈在哪里？

核查版本为 `7ea7bf35317e`。下面区分代码中确认的限制与设计建议。

### 7.1 前端已有控制事实，但还不是完整的可执行控制流 IR

已确认：[frontend.py](../../src/workflow/verification/lean_backend/frontend.py#L103) 有 `ControlFact`，记录节点类型、父控制节点、条件和更新文本等。

但 [ForStmt 处理](../../src/workflow/verification/lean_backend/frontend.py#L1121) 要求特定 AST 形状，且除 body 外的有效子节点数为两个。它不等同于支持所有含 init 声明、不同 body 形式的 C for。While/Do 的 body 也要求 CompoundStmt。

突破方式：保留 init、test、step、body 的结构和求值顺序；支持嵌套本身依靠递归降低，不靠正则新增 kernel 特例。遇到未定义或未支持的语义应拒绝，而不是忽略。

### 7.2 识别器主动限制了嵌套循环

已确认：[recognize.py](../../src/workflow/verification/elementwise_compiler/recognize.py#L499) 要求：

- RVV 只有一个顶层正剩余量循环。
- 条件匹配 `变量 > 0`。
- 该循环的直接嵌套控制节点只允许 IfStmt；其他控制节点拒绝。

固定宽度 NEON 循环也用特定条件／更新模式匹配，见 [同文件](../../src/workflow/verification/elementwise_compiler/recognize.py#L317)。

突破方式：将这些 recognizer 留作“已知家族的自动证明快路径”，而不是一般语义生成的入口条件。

### 7.3 生成的证明目标预先假定 map/zipWith 结构

已确认：[emit.py](../../src/workflow/verification/elementwise_compiler/emit.py#L607) 生成 `rvvChunkEqualsMapClaim`、单元素等价和循环等于 map 等目标；[Schedule](../../src/verification_bw/lean/SALT/Kernel/Schedule.lean#L156) 的块提升定理要求块等于 map。

这适合当前逐元素家族，但不自然覆盖 GEMM 多维地址、stencil 邻居、跨轮次累加或共享内存更新。

突破方式：先生成一般执行语义，再按程序性质选择观察关系和摘要。数学上的循环同余、Hoare 组合规则以及局部 intrinsic 证明可以复用，不必全部投影成一个标量函数。

### 7.4 状态与内存才是不能跳过的语义问题

循环体可以修改之后的条件、索引、指针、累加器、内存。GEMM 的 `w+=8` 就不是 `vl` 的另一种写法；它与打包记录宽度绑定。

突破方式：用明确的 State 串联操作。第一阶段可以只支持已分配的同宽单元，但必须保留别名和出错行为；随后逐步细化到字节内存，并证明两层之间的对应关系。

当前 compiler 自己也明确声明不证明完整 C 内存、合法 overread、aliasing 或二进制正确性，见 [Claim boundary](../../src/workflow/verification/elementwise_compiler/README.md#claim-boundary)。

### 7.5 自动找不变量，不会因语法通用而自动解决

嵌套层数会增加证明义务，但不构成语法上的障碍。真正困难的是：各层进展如何概括、哪些状态不变、内层结束后给外层什么保证。

对 GEMM，一种候选不变量是“已处理到第 k 项的每列累加器，等于参考程序前 k 次 FMA 的结果”，而不是直接写成实数 sum；后者会忽略浮点运算顺序。地址不变量则要记录当前 tile、列偏移和权重记录跨度。

突破方式：按层提供可复用摘要，允许人工或程序生成不变量候选，再由 Lean 检查。对非线性索引、量化、浮点和 aliasing，仍会有不能自动完成的证明。

### 7.6 还缺“原 C 程序确实对应这个 Lean 程序”的桥梁

demo 是手写的语义模型，没有将 C 自动提取到 Cmd。即使所有 Lean 定理通过，也不能推出某个原始 C kernel 已经正确。

突破方式：保留源码位置、类型、每条读写与控制节点的来源；对 lowering 建立对应关系或独立验证。当前受保护的模型／规格和 proof-only 生成机制可以保留，但必须扩大被冻结和核查的语义范围，不能让证明者自行简化掉困难的内存或循环行为。

## 8. 有哪些成熟方法可以借鉴？

### 8.1 显式语句 IR＋操作语义＋Hoare 规则：本 demo 的路线

Software Foundations 的 Imp 与 Hoare 章节展示了用递归命令类型、执行关系、顺序／分支／循环规则进行组合证明的基础方法。这里将同类思路实现为 Lean 原型，并补上明确的执行超时和简化内存。[Imp](https://softwarefoundations.cis.upenn.edu/lf-current/Imp.html)、[Hoare Logic](https://softwarefoundations.cis.upenn.edu/plf-current/Hoare.html)

适合你们的原因：控制流不绑定某个 kernel 家族；可清晰保留源程序／目标程序差异，也方便以后比较优化前后程序。不过，证明自动化需要继续建设。

### 8.2 Lean do-notation＋mvcgen：可选的证明自动化路线

Lean 官方已有 `mvcgen`，将命令式 monadic 程序的规格分解为局部验证义务，循环仍需要不变量。它并不能自动消除 C/RVV 语义或内存建模的工作。[官方教程](https://lean-lang.org/doc/tutorials/latest/mvcgen/)、[机制说明](https://lean-lang.org/doc/reference/latest/The--mvcgen--tactic/Overview/)

本机 4.29.1 已有 `Std.Tactic.Do`，但官方后续版本继续发展 while/repeat 支持；例如 4.31.0 发布说明记载了相关能力增强。因此不能直接把 latest 教程的全部能力当成当前项目 pin 已支持的能力。[4.31.0 发布说明](https://lean-lang.org/doc/reference/latest/releases/v4.31.0/)

**本 demo 没有使用 mvcgen，也没有升级工具链。** 它先以显式小核心和普通 Lean 证明验证可行性。后续可评估将 Cmd 解释到适合 mvcgen 的 monad，并证明解释对应关系，或直接为 Cmd 构建小型 VC 生成器。

### 8.3 不能只用 partial 避开终止性问题

Lean 支持多种递归定义机制，但普通 `partial` 定义与可用于逻辑展开和证明的定义有不同边界。将解释器写成能运行的 partial 函数，不等于已经得到可验证语义。[Lean 递归定义参考](https://lean-lang.org/doc/reference/latest/Definitions/Recursive-Definitions/)

本 demo 因而采用无 fuel 的归纳执行关系表示语义，fuel 解释器用于运行，终止性另用自然数度量证明。不存在“先假设所有循环终止”的隐含前提。

## 9. 建议的落地顺序与验收标准

下面是后续方案，不是已经完成的工作：

| 阶段 | 实现内容 | 具体验收标准 |
|---|---|---|
| A：控制流核心 | 类型明确的 State、seq/if/while、for lowering，支持受限纯条件 | 不靠 kernel 名称，表示矩形、三角形、动态上界及至少六层嵌套；覆盖零次执行与错误路径 |
| B：最小内存 | 块＋偏移、同宽有界 load/store、明确 alias 与错误 | 正反例区分重叠复制和不重叠复制；越界不能静默给默认值 |
| C：前端桥接 | 从 C AST 保留 init/test/step/body、绑定与求值顺序 | 手写小 C 样例与生成 IR 的对照；建立或明确尚未证明的 lowering 义务 |
| D：接入真实 kernel | 优先逐元素、transpose／packing，再 stencil、GEMM | 每个程序有状态不变量和地址关系；固定 NR 与动态 vl 分开，不以“测试通过”代替一般证明 |
| E：证明自动化 | Hoare/VC 规则、内层循环摘要、复用原 intrinsic 等价定理 | 自动化失败时留下明确义务，不改变规格或假设；所有证明由 Lean 核验 |

A 与 B 的一部分已由当前独立 demo 演示；前端接入、完整内存与真实 kernel 的新增通用证明还没有完成。对符号大小、任意嵌套深度的全自动求证也没有保证。

## 10. 本次完成情况与边界

已实现并检查：

- 通用递归 Cmd、C-style for 与 do-while 展开。
- 无 fuel 成功执行关系、带 timeout/fault 的解释器，以及解释器成功结果的健全性定理。
- 顺序、for/while 不变量规则与自然数排名终止性规则。
- 任意 rows/cols 的双层计数循环总正确性证明，及任意 n 的 countdown 终止证明。
- 三层内存写、三角形循环、动态上界、五／六层嵌套、共享内存复制、边界错误、空循环、未选中分支和超时等计算检查。
- 六个核心定理的标准公理依赖审计，无 sorry 或新增公理。

尚未实现：C 自动翻译、完整机器整数／浮点／RVV 语义、字节内存、权限、break/continue/return、带副作用条件、通用不变量自动生成、完整 ISA/C 对应证明。三层填充内存例子目前是具体输入检查，不是任意维度的形式化内存安全证明。

> 核心突破不是把更多循环写成新的 pattern，而是让 pattern 不再决定语义能否存在：语义核心接受一般循环，证明工具再决定哪些部分能自动简化、哪些需要不变量和人工帮助。
