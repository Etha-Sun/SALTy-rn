# Introduction：按作者九段逻辑重写

2026-11-04。按照作者最新反馈恢复九段结构。本次不按词数或页数裁剪，不写 Abstract。以下每段依次给出**新版中文译文、作者原文、英文正文**。作者原文中的待核查主张按原样保留，不代表论文采用该主张。

已重新阅读 `vekto-paper-writing`、`humanizer`、作者八条要求，以及 SALTyRN、TopoVerus 的 Introduction。九段原始 prompt 和后续反馈完整保存在 `../../author-input/INTRODUCTION-PROMPT.zh-CN.md`；工作摘要在 `../../author-input/INTRODUCTION-RESET-CONTEXT.zh-CN.md`。此摘要是持久记录，不声称系统上下文已被手动压缩。

本轮修正的叙述顺序：硬件专用化与人工成本 → CPU 内的 SIMD/vector units 及 C intrinsic → agent 优化与验证问题 → 可选语义层次 → 选择 C 的理由 → Vekto → 人工审核与修复 → 三类用途 → 待完成的评估。

Kernel 在技术分类上属于软件。作者要求的是从硬件专用化及其编程成本引入研究，不能把这理解为研究硬件电路优化。第一段保留原始 prompt 中 agent 进展的一句总述；第二段不讨论 agent，第三段再展开 intrinsic 编程接口与 agent 的联系。

事实边界保持：SALTyRN 已有有界验证；Vekto 当前保证是契约/模型下的部分正确性；四 ISA 完整覆盖和新 35 项结果没有被当作完成成果。

## 第 1 段

**新版中文译文**

GPU 和张量加速器体现了硬件专用化如何提升数据密集型工作负载的性能与能效。发挥这些能力，过去通常需要投入大量人工工作：专家必须组织数据移动、选择指令，并针对目标硬件调优 kernel。架构特有的编程接口使这些工作在迁移到另一平台时难以复用。近期研究开始借助语言模型 agent 自动完成其中一部分工作，利用硬件知识和执行反馈来生成和优化 kernel。

**作者原文**

> 第一段像keagan一样，讲述硬件优化整体概念，说这个是一个越来越受关注的主题，agent在写kernel方面表现的越来越好（kernelbench等等很多技术）

**英文正文**

GPUs and tensor accelerators illustrate how hardware specialization can improve the performance and energy efficiency of data-intensive workloads ([Autocomp](https://arxiv.org/abs/2505.18574v3)). Exploiting these capabilities has traditionally required substantial human effort: experts must organize data movement, select instructions, and tune kernels for the target hardware. Architecture-specific programming interfaces make this work difficult to reuse when moving to another platform. Recent work has begun to automate parts of this process with language-model agents that generate and optimize kernels using hardware knowledge and execution feedback ([KernelBench](https://proceedings.mlr.press/v267/ouyang25a.html), [Autocomp](https://arxiv.org/abs/2505.18574v3)).

## 第 2 段

**新版中文译文**

专用执行单元同样存在于通用 CPU 内部，其中的 SIMD 和向量扩展用于加速数据并行计算。这些扩展的执行模型存在显著差异：Arm NEON 操作固定宽度的向量，而 RISC-V Vector（RVV）允许在运行时选择有效向量长度。两者之间的迁移必须处理循环结构、尾部处理以及指令行为的差异。RVV 是这一生态中较新的扩展，完善其 kernel 支持也推动了对现有向量代码迁移的研究。C intrinsic 接口将这些硬件操作暴露在普通 C 程序中。程序员可以将 C 控制流和指针操作与向量 intrinsic 结合，由编译器将 intrinsic 降低为目标指令，从而无须用汇编实现整个 kernel。

**作者原文**

> 第二段，把视角拉回我们要解决的问题 SIMD vector in modern CPUs，然后简单描述一下simd上的不同架构非常不同，且说明rvv这个比较新，是这个非常上升的kernel，收获越来越多的关注。且这些simd指令，都有对应的c intrinsic解释，人们完全可以用C代码中间添加一些高并行的运算，编译器就会翻译成高性能的指令，可以在C层面编码，为人类的编码创造了很多便利（不需要直接写assembly代码）

**英文正文**

Specialized execution units are also embedded in general-purpose CPUs, where SIMD and vector extensions accelerate data-parallel computation. Their execution models differ substantially: Arm NEON operates on fixed-width vectors, whereas RISC-V Vector (RVV) allows the active vector length to be selected at runtime ([Arm ACLE](https://arm-software.github.io/acle/neon_intrinsics/advsimd.html), [RVV specification](https://docs.riscv.org/reference/isa/v20260120/unpriv/v-st-ext.html)). A migration between them must account for different loop structures, tail handling, and instruction behavior. RVV is a more recent addition to this ecosystem, and extending its kernel support has motivated work on porting existing vector code ([SALTyRN](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/), [IntrinTrans](https://arxiv.org/abs/2510.10119v3)). C intrinsic interfaces expose these hardware operations within ordinary C programs. Programmers can combine C control flow and pointer operations with vector intrinsics that the compiler lowers to target instructions, avoiding the need to implement an entire kernel in assembly.

## 第 3 段

**新版中文译文**

这一编程接口也使 agent 能够将代码生成能力用于 SIMD 优化。Intrinsic 的行为说明和硬件相关指导可以支持对指令选择、向量寄存器分组以及循环组织的修改。然而，这些修改可能改变现有测试没有覆盖的输入上的程序行为。Kernel 生成基准中报告的 reward hacking 进一步表明，优化目标可能通过利用评测漏洞而被满足。现有研究已经通过测试和形式化验证处理正确性问题，其中包括对翻译后 kernel 的有界等价性检查，以及在编译器 IR 上验证向量化。要建立覆盖完整调用域的等价性，需要在处理 ISA 数值行为差异的同时，对 kernel 的循环和内存访问进行推理。我们希望为实际优化后的实现建立这一保证，包括带来其性能的控制流和 intrinsic 选择。

**作者原文**

> 第三段，这也为agent创造了很好的平台，可以将其在代码优化中的expertise，辅以一些intrinsic解释以及硬件编程技巧，应用到simd code的优化中，比如salty rn，autocomp等等，但是，agent写的代码可能频频发生reward hack（比如kernel bench之前汇报的一些reward hack问题），我们还需要验证其正确性。现有工作在验证上已经做出了很多努力（引用很多文章）但他们都没有形式化验证转写后的等价性。对于end-to-end的跨架构的kernel验证还没有人做（这上面很多说法都不大恰当，你需要自行替换为学术感强的描述）

**英文正文**

This programming interface also gives agents a way to apply their code-generation capabilities to SIMD optimization. Intrinsic descriptions and hardware-specific guidance can inform changes to instruction selection, vector grouping, and loop organization ([SALTyRN](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/), [Autocomp](https://arxiv.org/abs/2505.18574v3)). However, these changes can alter program behavior on inputs that the available tests do not exercise. Reports of reward hacking in kernel-generation benchmarks further demonstrate that an optimization objective can be satisfied by exploiting weaknesses in its evaluation ([KernelBench evaluation report](https://scalingintelligence.stanford.edu/blogs/kernelbenchv01/)). Existing work addresses correctness through testing and formal validation, including bounded equivalence checking of translated kernels and verification of vectorization in compiler IR ([SALTyRN](https://riseproject.dev/2026/07/27/saltyrn-turning-neon-kernels-into-fast-verified-rvv-code-with-llms/), [LLM-Vectorizer](https://arxiv.org/abs/2406.04693v1)). Establishing equivalence for the complete calling domain requires reasoning about the kernels' loops and memory accesses while accounting for numerical differences between their ISAs. We seek this guarantee for the actual optimized implementations, including the control flow and intrinsic choices responsible for their performance.

## 第 4 段

**新版中文译文**

这类验证所需的共同语义基础可以建立在不同层次。在指令层面，ISA 规格描述作用于架构状态的操作，使机器码证明可以依据详细的硬件语义进行。在中间表示层面，可以将向量操作表达为 IR，并依据其计算和内存语义进行比较。LLVM 翻译验证和面向 Hexagon HVX 的已验证指令选择展示了这种方法的用途。Intrinsic 源码提供了第三种选择：将受支持的 intrinsic 解释为 C 操作，就可以将比较转化为 C 程序验证问题。这一层次选择决定了向量行为如何连接到外围的控制流和内存访问，以及哪些语义定义能够在不同 kernel 之间复用。

**作者原文**

> 第四段，构建跨isa的kernel的共享语义模型基于我们处理的代码层面不同可以有很多种路径：比如在编译后的assembly层面，sail/islaris 等等工作，通过specification language详细定义了isa中的很多操作，详细到很多exception的处理；也可以使用某种IR将simd code进行翻译，将intrinsic重新用ir定义，然后再在IR层面建立对应于语义模型，建立对应内存模型，定义正确性以及等价性（找找有什么工作嘛？这个我不是很清楚）也可以在C层面，得益于 C intrinsic 的支持，尝试对intrinsic做C解释，然后将simd 验证问题转化为C 程序的验证问题

**英文正文**

A shared semantic basis for this verification can be constructed at several levels. At the instruction level, ISA specifications describe operations on architectural state, enabling machine-code proofs grounded in detailed hardware semantics ([Sail](https://alastairreid.github.io/papers/popl19-isasemantics.pdf), [Islaris](https://pub.ista.ac.at/~msammler/paper/islaris.pdf)). At the intermediate-representation level, vector operations can be expressed in an IR and compared using its computational and memory semantics. LLVM translation validation and verified instruction selection for Hexagon HVX demonstrate uses of this approach ([Alive2](https://web.ist.utl.pt/nuno.lopes/pubs/alive2-pldi21.pdf), [Rake](https://people.eecs.berkeley.edu/~akcheung/papers/asplos22.pdf)). Intrinsic source code provides a third option: interpreting supported intrinsics as C operations turns the comparison into a C program verification problem. The choice determines how vector behavior is connected to the surrounding control flow and memory accesses, and which semantic definitions can be reused across kernels.

## 第 5 段

**新版中文译文**

我们的验证目标是明确调用契约下的功能等价性：对于契约允许的输入和硬件配置，两个 kernel 返回的输出应当等价，并满足各自的内存规格。对于这一目标，intrinsic 接口既呈现了向量操作，也呈现了操纵它们的 C 循环和指针。从编译后的指令出发推理，还需要关联架构状态，并将机器码行为连接回源 kernel。我们选择在 C 层面解释 intrinsic，使其数值和内存效果能够与源码一起审查，并交由现有 C 验证基础设施处理。这种选择在 intrinsic 定义中保留架构特有行为，同时为完整 kernel 提供共同的验证语言。这些定义与实际机器指令之间的对应关系，仍是方法的明确假设。

**作者原文**

> 第五段，在本工作中，由于我们关注的是functional correctness（找找有啥更确切的定义嘛？就是说我们不关心很多意外情况），在assembly层面建立等价性对于我们的验证目标过于底层，需要haddle很多exception的处理，并且sail对于rvv这样的vla架构构建了另一套isa model，验证vla 与fixed-length相关kernel仍需连接两个模型，处理复杂的对应关系。为了使我们整体的框架更加简洁，让intrinsic semantic能够更直接地连接到我们相信的东西，更容易被审计，我们在C层面完成了simd的验证，

**英文正文**

Our verification target is functional equivalence under explicit calling contracts: the two kernels must agree on their returned outputs and satisfy their memory specifications for admitted inputs and hardware configurations. For this target, the intrinsic interface exposes the vector operations together with the C loops and pointers that manipulate them. Reasoning from compiled instructions would also require relating architectural states and connecting the machine-code behavior to the source kernels. We instead interpret the intrinsics at the C level, where their numerical and memory effects can be inspected alongside the source program and handled by existing C verification infrastructure. This choice preserves architecture-specific behavior in the intrinsic definitions while giving the complete kernels a common language for verification. The correspondence between those definitions and native instructions remains an explicit assumption of the approach.

## 第 6 段

**新版中文译文**

我们提出 Vekto，一个通过可复用 C 语义 shim 检查跨 ISA kernel 等价性的框架，以 NEON、RVV、AVX 和 Hexagon HVX 为目标接口。[TODO：报告受支持的 intrinsic 子集。] 对于每对 kernel，Vekto 将 intrinsic 调用绑定到相应语义定义，并在共同规格中表达所要求的输出关系。QCP 对带注解的 C 程序进行符号执行，生成内存访问、循环不变量和后置条件的验证条件，再通过自动化机制及 Rocq/Coq 证明完成检查。每个实现使用自己的不变量来证明共同规格，因此两边的循环无须逐步同步执行。实现、规格和证明保持分离，使 agent 能够保留可执行 kernel，开发证明注解及辅助引理。最终保证是相对于调用契约和语义模型的部分正确性（第 3 节）。

**作者原文**

> 第六段，我们提出了\tool，一种跨isa语义等价性验证框架。我们对四种框架的intrinsic建立可复用code shim（c 语义)，使用QCP（引用一下）验证两个C program的等价性。对于两个kernel，我们会首先retrieve到对应code shim，然后建立简洁的spec，将output的等价性，定义为语义等价性。qcp会基于此建立verification condition，验证xxxx（这个可能需要搜一下qcp具体是怎么做的）。在证明中，我们将impl，spec，和proof严格分离，直接导入原有C intrinsic 实现。让agent要么完成相关proof的生成，要么能否找到确切反例，证伪验证的性质，并提出建议的修改方案。

**英文正文**

We present Vekto, a framework for cross-ISA kernel equivalence checking through reusable C semantic shims, with NEON, RVV, AVX, and Hexagon HVX as its target interfaces. **[TODO: Report the supported intrinsic subsets.]** For each kernel pair, Vekto binds intrinsic calls to their semantic definitions and states the required output relation in a common specification. QCP symbolically executes the annotated C programs and generates verification conditions for memory accesses, loop invariants, and postconditions, which are discharged through automation and Rocq/Coq proofs ([QCP](https://arxiv.org/abs/2505.12878v1)). Each implementation is proved against the common specification using its own invariants, so their loops need not advance in lockstep. Implementations, specifications, and proofs remain separate, allowing agents to develop annotations and auxiliary lemmas while retaining the executable kernels. The resulting guarantee is partial correctness relative to the calling contracts and semantic models (Section 3).

## 第 7 段

**新版中文译文**

人工审查围绕调用契约和验证过程中产生的证据展开。对于具体反例，首先需要检查它是否满足原调用方的假设。如果这些假设排除了该输入，就可以在规格中明确它们，同时提供证据说明所有合法调用仍被覆盖。如果输入可行，它便指出了需要在目标实现中修复的行为差异。修改后的实现随后需要重新验证，并通过性能测试评估修复代价。证明未成功也可能源于缺失的不变量或引理，因此尚未解决的义务应与已经证实的不一致区分。将证明修改与可执行代码修改分开，可以让每项修复的理由及其对优化代码的影响得到审查。

**作者原文**

> 第七段，在这个框架中，给定需要验证等价性的两个kernel，人类专家只需要，1.审核等价性spec的定义（一般只有几十行）2. 审核验证反馈。对于不等价的验证，审核反例，如果不是真实场景中会出现的，是虚假反例（不在我们预期的限制范围内），则需要加强相关spec，将其排除，若不是，则需要作出不严重干扰性能的相关修复。然后重新验证。

**英文正文**

Human review centers on the calling contract and the evidence produced during verification. A concrete counterexample must first be checked against the original caller's assumptions. If those assumptions exclude the input, the specification can be strengthened to express them, with evidence that all legitimate calls remain covered. If the input is feasible, it identifies a behavioral discrepancy for target-side repair. The revised implementation is then verified again and benchmarked to assess the repair's performance cost. An unsuccessful proof attempt can also reflect a missing invariant or lemma, so unresolved obligations remain distinct from demonstrated discrepancies. Keeping proof changes separate from executable changes makes it possible to review the reason for each repair and its effect on the optimized code.

## 第 8 段

**新版中文译文**

该等价性框架支持三类用途。第一，检查优化后的 kernel 是否保留参考实现的行为，既包括同一 ISA 内的优化，也包括跨 ISA 的优化。第二，为将现有 NEON 或 AVX kernel 迁移到缺少对应操作的 RVV 或 HVX 库提供正确性判据。已有实现既提供翻译所需的源代码，也提供验证所需的参考。第三，对独立开发的同功能实现进行语义交叉检查。与差分测试一样，不一致提供了调查的起点；等价性检查则将实现之间的关系转化为明确的证明义务。依据共同契约分析具体差异，可以识别实现缺陷或允许的数值差异，从而指导代码修复及库行为文档的澄清。

**作者原文**

> 第八段，基于该等价性框架，我们认为有三类有价值的下游任务。1.kernel优化后的语义等价性验证，对于同一isa，或者跨isa的kernel甚至program改写，验证其语义等价性，从而能够减少agent在基于test的优化任务上的reward hacking，语义一致性。 2. 跨isa的新kernel翻译，avx/neon，一直以来，由于其所在系统（x86/arm）的巨大影响力，高性能的cpu代码一直收到广泛关注，其中kernel功能完备，且受到持续的维护和完善，而rvv/hvx，则是较为新型的系统，所支持的kernel功能受限，使用人类专家重写同样面临较大的工程压力。而在该语义等价性框架之下，将已有的成熟系统中的kernel，有形式化保证地翻译到新语言，大大减少了相关的审计与人工effort压力 3. 对已有同功能kernel的等价性验证与debugging。在不同系统中，有许多功能一致的kernel，我们的系统不仅可以验证kernel是否符合某种安全性质或者功能性质，也可以直接对两个同功能的kernel，类似于差分测试一样（可以引用McKeeman，symdiff，差分测试这个词的用法我不确定），检测是否存在misalignment，并给出确切反例，xxxx（需要还有一句，类似于帮助人类更好维护系统之类的，但是肯定不是这么说，就是一个套话，你得想想了）。

**英文正文**

This equivalence framework supports three uses. First, it checks whether an optimized kernel preserves its reference behavior, within one ISA or across ISAs. Second, it supplies a correctness criterion for porting existing NEON or AVX kernels to RVV or HVX libraries that lack the corresponding operation. Existing implementations then provide both source code for translation and a reference for verification. Third, it enables semantic cross-checking of independently developed implementations of the same operation. As in differential testing, disagreement provides a starting point for investigation; equivalence checking makes the relationship between the implementations an explicit proof obligation ([Differential Testing](https://www.cs.tufts.edu/comp/150FP/archive/bill-mckeeman/DifferentailTesting.pdf), [SymDiff](https://www.microsoft.com/en-us/research/publication/symdiff-a-language-agnostic-semantic-diff-tool-for-imperative-programs/)). Examining a concrete discrepancy against the shared contract can identify an implementation defect or an allowed numerical difference, guiding repairs and clarifications to the library's documented behavior.

## 第 9 段

**新版中文译文**

我们计划通过 SALTyRN 的 35 个最终优化 RVV kernel、五个 AVX 操作向 RVV 和 HVX 的迁移，以及 XNNPACK 中的对应实现，评估这些用途。一个由多个操作组成的 SIMD 程序将用于检验 kernel 规格能否支持跨操作边界的等价性推理，目前的候选是 softmax。我们将测量验证覆盖率、证明开发时间和 token 成本、验证或修复所需的修改，以及相对于一致的目标平台基线的性能。[TODO：报告完成验证的 kernel 对及加速比、完成的迁移、交叉检查的发现及上游状态，以及组合程序的结果。] 这些实验将评估框架在多大程度上能够验证优化后的代码、在实现之间复用语义定义，以及支持保留优化收益的修复。

**作者原文**

> 第九段，我们在多个isa以及多种任务上测试了我们的框架。在salty-rn的基础上，我们修复并验证了35对基于neon kernel翻译而成的新rvv kernel，平均比手工的rvv kernel提速xxx倍。我们从avx这个相对成熟的系统中，将x个其独有的kernel翻译到了rvv与hexagon这样的新系统中，并验证了其语义等价性。我们通过检验一致性的方式，发现了XNNpack中xx个kernel实现不一致的情况，并将相关内容汇报。更一般的，我们加速并验证了应用级simd程序，softmax，相比人工的rvv程序实现了xx倍的加速。

**英文正文**

Our planned evaluation covers these uses through 35 final optimized RVV kernels from SALTyRN, five AVX operations to be ported to RVV and HVX, and corresponding implementations in XNNPACK ([Final optimized kernels](https://github.com/keaganchern/optimized-rvv-kernels/tree/80feb4564cb470de301062109b6f89db672bdf9d)). A composed SIMD program, with softmax as a candidate, will examine whether the kernel specifications support equivalence reasoning across operation boundaries. We will measure verification coverage, proof-development time and token cost, the changes required for verification or repair, and performance against consistent target-side baselines. **[TODO: Report verified pairs and speedups, completed ports, cross-checking findings and their upstream status, and the composed-program result.]** These experiments will assess the extent to which the framework can validate optimized code, reuse semantic definitions across implementations, and support repairs that retain the benefit of optimization.

