# Introduction：段落衔接与引用修改

2026-11-04。本次对应作者对段末、RVV 动机、人工审阅、最终稿时态、连字符和 reward hacking 引用的反馈。

## Keagan 原文的逻辑链

依据作者提供的 SaltyRN.pdf，Introduction 第 1–2 页：

1. 硬件专用化带来性能/能效收益，同时产生专属编程接口，增加重写与移植成本。
2. CPU 的 SIMD 单元是这种专用化的具体实例；NEON 和 RVV 的执行模型不同，因此移植涉及结构变化。
3. 移植需要同时满足正确性和性能，两者又会在激进优化中相互牵制。
4. 编译器自动向量化、移植库各自解决部分问题，LLM 提供更灵活的生成方式。
5. 生成代码仍需语义检查，因而引出先翻译和验证、再优化和重验的流程。

他没有单独论证 RVV 的影响力。本文按作者新要求补入“RVV 的技术能力与库支持需求”，再讨论已有代码及其迁移差异。这里依据具体技术和软件需求，不加入无依据的市场份额或普及度判断。参照 [IntrinTrans §I](https://arxiv.org/html/2510.10119v3)。

## 本轮修改

- P1 只讲硬件编程难度和人工成本，agent 移到 P3。
- P2：CPU SIMD → RVV 的能力 → 库支持需求 → 已有实现作为来源 → 执行模型差异 → C intrinsic。删除指定的 migration 列举句。
- P3 把 reward hacking 压成一句直接陈述，引用放句尾，随后进入 Existing work。
- P4 删除泛泛总结，停在 C 这一可选层次；P5 随即说明选择理由。
- P5 把语义模型可信性落实到人类专家对照 ISA 文档的审阅职责。保留方法章中真实的信任边界，未把人工审查写成形式化的 ISA 对应证明。
- P6 将部分正确性的范围移到方法定义处；P7 删去重复总结，以重验和性能测量结束。
- P9 使用最终论文的 We evaluate / We verify。未知结果显式为红色 TODO，并有本段实验尚未完成的提示。语气改变不代表实验已经运行。
- 减少连字符描述，保留 RISC-V 等专名和 cross-checking 等必要术语。

以下依次给出新版中文译文、作者最初九段原文和当前英文正文。最新追加要求以 `author-input/INTRODUCTION-PROMPT.zh-CN.md` 为准。

## 第 1 段

**新版中文译文**

硬件专用化通过 GPU 和张量加速器等架构带来性能和能效收益。发挥这些能力，过去通常需要投入大量人工工作：专家必须组织数据移动、选择指令，并针对目标硬件调优 kernel。每种新架构都可能要求开发者重新考虑这些选择，并使已有实现适配不同的编程接口。

**作者原文**

> 第一段像keagan一样，讲述硬件优化整体概念，说这个是一个越来越受关注的主题，agent在写kernel方面表现的越来越好（kernelbench等等很多技术）

**英文 LaTeX 正文**

```latex
Hardware specialization enables gains in performance and energy efficiency through architectures such as GPUs and tensor accelerators~\cite{autocomp}. Exploiting these capabilities has traditionally required substantial human effort: experts must organize data movement, select instructions, and tune kernels for the target hardware. Each new architecture can require developers to revisit these choices and adapt existing implementations to a different programming interface.
```

## 第 2 段

**新版中文译文**

CPU 中的 SIMD 和向量单元是这种专用化的一种常见形式。RISC-V 向量扩展（RVV）支持在具有不同硬件向量长度的实现上进行向量计算。为 RVV 建立库支持，可以使应用程序利用这些能力，也推动了对已有向量代码翻译的研究。具有 NEON 或 AVX 实现的库已经提供了优化后的 kernel，可作为这些翻译的源程序。不过，两侧的执行模型存在差异：NEON 处理固定宽度的向量，而 RVV 在运行时选择参与运算的元素数量。两者都通过 C intrinsic 接口提供向量操作，使程序员能够将普通 C 控制流与编译器会降低为硬件指令的操作结合起来。

**作者原文**

> 第二段，把视角拉回我们要解决的问题 SIMD vector in modern CPUs，然后简单描述一下simd上的不同架构非常不同，且说明rvv这个比较新，是这个非常上升的kernel，收获越来越多的关注。且这些simd指令，都有对应的c intrinsic解释，人们完全可以用C代码中间添加一些高并行的运算，编译器就会翻译成高性能的指令，可以在C层面编码，为人类的编码创造了很多便利（不需要直接写assembly代码）

**英文 LaTeX 正文**

```latex
CPU SIMD and vector units are a widely used form of this specialization. The RISC-V Vector extension (RVV) supports vector processing across implementations with different hardware vector lengths~\cite{rvv}. Building library support for RVV makes these capabilities available to applications and has motivated work on translating existing vector code~\cite{intrintrans,saltyrn}. Libraries with NEON or AVX implementations already provide optimized kernels that can serve as the source for these translations. The execution models differ, however: NEON processes vectors of a fixed width, whereas RVV selects the number of active elements at runtime~\cite{acle,rvv}. Both expose vector operations through C intrinsic interfaces, allowing programmers to combine ordinary C control flow with operations that the compiler lowers to hardware instructions.
```

## 第 3 段

**新版中文译文**

近期研究表明，agent 能够利用硬件知识和执行反馈生成并优化 kernel。对于 SIMD 代码，C intrinsic 接口让 agent 能将这些知识直接用于指令选择和循环组织。然而，agent 可能通过 reward hacking 利用测试覆盖中的缺口，产生能够通过现有测试、却未保留预期行为的 kernel。现有研究通过测试和形式化验证处理正确性，其中包括对翻译后 kernel 的有界等价性检查，以及在编译器 IR 上验证向量化。将保证扩展到完整调用域，需要证明 kernel 的循环和内存访问，并建立能够体现不同 ISA 数值差异的 intrinsic 语义。

**作者原文**

> 第三段，这也为agent创造了很好的平台，可以将其在代码优化中的expertise，辅以一些intrinsic解释以及硬件编程技巧，应用到simd code的优化中，比如salty rn，autocomp等等，但是，agent写的代码可能频频发生reward hack（比如kernel bench之前汇报的一些reward hack问题），我们还需要验证其正确性。现有工作在验证上已经做出了很多努力（引用很多文章）但他们都没有形式化验证转写后的等价性。对于end-to-end的跨架构的kernel验证还没有人做（这上面很多说法都不大恰当，你需要自行替换为学术感强的描述）

**英文 LaTeX 正文**

```latex
Recent work has shown that agents can generate and optimize kernels using hardware knowledge and execution feedback~\cite{kernelbench,autocomp,saltyrn}. For SIMD code, the C intrinsic interface lets an agent apply this knowledge directly to instruction selection and loop organization. However, agents may exploit gaps in test coverage through reward hacking, producing kernels that pass the available tests without preserving the intended behavior~\cite{kernelbench-eval}. Existing work addresses correctness through testing and formal validation, including bounded equivalence checking of translated kernels and verification of vectorization in compiler IR~\cite{saltyrn,llm-vectorizer}. Extending the guarantee to the complete calling domain requires proofs of the kernels' loops and memory accesses, together with intrinsic semantics that account for numerical differences between their ISAs.
```

## 第 4 段

**新版中文译文**

这类验证所需的共同语义基础可以建立在不同层次。在指令层面，ISA 规格描述作用于架构状态的操作，使机器码证明能够依据详细的硬件语义进行。在中间表示层面，可以将向量操作表达为 IR，并依据其计算和内存语义进行比较。LLVM 翻译验证和面向 Hexagon HVX 的已验证指令选择展示了这种方法的用途。Intrinsic 源码提供了第三种选择：将受支持的 intrinsic 解释为 C 操作，就可以将比较转化为 C 程序验证问题。

**作者原文**

> 第四段，构建跨isa的kernel的共享语义模型基于我们处理的代码层面不同可以有很多种路径：比如在编译后的assembly层面，sail/islaris 等等工作，通过specification language详细定义了isa中的很多操作，详细到很多exception的处理；也可以使用某种IR将simd code进行翻译，将intrinsic重新用ir定义，然后再在IR层面建立对应于语义模型，建立对应内存模型，定义正确性以及等价性（找找有什么工作嘛？这个我不是很清楚）也可以在C层面，得益于 C intrinsic 的支持，尝试对intrinsic做C解释，然后将simd 验证问题转化为C 程序的验证问题

**英文 LaTeX 正文**

```latex
A shared semantic basis for this verification can be constructed at several levels. At the instruction level, ISA specifications describe operations on architectural state, enabling proofs of machine code grounded in detailed hardware semantics~\cite{sail,islaris}. At the level of an intermediate representation, vector operations can be expressed in an IR and compared using its computational and memory semantics. LLVM translation validation and verified instruction selection for Hexagon HVX demonstrate uses of this approach~\cite{alive2,rake}. Intrinsic source code provides a third option: interpreting supported intrinsics as C operations turns the comparison into a C program verification problem.
```

## 第 5 段

**新版中文译文**

我们选择 C 接口，在明确调用契约下建立功能等价性。对于契约允许的输入和硬件配置，两个 kernel 返回的输出必须等价，并满足各自的内存规格。C 源码同时呈现了向量操作及其外围的循环和指针，因此可以直接表达这些义务，而无须先从架构状态中重建计算过程。我们依靠人类专家对照 ISA 文档审查 intrinsic 的解释，包括其数值行为和内存行为。QCP 使用这些经过审查的解释作为 kernel 证明的语义，从而在同一个 C 框架中验证外围的控制流和内存访问。

**作者原文**

> 第五段，在本工作中，由于我们关注的是functional correctness（找找有啥更确切的定义嘛？就是说我们不关心很多意外情况），在assembly层面建立等价性对于我们的验证目标过于底层，需要haddle很多exception的处理，并且sail对于rvv这样的vla架构构建了另一套isa model，验证vla 与fixed-length相关kernel仍需连接两个模型，处理复杂的对应关系。为了使我们整体的框架更加简洁，让intrinsic semantic能够更直接地连接到我们相信的东西，更容易被审计，我们在C层面完成了simd的验证，

**英文 LaTeX 正文**

```latex
We choose the C interface to establish functional equivalence under explicit calling contracts. The kernels must agree on their returned outputs and satisfy their memory specifications for admitted inputs and hardware configurations. C source exposes the vector operations alongside the loops and pointers that manipulate them, so these obligations can be expressed without first reconstructing the computation from architectural states. We rely on human experts to check the intrinsic interpretations against ISA documentation, including their numerical and memory behavior. QCP uses these reviewed interpretations as the semantics for the kernel proofs, allowing the surrounding control flow and memory accesses to be verified within the same C framework.
```

## 第 6 段

**新版中文译文**

我们提出 Vekto，通过可复用的 C 语义 shim 检查跨 ISA 的 kernel 等价性，以 NEON、RVV、AVX 和 Hexagon HVX 为目标接口。[TODO：报告受支持的 intrinsic 子集。] 框架建立相对于调用契约和语义模型的部分正确性（第 3 节）。对于每对 kernel，Vekto 将 intrinsic 调用绑定到对应语义定义，并在共同规格中表达所要求的输出关系。QCP 对带注解的 C 程序进行符号执行，生成内存访问、循环不变量和后置条件的验证条件，再通过自动化机制及 Rocq/Coq 证明完成检查。每个实现用自己的不变量证明共同规格，因此两边的循环无须同步推进。实现、规格和证明保持分离，使 agent 能够保留可执行 kernel，开发证明注解和辅助引理。

**作者原文**

> 第六段，我们提出了\tool，一种跨isa语义等价性验证框架。我们对四种框架的intrinsic建立可复用code shim（c 语义)，使用QCP（引用一下）验证两个C program的等价性。对于两个kernel，我们会首先retrieve到对应code shim，然后建立简洁的spec，将output的等价性，定义为语义等价性。qcp会基于此建立verification condition，验证xxxx（这个可能需要搜一下qcp具体是怎么做的）。在证明中，我们将impl，spec，和proof严格分离，直接导入原有C intrinsic 实现。让agent要么完成相关proof的生成，要么能否找到确切反例，证伪验证的性质，并提出建议的修改方案。

**英文 LaTeX 正文**

```latex
We present \tool, a framework for checking kernel equivalence across ISAs through reusable C semantic shims, with NEON, RVV, AVX, and Hexagon HVX as its target interfaces. \todo{Report the supported intrinsic subsets.} The framework establishes partial correctness relative to the calling contracts and semantic models (Section~\ref{sec:guarantee}). For each kernel pair, \tool binds intrinsic calls to their semantic definitions and states the required output relation in a common specification. QCP symbolically executes the annotated C programs and generates verification conditions for memory accesses, loop invariants, and postconditions, which are discharged through automation and Rocq/Coq proofs~\cite{qcp}. Each implementation is proved against the common specification using its own invariants, so their loops need not advance in lockstep. Implementations, specifications, and proofs remain separate, allowing agents to develop annotations and auxiliary lemmas while retaining the executable kernels.
```

## 第 7 段

**新版中文译文**

人工审查围绕调用契约和验证过程中产生的证据展开。证明未成功也可能源于缺失的不变量或引理，因此尚未解决的义务应与已经证实的不一致区分。具体反例需要对照原调用方的假设进行检查。如果这些假设排除了该输入，就可以在规格中明确它们，并提供证据说明所有合法调用仍被覆盖。如果输入可行，它便指出了需要在目标实现中修复的行为差异。修改后的 kernel 随后需要重新验证，并通过性能测试评估修复代价。

**作者原文**

> 第七段，在这个框架中，给定需要验证等价性的两个kernel，人类专家只需要，1.审核等价性spec的定义（一般只有几十行）2. 审核验证反馈。对于不等价的验证，审核反例，如果不是真实场景中会出现的，是虚假反例（不在我们预期的限制范围内），则需要加强相关spec，将其排除，若不是，则需要作出不严重干扰性能的相关修复。然后重新验证。

**英文 LaTeX 正文**

```latex
Human review centers on the calling contract and the evidence produced during verification. An unsuccessful proof attempt can reflect a missing invariant or lemma, so unresolved obligations remain distinct from demonstrated discrepancies. A concrete counterexample must be checked against the original caller's assumptions. If those assumptions exclude the input, the specification can be strengthened to express them, with evidence that all legitimate calls remain covered. If the input is feasible, it identifies a behavioral discrepancy to repair in the target implementation. The revised kernel is then verified again and benchmarked to assess the repair's performance cost.
```

## 第 8 段

**新版中文译文**

该等价性框架支持三类用途。第一，检查优化后的 kernel 是否保留参考实现的行为，既包括同一 ISA 内的优化，也包括跨 ISA 的优化。第二，为将现有 NEON 或 AVX kernel 迁移到缺少对应操作的 RVV 或 HVX 库提供正确性判据。已有实现同时提供翻译所需的源代码和验证所需的参考。第三，对独立开发的同功能实现进行语义交叉检查。与差分测试一样，不一致提供了调查的起点；等价性检查则将实现之间的关系转化为明确的证明义务。库契约决定某个差异是否违反所要求的行为，或者属于允许的数值差异。

**作者原文**

> 第八段，基于该等价性框架，我们认为有三类有价值的下游任务。1.kernel优化后的语义等价性验证，对于同一isa，或者跨isa的kernel甚至program改写，验证其语义等价性，从而能够减少agent在基于test的优化任务上的reward hacking，语义一致性。 2. 跨isa的新kernel翻译，avx/neon，一直以来，由于其所在系统（x86/arm）的巨大影响力，高性能的cpu代码一直收到广泛关注，其中kernel功能完备，且受到持续的维护和完善，而rvv/hvx，则是较为新型的系统，所支持的kernel功能受限，使用人类专家重写同样面临较大的工程压力。而在该语义等价性框架之下，将已有的成熟系统中的kernel，有形式化保证地翻译到新语言，大大减少了相关的审计与人工effort压力 3. 对已有同功能kernel的等价性验证与debugging。在不同系统中，有许多功能一致的kernel，我们的系统不仅可以验证kernel是否符合某种安全性质或者功能性质，也可以直接对两个同功能的kernel，类似于差分测试一样（可以引用McKeeman，symdiff，差分测试这个词的用法我不确定），检测是否存在misalignment，并给出确切反例，xxxx（需要还有一句，类似于帮助人类更好维护系统之类的，但是肯定不是这么说，就是一个套话，你得想想了）。

**英文 LaTeX 正文**

```latex
This equivalence framework supports three uses. First, it checks whether an optimized kernel preserves its reference behavior, within one ISA or across ISAs. Second, it supplies a correctness criterion for porting existing NEON or AVX kernels to RVV or HVX libraries that lack the corresponding operation. Existing implementations provide both source code for translation and a reference for verification. Third, it supports semantic cross-checking of independently developed implementations of the same operation. As in differential testing, disagreement provides a starting point for investigation; equivalence checking makes the relationship between the implementations an explicit proof obligation~\cite{mckeeman,symdiff}. The library contract determines whether a discrepancy violates the required behavior or falls within the permitted numerical differences.
```

## 第 9 段

**新版中文译文**

[TODO：本段的实验依据及结果仍待完成。] 我们通过 SALTyRN 的 35 个最终优化 RVV kernel、五个 AVX 操作向 RVV 和 HVX 的翻译，以及 XNNPACK 对应实现之间的比较，评估 Vekto。我们还使用 [TODO：应用，候选为 softmax] 考察跨操作边界的等价性。我们验证了 35 对优化 kernel 中的 [TODO：N] 对，并测量了相对于手写 RVV 基线的 [TODO：加速比]。翻译与交叉检查实验建立了 [TODO：完成验证的迁移]，并发现 [TODO：契约违反、允许的差异及上游处理结果]。我们报告构建证明所花费的时间和 token、修复所需的实现修改，以及它们对性能的影响。

**作者原文**

> 第九段，我们在多个isa以及多种任务上测试了我们的框架。在salty-rn的基础上，我们修复并验证了35对基于neon kernel翻译而成的新rvv kernel，平均比手工的rvv kernel提速xxx倍。我们从avx这个相对成熟的系统中，将x个其独有的kernel翻译到了rvv与hexagon这样的新系统中，并验证了其语义等价性。我们通过检验一致性的方式，发现了XNNpack中xx个kernel实现不一致的情况，并将相关内容汇报。更一般的，我们加速并验证了应用级simd程序，softmax，相比人工的rvv程序实现了xx倍的加速。

**英文 LaTeX 正文**

```latex
\todo{Evaluation paragraph: experimental evidence and results remain pending.}
We evaluate \tool using the 35 final optimized RVV kernels from SALTyRN, translations of five AVX operations to RVV and HVX, and comparisons of corresponding implementations in XNNPACK~\cite{final-kernels}. We also use \todo{application; candidate: softmax} to examine equivalence across operation boundaries. We verify \todo{N} of the 35 optimized kernel pairs and measure \todo{speedup} relative to the handwritten RVV baseline. The translation and cross-checking studies establish \todo{verified ports} and identify \todo{contract violations, allowed differences, and upstream outcomes}. We report the time and tokens spent constructing proofs, the implementation changes required for repairs, and their effect on performance.
```

