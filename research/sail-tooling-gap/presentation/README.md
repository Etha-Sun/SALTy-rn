# NEON → RVV reduction：汇报用代码精选

组会英文简报：[GROUP_MEETING.md](GROUP_MEETING.md)。

这里展示两份简化 reduction 汇编，从机器码经 Sail/Isla 提取指令语义，再在 Coq/Islaris 中证明规格的实际材料。所有被选中的源码保持原文；超大的加载 trace 仅做 gzip 无损压缩。

**当前结论：NEON 整段程序已证明；RVV 整段程序的证明仍依赖加载合同 Hload。加载仅完成 VL=0、1，VL=2..8 未完成，因此完整跨 ISA 等价性尚未闭合。**

## 建议的展示顺序

1. **程序做什么**：[NEON 汇编](01_programs/neon/neon-simple.S)、[RVV 汇编](01_programs/rvv/rvv-simple.S)。两者把字节数组之和加到原有的 32 位输出上。
2. **共同的目标**：[KernelSpec.v](02_specs/KernelSpec.v) 中的 `byte_reduction_spec`，即 `(initial + sum(input)) mod 2^32`。`byte_sum` 的定义在 [NeonTail.v](04_proofs/neon/NeonTail.v)。
3. **两边实际合同**：[NeonByteSpec.v](02_specs/NeonByteSpec.v) 与 [RvvByteSpecConditional.v](02_specs/RvvByteSpecConditional.v)。后者文件开头的 `Hypothesis Hload` 是尚未完全解除的前提。
4. **指令如何进入 Coq**：对照 RVV [扩宽 Isla trace](03_instruction_semantics/rvv/a800001d2.isla)、[生成的 Coq trace](03_instruction_semantics/rvv/a800001d2.v)、[指令合同及证明](04_proofs/rvv/instructions/RvvWidenShared.v)。生成 trace 的 `.v` 只是数据定义；指令正确性在另一个证明文件中。
5. **从指令组合到 kernel**：[NEON kernel](04_proofs/neon/NeonKernel.v)、[RVV 循环](04_proofs/rvv/kernel_conditional/RvvLoopConditional.v)、[RVV kernel](04_proofs/rvv/kernel_conditional/RvvKernelConditional.v)。
6. **共同逻辑输入的映射**：[KernelMemoryBridge.v](02_specs/KernelMemoryBridge.v) 把 NEON 块状内存对应到字节数组；[RvvSharedSpec.v](02_specs/RvvSharedSpec.v) 证明 RVV 的数学结果等于共同规格。

## 文件树

```text
presentation/
├── README.md                       # 汇报入口、阅读顺序、指令索引
├── STATUS.md                       # 已证明什么、尚未证明什么
├── 01_programs/
│   ├── neon/                       # 完整简化汇编、ELF、带机器码的反汇编
│   └── rvv/
├── 02_specs/                       # 共同规格、两边程序合同、表示转换
├── 03_instruction_semantics/
│   ├── neon/                       # 全部 20 条指令：.isla 与生成的 .v
│   └── rvv/                        # 全部 19 条指令；加载 .isla 用 gzip 保存
├── 04_proofs/
│   ├── Programs.v                  # 完整程序的指令地址表
│   ├── neon/                       # 指令组合、循环、kernel 与程序包装证明
│   └── rvv/
│       ├── instructions/           # 已通过的指令与组合证明
│       ├── load_partial/           # 加载 VL=0、1 的已通过证明
│       └── kernel_conditional/     # 仍带 Hload 前提的循环/kernel 证明
└── 05_evidence/
    ├── configs/                    # 所选 trace 使用的架构配置
    ├── check-records.json          # 所选证明的既有 Coq 检查记录
    └── manifest.json               # 原始路径、SHA-256、复制和压缩信息
```

## 重点指令索引

两边全部 39 条指令均已收入；完整列表见 [指令语义索引](03_instruction_semantics/README.md)。

| ISA | 汇编 | 这里实际覆盖的情况 | 文件 |
|---|---|---|---|
| NEON | `ldr q2, [x1], #16` | 固定 16 字节加载 | [Isla](03_instruction_semantics/neon/a8000100c.isla) / [Coq](03_instruction_semantics/neon/a8000100c.v) |
| NEON | `uadalp v1.8h, v2.16b` | 固定 16 个字节，成对扩宽累加 | [Isla](03_instruction_semantics/neon/a80001014.isla) / [Coq](03_instruction_semantics/neon/a80001014.v) |
| NEON | `addv s0, v0.4s` | 固定 4 个 32 位元素归约 | [Isla](03_instruction_semantics/neon/a80001024.isla) / [Coq](03_instruction_semantics/neon/a80001024.v) |
| RVV | `vsetvli a5,a0,e32,m1,tu,ma` | 输入长度为符号值，容量固定为 8 | [Isla](03_instruction_semantics/rvv/a800001c6.isla) / [Coq](03_instruction_semantics/rvv/a800001c6.v) |
| RVV | `vle8.v v2,(a1)` | VL=0..8 的路径均已提取；证明只完成 0、1 | [Isla](03_instruction_semantics/rvv/a800001ca.isla.gz) / [Coq](03_instruction_semantics/rvv/a800001ca.v) |
| RVV | `vzext.vf4 v16,v2` | 符号 VL≤8，9 条完整路径；证明已通过 | [Isla](03_instruction_semantics/rvv/a800001d2.isla) / [Coq](03_instruction_semantics/rvv/a800001d2.v) |
| RVV | `vadd.vv v8,v8,v16` | 符号 VL≤8，9 条完整路径；证明已通过 | [Isla](03_instruction_semantics/rvv/a800001d6.isla) / [Coq](03_instruction_semantics/rvv/a800001d6.v) |
| RVV | `vredsum.vs v8,v8,v1` | 这里固定 VL=8；证明已通过 | [Isla](03_instruction_semantics/rvv/a800001ea.isla) / [Coq](03_instruction_semantics/rvv/a800001ea.v) |

扩宽与加法 trace 各约 1.05 MB，嵌套 `cases` 区分 VL=0..8。归约 trace 开头明确固定 VL=8。巨大的 `65536` 位容器和长串零来自此版本模型的表示；它们不表示已证明所有 VLEN。

加载原始 `.isla` 为 147,213,679 字节，生成的 Coq `.v` 为 2,481,220 字节，两者不要混淆。需要查看完整加载 trace 时，从本目录运行：

```bash
gzip -dc 03_instruction_semantics/rvv/a800001ca.isla.gz > /tmp/presentation-vle8.isla
```

## 使用与复核

这是用于阅读和汇报的源码精选，不是独立可编译的项目。为保持目录简洁，没有复制全部辅助引理、Sail IR、Islaris/Iris 依赖和 `.vo` 编译产物；原有 Coq `Require Import` 保持原样。

原始完整环境在相邻的 [kernel-e2e](../kernel-e2e/README.zh-CN.md)。本次只整理并核对文件，没有重新运行耗时的证明。`05_evidence/check-records.json` 保留既有编译命令和结果；manifest 记录所选源码与成功检查记录匹配的哈希。若要重新编译，应在原环境使用 `check.py`，而不是直接编译这里的精选文件。

共同 spec 是人工/agent 编写并由 Coq 证明关联，不是 Sail 自动生成。两份汇编是经简化的 kernel；没有证明原始 C 到这两份简化汇编的等价性。Sail/Isla 提取及架构配置仍在本实验的信任边界内。
