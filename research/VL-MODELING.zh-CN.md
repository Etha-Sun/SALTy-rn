# RVV 的 vl 分块原理、建模方法与 vl=1 的局限

可以把 `vl=1` 当作简化后的参考执行，但**不能直接假设它与正常 RVV 程序等价；“分块方式不影响结果”本身需要证明。**

这个直觉对 maxpool 这类“不同 channel 独立计算”的程序成立，但对跨轮次的向量累加不一定成立。下面给一个**两种合法分块就产生不同结果**的反例。

## 1. 正常程序如何划分 vl？

通常程序这样写：

```c
while (remaining > 0) {
    size_t vl = __riscv_vsetvl_e32m1(remaining);
    // 处理 vl 个元素
    input += vl;
    remaining -= vl;
}
```

程序提供“想处理多少个”，即 `AVL`；硬件根据向量容量返回这次实际处理的 `vl`。

设容量 `M = VLMAX = VLEN × LMUL / SEW`。对于受支持的配置：

| 请求数量 AVL | 返回的 vl |
|---|---|
| `0 ≤ AVL ≤ M` | 必须等于 AVL |
| `M < AVL < 2M` | 可以在 `ceil(AVL/2)` 到 `M` 之间选择 |
| `AVL ≥ 2M` | 必须等于 M |

同一实现对相同 AVL、VLMAX 的选择是确定的，不是每次随机选。中间区间允许把最后两轮分得更均匀。[RVV 1.0 规范](https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#constraints-on-setting-vl)

例如 `M=4`：

```text
10 个元素：4 + 4 + 2

 6 个元素：4 + 2
       或：3 + 3       ← 两种实现都合法
```

注意：请求 `6`、容量 `4` 时，返回 `1` **不合法**。要始终处理一个元素，你需要改成请求 `vsetvl(1)`——这已经改变了程序，而不是选择了原程序的一种合法执行。

## 2. 具体反例：普通浮点求和

考虑“每个 lane 分别累加，最后把所有 lane 求和”的常见写法：

```c
#include <stddef.h>
#include <riscv_vector.h>

float sum_rvv(const float *x, size_t n) {
    size_t M = __riscv_vsetvlmax_e32m1();
    vfloat32m1_t acc = __riscv_vfmv_v_f_f32m1(0.0f, M);

    while (n > 0) {
        size_t vl = __riscv_vsetvl_e32m1(n);
        vfloat32m1_t v = __riscv_vle32_v_f32m1(x, vl);

        // _tu：本轮没有更新的尾部 lane 保持原值
        acc = __riscv_vfadd_vv_f32m1_tu(acc, acc, v, vl);

        x += vl;
        n -= vl;
    }

    vfloat32m1_t zero = __riscv_vfmv_v_f_f32m1(0.0f, 1);
    vfloat32m1_t result =
        __riscv_vfredosum_vs_f32m1_f32m1(acc, zero, M);
    return __riscv_vfmv_f_s_f32m1_f32(result);
}
```

这里特意使用**有序归约** `vfredosum`：最后严格按 lane 顺序相加，避免把差异归因于无序归约的实现选择。[有序浮点归约规范](https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-single-width-floating-point-reduction-instructions)

假设：

```text
M = 4
float32，round-to-nearest ties-to-even

A = 16777216 = 2²⁴
输入 = [A, 0, -A, 1, 0, 0]
```

关键是 float32 的：

```text
A + 1 → 舍入成 A
A - A → 0
```

### 分块一：[4, 2]

```text
初始 acc： [0, 0,  0, 0]

第一轮：
输入       [A, 0, -A, 1]
acc        [A, 0, -A, 1]

第二轮：
输入       [0, 0]
acc        [A, 0, -A, 1]   ← 后两个 lane 保留

最后依次求和：
((A + 0) + (-A)) + 1 = 1
```

### 分块二：[3, 3]

```text
初始 acc： [0, 0,  0, 0]

第一轮：
输入       [A, 0, -A]
acc        [A, 0, -A, 0]

第二轮：
输入       [1, 0,  0]
acc        [A, 0, -A, 0]   ← lane 0 的 A + 1 舍入成 A

最后依次求和：
((A + 0) + (-A)) + 0 = 0
```

如果把循环改为每次 `vl=1`，所有输入在 lane 0 顺序累加：

```text
A → A → 0 → 1 → 1 → 1

结果 = 1
```

这里仅修改循环内的请求；初始化和最后归约仍使用 `M`，以隔离分块变化的影响。

所以：

| 循环分块 | 最终结果 |
|---|---:|
| `[4,2]`，原程序合法分块 | 1 |
| `[3,3]`，原程序合法分块 | 0 |
| 每次请求 1，修改后的程序 | 1 |

已用主机 binary32 运算复现上述三个结果，并通过断言检查；这是[浮点语义复现代码](vl_partition_witness.c)，不是 RVV 硬件实测。

这个结构也不是脱离项目的：仓库的 [f32-raddstoreexpminusmax.c](../kernels/target/f32-raddstoreexpminusmax.c#L72) 就使用了“跨轮次 lane 累加，最后归约”的结构。不过，上面的输入是简化求和程序的反例，不是该 exp kernel 的具体反例。

## 3. 分块影响结果，是否说明程序很奇怪？

**对预期逐位一致的程序，这是必须处理的问题；但并不是 RVV 的矛盾。**

`vl` 控制哪些元素参与指令执行。它不承诺改变分块以后，整个算法仍然等价。

上面的不同分块，把 `1` 分配给了不同的累加链，从而改变浮点加法的括号位置。浮点加法不满足结合律，所以结果可以不同。

而 maxpool 示例中，向量化的是 channel：

```text
out[c] = max(p0[c], p1[c], p2[c], p3[c])
```

只要每个 channel 内的运算顺序和语义保持一致、内存没有相互干扰，改变 channel 的分块不会改变该 channel 的计算。因此它可以证明分块无关。

**不是“浮点程序都不行”，而是要看分块是否改变了数据依赖和运算顺序。**

## 4. 建议如何建模？

建议采用：**底层保留 `vl`，上层证明可以消去 `vl`。**

### 底层：忠实表示执行

至少保留：

```text
向量容量 / 元素宽度
当前 vl
向量各 lane 的值
mask 与尾部保留规则
内存和循环状态
```

把 `vsetvl` 建模为满足上述约束的选择函数。证明面向所有实现时，对满足约束的选择函数量化，不必枚举所有分块。

尤其不能把向量寄存器简单截成长度 `vl` 的 list：反例中 `[4,2]` 的第二轮，尾部 lane 的旧值仍影响最终结果。

### 上层：证明分块无关，然后使用标量参考

对于独立逐元素计算，可以先证明一个可复用定理：

```text
对所有合法分块 π：

    执行 RVV 程序(input, π) = 标量参考程序(input)
```

然后每个 kernel 的主要工作就变成证明单元素运算正确，避免反复展开分块细节。

仓库已经有这个方向的基础：[Schedule.lean](../src/verification_bw/lean/SALT/Kernel/Schedule.lean#L54) 证明了 `processChunks` 对任何完整正分块都等于 `List.map`。

但这里有一个关键边界：**`processChunks` 的定义本来就是分块执行 `map`。还需要证明实际 RVV 循环确实符合这个抽象，不能直接把一般循环解释成它。** 上面的浮点累加就不符合。

对于 reduction、nested loop、while loop，则保留状态和循环不变量，按具体性质证明；不要求它们全部变成 element-wise。

因此，减少验证负担的方向是对的，但正确的简化是：

> **证明“任意合法 vl 都等价于标量参考”，再只验证标量核心；不是只验证 vl=1，就默认其他 vl 也成立。**

## 附：反例复现方法

在仓库根目录执行：

```sh
cc -std=c11 -O0 -fno-fast-math -ffp-contract=off \
  research/vl_partition_witness.c -lm -o /tmp/salty_vl_partition_witness
/tmp/salty_vl_partition_witness
```

预期输出：

```text
[4,2] = 1
[3,3] = 0
[1,1,1,1,1,1] = 1
```

该复现程序模拟四个累加 lane、tail-undisturbed 更新和有序归约，要求主机使用 binary32 `float`，并显式设置 round-to-nearest ties-to-even。它验证反例的浮点计算，不代替 RVV 编译或硬件执行验证。
