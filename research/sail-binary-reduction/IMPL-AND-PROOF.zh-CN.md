# 直接阅读 impl，以及证明难度评估

`artifacts/formal/rv64_kernel.lem.gz` 是 gzip 压缩源码，不是特殊的证明文件。
运行 `python3 research/sail-binary-reduction/unpack_formal.py` 可解压所有已归档的
Lem/Isabelle 源码；解压前后均核对已记录的 SHA-256。压缩包保留，已有不同内容的
源码不会被覆盖。解压副本已在本地生成。

## 从哪里看实现

- [Impl.focus.lem.txt](artifacts/formal/Impl.focus.lem.txt)：约百行的原样摘录，含单步执行、
  `vsetvli` 及整数归约执行函数。用于阅读，不是独立可编译模块，没有重写或简化函数体。
- [完整 impl：rv64_kernel.lem](artifacts/formal/rv64_kernel.lem)：约 27.7 MB、119571 行。
  搜索 `kernel_instruction`、`kernel_step`、`execute_VVTYPE`、`execute_RMVVTYPE`。
- [类型与寄存器状态](artifacts/formal/rv64_kernel_types.lem)：`instruction`、`regstate` 和 `M`。
- [生成的 Sail 入口](artifacts/formal/Kernel.sail)：19 条机器码的地址表，以及调用解码器和
  上游执行函数的适配层。汇编分支本身由上游语义处理。
- [共同数学 spec](kernel_spec.lem)：`(old + sum(input)) mod 2^32`。
- [Isabelle 源码](artifacts/formal/Rv64_kernel.thy)：另一种输出语法，尚未通过 Isabelle 检查。

这里的 impl 是“程序地址表 + 通用单步执行 + 所调用的 ISA 定义”。尚未生成一个已证明
等价、仅表达求和算法的简化函数。`kernel_step` 中的 `>>=` 表示带副作用操作的顺序组合；
本版本的 `M` 使用上游 `sail2_concurrency_interface`，会产生寄存器/内存请求和异常等。
因此还需要定义或接入解释这些请求的机器环境，才能得到完整的多步执行关系。

## 难度判断

**从目前产物出发直接证明完整二进制正确性，难度高；求和数学本身并不是主要难点。**
这个判断来自当前生成代码和已有小模型证明的比较，不是已测量的 proof 生成耗时。
生成器导出成功和 Lem 类型检查通过，都不足以估计后续自动证明的成功率。

| 工作 | 难度与原因 |
|---|---|
| 让证明助手接受模型及支持库 | 当前前置阻碍：Isabelle 未检查，Lean 后端未生成成功；终止证明、依赖和外部函数仍待核实 |
| 定义合法初态、内存和多步运行 | 高：需要明确寄存器/内存请求解释、异常、返回哨兵、ABI、内存 frame；当前只有单步入口和输出公式 |
| 为实际使用的指令建立摘要引理 | 高但可复用：证明位列表长度/有效位、向量寄存器分组、SEW/LMUL、vl/vstart、mask/tail、字节与 lane 的对应 |
| 证明解码和控制流对应 | 需要单独完成：19 个编码的解码结果依赖合法 ISA 状态；压缩指令展开、真实地址和叶函数返回均需连接 |
| 证明 reduction 循环 | 指令摘要就绪后相对可控：每轮累加本次读取字节、剩余长度严格下降、最终归约和旧输出相加 |
| 把结论推广到其他 kernel | 整数指令/内存引理可复用；浮点规格、舍入、NaN、溢出等另有难点，且当前浮点支持包含 fail stub |

已有 `assembly-reduction/proofs/qu8-rsum/Proof.lean` 展示了合适的证明结构：
`body_path`、`body_sum`、`loop_exit`、`finish_output`，最后组合成 `correctness`。
它是在手写 Lean 小模型下完成的，不能直接算作这套 Sail 模型的证明。

比较合理的路线是先固定当前配置（RV64、VLEN=256），建立合法用户程序执行环境，
证明实际使用的少数指令到小型抽象状态的对应关系，再在抽象状态上证明循环。
初次可以采用平坦、有效内存等明确前提；不能把没有证明的指令摘要当成公理来宣布完成。
当前导出模型固定了 VLEN=256，不能直接声称涵盖旧证明里的所有 VLEN 配置。

如要复用旧 Lean proof，需要同一个证明器中可检查的 refinement 连接；Isabelle 中的一个
定理不会自动被 Lean 接受。两种选择是让 Sail→Lean 跑通后在 Lean 内连接，或者在
Isabelle 中重建相同的抽象层和证明结构。

本次生成的三个 ISA `.thy` 文件中，文本检查没有发现 `sorry`、`oops` 或 `axiomatization`；
但支持库并未完成公理审计，也没有运行 Isabelle 检查。尤其
`Rv64_kernelAuxiliary.thy` 中的自动终止证明尚未验证是否能通过。这不是“无公理证明”的证据。

## 本次 Lean 后台任务

2026-09-17 已启动独立生成尝试，显式选择 `V_instructions`，包含相同 ELF 的 kernel 入口，
使用正常 Lean 后端，超时上限 7200 秒（两小时），保留原来的失败记录。

```bash
python3 research/sail-binary-reduction/formal_attempt.py rvv --backend lean --kernel \
  --timeout 7200 --out research/sail-binary-reduction/out/background/rvv-lean-kernel-20260917
```

运行中不要再向同一个输出目录启动重复任务。当前状态以
`out/background/rvv-lean-kernel-20260917/Result.json` 为准；进度和错误在同目录的
`generation.log`。任务若成功，Lean 源码出现在 `model/`，仍需后续 Lean 类型检查和执行验证。
此后台任务只负责生成，不会自动宣称 proof 完成。
