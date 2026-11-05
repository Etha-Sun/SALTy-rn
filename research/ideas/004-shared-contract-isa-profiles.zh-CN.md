# 共享 kernel 合同与可复用的 NEON/RVV 环境接口

记录与调研日期：2026-10-09。状态：经项目源码和一手文献调研的候选设计；未自动采纳为实现路线。本次未修改证明源码、未运行 Coq/Lean，也未解除任何既有证明前提。

后续核查（2026-10-10）：[Tianrui 讨论与源码调研](../isa-assumptions-20261010/README.zh-CN.md)明确区分提取端 Assume/AssumeReg、证明端义务、路径 Assert 和 const_primops；补充了当前实际环境条件、加强假设的域变化以及小模型的信任/桥接选项。原卡结论与当时证据保留。

后续实验（2026-10-11）：[会议与 Slack 跟进](../meeting-followup-20261011/README.zh-CN.md)保存用户重申的三层接口、GEMM scale-up 和 instruction library 方向。新增 Lean 抽象接口/循环证明与原 GEMM C 的 host intrinsic 模型测试；发现 NaN 截断差异。真实 ISA adapter、Hload 和 FP32 GEMM 机器证明仍未完成，不改变本卡历史结论。

源码基线：`feat/assembly-reduction-lean`，HEAD `978bc31b8d005122f8256605dc376bf3959e4d16`。既有 `.gitignore` 修改、idea 003 及其他未跟踪实验目录保留。也读取了 `proof/sum` 工作树的项目 README；该工作树有后续本地实验，不能将历史 verification.json 当成当前全部文件的检查记录。

## 用户原话

> 查看一下我们的idea记录器，明确记录方法，你现在需要调研我的idea：
> 目前我们仍然需要规定spec，post condition和pre condition，现在由于sail model 过于的底层，我们不像prove 那么多的性质，所以我们在想，我们能否将要证明的pre 和post condition分为三类，1.neon侧的自己独有的性质，如neon env 包含了所有我们不关心的register之类的，以及address的alignment，2。对于rvv侧同理的相关性质，如果我们能够将这一块锚定就好了，不需要再对每一个kernel描述这样的信息 3. 是对于这个kernel独有的信息，比如矩阵乘法的时候我们需要match 矩阵的size，这一块的信息最好能做到一个两边共享的，导致我们仍然没有把LLM纳入tcb，我们trust是这个两边共享的，包含所有可能输入并有一个对应输出的spec

## 1. 当前解释与结论

这是 [idea 001](001-cross-isa-spec-interface.zh-CN.md) 的进一步细化：除了在顶层使用共同规格，还希望把每个 kernel 重复出现的机器条件交给可复用接口，使人和 LLM 主要面对同一份算法合同。

**可行的目标是“三个对外接口 + 两侧内部的参数化适配”。** NEON、RVV 各提供环境/调用/状态保持库；kernel 只定义一次共享的逻辑输入、合法域、算术语义和观察结果。每个实现仍需证明它使用这些接口的方式正确，不能把机器义务直接删除。

本次按“所有约定合法、受支持的输入”理解“所有可能输入”。矩阵尺寸匹配、可分配内存、地址表示范围等会排除不合法情况；不能同时宣称对任意数学尺寸、任意机器状态都有无异常返回保证。这个解释是助手对范围的明确化，不是改写用户原意。

应区分三种收益：减少重复书写；减少每个新 kernel 的证明劳动；减少检查时间与内存。第一种很有把握，后两种需要测量。共享接口不会自动解决当前 RVV load 和 FP 语义桥的瓶颈。

## 2. 三类如何划分

| 用户提出的类别 | 适合放入的内容 | 可复用方式与每个 kernel 的剩余工作 |
|---|---|---|
| NEON 侧 | 固定模型/平台 profile、端序、特权与 SIMD 使能；寄存器/参数编码、返回约定、栈和允许破坏的状态；具体指令的对齐规则 | profile 和通用规则可固定；kernel 提供参数位置、读写对象、布局和状态效果的描述，并证明实际代码满足描述 |
| RVV 侧 | 对应的平台与 ABI；支持的 VLEN/扩展；vl/vtype/vstart 等状态规则、向量分组与内存访问规则 | 固定环境与动态配置状态分开；kernel 需证明 vset、活动 lane、tail/mask 和访问范围正确 |
| kernel 共享侧 | Input、Output、Domain、数学/位级函数、维度和单位、逻辑对象/视图、别名、可观察副作用 | 两侧绑定同一份合同，各自证明具体表示回到相同逻辑对象与结果 |

两侧内部应再区分 **平台固定条件** 与 **随实现变化的调用/布局/效果条件**。这不增加第四个对外接口，而是避免把后者误当成所有 kernel 天然共享的事实。

例如，对齐不是固定“NEON 16 / RVV 某个值”就能概括：要求取决于指令、元素宽度、访问地址表达式、平台配置和已选证明合同。可复用的是 `aligned(base,a)` 与偏移保持对齐的引理；仍要证明 kernel 每次访问满足所用规则。RVV 1.0 §8 按元素自然对齐与实现支持规定异常边界，而非统一要求向量宽度对齐。[RVV 1.0](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-memory-alignment-constraints)

把所有指针统一加强为 64 字节对齐会方便部分证明，却可能排除原调用者的合法输入。可以选择更强的公开 API，但必须明确报告域的变化，并验证调用者；不能将其包装成等价的接口整理。

## 3. “不关心 register”实际上有三种处理

1. **系统配置寄存器**：算法不关心，但会影响指令是否可执行、访问是否异常。可封装在环境谓词中，并证明相应环境条件在适用代码下保持；不能任意省略。
2. **临时寄存器**：对入口允许任意值作全称量化；实现应在使用前正确初始化。返回时若公开接口不观察它们，可以用存在量化隐藏最终值，但保留所有权及允许破坏的约定。
3. **须保持的寄存器/内存**：由 ABI 或调用者要求决定。用已证明的 frame/状态保持规则复用；不能仅因为不影响当前输出就允许破坏调用者状态。

在分离逻辑中，典型复用形状是 `{P * R} code {Q * R}`，其中 `R` 是与代码所用资源分离、由适用规则允许保留的资源。它不意味着任意重叠资源都能 frame，也不意味着把整个环境丢弃即可。NEON 模型把向量寄存器组合为 `_V`，子寄存器保持仍需数组更新引理；不能假定它们已是独立资源。

如果不观察某些初始值，还应证明输出对所有接口允许的初始值一致。仅构造一个“scratch 全为 0”的初态不会证明这一点。RVV 的 ta/ma 允许某些非活动值非确定；若后续计算会读取这些值，隐藏它们会掩盖错误。[RVV 1.0 §3.4.3](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc#vector-tail-agnostic-and-vector-mask-agnostic-vta-and-vma)

## 4. 共享合同与两侧符合性的最小逻辑形状

下列是设计记号，不是已编译的 Coq 接口。

```text
Shared(K) = (Input_K, Output_K, D_K, F_K, Effects_K)
F_K : {x : Input_K | D_K(x)} -> Output_K

I ∈ {NEON, RVV}
Pre_I(K,x) = Env_I(profile_I)
             * Call_I(desc_I(K), x)
             * R

{ D_K(x) ∧ Pre_I(K,x) }
    code_I(K)
{ exists y, y = F_K(x)
            ∧ EnvOut_I(profile_I, desc_I(K))
              * Result_I(desc_I(K), y, Effects_K)
              * R }
```

`Call` 连接逻辑输入与实参、内存布局、权限、初值和返回续延；`Result` 连接机器结果与共享观察；`desc` 表达本实现的布局、参数映射、scratch 与允许状态变化。EnvOut 不必等于入口 Env：例如 vl/vtype 可能合法改变，需符合约定而非假装固定。`R` 的 frame 条件及资源分离仍需满足。

真实 Islaris 接口使用 `instr_body`/`instr_pre` 续延，需通过其已证明规则实现上述形状；这里没有假定仓库已有普通函数式 total Hoare triple 的转换。

如果 Spec 使用关系，应要求 `∀x, D_K(x) → ∃!y, Spec_K(x,y)`，并证明两侧返回结果满足它。只要求“有一个输出”仍可能允许多个不同结果，不能推出两侧相等。若 Spec 允许误差区间或多种合法浮点结果，两侧符合性通常只推出共同规格内的正确性，不能推出逐位相等。

对任何共同 x，若两侧都正常返回并满足上述同一 F，则两侧观察都等于 F(x)，从而相等。此推理不要求具体机器状态确定。**F 的全定义性不证明机器终止**；若要求每个合法输入都有实际返回输出，必须另证明安全、终止以及程序逻辑到操作语义的适当连接。当前 sum 项目的合同仍按既有部分正确性边界报告。

还需要防止合法域被适配缩小：

- 每个 D_K 输入在所声称支持的两侧平台上都可表示；内存容量和尺寸上界必须与声明的域一致。
- 对每个公开允许的布局、别名、初始 scratch 和 padding，正确性覆盖所有符合表示关系的入口状态。存在一个好用初态不等于覆盖所有调用。
- 两侧私有前提由共享合同、公开平台条件及已证明适配建立；额外前提无法推出时，报告差异，不允许静默收紧 D_K。
- 若两个布局不同，编码/解码须保持相同逻辑对象及其别名关系；物理地址可以不同。完整输出与规定的内存保持效果都要纳入观察。

## 5. 两个项目例子

**当前字节 reduction。** 共享 Input 至少含 `xs` 和输出初值 `old`，函数为 `(old + sum(xs)) mod 2^32`；Effects 要求输入不变及输出对象更新。初始 output 不是无关机器状态。NEON 的块/尾部表示与 RVV 的平坦字节表示可分别适配。

NEON 当前输入 16 字节对齐、输出 4 字节对齐；RVV 当前合同要求 7 字节有效 padding。padding 是具体读取合同/内存表示条件，不能因为 F 不使用它就删除。若希望 padding 值无关，应对所有允许值证明同一 F。若共享 caller 合同未承诺 padding，现有 RVV 接口就尚未覆盖该 caller 域；需改进加载合同或明确增强公开条件。

**矩阵乘法。** 共享侧可定义 `A : M×K`、`B : K×N`、输出形状 M×N，并规定 bias、截断、是否累加 C 初值、元素类型和完整算术语义。具体 packing、字节 stride、NR/KR/SR 与寄存器参数映射放到两侧适配，证明解码到同一 A/B。共享的维度关系不是仅检查两个整数碰巧相等。

本仓库现有 FP32 GEMM 是带 bias/minmax 的最多 4 行、每轮 8 列微内核。不能直接用实数矩阵乘法替代其规格：浮点位模式、FMA 和累加顺序、舍入、NaN/signed zero、FP 状态的观察政策都需明确。现有[浮点接口审计](../gemm-neon-cfg/proof-pilot/FP-INTERFACE-AUDIT.zh-CN.md)还指出真实模型/提取/Coq 表达式之间的缺口；环境封装不会修复它们。

## 6. 项目已有证据：哪些已经存在

以下来自本次源码阅读与既有记录，均不是本次新运行证明。

| 证据 | 对本 idea 的支持与限制 |
|---|---|
| [NeonSequence.v](../sail-tooling-gap/kernel-e2e/NeonSequence.v) 的 `neon_env` | 已封装系统配置，但不是“所有不关心寄存器”的集合，也不是对任意 kernel 已证明的全局环境定理 |
| [RvvPlatform.v](../sail-tooling-gap/kernel-e2e/RvvPlatform.v)、[RvvDefs.v](../sail-tooling-gap/kernel-e2e/RvvDefs.v) | 已分别封装平台与向量配置；固定 VLEN=256，不能默认任意 VLEN |
| [NeonRegisters.v](../sail-tooling-gap/kernel-e2e/NeonRegisters.v) | 已有 v3..v31 保持引理；说明保持性质能被包装复用，不等于完整 ABI 已验证 |
| [KernelSpec.v](../sail-tooling-gap/kernel-e2e/KernelSpec.v) | 已有共同求和函数，但仍导入 AArch64/NEON 模块；共享逻辑核心尚未完全脱离 ISA 依赖 |
| [NeonByteSpec.v](../sail-tooling-gap/kernel-e2e/NeonByteSpec.v) | 已把整段 NEON 合同接到共同 F，顶层仍显式携带大量机器资源 |
| [RvvByteSpecConditional.v](../sail-tooling-gap/kernel-e2e/RvvByteSpecConditional.v) | 已把返回观察缩到输出与输入内存；入口仍具体且显式依赖 Hload，不能把包装称为解除 Hload |
| [KernelMemoryBridge.v](../sail-tooling-gap/kernel-e2e/KernelMemoryBridge.v) | 已有块内存到平坦字节的表示桥，适合构建两侧 adapter |
| [40 kernel 合同审查](../kernel-contract-vl-audit-20261007/README.zh-CN.md) | 已提出按 kernel 参数化的共同合同、对象图、覆盖性与表示关系；本 idea 进一步明确复用范围和 LLM 信任边界 |

因此已有可用基础，不宜从零重写环境或引入新 ISA 模型。当前最大的新增工作是：共享纯逻辑核心、可证明的调用/效果模板、合法域覆盖，以及让 kernel 声明这些接口时不再重复机器细节。

## 7. 一手文献与新颖性边界

查阅日期均为 2026-10-09；仓库 `main` 链接可变，仅代表此次读取的材料。

**Islaris，PLDI 2022，§1/§4/§5。** 已将系统配置约束下的 ISA 符号执行与模块化分离逻辑证明结合。其 Figure 1 区分默认约束与指令约束；论文也明确基本流程的 TCB 包含 Isla/SMT，另提供 RISC-V translation validation 路线。环境封装与 modular proof 的基础并非新点，translation validation 的存在也不证明本项目所有 trace 已验证。[论文](https://www.cl.cam.ac.uk/~jp622/islaris.pdf)

**s2n-bignum 的实际 ARM 加法证明。** `BIGNUM_ADD_SUBROUTINE_CORRECT` 同时使用 `C_ARGUMENTS`、数学输出、具体 nonoverlapping 条件和 `MAYCHANGE_REGS_AND_FLAGS_PERMITTED_BY_ABI`。这是复用 ABI 模板且保留函数特有内存条件的直接先例；它使用自己的 ISA/HOL Light 模型，不是现成 NEON→RVV Sail adapter。[证明源码](https://raw.githubusercontent.com/awslabs/s2n-bignum/main/arm/proofs/bignum_add.ml)

**s2n-bignum 的 soundness 文档，A1/A2/A4/D1。** 分别讨论规格错误、前提与调用者不匹配、功能/最终 frame 不等同于完整内存访问安全，以及平台假设。支持本 idea 对“规范正确”“程序符合规范”“调用条件满足”的区分。不能将其全项目状态移植为本仓库已具备的保证。[官方说明](https://github.com/awslabs/s2n-bignum/blob/main/SOUNDNESS.md)

**RVV 1.0，§3.4.3/§8。** 非活动 lane 的允许行为和对齐规则说明环境、动态指令配置与公开观察必须有明确分工，不能单凭“不关心”删除约束。[固定规范](https://github.com/riscvarchive/riscv-v-spec/blob/v1.0/v-spec.adoc)

本次为针对性调研，未穷尽跨 ISA 合同生成文献。候选研究增量应定位为：面向真实 Sail NEON/RVV 的共享 kernel 合同、受检查适配与域覆盖机制，及跨多个 kernel 的可测量复用收益。仅把前提分三组或写三个 record，不能单独支撑新颖性主张。

## 8. LLM 与 TCB：什么可以不信任

用户希望 LLM 留在 TCB 之外，这是可实现的约束，但**共享 spec 不是全部信任基础**。

- 共享 spec、Domain 和观察政策需要独立确认与需求一致；这是需求层的可信锚点。
- LLM 可提出翻译代码、desc、表示桥、引理和证明脚本。只有在固定合同下检查通过的结果才接受；LLM 不得自行更换合同、加强前提或遗漏观察。
- 生成器本身可以不受信任，前提是其输出通过形式证书连接到固定合同和真实代码/语义。仅通过 JSON/schema/hash 检查不够；hash 负责绑定来源，不证明语义。
- 若默认接受 LLM 声称的 footprint、Env、编码或摘要而不证明，就仍信任了 LLM。把错误包装成 adapter 不会缩小 TCB。
- 证明检查器、ISA 模型以及未验证的语义提取链仍有各自可信假设。当前 Islaris trace 的检查不自动建立全部 Sail→trace refinement。

举例：`F(x)=0` 是全定义且唯一的函数，但可能完全不是用户需要的 GEMM。对它证明两边都正确也不能修正规格错误。`D(x)=False` 会使符合性空泛；`D(x)=(n=0)` 则可能偷偷丢掉所有非空调用。覆盖性必须相对预先确认的 caller 域审查，不能只对 LLM 新定义的 D 自证覆盖。

若只追求翻译保持性，可以让两边都精化一个共同参考语义，再证明该语义连接原 NEON。若还要求算法正确，则需进一步确认该参考满足算法合同。两种目标要明确，不把原程序语义和预期算法混为一谈。

## 9. 候选最小实验与可证伪标准

建议先用现有 reduction 检查接口分层，再用第二个小 kernel 验证真正的跨 kernel 复用；不要首先用尚无 FP 接口的 GEMM 承担全部基础设施成本。

1. 从已有字节数学定义提取 ISA 无关的共享核心，证明它与旧 F 相同。保留旧合同、合法域、观察与 Hload；验证两个 adapter 只返回共享结果和约定效果。
2. 包装平台 profile、调用参数与 frame/状态效果规则；保留 kernel 参数化的对齐、footprint、padding 和 scratch 描述。验证所有新增前提均有公开来源或证明。
3. 对同一个已固定共享合同，验证错误编码、尺寸单位错误、遗漏 output 初值、padding 条件丢失、越界读取、非法 callee-saved 破坏不能被接受。域覆盖与调用者连接要和功能证明分别检查。
4. 选第二个有可处理 ISA 语义的小 kernel，复用同一 profile 和调用规则。比较新增描述与引理、人工/agent 工作、编译与独立检查时间、峰值内存；首次基础设施与后续边际成本分开报告。

最低成功标准：相同合同/合法域/观察下，隐藏机器细节后的接口经内核检查且未增加信任假设；第二个 kernel 确实复用规则；所有新增私有前提都有覆盖证据。reduction 若仍使用 Hload，应明确标为条件性接口实验，不能报告完整跨 ISA 程序正确性。

反对/转向条件：每个 kernel 仍需等量手写 env/地址证明；只能靠收紧域或弱化观察通过；或包装后检查成本无改善。若只减少声明长度，可以记为工程组织收益，不扩大为证明难度或性能已经降低。

## 10. 本次动作与下一步

本次完成：阅读项目交接、idea 001–003、两条分支的证明边界、2026-10-07 合同审查和 GEMM FP 审计；核对相关 Coq 定义；查阅上述一手资料；新增本卡及[记录索引](README.zh-CN.md)，给 001 增加后续链接。

未完成：接口实现、调用域覆盖证明、第二个 kernel 的复用实验、性能对照、RVV 通用 Hload 和最终跨 ISA 定理。本次没有重跑历史检查、没有修改模型、没有提交或发布文件。下一步候选是为现有 sum 画出具体字段/前提归属，再实现保持原合同的最小包装；尚未将这一候选当作用户已选定的实现任务。


## 11. 后续实验（2026-10-11，不覆盖原始想法）

用户随后要求继续尝试多个方向，并询问 GEMM 是否修好。已完成的抽象三层接口、clamp 修复和浮点观察实验见[后续报告第 11 节](../meeting-followup-20261011/README.zh-CN.md#11-多方向继续任意-boundsfma-payload共享观察和-ulp)。

新证据：clamp 的局部逐位定理已扩展到任意 NaN bounds；完整 GEMM host 模型仍有 FMA payload 反例。候选 `observe` 把 NaN 统一为一种观察、其他输出保持位模式，从而保留共享输出唯一性；尚未获选为公开规格。另证明 ULP 预算通过共享参考组合时会相加，固定 2 ULP 关系不具传递性。这意味着“允许误差”不能直接沿用原来由唯一性得到相等的组合结论。

新增 `gemm_observations_match` 保留了逐步关系与最终观察的显式义务，并覆盖任意 K 列表的两步/逐步 schedule；尚未连接真实 FMA、内存或 Sail。当前仍是局部模型与接口实验，没有把 LLM 的手工模型假定为已经受 Sail 证明支持。


继续实验（2026-10-11）：[FMA payload 修复与任意 K 组合](../meeting-followup-20261011/README.zh-CN.md#12-fma-payload-修复与任意-k-的组合2026-10-11)。原 payload 反例已转为逐位回归，33,660 组 kernel cases 全部按位通过。新的组合定理把 NaN 选择、循环 schedule 与 clamp 相连，仍显式要求非 NaN 数值 FMA 一致和 Quiet 性质；未把这些接口前提当作已完成的 Sail bridge。为修复引入的 scratch/栈空间也成为后续 ISA profile/调用 footprint 的具体义务。


数值接口后续（2026-10-11）：[独立 SoftFloat 对照与 SMT 编码审计](../meeting-followup-20261011/README.zh-CN.md#13-独立数值-fma-检查与-smt-编码边界2026-10-11)。1,004,913 组非 NaN 输入的数值 FMA 对照通过；这不替代 ISA refinement。发现旧 FP→BV 约束允许 signaling NaN 输出，故不能直接导出 Quiet。新的显式 canonical adapter 在 Lean 中证明 Quiet，但 NaN 输入的 Arm payload 规则仍需单独保留；未全局修改旧 SMT 后端。


舍入桥后续（2026-10-11）：[RNE 舍入核心与 sticky-bit 证明](../meeting-followup-20261011/README.zh-CN.md#14-数值桥的第一段rne-舍入核心2026-10-11)。整数规则与带明确无回绕上界的 32 位操作等价，七项局部定理经 Lean 检查，无额外 native checker 假设；精确乘加、指数对齐、打包与真实 ISA 对应仍未完成。


共享 spec 审核点（2026-10-11）：[整数 FMA、具体 GEMM 合同与三方检查](../meeting-followup-20261011/README.zh-CN.md#15-可执行共享-spec-与审核点2026-10-11)。新增 11 项局部定理；128,118 组 FMA、640 组 GEMM/13,440 个输出逐位通过。待用户审核固定 FP profile 下只观察输出位模式的第一阶段范围；小模型没有被认定为已认证 ISA，Sail/真实内存 refinement 仍未完成。
