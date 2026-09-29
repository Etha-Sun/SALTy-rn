#### 组会汇报：`qu8-rsum` 从汇编证明到 Sail ISA 语义

**汇报范围：2026 年 9 月 10–17 日。** 本周围绕同一个真实 reduction kernel，推进了两件事：在一个可审计的小型 Lean 汇编模型中完成任意合法输入的总正确性证明；随后把 NEON/RVV 编译产物接入 ELF 与上游 Sail ISA 语义生成链。本文依据工作区文件和结果记录整理；这些工作尚未提交到 Git 历史。

##### 本周最重要的结论

`qu8-rsum` 的 RVV 编译汇编已在**手写 Lean 指令模型**中证明：对满足前提的任意初始机器状态，程序正常返回，输出为旧值加所有输入字节之和（模 $2^{32}$），输出之外的内存和约定的 ABI 寄存器保持不变。上游 Sail 路线已经为同一 RVV ELF 生成可类型检查的 Lem 模型，也已生成 Lean 源码；**尚未在上游模型中执行 kernel 或证明二进制正确性**。

##### 1. 9 月 10 日：汇编到 Lean 的纵向实验

从仓库原有的 [RVV `qu8-rsum` C](../kernels/target/qu8-rsum.c) 用真实 RVV 头文件编译，解析产生的 `.s`，逐条生成 19 条 Lean 指令及源码映射。翻译器根据指令与跳转工作，没有按 reduction 名字替换成数学求和函数，也没有固定展开循环。[框架与限制](assembly-reduction/README.zh-CN.md)。

公开规格要求**正常终止、模 $2^{32}$ 求和结果、内存 frame 和 ABI 保持**。证明覆盖任意正输入长度、满足前提的初态、合法 VLEN/VL 选择及允许的 tail 取值；不把 fuel 或循环不变量放进公开前提。独立 checker 在新目录重编所有 Lean 文件，核对冻结哈希、目标类型和传递公理，结果为 `proved-relative-to-assembly-model`；传递公理仅有 `propext`、`Classical.choice`、`Quot.sound`。[冻结证明包](assembly-reduction/proofs/qu8-rsum/README.zh-CN.md)、[证明结果](assembly-reduction/proofs/qu8-rsum/ProofResult.json)。

作为语义交叉检查，1,512 个 Lean 执行用例和 252 个真实汇编的 QEMU 对照用例通过，覆盖多种 VLEN、VL 选择、tail、边界长度、溢出和重叠输出。有限测试支持对模型的信心，任意输入结论来自 Lean 定理。[执行结果](assembly-reduction/proofs/qu8-rsum/ExecutionResult.json)。

**准确边界：** 汇编 parser 与指令语义目前由我们编写；尚未证明它们与真实 ISA、ELF 解码或编译器输出的语义一致。这项成果也只证明 RVV 汇编满足 reduction 规格，未给出 NEON≈RVV 的二进制等价定理。

##### 2. 9 月 16–17 日：同一 kernel 的 ELF 与 Sail 实验

将原有 NEON/RVV C 分别编译、汇编、链接为 ELF，并把函数机器码、地址和载入段作为**数据**导入 Lean。NEON 函数为 168 字节，RVV 函数为 60 字节；数据导入通过 Lean 类型检查，但数据模块不含 ISA 执行语义。[实验总览](sail-binary-reduction/README.zh-CN.md)、[二进制记录](sail-binary-reduction/artifacts/BinaryResult.json)。

有限执行方面，NEON ELF 在 QEMU 通过 225 个输入用例；RVV ELF 在 Sail C++ 模拟器以 VLEN=128/256/512 各通过 225 个。把 RVV ELF 内的 `vadd.vv` 换成 NOP 后，检查入口报告失败，说明这组测试能发现丢失累加行为。它们仍不能覆盖所有初态、VL 策略、别名和异常。[二进制记录](sail-binary-reduction/artifacts/BinaryResult.json)。

形式化语义生成方面，ELF 适配层按真实字节 PC 调用上游 RISC-V Sail 的解码与执行定义；RVV 线路已通过 Sail 类型检查、生成含 kernel 入口的 Lem、通过 Lem 类型检查并导出 Isabelle/HOL 源码。**Isabelle 只完成源码导出，没有对 `.thy` 运行自身检查。** 适配层尚未实现完整的执行环境、异常观察和返回协议。NEON 的 Sail→Lem/Coq 尝试超时，不能把 RVV 的生成结果推广到 NEON。[形式化结果](sail-binary-reduction/FORMAL-RESULTS.zh-CN.md)、[机器记录](sail-binary-reduction/artifacts/formal/Result.json)。

9 月 17 日稍晚，显式选择 `V_instructions` 的完整 RVV Sail→Lean 后台任务**成功生成 135 个 Lean 源文件**，耗时约 72.5 分钟，退出码 0。但结果仍记录 `typechecked: false`、`binary_execution: false`、`binary_equivalence_proved: false`。这是相对于较早“仍在运行”的说明文档更新的状态。[后台结果](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/Result.json)。

##### 3. 本周进展在整条验证链中的位置

```text
RVV C ─GCC→ .s ─解析→ 小型 Lean 指令模型 ─证明→ reduction 总正确性
                                  ↑ 已完成；模型与 ISA 的对应待证

NEON/RVV C ─编译/链接→ ELF ─数据导入→ Lean 字节与地址
                           └─上游 Sail ISA→ RVV Lem（已类型检查）
                                           → Isabelle 源码（未检查）
                                           → Lean 源码（已生成，未类型检查）
```

对应文件：[汇编模型与证明](assembly-reduction/proofs/qu8-rsum/README.zh-CN.md)、[Sail/ELF 实验](sail-binary-reduction/README.zh-CN.md)。

本周最大的进展是把“真实编译产物上的证明”与“上游 ISA 语义”放到了同一个 `qu8-rsum` 案例上。最大缺口是两者之间仍没有可检查的 refinement。已有小模型中的 19 条指令证明不能自动迁移到生成的 Sail 模型；同样，能生成 ISA 源码也不等于已证明机器码正确。[实现与证明难度评估](sail-binary-reduction/IMPL-AND-PROOF.zh-CN.md)。

##### 4. 下一周建议与需要讨论的决策

1. **先检查新生成的 RVV Lean 包。** 完成依赖构建和类型检查，记录第一个实际阻碍；若通过，再定义 VLEN=256 的合法初态、内存和叶函数返回协议，争取在上游语义中执行同一 ELF 的一个最小用例。
2. **围绕实际 19 条指令建桥。** 优先处理解码、`vsetvli`、load、widen、`_tu` add、reduction、store 和分支，建立上游 Sail 状态到已有小模型状态的关系。先固定一个 VLEN，明确每项摘要的证明状态。
3. **组会决策：** 下一轮主要投入 Lean 路线（便于复用现有 proof 结构），还是已通过 Lem 类型检查的 Isabelle 路线（先解决执行环境与单步引理）？两边目前都还没有二进制正确性定理。

##### 口头汇报摘要

> 这一周我们用 `qu8-rsum` 向机器码层推进。9 月 10 日完成了真实 RVV 汇编在手写 Lean 指令模型中的任意合法输入总正确性证明，并通过 Lean/QEMU 对照检查。9 月 16–17 日把同一 kernel 编成 ELF，完成 QEMU/Sail 有限执行和 RVV 上游 ISA 的 Lem 类型检查；最新又生成了 Sail 对应的 Lean 源码。下一步要让生成模型真正通过证明助手检查和执行，并证明它与已有小模型的对应关系。

**简短背景：** 上周更早的高层实验已经对人工翻译的 NEON/RVV `qu8-rsum` value model 完成输出等价证明。本周的汇编与 Sail 工作旨在收紧这项结论的机器语义边界；高层结果见 [reduction demo](reduction-demo/README.zh-CN.md)。
