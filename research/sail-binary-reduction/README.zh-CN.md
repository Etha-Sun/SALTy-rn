# `qu8-rsum`：ELF 程序与 Sail ISA 语义的两条链

本实验在 `research/assembly-reduction` 之外单独实现，复用同一个 reduction
kernel：`kernels/source/qu8-rsum.c`（NEON）和 `kernels/target/qu8-rsum.c`（RVV）。
两个源文件均不修改，只通过 `kernel-neon.c` / `kernel-rvv.c` 补充编译环境。

**新增实测：RVV ELF 的程序适配层 + 上游 Sail ISA 已生成 Lem、通过 Lem 类型检查，
并导出 Isabelle/HOL 源码。详见 [形式化生成结果](FORMAL-RESULTS.zh-CN.md)。**

两边的二进制生成、ELF 数据导入 Lean，以及有限输入的二进制执行测试也已完成。
完整的 Sail→Lean→二进制执行尚未打通，NEON≈RVV 的一般性定理尚未证明。
不能把生成了 `RvvBinary.lean` / `NeonBinary.lean` 当作已经生成或运行了 ISA 语义。

## 两条链在哪里

```text
kernels/source/qu8-rsum.c → Clang 14 → neon.s → neon.o → neon.elf
kernels/target/qu8-rsum.c → GCC 15.2 → rvv.s  → rvv.o  → rvv.elf
                                                     ↓ elf_image.py
                                    NeonBinary.lean / RvvBinary.lean
                                    （字节、地址、PT_LOAD、BSS 数据）

固定版本的 Arm / RISC-V Sail ISA → Sail 0.20.2 Lean backend
                                  ↓ generate_model.py
                             Lean ISA 语义（生成未完成）

ELF ＋ Lean ISA 语义 ＋ 初始化/内存/ABI/返回适配
                                  ↓ run_lean.py（RVV 上游入口）
                             Lean 中执行与推理（尚未到达）
```

`.o` 已是机器码，但符号地址通常还需要链接；它不需要再经过 assembler。
本实验按 `.s → assembler → .o → linker → ELF` 显式保留中间产物。

## 已有结果

结果及精确命令保存在 `artifacts/Result.json` 和 `artifacts/BinaryResult.json`；
原始大型编译日志在 `out/`；去掉进度条、汇总重复的 unused-variable 警告后的诊断
在 `artifacts/`，保留错误与完成阶段的耗时。

| 阶段 | NEON | RVV |
|---|---|---|
| 同一个仓库 kernel 编译到 ELF | 成功，函数 168 字节 | 成功，函数 60 字节 |
| ELF 数据导入 Lean 并类型检查 | 成功 | 成功 |
| 225 个有限输入测试 | QEMU 成功，**不是 Sail** | Sail C++ 模拟器成功，VLEN=128/256/512 各 225 个 |
| 正常后端生成完整 Lean ISA | 1200 秒超时，0 个生成的 Lean 文件 | 1200 秒超时，0 个生成的 Lean 文件 |
| ELF 在 Lean ISA 中执行 | 未完成 | 未完成 |
| 任意合法输入的二进制等价性 | 未证明 | 未证明 |

输入覆盖 25 个长度（1–8191，含 16、VLEN 对应分块、2048 和 4096 附近的边界）、
三种字节模式和三个初始输出值，包含 uint32 溢出。
测试检查输出值、相邻输出 guard 和输入字节保持。它们不覆盖所有地址、别名布局、
初始寄存器、异常、VL 选择或硬件行为。

负对照修改 **ELF 内核字节**，将 `vadd.vv v8,v8,v16` 换为同宽 NOP：
Sail 报告 `FAILURE: 1`，说明测试确实会发现丢失累加行为。

新 RVV 汇编经旧翻译器导入后的 19 条指令，与之前证明包中的指令数组完全一致。
这只是转换结果比较，不是二进制到旧模型的形式化 refinement 证明。

## ISA 生成尝试和具体障碍

模型与编译器归档锁定在 `tools.lock.json`，下载后校验 SHA-256。

- Sail：0.20.2，提交 `3b7af38d66466ecadad563158b07ce2f82fe05da`。
- RISC-V：`29e6158f0a88bdb26b9fbcd0718ab919449b5179`，实例化 VLEN=256。
  历史命令使用 `V Zca Zba Zicsr_insts postlude`，后来发现 CLI 的 `V` 没有选中
  `V_instructions`；旧尝试不能称为完整 RVV ISA 测试。脚本已修正为显式选择
  `V_instructions`，历史命令和结果保留。新 Lem kernel 构建通过项目依赖带入了
  向量指令，并额外检查产物中的相关执行函数。
- Arm：`1bf2e5574ba9d704639a28401b6a387dcb113cae`，使用 Armv9.4-A 的真实
  `make gen_lean` 目标，包含 NEON 指令、共享 ASL 辅助函数、解码及取指模型。

RISC-V 的初始类型检查约 21 秒；正常后端在后续转换阶段未能在 20 分钟内完成。
最后完成的 pass 是 `early_return` 后的 `recheck_defs`；对应编译器源码的下一个
pass 是 `make_cases_exhaustive`。日志只能把瓶颈定位到这一区间，不能断言
“向量执行慢”或精确归因到某个内部函数。

额外尝试 `--lean-matchbv` 保留位向量模式：RISC-V 在约 207 秒后遇到编译器内部错误，
位置 `pmp/pmp_regs.sail:78`，`Could not resolve quantifiers for ones`。
这不是 ELF 格式错误或 reduction 正确性失败。Arm 的同选项尝试在 600 秒后超时，
同样未生成 Lean 文件；具体结果见 `artifacts/Result.json` 中
`neon-matchbv-generation`，与正常后端尝试分开记录。

Sail C++ 模拟器的 `--build-info` 确认其模型提交也是 `29e6158`、Sail 编译器也是
`3b7af38d…`，与本实验尝试生成 Lean 的 RISC-V 来源相同；这仍然不能替代
对 Lean 后端产物的检查。

还需要解决的 Arm 可信性问题：

- 上游 `gen_lean` 使用 `--lean-noncomputable`；适合描述语义并不等于能直接 `#eval` ELF。
- 上游 `lean/ArmExtras.lean` 中 `decreasing_trivial` tactic 有 `sorry` 回退。
  这是生成/支持代码中的潜在证明缺口，必须审计实际用到的定理及传递公理依赖。
  本实验没有把这个回退当作已证明，也没有把它复制到我们的 `BinarySpec.lean`。
- 尚未实现 Arm Lean 的初始化、内存和调用/返回适配。当前 NEON 测试 ELF 的 `_start`
  使用 Linux `svc` 退出协议，不能原封不动当作 Arm Sail 裸机启动环境。
  后续可直接在 `test_neon` 地址初始化 ABI 参数，以哨兵返回地址结束 kernel 执行。

## 如何复现和查看

工具放在本目录 `vendor/`，不会安装到系统。依赖系统的 Python 3、Clang/llvm-objdump 14、
make，以及已安装的 Lean 4.29.1。首次下载需要联网。

```bash
python3 research/sail-binary-reduction/bootstrap.py
python3 research/sail-binary-reduction/run.py
```

`run.py` 会生成 `out/binaries/{neon,rvv}.{s,o,elf}`、反汇编、Lean 数据模块、
manifest 和结果。实际三组 Sail 测试各约 155 秒；大部分指令来自标量测试 harness。
这不是 kernel 本身的性能基准。

两个模型生成可独立运行；超时/错误会写入各自 `Result.json` 并返回非零退出码：

```bash
python3 research/sail-binary-reduction/generate_model.py rvv --timeout 1200
python3 research/sail-binary-reduction/generate_model.py neon --timeout 1200
python3 research/sail-binary-reduction/generate_model.py rvv --matchbv --timeout 600
python3 research/sail-binary-reduction/generate_model.py neon --matchbv --timeout 600
```

不要同时运行两个 Arm 生成命令，它们使用上游的同一个生成目录。
如果 RVV 模型生成成功，下一步是：

```bash
python3 research/sail-binary-reduction/run_lean.py --model PATH_TO_GENERATED_MODEL
```

这个入口使用固定提交的上游 `lean_emulator/LeanRiscv.lean` 和 `Main.lean`，
配置真实模型依赖后执行 `lake update`、`lake build`，再读取 ELF。当前实际运行它会
报告 `blocked-missing-generated-model`；不存在外部模拟器或旧模型替代执行的路径。
依赖下载、Lean 版本兼容、初始化和 BSS 行为仍需在模型可用后实测。

ELF 导入器的反例检查：

```bash
cd research/sail-binary-reduction
python3 -m unittest -v test_elf_image
```

它拒绝错误架构、ET_REL/错误字节序、截断文件、非法加载段、未解析的已分配段重定位等。
测试不构成 Python 导入器的形式化正确性证明。

## 与当前手写汇编模型的区别

| 问题 | `assembly-reduction` | 本实验的目标路线 |
|---|---|---|
| 程序表示 | `.s` 转 `Array Instr` | 已链接 ELF 的机器码与加载段 |
| PC | 指令数组索引 | 真实字节地址 |
| 跳转 | 标签提前解析到索引 | ISA 解码器读取指令位，按语义更新 PC |
| 指令语义 | 手写小型 RV64/RVV `Machine.lean` | 上游 ISA 经 Sail 后端生成 |
| 常量、布局、重定位 | 受限汇编子集 | 链接结果已体现在 ELF 字节和地址中 |
| `ret` | 抽象为叶函数返回 | ISA 的真实跳转，加 kernel 调用/返回观察约定 |
| proof | RVV 相对小模型的一般性证明已完成 | 两个 ISA 各自证明到共同 spec，再组合 |
| 当前状态 | 可执行且有已检查的 kernel proof | 程序链和测试已完成；Lean ISA 链尚未完成 |

新路线减少了我们手写每条 ISA 语义的工作，但增加了生成后端、支持库、初始化/平台、
ELF 加载和 ABI 适配等需要核对的环节。Sail→Lean 本身不是已验证编译器的同义词；
生成代码通过类型检查也不意味着没有 `sorryAx`、额外公理或不完整平台模型。

## spec 可以保持简洁，但等价关系必须定义清楚

我们比较 **同一逻辑输入下的可观察结果**，不要求 Arm 与 RISC-V 的寄存器状态相等：

```text
expected(input, old) = old + sum(input) mod 2^32
NEON binary 正确  → 输出为 expected
RVV binary 正确   → 输出为 expected
                 → 两者输出等价
```

`BinarySpec.lean` 给出这个共同 spec 和有条件的组合引理 `equivalent_of_correct`。
两个 `Correct` 假设还没有被具体 Sail 二进制执行关系实例化和证明；这个引理绝不是
“NEON≈RVV 已证明”。完整规格还需在适配层涵盖内存 frame、ABI、异常及终止性质。

共同前提需要包含：`batch > 0`、合法内存、输出读写、合适的 ISA 配置、栈与常量可读；
特别是 NEON 尾部 `vld1q_u8` 读取完整 16 字节，输入末尾必须有最多 15 字节可读 padding。
RVV 仅加载活动 lane，因此 RVV 的最小内存前提不足以直接作为跨 ISA 前提。
测试采用独立输出内存及有 padding 的输入，不声称验证了全部别名情况。

若要提升结论到 intrinsic C，需要对 **有定义行为且满足约定的源程序** 假设编译链保持语义。
这个信任假设涉及编译器及 intrinsic headers、编译选项、assembler/linker 和运行环境，
不能忽略 C 未定义行为、padding、ABI 等条件。仅证明这两个确定的 ELF 时，不需要
额外假设它们由 C 正确编译而来；需要的是 ISA、加载及平台模型可信。

Lean 路线的下一步是先获得一个可构建、可审计的 RVV Lean ISA，跑通这 60 字节
kernel，再为旧的小模型证明建立到 Sail 的 refinement 连接；Arm 侧并行解决生成后端
与支持库的缺口。直接从巨大 ISA 定义重新生成整个 proof，成本会显著高于复用小模型引理。

## 上游依据

- [Sail RISC-V Lean emulator](https://github.com/riscv/sail-riscv/blob/29e6158f0a88bdb26b9fbcd0718ab919449b5179/lean_emulator/README.md)
- [Armv9.4-A Makefile，含 gen_lean](https://github.com/rems-project/sail-arm/blob/1bf2e5574ba9d704639a28401b6a387dcb113cae/arm-v9.4-a/Makefile)
- [ArmExtras.lean](https://github.com/rems-project/sail-arm/blob/1bf2e5574ba9d704639a28401b6a387dcb113cae/arm-v9.4-a/lean/ArmExtras.lean)
- [Arm ASL→Sail 来源说明](https://github.com/rems-project/sail-arm/blob/1bf2e5574ba9d704639a28401b6a387dcb113cae/arm-v9.4-a/README.md)
