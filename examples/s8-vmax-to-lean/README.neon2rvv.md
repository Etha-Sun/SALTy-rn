# 用 neon2rvv 编译原 NEON 示例

`neon.c` 和 `rvv.c` 是仓库原有的两份实现；`rvv.c` 不是 neon2rvv 的输出。
本实验通过 `neon2rvv-input.c` 包含原 `neon.c` 和真实 `neon2rvv.h`，
交叉编译产生 `neon2rvv-output.s`。库本身没有输出 RVV C 的源到源转换命令。

在本目录运行：

```bash
bash build-neon2rvv.sh
cat neon2rvv-output.s
```

脚本默认使用：

- 工具链：`/tmp/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc`
- 头文件：仓库相邻的 `../neon2rvv-reference/neon2rvv.h`
- 编译选项：`-march=rv64gcv_zba -mabi=lp64d -O2 -DNDEBUG -S`

可覆盖安装位置：

```bash
RVV_CC=/path/to/riscv-none-elf-gcc \
NEON2RVV_DIR=/path/to/neon2rvv \
bash build-neon2rvv.sh
```

已使用 xPack GCC 15.2.0 和 neon2rvv 提交
`2abbe36cc3c52d4616f854f88894e5be11b96580` 成功生成汇编。
工具链来自 xPack 的 `v15.2.0-1` Linux x64 预编译发布包；解压在 `/tmp`，
如果该目录被清理，需要重新安装或指定 `RVV_CC`。

当前汇编包含 `vsetivli zero,16,e8,m1,ta,ma`，加载、max、存储循环的
指针步长仍为 16。`-DNDEBUG` 移除了示例中的运行时断言；调用时仍应满足
原输入要求，包括 batch 非零且为 16 的倍数。

生成汇编不需要 RISC-V 硬件、QEMU 或 Spike。
后续已用 QEMU 执行两份汇编进行有限检查，结果和适用条件见
[SEMANTICS.md](SEMANTICS.md)；这不代表验证了整个兼容库。

## 对照：直接编译动态 vl 的 RVV C

`rvv-input.c` 补齐真实 `<riscv_vector.h>` 与参数类型，包含原 `rvv.c`。
使用相同 GCC 和编译选项生成独立汇编：

```bash
bash build-rvv.sh
cat rvv-output.s
```

已成功编译。`rvv-output.s` 的循环包含
`vsetvli a5,a0,e8,m8,ta,ma`：剩余元素数在 `a0`，实际 vl 返回到 `a5`。
加载、max、存储使用这个 vl，随后剩余数量减去 vl，输入输出指针前进 vl。
`m8` 表示使用 8 个向量寄存器组成的分组；原 neon2rvv 输出则为 `m1`，
固定 vl=16。生成两份汇编不构成两份程序等价的形式化证明。

## 展开后的 C 与执行检查

- [neon2rvv-expanded.c](neon2rvv-expanded.c)：按库中实际实现手工展开的 RVV C，
  保留固定 16 元素循环，不再包含 neon2rvv.h。
- `bash build-neon2rvv.sh`：同时生成 `neon2rvv-expanded.s`，并检查它与
  `neon2rvv-output.s` 除源文件名标记外完全一致。
- `bash check-assembly.sh`：用 QEMU 执行两份原汇编，检查非重叠、原地处理，
  并复现部分内存重叠时的差异。
- [SEMANTICS.md](SEMANTICS.md)：等价条件、逐指令分析、反例和实际检查结果。
