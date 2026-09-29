# Islaris / RVV reduction 小实验

展示材料见 [PRESENTATION.zh-CN.md](PRESENTATION.zh-CN.md)：7 页讲解提纲、3 个本地检查成功的案例、错误规格对照、源码打开顺序，以及上游既有证明的索引。

这是接入真实 Sail 指令语义的 **指令级 demo**。完整 `qu8-rsum` 的任意输入长度循环证明、NEON 侧证明以及跨 ISA 等价性均尚未完成。机器可读状态见 [results/replay.json](results/replay.json)；不要把“生成了 Coq 定义”当成“程序满足规格”。

最终复查全部 10 项检查成功，包括原版标量示例、两个 RVV 指令定理，以及错误 seed 规格被拒绝的负对照。两个 ISA 定理均显示 `Closed under the global context`，没有额外公理。最终配置下，`vsetvli` 证明约 22.9 秒，`vredsum.vs` 证明约 253.6 秒。

## 我们要证明的程序行为

对象是 `kernels/target/qu8-rsum.c` 和 `kernels/source/qu8-rsum.c`，讨论单线程、无外部干扰的函数行为。原 RVV ELF 的汇编见 `research/sail-binary-reduction/artifacts/rvv.s`。

令 `xs` 为调用前的全部输入字节，`old` 为调用前输出地址中的 32 位无符号数。精确结果为：

```
output_after = (old + sum(unsigned_byte(x) for x in xs)) mod 2^32
```

[ReductionSpec.v](ReductionSpec.v) 是 agent 编写、由 Coq 检查的规格定义及数学辅助引理。它要求整个最终内存等于初始内存上一次明确的 little-endian 32 位写入，因而不能用“输出大致正确”或“只验证一个弱范围条件”替代精确结果。函数后置条件还要求正常返回到指定地址、没有最终异常、保留 ABI 指定的寄存器。`total_contract` 单独要求终止和不陷入无后继的错误状态。

本 demo 的规格输入域：任意正长度、输入字节已初始化、地址不回绕、输出四字节对齐。允许输入与输出重叠：`xs` 和 `old` 均从初始内存取值，最后只覆盖输出的四字节。真实 ISA 证明还必须提供内存访问权限和代码布局。NEON 的尾部会读取完整 16 字节，因此未来共享调用前置条件必须额外保证尾部 padding 可读；当前 `legal_call` 只是 RVV 侧的函数级输入条件，不能直接拿来宣称 NEON 安全。

`function_post` / `total_contract` 是待证明的完整可观察行为契约，不是已经证明的 ISA 定理。ISA 状态到 `call_observation` 的适配及整段机器码满足该契约的证明仍待完成。调用者临时寄存器、执行时间和微架构状态不属于这里的函数等价性观察。

## 真正接到 Sail 的部分

使用未经修改的官方 Sail/Isla 快照 `riscv64.ir`，取自 isla-snapshots 提交 `d8b31014643035a3b11071e56ef30001de3f52ab`，SHA-256 为 `c3f29aeb4e04659f632a151dbd6d3ae8ca7e9d74a17b32a40bf2a627a357eeed`。这与更新的 `rv64d.ir` 是两个不同文件。

链路是：

```
原 ELF 中的指令字
  → 官方 Sail IR + 原版 Isla 符号执行
  → 原版 Islaris 前端（--no-simplifications）
  → generated/*.v 的真实指令 trace
  → agent 编写的 Islaris 证明
  → Coq 内核检查
```

Islaris 前端仍应用它固有的事件过滤，包括删除 `Cycle`、枚举声明和 RISC-V 辅助寄存器 `nextPC` 的事件；`--no-simplifications` 保留具体寄存器读取与全部断言。我们没有自行删除路径条件或初始化假设。

| 文件 | 实际证明目标 |
|---|---|
| [VsetProof.v](VsetProof.v) | 对任意 64 位剩余长度，真实 `vsetvli a5,a0,e32,m8,tu,ma` 选择的 `vl`、写回值、`vtype`、`vstart` 和 PC 符合提取模型 |
| [InstructionProof.v](InstructionProof.v) | 对任意源寄存器内容，真实 `vredsum.vs v8,v8,v1` 的目标低 32 位等于 seed 加上 64 个源 lane，按 32 位位向量相加 |
| [WholeStruct.v](WholeStruct.v) | 从 Islaris 已有 lifting 引理推出整寄存器/字段混合访问的辅助规则 |
| [BitsProof.v](BitsProof.v) | 打包位向量取低 32 位的代数引理 |

两个指令引理的后置条件只覆盖表中列出的结果；它们不是完整函数的寄存器保持、内存效果或终止证明。Islaris 的 `instr_body` 是续接式部分正确性规则，不能单独当成终止定理。

配置为 VLEN=256、SEW=32、LMUL=8，因此 VLMAX=64。旧模型用 65536 位存储表示一个向量寄存器，但本次配置有效宽度为 256 位。这不限制函数的输入长度为 64；**也不表示本实验已经证明了任意长度的整个函数**。

最终指令前置条件显式使用 `mstatus=0x8000000000000600`（VS=Dirty，SD=1）、`vstart=0` 和相应 `vtype`。这些条件没有被当作无条件公理；它们出现在 Coq 定理的前提中。今后的循环证明必须证明每个执行点满足所用指令引理的条件，或把引理推广到循环中其他可达的 CSR 状态。

该快照选择 VL 的策略是：

```
n <= 64       → n
64 < n < 128  → ceil(n/2)
n >= 128      → 64
```

因此 `n=65` 时得到 33。定理没有偷换成 `min(n,64)`。本实验没有证明所有硬件 VLEN 或所有规范允许的 VL 选择策略。

## 工具接入中实际遇到的工作

- Islaris 源码固定为 `c978e10f50db5c40f0fdf113f5f76a779782c6f9`。其原有示例使用标量 RISC-V；没有现成的 RVV reduction 证明。本实验另选了官方已有 RVV 的快照。
- 新 `rv64d.ir` 的 footprint 入口缺少 PC 推进，符号向量 reset 又产生 `AssumeReg` 前提，不能把提取成功直接当成可用的程序证明。旧 RVV 快照的入口保留 PC 更新，静态宽度寄存器能直接产生符号读取，解决了这个实验的接入问题。
- Islaris 原自动化不能直接处理本 trace 中混合的整寄存器和字段访问。`WholeStruct.v` 补的是经过证明检查的规则，不是新的语义假设。
- 原 `riscv64_test.v` 标量示例已用正确 Coq load path 编译通过，见 `logs/scalar-smoke.log`。Dune 的 examples 目标存在子 theory load path 问题；无需修改逻辑即可绕过该构建配置问题。
- 动态 VL 的循环 `vadd.vv` 也实测提取了：VL 限于合法范围 0..64，约 114 秒、129 个 trace 节点、61,148,211 字节原始输出。见上一目录 `results/islaris-add-symbolic-vl.json`。这还只是提取，没有该指令的动态 VL 正确性证明，更没有循环证明。
- 2026-09-24 进一步检查这份 61 MB 文本：约 97.54% 是同一个 65536 位、数值为 32 的常量以补零十六进制重复打印造成的（每次 16,386 字节，共 3,640 次）。原文件 gzip 后约 205 KB。原始体积主要反映表示冗余，不能直接作为路径爆炸或证明不可扩展的证据；未修改原 trace，动态 VL 证明仍待完成。

## 信任边界

agent 提出 spec、辅助规则和证明脚本；这些脚本必须经过 Coq。不能用 `Admitted`、新公理或者未经证明的抽象摘要填补程序到 spec 的连接。两边若最终满足同一个精确、确定的函数契约，才可推出对应观察相等。

本实验沿用 Islaris 的基本信任边界：选定 Sail 模型及其编译快照、Isla 与 SMT 路径处理、Islaris 前端、Coq 内核，以及本项目已接受的 C 到机器码编译链。没有额外证明本次 Sail→trace 的翻译正确性。LLM 不需要成为证明可信组件，但“规格和前置条件是否表达了用户真正要求的任务”仍然需要审核。

## 复现

依赖安装在上一目录 `vendor/islaris-opam`，不修改用户全局 opam 环境。版本：OCaml 4.14.2、Coq 8.19.0、Dune 3.9.1、Islaris 固定版本的 Iris/Lithium/Stdpp；具体安装日志保留在 `logs/opam-*.log`。Dune 3.9.1 从官方发布包恢复；GMP 6.3.0 在该独立 prefix 中以 PIC 静态库编译。

```bash
python3 research/sail-tooling-gap/islaris-reduction/replay.py
```

复查会构建所需 Islaris 库，检查规格、生成的 trace、辅助引理和指令定理，再故意把 reduction seed 改错，要求错误规格被 Coq 拒绝。输出包含每一步退出码、用时及输入哈希；结果始终明确记录完整 kernel 和跨 ISA 定理尚未证明。

重新提取见 [extract.py](extract.py)。前端使用 [bin/isla-footprint](bin/isla-footprint) 选择固定官方快照和 `--no-model-reg-init`，不修改 Sail IR。

## 当前判断

这条路线有实际接入 RVV 的可能，已有工具和少量经过检查的辅助规则能够推进真实指令证明。剩余工作是把动态 VL 的 load / widening / tail-undisturbed add、循环不变式、内存契约与终止连接起来，再做 NEON 侧。因此目前既不能说已有工具已经完成了整个验证任务，也不能仅凭接入成本就断言存在新的研究贡献。
