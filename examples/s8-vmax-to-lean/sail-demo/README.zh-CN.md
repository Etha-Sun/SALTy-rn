# Sail 与 RVV 汇编接入样例

这个目录区分三个不同操作：

1. 把 Sail 函数编译成 Lean：`signed_max.sail` → `LaneExample`。
2. 把已有 `../rvv-output.s` 汇编成 ELF，并在官方 Sail RISC-V 模拟器中执行。
3. 把 ELF 中的程序数据导入 Lean，再尝试生成能解释它的官方 RISC-V Lean 模型。

第 1、2 步以及第 3 步的数据导入已实际通过。完整 ISA 模型的 Lean
生成尝试及其状态记录在 `RESULTS.json`。本目录没有声称完成机器码在 Lean
中的执行、全输入正确性证明，或自动反编译出高层 Lean 函数。

本次完整模型生成在实际运行约 **48 分 23 秒**、停止时 RSS 约 **15.5 GiB**
后终止，尚未生成 Lean 文件。日志最后是 assembly mapping 的冗余分支警告，
没有出现能据此认定 RVV 不受支持的致命语义错误。首次是手动请求在
30 分钟上限后停止，实际停止较晚；重放脚本直接用 `timeout` 执行上限。
因此结果是“本次完整生成未完成”，不是“已经证明 Sail 无法生成 RVV Lean 模型”。

## 1. 最小 Sail → Lean 样例

`signed_max.sail` 定义一个 8-bit signed max，展示本例 RVV 指令的单个 lane
所执行的运算。它是教学样例，不是完整的 `vmax.vx` 语义：它没有模拟向量
寄存器组、mask、tail、异常或访存。

```sail
default Order dec
$include <prelude.sail>

val signed_max8 : (bits(8), bits(8)) -> bits(8)
function signed_max8(x, threshold) =
  if signed(x) < signed(threshold) then threshold else x
```

Sail 实际生成的函数是：

```lean
def signed_max8 (x : BitVec 8) (threshold : BitVec 8) : BitVec 8 :=
  if (((BitVec.toInt x) <b (BitVec.toInt threshold)) : Bool)
  then threshold
  else x
```

执行：

```bash
bash examples/s8-vmax-to-lean/sail-demo/run-lane.sh
```

脚本执行 Sail 生成、`lake update`、`lake build` 和 `CheckLane.lean`。
实际构建通过（13 jobs），`#eval` 输出 `-5`，`by decide` 检查了生成函数对
`0x80`、`0xfb` 的结果为 `0xfb`。生成文件位于
`out/LaneExample/LaneExample/SignedMax.lean`。

Sail 的函数名 `example` 会原样生成 Lean 保留字而导致语法错误；本样例使用
`sample_value` 避开此问题，没有手工改写生成的函数体。

## 2. 执行我们的原始汇编

```bash
bash examples/s8-vmax-to-lean/sail-demo/run-sail.sh
```

脚本将 **原始 `rvv-output.s` 直接汇编、链接**，不重新编译 `rvv.c`。
`check.c` 是独立的标量检查入口，编译时关闭自动向量化。入口为 Sail 的
裸机/HTIF 平台设置栈和 `mstatus`，与之前 QEMU Linux 检查的入口不同。

检查内容：

- batch=272，threshold=-5；输入包含全部 256 种 signed int8 值。
- 输入输出是两个不同的有效数组。
- 在 VLEN=128、256、512，ELEN=64 下分别执行同一个 ELF。
- 每个输出元素必须等于标量 signed max；成功向 HTIF 写入成功退出码。

这三种配置均实际返回 exit 0 / `SUCCESS`。在 VLEN=256 的执行轨迹中，
目标函数执行两轮 `vsetvli` / `vmax.vx`。作为独立反向检查，还将 ELF 中
唯一的 `vmax.vx` 编码从 `0x1e874457` 改成 `vmin.vx` 的 `0x16874457`，
写入另外一个 `negative-vmin.elf`；原检查入口报告 exit 1 / `FAILURE: 1`。

这证明了具体检查用例执行通过，不是任意 batch、输入、阈值或内存布局的
形式化证明。也没有检查两份汇编的等价性。

## 3. 机器码 → Lean 数据，与 Sail 指令模型

Sail 不接受 GNU `.s` 文件。实测直接调用报错：

```text
No handler for file '.../rvv-output.s' with extension '.s'
```

因此接入结构是：

```text
rvv-output.s ──GNU assembler/linker──→ rvv-check.elf
                                         │
                                    elf-to-lean.py
                                         ↓
                                  RvvProgram.lean（数据）

官方 RISC-V .sail 规范 ──Sail --lean──→ 解码器、指令语义、机器状态
                                         │
                          与上面的程序数据组合，才能执行/证明程序
```

`elf-to-lean.py` 仅接受本实验使用的 little-endian RISC-V ELF64 executable。
它导出 PT_LOAD 段、入口地址、`test_rvv` 的精确字节和源/ELF SHA-256。
它不定义指令含义，也不声称是已验证的 ELF 解析器。`out/RvvProgram.lean`
本身已经通过 Lean 类型检查。

本次 ELF 中 `test_rvv` 位于 `0x800000e2`，长度 32 字节；混合了 16-bit
压缩标量指令和 32-bit RVV 指令，所以生成模型也选入了 `Zca`。

完整官方模型生成命令封装在：

```bash
bash examples/s8-vmax-to-lean/sail-demo/generate-model.sh \
  > examples/s8-vmax-to-lean/sail-demo/out/generate-model.log 2>&1
```

生成范围是 `V Zca Zba Zicsr_insts postlude` 及其上游依赖；配置为
RV64、VLEN=256、ELEN=64。没有手工重写 RVV 指令语义。该范围仍含本例
未用到的向量/浮点指令，因此并不是只针对 11 条目标指令生成的微型模型。
脚本默认 1800 秒超时，可通过 `MODEL_TIMEOUT_SECONDS` 设置。
首次尝试的原始诊断保存在 `out/generate-model.log`，停止记录在
`out/generation-limit.json`，所有结果概览在 `RESULTS.json`。

上游顶层 CMake 会要求 GMP 开发头文件，即使只是生成 Lean；脚本只运行
上游配置子目录的 CMake，然后直接调用 Sail，避免为此安装 C++ 后端依赖。

若模型生成成功，输出在 `out/models/Lean_RV64D_executable/`。
还需要构建该 Lean 包、接入初始化与执行入口，才能在 Lean 中运行 ELF。
机器执行与 repo 现有数组模型之间的对应证明则是再后续的一步。

## 固定版本与依赖

- Sail 0.20.2，commit `3b7af38d66466ecadad563158b07ce2f82fe05da`。
- 官方 Sail RISC-V 模拟器 0.14，构建信息显示 git `29e6158`。
- Sail RISC-V 源码 `29e6158f0a88bdb26b9fbcd0718ab919449b5179`。
- Lean 支持库 `rems-project/lean-sail`：`79b4d08505af29d88b3918f32d29840fae1fa191`。
- 实际使用已安装的 Lean 4.29.1；Sail 生成的原 toolchain 文件指定 4.29.0。
  通过 `ELAN_TOOLCHAIN` 覆盖，不修改主 repo 的 Lean 配置。
- GCC：之前实验已使用的 xPack RISC-V GCC 15.2.0。

本次下载的依赖位于 `/tmp/s8-vmax-sail-tools`，GCC 位于
`/tmp/xpack-riscv-none-elf-gcc-15.2.0-1`。`/tmp` 被清理后需重新获取依赖。
脚本支持 `SAIL_BIN`、`SAIL_RISCV_DIR`、`SAIL_RISCV_SIM`、`SAIL_CONFIG_DIR`、
`RVV_CC`、`OUT_DIR` 和 `DEMO_LEAN_TOOLCHAIN` 覆盖路径/配置。

官方来源：

- [Sail 编译器二进制](https://github.com/rems-project/sail/releases/tag/0.20.2-binary)
- [Sail RISC-V 0.14 模拟器](https://github.com/riscv/sail-riscv/releases/tag/0.14)
- [固定的 RISC-V 模型源码](https://github.com/riscv/sail-riscv/tree/29e6158f0a88bdb26b9fbcd0718ab919449b5179)
- [上游 Lean 模拟器](https://github.com/riscv/sail-riscv/tree/29e6158f0a88bdb26b9fbcd0718ab919449b5179/lean_emulator)
