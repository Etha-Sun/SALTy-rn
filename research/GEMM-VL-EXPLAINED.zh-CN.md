# 从 GEMM 看懂 RVV 的 vl：布局、逐轮执行与建模结论

本文以 SALTy-RN 的 `f32-gemm-minmax.c` 为主例，解释关键 intrinsic，以及为什么“只把 vl 改成 1”不等于正确的标量化；最后汇总本轮关于 vl 的讨论。

核查基线：`feat/elementwise-verification`，提交 `7ea7bf35317e`。文中的 kernel 行号对应此版本。原始 kernel 与 Lean 模型均未修改。

## 1. 先给结论：问题在固定布局，不在浮点舍入

这个 GEMM 把权重按 **8 个输出列一组**打包。每次外层循环都消费一个完整的打包块，即使最后只需要其中一部分列。

因此：

- 原程序每次处理 `min(剩余列数, 8)` 列，与打包布局一致。
- 只把请求改成 1，却仍让权重和输出指针按整块跳转，会漏掉同一块里的其他列。
- 正确的逐元素版本可以得到同样的结果，但必须保留“块编号”和“块内列编号”。

**这个例子不是两种合法硬件策略导致原程序结果不同，也不是原 GEMM 的已确认 bug。它是对“保持其他代码不变，只令 vl=1”的反例。**

## 2. 这个 kernel 到底在计算什么？

原代码：[f32-gemm-minmax.c](../kernels/target/f32-gemm-minmax.c)。

它一次处理最多 4 行输出。对一行而言，每个输出列先从 bias 开始，再沿 K 维做 fused multiply-add，最后截断到指定范围：

```text
acc[j] = bias[j]
for k = 0 .. K-1:
    acc[j] = fma(A[k], B[k,j], acc[j])
out[j] = max(min(acc[j], upper), lower)
```

这里的向量 lane 对应不同的输出列 `j`，不是同一个输出的不同 K 项。因此这段代码没有水平浮点求和归约；不同 lane 不需要在最后加到一起。

关键参数：

| 参数／名称 | 含义 | 本例取值 |
|---|---|---:|
| `mr` | 本次有效输出行数 | 1 |
| `nc` | 剩余有效输出列数，单位是元素 | 2 |
| `kc` | 每行 A 的 K 维长度，单位是字节 | 4 |
| `K = kc / sizeof(float)` | 每个输出做几次 FMA | 1 |
| `NR` | 权重固定打包宽度，代码中的常量 8 | 8 |
| `cn_stride` | 相邻输出列块起点的字节距离 | 32，即 8 个 float |
| `cm_stride` | 输出相邻行起点的字节距离 | 本例仅 1 行，不影响结果 |

原代码通过别名让无效行重复使用有效行的 A、C 指针。`mr=1` 时，四条行计算路径最终都计算同一行、写入同样的结果。下面只展开第一行。

## 3. VLMAX、NR、AVL、vl 不是一个东西

以项目默认 `VLEN=256`、本 kernel 的 `e32m4` 为例：

```text
VLEN = 256 bits                  硬件向量寄存器位宽
SEW  = 32 bits                   一个 float32 元素的宽度
LMUL = 4                         向量寄存器组倍率
M = VLMAX = 256 / 32 × 4 = 32    该配置的元素容量

NR = 8                           软件规定的打包列数
AVL = min(nc, 8)                 本轮请求数量
vl                              本轮实际处理数量
```

**`m4` 不表示 4 个 lane，`NR=8` 也不表示硬件最多只有 8 个 lane。**

该例中 `AVL≤8≤M`，所以硬件必须返回 `vl=AVL`；没有 `M<AVL<2M` 区间的选择空间。比如 `nc=18`，程序按 `8+8+2` 处理，而不是按容量 32 一次处理 18 个输出。[RVV 的 vl 设置约束](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#constraints-on-setting-vl)

上述推论要求当前向量配置受支持，并且 `VLMAX≥8`。

## 4. 权重如何存放？先看地址，再看计算

对于一个 8 列块，权重指针 `w` 指向下面的连续布局：

```text
一个打包块，共 8 × (K+1) 个 float

偏移 0       [bias0, bias1, ..., bias7]
偏移 8       [B[0,0], B[0,1], ..., B[0,7]]
偏移 16      [B[1,0], B[1,1], ..., B[1,7]]  （K≥2 时）
...
偏移 8*K     [B[K-1,0], ..., B[K-1,7]]

随后才是下一个 8 列块。
```

本例 `K=1`，所以一个块只有 16 个 float：8 个 bias，加上 8 个权重。

即使 `nc=2`，这 2 个有效列仍放在一个 8 列布局内：

```text
w[0..7]   = [0, 0, 0, 0, 0, 0, 0, 0]   bias
w[8..15]  = [1, 2, 3, 4, 5, 6, 7, 8]   K=0 的权重
             ↑  ↑
             只有前两列是本次有效输出需要的值
```

其余列是已分配槽位，本次不参与计算。`w += 8` 是跳到下一条 8 列权重记录，不是“前进本次有效列数”。

测试还额外分配并初始化了一个后续块，以安全展示错误访问：

```text
w[16..23] = [100,100,100,100,100,100,100,100]
w[24..31] = [ 10, 10, 10, 10, 10, 10, 10, 10]
```

**原程序处理 `nc=2` 时根本不会读取后续块。** 它不是该逻辑输入所需的一部分，只是测试的额外存储。

## 5. 重要 intrinsic 逐个解释

下面只解释本例使用的活动 lane；编号为 `j=0..vl-1`。

### 5.1 `__riscv_vsetvl_e32m4(requested)`：取得本轮长度

```c
size_t vl = __riscv_vsetvl_e32m4(nc > 8 ? 8 : nc);
```

选择 32 位元素、LMUL=4 的配置，并取得该请求对应的实际长度。本例 `nc=2`，返回 `2`。

C intrinsic 里名为 `vl` 的长度参数表达请求的 AVL；编译器负责安排底层配置。这里先调用 `vsetvl` 得到实际长度，再将其传给其他操作；该长度已不超过相应容量。不能理解成“每个 C intrinsic 必须独立生成一条 vsetvl 指令”。[RVV C intrinsic 的长度控制说明](https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-intrinsic-spec.adoc#control-of-vl)

### 5.2 `__riscv_vle32_v_f32m4(w, vl)`：连续读取 float32

```c
vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);
w += 8;
```

活动元素的效果是：

```text
vacc[j] = w[j]
```

第一次读的是 bias，K 循环里读的是对应 K 项的权重。**load intrinsic 不会修改 C 指针 `w`；`w += 8` 是单独的标量语句。** 将 load 长度改成 1，不会自动把指针步长改成 1。

`w` 是 `float*`，所以 `w += 8` 前进 8 个 float，即本例的 32 字节。

### 5.3 `__riscv_vfmacc_vf_f32m4(acc, a, b, vl)`：逐 lane 的融合乘加

```c
vacc = __riscv_vfmacc_vf_f32m4(vacc, a_val, vb, vl);
```

活动元素的效果是：

```text
vacc[j] = fma(a_val, vb[j], vacc[j])
```

`vf` 表示向量与浮点标量的形式：同一个 `a_val` 用在所有活动 lane，`vb[j]` 则按列变化。FMA 对乘加整体进行一次舍入，不等同于一般的先乘后加两次舍入。它不会把各 lane 相加。[RVV 融合乘加规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-single-width-floating-point-fused-multiply-add-instructions)

本例全部运算可精确表示：

```text
lane 0：fma(2,1,0) = 2
lane 1：fma(2,2,0) = 4
```

### 5.4 `vfmin_vf` 和 `vfmax_vf`：逐 lane 截断

```c
vacc = __riscv_vfmin_vf_f32m4(vacc, upper, vl);
vacc = __riscv_vfmax_vf_f32m4(vacc, lower, vl);
```

对本例的普通有限数，得到 `max(min(vacc[j], upper), lower)`。设范围为 `[-1000,1000]`，则 `2`、`4`、`120` 都不变。

NaN 和有符号零应按指令语义解释，不能仅以实数 min/max 代替；本例不涉及这些情况。[RVV 浮点 min/max 规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-floating-point-minmax-instructions)

### 5.5 `__riscv_vse32_v_f32m4(c, vacc, vl)`：连续写出活动结果

```text
c[j] = vacc[j]，仅对 j < vl
```

本例 `vl=2` 写 `c[0]`、`c[1]`；`vl=1` 只写 `c[0]`。store 不会自动修改指针，也不会替未活动列写入零。

完整指令格式见 [RVV 向量访存规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-loads-and-stores)。

### 5.6 `vfloat32m4_t` 的尾部不是隐含的有效输出

这些无策略后缀的向量结果一般使用 tail-agnostic 策略，不能依赖未活动 lane 保存某个确定值。本 kernel 在一个列块内部保持活动长度不变，只存储这些活动 lane；它不需要把未活动的寄存器尾部解释成其他列的结果。[Intrinsic 策略说明](https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-intrinsic-spec.adoc#policy-and-masked-naming-scheme)

## 6. 正常执行：一次计算两个列，结果 [2,4]

初始条件：

```text
mr=1，nc=2，K=1，A[0]=2
NR=8，VLMAX=32，cn_stride=32 字节
所有输出存储槽位初始化为 -999（未写标记）
```

逐步执行：

| 步骤 | 活动值／结果 | 指针或计数变化 |
|---|---|---|
| 请求长度 | `vl=2` | 无 |
| 读取 bias | `vacc=[0,0]`，来自 `w[0],w[1]` | `w` 从偏移 0 到 8 |
| 读取 A | `a_val=2` | A 行指针前进 1 个 float |
| 读取权重 | `vb=[1,2]`，来自原 `w[8],w[9]` | `w` 从偏移 8 到 16 |
| FMA | `vacc=[2,4]` | K 循环完成 |
| 截断 | 仍为 `[2,4]` | 无 |
| 写出 | `c[0]=2,c[1]=4` | 无 |
| 更新剩余列 | `nc=2-2=0` | 直接退出，不跳下一个输出块 |

这里 `w` 移动到下一块的起点，但不会再解引用它。所有当前有效列已经完成。

## 7. 只把请求限制为 1：为什么会错？

这里考察的修改等价于把原来的长度请求替换成：

```c
size_t vl = __riscv_vsetvl_e32m4(1);
```

其余 `w += 8`、`nc -= vl`、`cn_stride`、A 指针回退等保持不变。**这是一种软件修改，不是容量 32 的硬件对原始请求 2 的另一种合法回答。**

### 第一轮：第 0 列正确，但整块已被跳过

```text
vl=1

读取 bias：原 w[0] = 0             w 前进到偏移 8
读取 A：2
读取权重：原 w[8] = 1             w 前进到偏移 16
FMA：fma(2,1,0) = 2
写出：c[0] = 2

nc = 2 - 1 = 1                    还有一个有效列没有计算
输出指针前进 cn_stride=32 字节     指向原 c[8]，不是 c[1]
A 指针回退 kc=4 字节              下一轮再次使用 A[0]=2
```

此时本来应计算当前块的第 1 列，但权重指针已经位于下一个块的起点。

### 第二轮：读取了下一块，写到了下一块

测试准备的后续块让错误行为可以被安全观察：

```text
读取 bias：原 w[16] = 100          w 前进到偏移 24
读取 A：2
读取权重：原 w[24] = 10           w 前进到偏移 32
FMA：fma(2,10,100) = 120
写出：原 c[8] = 120

nc = 1 - 1 = 0，结束
```

对比：

| 执行方式 | `c[0]` | `c[1]` | `c[8]` |
|---|---:|---:|---:|
| 原程序，`vl=2` | 2 | 4 | -999，未写 |
| 仅限制 `vl=1` | 2 | -999，未写 | 120，错误写入 |

**这不是 ULP 差异，而是读取了错误的数据、写入了错误的位置。** 测试已额外分配权重和输出空间，不依靠越界或未初始化读取制造结果。若调用者仅提供正常所需的空间，这种修改还可能引发越界。

## 8. 正确的逐元素版本应该怎样写？

关键是：列 `j` 变化时，保持打包块基址不变；完成整个块后，才跳到下一块。

下面是一行输出的示意代码，`K` 的单位是元素，`cn_stride` 的单位是字节：

```c
while (nc > 0) {
    size_t live = nc < 8 ? nc : 8;

    for (size_t j = 0; j < live; ++j) {
        float acc = w[j];                  // 当前块第 j 列的 bias
        for (size_t k = 0; k < K; ++k) {
            float b = w[8 + k * 8 + j];   // 当前块、第 k 项、第 j 列
            acc = fmaf(a[k], b, acc);      // 保留每个输出的 K 顺序
        }
        c[j] = fmaxf(fminf(acc, upper), lower);
    }

    w += 8 * (K + 1);                     // 全块完成后才跳下一块
    nc -= live;
    if (nc > 0)
        c = (float*)((unsigned char*)c + cn_stride);
}
```

这段参考代码在本例得到 `[2,4]`，与正常向量执行一致。它没有将固定权重步长全部改成 1；记录之间的跨度仍是 8，只是新增了块内偏移 `j`。

也可以用单 lane RVV 指令实现这个正确的索引结构。这里用标量 C，是为了把地址关系讲清楚；不代表已经完成一般输入上的形式化等价证明。

**因此，“可以逐元素计算”与“可以在原模型中统一设 vl=1”是两件不同的事。**

## 9. 可复现验证

配套程序：[gemm_vl_witness.c](gemm_vl_witness.c)。它直接包含仓库原始 kernel，不复制或修改其循环，通过主机活动-lane 模型执行所需的 intrinsic。

在仓库根目录运行：

```sh
cc -std=c11 -O0 -fno-fast-math -ffp-contract=off \
  research/gemm_vl_witness.c -lm -o /tmp/salty_gemm_vl_witness
/tmp/salty_gemm_vl_witness
```

预期输出：

```text
normal vl=2: c[0]=2 c[1]=4 c[8]=-999
capped vl=1: c[0]=2 c[1]=-999 c[8]=120
scalar layout-aware: c[0]=2 c[1]=4 c[8]=-999
PASS: all output slots checked; normal agrees with scalar reference.
```

程序检查全部 32 个输出槽位，并检查正常执行与保留布局的标量参考一致。它采用主机 binary32 与 `fmaf`，使用有限、可精确表示的测试数值。

验证边界：这是原 C 控制流和地址计算的主机复现，不是 RVV 硬件实测，不是完整 ISA 模拟，也不是 Lean 证明。它不模拟异常标志或所有特殊浮点值的架构行为。

## 10. 本轮关于 vl 的讨论总结

### 10.1 谁决定 vl？软件给请求，硬件按规则回答

对于受支持的配置、容量 `M=VLMAX`：

| 请求 AVL | 规范对返回 vl 的要求 |
|---|---|
| `0≤AVL≤M` | `vl=AVL` |
| `M<AVL<2M` | `ceil(AVL/2)≤vl≤M` |
| `AVL≥2M` | `vl=M` |

同一实现对相同 AVL 和 M 的返回值必须确定。所谓 `[4,2]` 与 `[3,3]` 都合法，是指容量 4、初始请求 6 时，不同实现可以采用不同的固定策略，不是同一实现每次随机选。[RVV 规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#constraints-on-setting-vl)

因此必须区分：固定平台上的执行确定性，与跨平台结果逐位一致性。

### 10.2 实际实现与软件固定策略

核查到的普通 strip-mining 实现包括：Spike 与开源 Ara 均采用 `min(AVL,M)`；QEMU 曾合入 `rvv_vl_half_avl` 配置，用于在中间区间测试均衡分块。[Spike 源码](https://github.com/riscv-software-src/riscv-isa-sim/blob/master/riscv/vector_unit.cc#L143)、[Ara RTL](https://github.com/pulp-platform/ara/blob/main/hardware/src/ara_dispatcher.sv#L610)、[QEMU 提交](https://github.com/qemu/qemu/commit/12f1e2ec0095b2b4bfe55f2a608bd87be58fb908)。这不是所有商用芯片的策略普查。

软件可先计算 `requested=min(remaining,M)` 再请求长度，使请求落入必须原样返回的范围。固定 M 时即可得到 `M+M+…+r`。如果要跨不同容量的机器保持相同分块，可选固定逻辑宽度 B，并要求所有目标配置满足 `M≥B`。

本 GEMM 的 `B=NR=8` 就体现了逻辑块宽度与硬件容量的区别。neon2rvv 的 [vaddq_f32](../../neon2rvv-reference/neon2rvv.h#L277) 则固定请求 4 个 float32 lane，保留 NEON 的逻辑宽度。

### 10.3 SALTy-RN 当前各层并不使用同一种调度模型

| 层次 | 当前代码中的做法 |
|---|---|
| SMT intrinsic 模型 | `vl=min(AVL,VLMAX)`；见 [core.hpp](../src/verification_bw/rvv/ops/core.hpp#L9) |
| 部分手写 Lean 模型 | 显式 `let vl := min xs.length vlmax`；见 [QS8VAdd/RVV.lean](../src/verification_bw/lean/SALT/Kernel/QS8VAdd/RVV.lean#L116) |
| 最新 element-wise 生成模型 | 用 `PositivePartition` 表示完整正分块；见 [生成 Models.lean](../verification/elementwise-results/programs/f32-f16-vcvt/Models.lean#L240) |
| 实际 C kernel | 很多直接请求剩余元素；GEMM 等则先按固定布局限制请求 |

工作流默认 VLEN 为 256 位，可配置，见 [config.py](../src/workflow/config.py#L27)。不能把验证器的 min 假设当成所有目标程序对所有硬件强制实施的策略。

### 10.4 Schedule 证明了什么，没有证明什么？

[Schedule.lean](../src/verification_bw/lean/SALT/Kernel/Schedule.lean#L8) 的 `PositivePartition` 只要求每块大于零、块大小之和等于输入长度。它没有 ISA 级 AVL、VLMAX 选择约束。

这是一种更宽的抽象，不是单凭这一点就不可靠：对于适用的流式循环，所有真实合法调度都可以落在完整正分块集合内。

但是，模块中的 [processBlocks_eq_map](../src/verification_bw/lean/SALT/Kernel/Schedule.lean#L156) 要求先证明：

```lean
blockRefines : forall input, block input = input.map f
```

它不是无条件断言所有块程序都与 map 等价。还需要证明实际循环的内存、步长、状态和块语义符合这个抽象。GEMM 的固定布局不能通过忽略地址关系自动变成这样的模型。

### 10.5 BitVec 和 List 仍然可以使用

当前 Lean 值模型主要用 `BitVec w` 表示整数或浮点位模式，用 `List (BitVec w)` 表示逻辑数组或活动 lane；mask 常用 `List Bool`，长度和调度大小用 `Nat`／`List Nat`。

float32 的位模式是 `BitVec 32`，但普通浮点运算还使用 Lean `Float32` primitive，并单独处理特殊值，见 [FP32.lean](../src/verification_bw/lean/SALT/Intrinsics/FP32.lean#L51)。不能将“位模式用 BitVec”理解成“浮点加法就是 BitVec 整数加法”。

问题不是 List 这个容器不合适，而是单纯的数据序列没有表达指针别名、固定布局及跨轮次保留的寄存器状态。更一般的建模可以继续用这些类型，同时显式加入相应状态和约束。

### 10.6 哪些情况下可以消去分块差异？

| 程序结构 | 对 vl 的结论／建模要求 |
|---|---|
| 独立逐元素计算、独立 channel 的 maxpool | 保持每个输出的运算顺序，证明内存无干扰后，可证明分块无关 |
| 当前 GEMM 等固定打包 kernel | 保留 NR、块内索引、整块步长和尾块；不能仅修改 vl |
| depthwise stencil | [代码](../kernels/target/f32-dwconv2d-chw.c#L76) 已维护 prev／next 邻居；有跨 lane 操作不等于结果一定依赖分块，但需要状态不变量 |
| transpose 等重排 | 输入输出重叠可能改变读写结果；不重叠条件必须明确。原地转置是否在上层契约内尚未确认 |
| 各 lane 跨轮次浮点累加、最后归约 | 分块可能改变求和分组，不能一般性假设逐位一致 |

尤其不能把“多个 lane 的并行计算”一概理解成“多个 lane 的求和”。本 GEMM 的 lane 是输出列；之前的求和反例的 lane 是部分和，两者不同。

### 10.7 逐位相等、近似相等与 ULP

之前的浮点求和反例见 [VL-MODELING.zh-CN.md](VL-MODELING.zh-CN.md)：合法分块 `[4,2]` 与 `[3,3]` 可分别得到 1 与 0。普通正数输入也可能只产生末位差异；这与是否出现 NaN 无关。

讨论中的“实验最多相差 2 ULP”只是那批短输入的观测结果，**不是 ISA 保证或一般数学上界**。对纯求和，在标准舍入误差模型成立且无上溢、下溢等前提下，误差界通常依赖累加深度、输入长度及 `sum(abs(x))`；不能任意指定一个与这些量无关的 ULP 常数。[Higham 的求和误差分析](https://nhigham.com/wp-content/uploads/2023/10/high93s.pdf)

如果希望接受改变运算顺序的优化，需要明确输入域和精度规格，再证明误差界；不能用容差掩盖本例这种索引错误。

固定 vl 也不自动固定无序归约的计算树。对于简单顺序求和，可以每块使用有序 `vfredosum`，并把上一块的标量结果作为下一块的初始值，从而保留全局加法顺序；这不同于各 lane 分别跨轮次累加。[RVV 归约规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-single-width-floating-point-reduction-instructions)

## 11. 对后续建模的建议

1. 底层保留真实控制流、向量活动长度、必要寄存器状态及内存地址关系；硬件选择策略作为显式参数或受约束规则。
2. 固定布局程序保留逻辑块宽度 NR；它与硬件容量 VLMAX 分开建模。
3. 上层通过证明将适合的程序化简为 map、zipWith、stencil 或带状态的循环摘要，而不是预先把所有程序限定成 element-wise。
4. 对需要逐位等价的翻译，保留每个输出的浮点运算依赖；对允许重排的优化，另立明确的误差规格。
5. 将正确的标量化参考与直接令 vl=1 区分。示意标量代码可以帮助理解，但实际程序到参考模型的对应关系仍须证明。

> 最重要的结论：不能省略布局和依赖，但可以通过可复用定理省略不相关的分块细节。GEMM 不是不能逐元素验证，而是逐元素参考必须知道“这个元素位于哪个打包块、块内哪一列”。
