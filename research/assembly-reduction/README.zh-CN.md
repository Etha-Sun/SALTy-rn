# 汇编 → Lean：qu8-rsum reduction 框架

选择仓库现有的 `kernels/target/qu8-rsum.c`，保持 C 函数体不变，用真实
RVV intrinsic 头文件编译，再把 `.s` **逐条**解析成 Lean 指令数组。
没有识别 reduction 名字、匹配循环模板、按源码推算循环次数或展开固定轮数。

当前已完成可执行翻译器、共享指令语义、独立 spec，以及 **kernel 的任意合法输入
总正确性证明**。完整冻结证明包见 [proofs/qu8-rsum](proofs/qu8-rsum/README.zh-CN.md)，
独立重编/目标/公理/哈希检查均已通过，结果见 [ProofResult.json](proofs/qu8-rsum/ProofResult.json)。
模型和 spec 没有为证明而改动；公理只有 propext、Classical.choice、Quot.sound。

这份新证明直接连接实际指令路径与 Assembly.Exec。原先 reduction-demo 的高层
value-level proof 并没有被当作汇编正确性的替代品。证明仍相对于手写指令模型成立，
不是 Sail/真实 ISA 一致性证明。

## 一条命令重跑

从仓库根目录运行：

```bash
python3 research/assembly-reduction/run.py
```

默认使用 Lean 4.29.1、当前机器 `/tmp` 下的 xPack GCC 15.2.0 与 RISC-V QEMU。
可以通过 `RVV_CC`、`QEMU_RVV` 指定其它安装路径；Lean 由本目录
`lean-toolchain` 固定。工具不存在会明确报错，不自动下载。仅需 Lean 执行检查时
可以显式传 `--skip-qemu`；此时报告也明确记录没有运行真实汇编交叉检查。

输出到 `out/`（生成物不进 Git）：

| 文件 | 用途 |
| --- | --- |
| `kernel.s` | GCC 编译出的原始汇编；随后交叉检查直接汇编这份文件 |
| `Impl.lean` | 19 条指令，每条保留原始行号与 PC 索引 |
| `SourceMap.json` | `.s` → 指令 → Lean 的完整映射和汇编 SHA-256 |
| `Machine.lean` | 本次冻结的共享机器语义 |
| `ReductionContract.lean` | 独立编写的参数条件、数学结果、内存 frame 和 ABI 条件 |
| `Spec.lean` | 唯一公开目标 `Kernel.correctnessClaim` |
| `ProofSupport.lean` | 与任何 kernel/循环形状无关的通用终止性规则 |
| `ProofTask.json` / `PROOF-PROMPT.md` | 下一阶段 proof 的目标、约束与冻结哈希 |
| `Result.json` | 翻译/执行检查结果，明确区分未完成的通用证明 |

也可以单独翻译指定 `.s` 中的函数，不使用 C 编译步骤：

```bash
python3 research/assembly-reduction/translate.py \
  research/assembly-reduction/out/kernel.s \
  --function test_rvv --out /tmp/rsum-lean-import
```

这个通用入口生成 Impl 和 SourceMap；对应的 API spec 必须独立选择/编写。
`run.py` 才是把该通用入口与 **qu8-rsum 契约**连接起来的示例驱动。
不能根据任意输入程序自动猜出它“应该”满足的规范。

## 重检已有证明与生成后续 proof

重检本次完成的、独立保存的冻结证明包：

```bash
python3 research/assembly-reduction/check_proof.py \
  --out research/assembly-reduction/proofs/qu8-rsum
```

以下是针对新生成产物的 proof 流程。已有 out/Proof.lean 时，重新运行翻译/执行
示例请指定新的 `--out /tmp/assembly-reduction-repro`，避免覆盖已有证明的冻结输入。

把 `out/` 的冻结输入和 `PROOF-PROMPT.md` 交给 proof 阶段，仅创建/修改
`out/Proof.lean`，最终目标为：

```lean
import Spec
import ProofSupport

-- 在这个文件里添加经过证明的引理和最终 theorem：
-- theorem Kernel.correctness : Kernel.correctnessClaim := ...
```

检查命令：

```bash
python3 research/assembly-reduction/check_proof.py
```

检查器在新临时目录重新编译所有依赖，检查冻结哈希、目标类型和传递公理。
仅允许 `propext`、`Classical.choice`、`Quot.sound`。缺少 proof、只有部分引理、
`sorry`、修改 spec 等都不会报告成功。缺少 proof 时退出码 2，状态为
`awaiting-proof`。`run.py` 遇到已经存在的 Proof.lean 会拒绝覆盖其冻结输入；
可以使用新的 `--out` 生成另一份任务。

Spec 的实质是：对任意合法配置和满足 Pre 的初始机器状态，存在正常返回的
执行，输出为 `oldOutput + sum(zeroExtend32(input[i])) mod 2^32`，输出之外的
内存不变，并保留 ABI 指定的寄存器。包括任意初始向量内容，不假设寄存器为零。
不假设 input/output 不重叠，因为本 kernel 在读完所有输入之后才执行唯一的 store。

`Assembly.Exec` 是无界正常返回关系。Spec 要求存在正常返回，因此不是只证明
“如果终止则结果正确”。`run` 的 fuel 只用于有限执行测试，完全不出现在公开 spec 中。

## 控制流与扩展方式

PC 是指令索引；普通指令前进，branch/jump 根据寄存器值更新 PC，ret 返回。
命名标签和 GNU 数字局部标签都解析为目标索引。没有 CFG 结构化或 loop recognizer。
共享语义里对 **指令种类** 的 match 是正常解释器分派，不是对控制流形状做匹配。

当前支持标量 add/sub/addw/addi/li、六种条件分支、jump、lw/sw、ret，以及当前
kernel 所需的七类 RVV 指令：vsetvli、vmv.v.i、vle8.v、vzext.vf4、vadd.vv、
vredsum.vs、vmv.x.s。也接受部分简单汇编伪指令。只支持 SEW=32 和整数 LMUL，
仅接受 unmasked 向量指令。超出支持范围会翻译失败或产生显式执行 fault。

增加一个指令只需要扩展：

1. `Machine.Instr` 的构造及 `execInstr` 中的语义；
2. `translate.OPCODES` 的操作数解析与生成规则；
3. 针对该指令的边界、负对照和真实执行对照测试。

无需修改控制流执行器或 `Assembly.Exec`。后续可以将标量、向量的指令处理器
拆成模块；当前保持单一语义文件，便于第一轮逐条审阅。

已提供通用 `total_of_rank` 定理：按 PC 定义 invariant，给出每一步的进展及
递减度量，即可证明总正确性。它可以处理嵌套循环和多个入口的控制流；代价是
证明者仍需要提供正确的不变量。框架没有承诺自动发现任意程序的不变量。

## RVV 中实际保留的细节

- GCC 把循环配置变成了 `e32,m8,tu,ma`，但仍然使用 `vle8.v`：EEW=8，
  EMUL=2，读取 v2..v3；不能把 load 错当成 32-bit load。
- v8..v15 是 32-bit accumulator，v16..v23 是 widening 的目标。
  向量寄存器使用物理字节数组存储，重新解释位宽/分组时保留真实重叠关系。
- `tu` 保留未激活 lane。`ta` 通过任意每步/每 lane oracle 选择保留或全 1；
  Spec 量化所有 oracle。不会把两种策略一律当成补零。
- `chooseVL` 参数满足 RVV 1.0 的 AVL/VLMAX 规则；Spec 覆盖所有合法选择函数，
  并未把 `min(AVL,VLMAX)` 当作唯一合法行为。
- reduction 读全 VLMAX，seed/destination 是单个寄存器，支持与源重叠。
- lw、vmv.x.s、addw 的符号扩展和最终 sw 截断都显式保留。

规范参考：[RISC-V V 1.0](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc)
中的 vector configuration、load/store、integer extension/reduction 和 move 章节。

## 检查范围与可信边界

已运行 1,512 个 Lean reduction 用例：VLEN 128/256/512，最大与平衡两种 VL
选择，保留/全 1/混合三种 tail oracle，边界长度、32-bit wraparound、重叠输出，
并检查输出外内存和 ABI 寄存器。真实 `.s` 汇编后在 QEMU 上运行的 252 个对应
用例与 Lean 输出一致。有限测试支持语义检查，不能替代任意输入证明。

另有嵌套循环、两个入口的 SCC、寄存器/标签改名、零长度实际汇编路径、无限循环
timeout、非法访问 fault，以及把 `tu` 改成 `ta` 必须失败的负对照。
通用 `run_sound` 和 `total_of_rank` 已由 Lean 检查；一个小型嵌套循环还有
`by decide` 的内核计算检查。checker 自身的正向测试使用单独的 trivial contract，
不会把它报告成 reduction 的证明。

这仍是 **手写汇编指令模型**，不是已证明正确的 Sail→Lean 或 ELF→Lean 链路。
Python parser、指令模型与真实 ISA 的一致性是当前信任边界。ret 被抽象为叶函数
返回，PC 不是字节地址；没有机器码解码、重定位、函数调用、特权态、MMIO、中断、
异常恢复。环境假设 vstart=0、little endian、普通有限字节内存及合法 VLEN。
标量 word 访问要求对齐。向量 widening 重叠仅支持当前的源/目标不相交子集。
vma 在全部指令 unmasked 且不允许读取 CSR 的封闭子集中没有可观察效果，故未存储；
扩展 masked 指令或 CSR 读取前必须补全相关状态。

翻译器严格拒绝未知指令、无法解析的跳转、额外 mask 操作数、函数内数据/对齐
指令，以及宏/条件汇编/符号赋值等会改变程序的预处理构造，不会静默跳过它们。

这里只验证 RVV 编译产物满足 sum 契约；不声称原始 NEON→RVV 的整条转换已被证明。
