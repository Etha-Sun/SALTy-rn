# qu8-rsum 汇编模型：完整正确性证明

本目录保存一份独立可重检的冻结证明包。`Proof.lean` 证明
`Kernel.correctness : Kernel.correctnessClaim`；模型、汇编、spec 与最初
`ProofTask.json` 中的哈希一致。没有把数学 sum 替换进实现，也没有修改 spec。

从仓库根目录重检：

```bash
python3 research/assembly-reduction/check_proof.py \
  --out research/assembly-reduction/proofs/qu8-rsum
```

检查器在全新临时目录重编译所有 Lean 文件，核对准确目标类型、冻结哈希和传递公理。
检查结果见 `ProofResult.json`，实际编译输出见 `ProofCheck.log`。

证明覆盖所有满足原 Pre 的初始机器状态，包括任意初始向量内容、任意正输入长度、
所有合法 VLEN/AVL 选择，以及逐步逐 lane 的任意 agnostic-tail oracle。
结论同时包含正常终止、32-bit 模求和结果、输出范围以外内存不变和 ABI 寄存器保持。
input/output 可以重叠。公开 spec 不含循环展开次数、fuel、假设的 invariant 或 refinement。

建议按以下关键定理阅读 Proof.lean：

- `writeLE_get` / `readLE_writeLE4`：字节存储与小端 32-bit 读回。
- `blocks_lane` / `writeVector_active32` / `writeVector_tail32`：物理向量寄存器中的 lane 更新与保持。
- `body_path`：循环体每条指令确实连接这些机器状态。
- `body5_acc` / `body_sum`：每轮累加器的总和增加量等于当轮加载的字节和。
- `loop_exit`：按剩余字节数强归纳，证明无界循环退出及完整求和摘要。
- `start_path` / `start_sum`：真实初始化路径把 accumulator 全部清零。
- `finish_exec` / `finish_output` / `finish_keep`：真实收尾路径和存储、寄存器效果。
- `correctness`：组合以上已证明定理，满足唯一公开 spec。

`Reach`、`sumW` 等仅是 proof 内部定义。它们通过逐指令路径证明连接到被冻结的
`Assembly.Exec`，没有替换该语义。控制流的处理不要求翻译器识别循环模板。

可信边界保持不变：这是相对于手写 RV64/RVV 汇编指令模型的 Lean 证明。
不声称已证明 Python parser、GCC、Sail→Lean、ELF 解码或硬件符合性；也不是原始
NEON 与 RVV 二进制之间的完整等价证明。详细环境/指令子集限制见 ../../README.zh-CN.md。

ProofTask.json 保留任务生成时的 `awaiting-proof` 元数据，以保持原始任务哈希；
完成状态以 ProofResult.json 中的 `universal_kernel_proof: true` 为准。
