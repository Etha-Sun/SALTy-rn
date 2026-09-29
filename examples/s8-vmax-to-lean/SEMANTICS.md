# 两份汇编的语义检查

## 结论与比较范围

`neon2rvv-output.s` 和 `rvv-output.s` **不是无条件等价**。
在以下充分条件下，逐指令分析表明两者有相同的最终输出数组：

- `batch > 0` 且为 16 的倍数，满足原 C 示例的断言；
- 输入可读、输出可写，至少各有 batch 字节，地址计算合法；
- 输入输出区域不重叠，或二者完全原地重合（`input == output`）；
- 参数有效，threshold 不被输出写入修改，满足原 C 的 restrict 契约；
- 普通内存，没有并发修改、MMIO、副作用式读取或执行异常；
- 目标支持本次编译的 RV64 ISA 扩展及 RVV 1.0，VLEN 至少 128。

这里比较的是函数的输出值和普通内存效果，不是完整机器状态、访存轨迹、
执行时间或指令数量相同。两者返回时的 vl/vtype 以及临时寄存器可以不同。

## 逐指令分析

| 行为 | neon2rvv-output.s | rvv-output.s |
|---|---|---|
| 设置长度 | `vsetivli zero,16,e8,m1,ta,ma` | `vsetvli a5,a0,e8,m8,ta,ma` |
| threshold | 零步长 `vlse8.v`，广播相同的 int8 | `lb` 加载并符号扩展为标量 |
| 输入 | 每轮 `vle8.v` 读取 16 字节 | 每轮 `vle8.v` 读取 vl 字节 |
| 计算 | `vmax.vv`：每个 lane 与广播值取 signed max | `vmax.vx`：每个 lane 与标量取 signed max |
| 输出 | 每轮 `vse8.v` 写 16 字节 | 每轮 `vse8.v` 写 vl 字节 |
| 前进 | 输入输出指针都加 16 | 输入输出指针都加 vl，剩余数量减 vl |

固定版本的 `andi a0,a0,-16` 在 batch 为 16 的倍数时不改变长度。
动态版本在剩余数量大于零时，实际 vl 满足 `0 < vl <= remaining`；
当请求不超过 VLMAX 时实际 vl 等于请求。这里不假设一般情况下
`vl = min(remaining, VLMAX)`，也不假设硬件总选最大值。
参见 [RVV 1.0 规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc)
的长度设置、向量加载存储和 integer min/max 章节。

以处理前的输入为 initialInput，循环不变量为：已处理的前 k 个元素满足
`output[i] = signed_max(initialInput[i], threshold)`，尚未读取的输入保持原值。
固定版本每次把 k 增加 16；动态版本每次增加正的 vl。
上述内存条件保证一次写入不会改变未来轮次要读取的输入。
每轮先加载整个块再存储，因此 `input == output` 也满足这个条件。
循环结束时两者都处理了 batch 个元素，得到同一数组。

## 实际执行的反例

参数单独存放；分配 33 字节数组，初值为 `0,1,...,32`，然后设置：

```text
batch = 32
input = buffer
output = buffer + 1
threshold = -128
```

这些参数满足原源码中的断言。input/output 都没有 restrict 限定，
因此这种普通数组内的重叠没有被当前源码排除。

- 固定版本先加载 input[0..15]，再写入 buffer[1..16]，使 buffer[16] 变成 15。
  下一轮读取 input[16] 时得到 15，最终 output[16] 为 **15**。
- 动态版本在 e8,m8 下即使 VLEN=128，也能一次加载全部 32 个元素，
  写入前已经读到了原来的 input[16]=16，最终 output[16] 为 **16**。

所以仅凭相同的逐元素 max 运算，不足以忽略分块方式导致的内存依赖差异。
此外，若放弃 batch 为 16 倍数的前提，固定版本不处理余数，而动态版本会处理。

## 已运行的检查

工具链为 xPack GCC 15.2.0，模拟器为 multiarch 发布的 QEMU user 7.2.0。
`check-assembly.sh` 直接汇编、链接被检查的两个 `.s` 文件，而非重新编译原 C。
使用一个无 libc 的小型入口，通过 Linux write/exit 系统调用报告结果。

在 VLEN=128、256、512 三个配置下分别运行：

- 全部 256 个 signed int8 threshold；
- 长度 16、32、48、64、112、128、144、240、256、272、512、1024、1040；
- 每个长度/threshold 组合分别检查非重叠与完全原地执行，并与标量 max 对照；
- 长度至少 256 的用例包含全部 256 个 signed int8 输入值；
- 上述部分重叠反例。

三个配置均报告 `3328 disjoint + 3328 in-place` 通过，并复现 15 与 16 的差异。
正向检查合计 19,968 个成对用例。有限测试不是任意输入的形式化等价证明；
正向一般性结论依赖上面的循环不变量和 ISA 语义分析。

重跑：

```bash
bash check-assembly.sh
```

默认 QEMU 路径为 `/tmp/neon2rvv-qemu-riscv64-static`，可用 `QEMU_RVV` 覆盖。
默认 GCC 路径与 `build-neon2rvv.sh` 一致，可用 `RVV_CC` 覆盖。
本次 QEMU 二进制来自
[multiarch v7.2.0-1](https://github.com/multiarch/qemu-user-static/releases/tag/v7.2.0-1)。

## 根据 intrinsic 实现展开 C

`neon2rvv-expanded.c` 手工展开本例四个 intrinsic 的实际 wrapper 函数体，
将 `int8x16_t` 改为其对应的 `vint8m1_t`，保留函数名、断言和固定 16 元素循环。
文件直接包含 `<riscv_vector.h>`，不依赖 `neon2rvv.h`。

```bash
bash build-neon2rvv.sh
```

该命令同时编译原头文件路径和展开后的 C，并比较两份汇编。
本次已确认：除 `.file` 的源文件名之外，汇编文本完全一致。
这是本例、此版本头文件和此套编译选项下的核对结果，不是全库的转换证明。

neon2rvv 本身没有这个 C 输出功能。这份文件是按实际 wrapper 展开的结果，
不是一个通用自动转换器。推广到复杂 intrinsic 需要处理一对多实现、类型、
临时变量、参数单次求值以及头文件版本，不能只做函数名的字符串替换。
