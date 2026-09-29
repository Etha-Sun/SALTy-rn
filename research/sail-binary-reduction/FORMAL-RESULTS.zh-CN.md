# 实测：ELF + Sail ISA → Lem → Isabelle/HOL

**RVV 路线已生成带执行语义的形式化代码，通过 Lem 类型检查，并导出 Isabelle/HOL 源码。**
这次不只是把 ELF 字节存进 Lean。还没有通过 Isabelle 自身检查、在该生成模型中运行完整
kernel，或证明 kernel 正确性。不能把前面的 Sail C++ 模拟器测试算成本模型的执行测试。

## 使用同一个 kernel

输入仍是 `artifacts/rvv.elf` 中的 `test_rvv`，60 字节、19 条混合 16/32 位指令。
`elf_to_sail.py` 自动读取 ELF 符号和代码，产生 `Kernel.sail`：

1. 按真实字节 PC 查找机器码，交给上游 `encdec` / `encdec_compressed` 解码。
2. 调用上游 `execute`；压缩指令返回 `ExecuteAs` 时执行其展开指令。
3. 默认 `nextPC = PC + 指令长度`；分支、`jalr` 等由 ISA 语义修改 `nextPC`。
4. 正常退休时提交 PC。PC 不在导入的指令边界上时返回 `None`；可用调用者的返回哨兵
   定义叶函数返回，但调用/终止协议还没有证明。

没有识别 reduction 循环再替换成求和函数。地址分派只是取指，执行语义来自固定版本的
上游 RISC-V Sail；它不是 `.s` 文本解析器，也不是“ELF 生成整套 ISA 规范”。

适配层采用静态代码：没有实现指令取指权限/取指异常、并发改写代码、异步中断、landing-pad
检查或平台启动。数据访存仍通过上游语义。需要另行定义合法初态、内存、ABI 和异常观察。

## 实际生成的内容

生成文件在 `out/`；可提交、可校验的压缩副本及日志在 `artifacts/formal/`：

需要直接打开源码时，运行 `python3 research/sail-binary-reduction/unpack_formal.py`。
本地已解压同目录下的 [rv64_kernel.lem](artifacts/formal/rv64_kernel.lem)；
也可以先读仅 102 行的 [实现原样摘录](artifacts/formal/Impl.focus.lem.txt)。
详细阅读索引和证明难度评估见 [IMPL-AND-PROOF.zh-CN.md](IMPL-AND-PROOF.zh-CN.md)。

- `Kernel.sail`：自动生成的程序适配层，已通过 Sail 类型检查。
- `rv64_kernel.lem.gz`：约 27 MB 的未压缩 Lem 模型，包括 RVV 执行语义和 kernel 入口。
- `rv64_kernel_types.lem.gz`：寄存器、指令构造子、状态等类型。
- `Kernel_entry.lem.txt`：从完整模型原样截取的 kernel 入口，方便阅读；不能单独编译。
- `Rv64_kernel.thy.gz`、`Rv64_kernel_types.thy.gz`：Lem 导出的 Isabelle/HOL 文件。
- `kernel_spec.lem`、`Kernel_spec.thy.gz`：共同的输出规格，Lem 检查通过，**尚未与执行关系证明连接**。
- `Result.json`：生成命令、检查结果、耗时、源码和压缩文件的 SHA-256。

规格仍只有一行：

```text
reduction_spec(input, old) = (old + sum(input)) mod 4294967296
```

它假定 input 是无符号字节序列；内存 frame、ABI、异常、终止等前提不应被这个简短公式隐藏。

### 检查究竟到了哪一步

| 阶段 | RVV |
|---|---|
| ELF → Sail 程序适配层 | 已完成，逐字节重建及真实地址测试通过 |
| 适配层 + 上游 ISA 的 Sail 类型检查 | 通过 |
| Sail → Lem | 成功；含 kernel 的实测生成约 299 秒 |
| Lem 类型检查 | 通过；实测约 5 秒 |
| Lem → Isabelle/HOL | 成功；实测约 57 秒 |
| Isabelle 检查 `.thy` | **未执行** |
| 在生成模型中执行 kernel | **未完成** |
| 任意合法输入正确性 / NEON≈RVV | **未证明** |

Lem 是形式化规格语言，这条链已经产出了类型检查通过的程序语义；生成 `.thy` 不等于
Isabelle 已接受其中的所有定义，也不等于获得了程序正确性定理。

## 为什么本次成功、Coq 又怎样

Lem 后端的转换流程不同，没有经过之前 Lean/Coq 尝试卡住的 `make_cases_exhaustive`
步骤。这说明不能将失败笼统归因于“向量太复杂”或“Sail 天生不能翻译向量”。

本次也试了直接 Sail→Coq（RVV、Arm 各 1200 秒超时）及 Sail→Lem→Coq。
后者遇到明确的支持库错误：`sail2_values.lem` 的 `word_length` 没有 Coq 目标定义。
这属于所选版本/后端支持问题，不是 kernel 的正确性反例。

另外发现并修正了先前的模块选择错误：CLI 上的 `V` 父模块不会自动选中
`V_instructions`。旧的直接 Lean/Coq 尝试没有完整带入向量指令，因此不应该叫
“完整 RVV ISA 的后端测试”。`generate_model.py` 已改为显式选择 `V_instructions`，
新的结果目录带 `vext`，旧结果保留。这次成功的 kernel 构建通过项目里的 `requires V`
引入了子模块；产物检查确认包含 `execute_VVTYPE`、`execute_RMVVTYPE`、
`execute_VSETVLI` 等定义。不能仅依据生成器退出码认定 ISA 覆盖完整。

支持库也不是没有缺口：上游 `riscv_extras_fdext.lem` 的 SoftFloat 外部函数是 `fail`
stub，且所选 ISA 模块仍有不完备分支警告。此次为链接这些外部符号只添加了该模块的
import，没有改写指令函数。目标是整数 reduction，但仍需证明所需执行不会到达
这些未实现路径。当前不声称得到完整可执行的浮点模型或已验证的 ISA 裁剪。

NEON 的完整上游模型也尝试了 Coq 和 Lem，分别在 1200 秒、600 秒后超时，没有生成
ISA 代码。Lem 目标复制出的 `extra_defs.lem` 是已有支持文件，不是生成的 ISA 模型。
独立结果见 `artifacts/formal/Result.json`；不能把 RVV 的成功推广成 NEON 已成功。

## 复现

已有 `bootstrap.py` 所安装工具和 `artifacts/rvv.elf` 后：

```bash
python3 research/sail-binary-reduction/run_formal.py
```

这个入口在需要时安装本目录内的 Lem，然后生成 RVV 模型、检查 Lem、导出 Isabelle。
不安装系统包，不调用 LLM。编译器和依赖版本/哈希见 `tools.lock.json`、`lem-tools.lock.json`。

也可以分阶段运行：

```bash
python3 research/sail-binary-reduction/bootstrap_lem.py
python3 research/sail-binary-reduction/formal_attempt.py rvv --backend lem --kernel --timeout 1200
python3 research/sail-binary-reduction/check_lem.py
python3 research/sail-binary-reduction/check_lem.py --target isabelle
python3 research/sail-binary-reduction/record_formal_results.py
```

`check_lem.py --target coq` 可重现 Coq 支持库错误。每个阶段都有独立结果，失败返回非零码。
`record_formal_results.py` 只归档结果，不生成正确性证明。

与旧 `assembly-reduction` 的区别是：旧路线在手写的小型 Lean 指令语义下已有 kernel
的一般性证明；本次路线使用上游 ISA 生成的语义，模型更大，尚无 kernel proof。
旧证明不会自动适用于新模型，需要建立 refinement，或者在新执行关系上重新证明。
