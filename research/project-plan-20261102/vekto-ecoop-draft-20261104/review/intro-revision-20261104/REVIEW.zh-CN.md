# Introduction 修改审阅稿

2026-11-04。只重写 Introduction；不改其他章节的技术内容，不写 Abstract，不增加实验或已完成结论。旧稿保存在同目录的 `introduction.before.tex`，旧 PDF 为 `draft.before.pdf`。本稿的英中段落一一对应，英文来自当前 LaTeX 正文。

## 原稿问题与修改

1. **用文献介绍代替论证。** 原第一段逐项解释 KernelBench 和 Autocomp 做什么，但段落需要建立的是“硬件相关的 kernel 开发成本高，agent 已能参与这类工作”。新版直接陈述这一点，让引用支持论点。并非禁止在 Introduction 中点名工作；只有具体方法差异承担论证作用时，才值得展开。
2. **把给作者的核查回复写给了读者。** 原稿反复解释“不能保证计时作弊”“HVX 并非新架构”“不能只读几十行 spec”“旧证明不计入新 cohort”。必要事实已在方法、相关工作、评估和审计文档中保留；Introduction 聚焦实际验证目标，并用一句话交代部分正确性的边界。
3. **介绍组件，却没有解释组件为什么能处理问题。** 新版明确区分两件事：shim 保留各 ISA 的实际差异；共同 spec 关联完整实现的输出。每个实现使用自己的循环不变量，因此无需让不同步长的循环逐步同步。这是方法的具体作用，不以组件名称代替解释。
4. **结尾像项目任务清单。** 新版将三类用途和评估目标接回同一个等价性问题。实验仍未完成，保留未来时态和 TODO。没有为了让结尾更像论文而虚构结果。

## 参考的写法

- 作者提供的 **TopoVerus，Introduction，第 1–3 页**：先建立验证的价值和开发负担，再具体解释 verifier feedback 为什么不足，最后让诊断方法及训练设计回应这些困难。本次借鉴的是论证的衔接，不复用其文字或把它的结果转移到 Vekto。
- [Autocomp，§1](https://arxiv.org/html/2505.18574v3)：把硬件性能、编程成本和优化搜索的困难连起来，再解释方法为何需要相应设计。
- [KernelBench，§1](https://arxiv.org/html/2502.10517v1)：由 kernel 开发与迁移困难引出模型任务及其评估需求。它是 benchmark 工作，不能替代 Vekto 的验证动机。
- [LLM-Vectorizer，§1](https://arxiv.org/html/2406.04693v1)：从向量化的实际障碍引出 intrinsic 编程与正确性负担。保留其已有形式化验证事实，未声称此前只有测试。
- 作者此前提供的 **SALTyRN PDF，§I，第 1–2 页**：重点阅读跨 ISA 执行模型与优化如何同时影响正确性。未把其旧 32-kernel 结果写成我们的新实验。

本次将 Introduction 从约 1,160 词改为约 760 词，保留 8 个自然段。以下小标题仅帮助审阅，不进入论文正文。

## 第 1 段

**英文正文**

High-performance numerical software relies on kernels that exploit target-specific instructions and memory behavior. Developing these kernels requires substantial hardware expertise, and moving to a different architecture often entails another round of implementation and tuning. Recent advances in language models have made it possible to automate parts of this work, with agents using hardware descriptions and execution feedback to generate and optimize low-level code ([KernelBench](https://proceedings.mlr.press/v267/ouyang25a.html), [Autocomp](https://arxiv.org/abs/2505.18574v3)).

**中文对照**

高性能数值软件依赖能够利用目标硬件特有指令和内存行为的 kernel。开发这些 kernel 需要大量硬件知识，而迁移到另一种架构往往意味着重新实现和调优。语言模型的近期进展使其中一部分工作能够自动化：agent 可以利用硬件描述和执行反馈，生成并优化底层代码。

## 第 2 段

**英文正文**

We focus on SIMD kernels for CPU vector extensions. Their C intrinsic interfaces expose vector operations within ordinary C programs, allowing agents to modify instruction selection and loop organization directly. These rewrites must account for differences in the underlying execution models. Arm NEON uses fixed-width vectors, whereas RISC-V Vector (RVV) selects the number of active elements at runtime; a port must therefore account for different iteration sizes and tail accesses ([Arm ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html), [RVV specification](https://docs.riscv.org/reference/isa/v20260120/unpriv/v-st-ext.html)). Recent work has applied language models to this migration, including translation of NEON kernels to RVV followed by target-specific optimization ([SALTyRN](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/), [IntrinTrans](https://arxiv.org/abs/2510.10119v3)).

**中文对照**

我们关注 CPU 向量扩展上的 SIMD kernel。C intrinsic 接口允许在普通 C 程序中使用向量操作，使 agent 能够直接修改指令选择和循环组织。这些改写必须处理底层执行模型之间的差异。Arm NEON 使用固定宽度的向量，而 RISC-V Vector（RVV）在运行时选择参与运算的元素数量，因此迁移需要处理不同的迭代步长和尾部访问方式。近期研究已将语言模型用于这种迁移，包括将 NEON kernel 翻译为 RVV，再进行面向目标架构的优化。

## 第 3 段

**英文正文**

Correctness errors can arise in the transformations that improve performance: changing a loop's iteration size affects which elements are loaded, while replacing an intrinsic may change rounding or exceptional-value behavior. These errors can survive tests on ordinary inputs. Existing formal approaches already validate generated code through bounded symbolic execution or compiler-IR reasoning ([SALTyRN](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/), [LLM-Vectorizer](https://arxiv.org/abs/2406.04693v1), [Alive2](https://web.ist.utl.pt/nuno.lopes/pubs/alive2-pldi21.pdf)). Establishing equivalence over the full calling domain requires reasoning about every admitted loop iteration and memory access, under a model that retains the relevant ISA differences. Even a one-element maximum can disagree across ISAs if one instruction propagates a NaN and the other selects the numerical operand (Section 2). Our objective is to verify the optimized implementation under an explicit calling contract, while preserving the code whose performance motivated the optimization.

**中文对照**

正确性错误可能恰恰出现在提升性能的变换中：改变循环每次处理的元素数量会影响加载哪些元素，而替换 intrinsic 则可能改变舍入或特殊数值的处理行为。使用普通输入进行测试可能无法发现这些错误。现有形式化方法已经通过有界符号执行或编译器 IR 层面的推理来验证生成代码。要建立覆盖完整调用域的等价性，还需要在保留相关 ISA 差异的模型下，对契约允许的所有循环迭代和内存访问进行推理。即使只计算一个元素的最大值，如果一个指令传播 NaN，而另一个选择数值操作数，两种 ISA 的结果也会不同（第 2 节）。我们的目标是在明确的调用契约下验证优化后的实现，同时保留原本带来优化收益的代码。

## 第 4 段

**英文正文**

This objective requires a semantic model for both the vector operations and the surrounding program. Machine-code and compiler-IR verification provide established ways to express such models ([Sail](https://alastairreid.github.io/papers/popl19-isasemantics.pdf), [Islaris](https://pub.ista.ac.at/~msammler/paper/islaris.pdf), [Alive2](https://web.ist.utl.pt/nuno.lopes/pubs/alive2-pldi21.pdf), [Rake](https://people.eecs.berkeley.edu/~akcheung/papers/asplos22.pdf)). For intrinsic kernels, the C source already exposes the loops, pointer operations, and calls that must be related. We therefore give the supported intrinsics executable C interpretations and verify the resulting C programs. This keeps the proof obligations close to the source and allows intrinsic definitions and supporting lemmas to be reused across kernels. The interpretations retain architecture-specific behavior; equivalence is established between the complete kernels under their calling contracts.

**中文对照**

实现这一目标，需要同时描述向量操作及其外围程序的语义。机器码和编译器 IR 层面的验证已经提供了建立这类模型的途径。对于 intrinsic kernel，C 源码本身就呈现了需要关联的循环、指针操作和函数调用。因此，我们为受支持的 intrinsic 提供可执行的 C 解释，再验证由此得到的 C 程序。这使证明义务贴近源码，并允许不同 kernel 复用 intrinsic 定义及相关引理。这些解释保留架构特有的行为；等价性则在完整 kernel 之间、依据各自调用契约建立。

## 第 5 段

**英文正文**

We present Vekto, a framework for semantic equivalence checking of SIMD kernels using reusable C semantic shims. Its design targets NEON, RVV, AVX, and Hexagon HVX. **[TODO: Report the supported intrinsic subsets.]** A common specification determines the required outputs for the logical inputs, while each implementation has its own memory representation and loop invariants. Proving both implementations against this specification relates their results without requiring their loops to advance in lockstep. QCP generates verification conditions for the annotated C programs, which are discharged through automation and Rocq/Coq proofs ([QCP](https://arxiv.org/abs/2505.12878v1)). These obligations cover the output relation and modeled memory accesses. The guarantee is partial correctness relative to the intrinsic models and calling contracts; Section 3 states its trust assumptions and scope.

**中文对照**

我们提出 Vekto，一个利用可复用 C 语义 shim 检查 SIMD kernel 语义等价性的框架，设计面向 NEON、RVV、AVX 和 Hexagon HVX。[TODO：报告受支持的 intrinsic 子集。] 共同规格根据逻辑输入确定所要求的输出，而每个实现保有自己的内存表示和循环不变量。分别证明两个实现满足这一规格，就能关联它们的结果，无须要求两边的循环逐步同步执行。QCP 为带注解的 C 程序生成验证条件，再通过自动化机制及 Rocq/Coq 证明完成检查。这些义务覆盖输出关系和模型中的内存访问。保证范围是相对于 intrinsic 模型和调用契约的部分正确性；第 3 节说明其信任假设和适用范围。

## 第 6 段

**英文正文**

Vekto separates the implementation, specification, and proof so that agents can develop proof annotations and auxiliary lemmas without altering the executable algorithm. Experts review the calling contract and any changes suggested during verification. A feasible counterexample calls for repairing the target and checking the revised implementation. A counterexample excluded by the original caller's documented assumptions instead calls for making those assumptions explicit in the specification, with evidence that all legitimate calls remain covered. This separation makes the reason for each change reviewable and allows its performance cost to be measured independently of proof development.

**中文对照**

Vekto 将实现、规格和证明分离，使 agent 能够在不改变可执行算法的情况下开发证明注解和辅助引理。专家审查调用契约，以及验证过程中提出的修改。可行的反例要求修复目标程序，并检查修改后的实现。如果反例已被原调用方有文档依据的假设排除，则应在规格中明确这些假设，并提供证据说明所有合法调用仍被覆盖。这种分离使每项修改的理由能够被审查，也让性能代价可以与证明开发过程分别测量。

## 第 7 段

**英文正文**

The same verification method supports optimized-kernel validation, translation to another ISA, and cross-checking of independently developed implementations. For translation, an existing NEON or AVX kernel supplies a reference when a target library lacks the operation. For cross-checking, the question is whether implementations of the same operation agree under a shared contract, extending the comparison underlying differential testing to a program equivalence obligation ([Differential Testing](https://www.cs.tufts.edu/comp/150FP/archive/bill-mckeeman/DifferentailTesting.pdf), [SymDiff](https://www.microsoft.com/en-us/research/publication/symdiff-a-language-agnostic-semantic-diff-tool-for-imperative-programs/)). A concrete disagreement identifies behavior to examine against the library contract, helping distinguish a defect requiring repair from an intentional numerical difference.

**中文对照**

同一种验证方法支持优化后的 kernel 验证、向另一种 ISA 迁移，以及独立开发的实现之间的交叉检查。在迁移中，当目标库缺少某项操作时，现有 NEON 或 AVX kernel 可以提供参考。在交叉检查中，问题是相同操作的不同实现是否在共同契约下保持一致，相当于将差分测试中的比较提升为程序等价性证明义务。具体的不一致指出了需要对照库契约检查的行为，有助于区分需要修复的缺陷和有意允许的数值差异。

## 第 8 段

**英文正文**

Our evaluation will examine these uses through the 35 final optimized RVV kernels released by SALTyRN, ports of five AVX operations to RVV and HVX, and corresponding implementations in XNNPACK ([Final optimized kernels](https://github.com/keaganchern/optimized-rvv-kernels/tree/80feb4564cb470de301062109b6f89db672bdf9d)). A composed SIMD program, with softmax as a candidate, will test whether the kernel contracts support reasoning across operation boundaries. **[TODO: Report verification coverage and cost, justified repairs and their performance effects, cross-checking findings, and the composed-program result.]** The main measurements are the optimized implementations that can be verified without executable changes, the effort required to extend the semantic models, and the performance retained after necessary repairs.

**中文对照**

我们的评估将围绕这些用途展开，研究 SALTyRN 发布的 35 个最终优化 RVV kernel、五个 AVX 操作向 RVV 和 HVX 的迁移，以及 XNNPACK 中的对应实现。一个由多个操作组成的 SIMD 程序将用于检验 kernel 契约能否支持跨操作边界的推理，目前的候选是 softmax。[TODO：报告验证覆盖率和成本、有充分理由的修复及其性能影响、交叉检查的发现，以及组合程序的结果。] 主要测量内容包括：哪些优化实现可以在不改变可执行代码的情况下得到验证，扩展语义模型需要多少工作，以及必要修复之后保留了多少性能。

