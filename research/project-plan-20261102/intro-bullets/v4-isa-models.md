**Paragraph 1: Hardware specialization and human effort**

- Specialized hardware improves performance and energy efficiency.
- Exploiting these capabilities requires kernels tailored to the hardware.
- Developing and optimizing these kernels has traditionally required substantial human effort.
- Developers must understand the hardware, organize computation, and tune performance.
- Supporting another architecture often requires repeating this work.

**Paragraph 2: CPU SIMD, RVV, and C intrinsics**

- SIMD and vector units bring hardware specialization into modern CPUs.
- RVV is a relatively new vector extension that is attracting growing interest.
- Exploiting RVV requires efficient kernels, motivating the reuse of existing SIMD implementations.
- These architectures have different execution models: NEON uses fixed-width vectors, while RVV selects the active vector length at runtime.
- C intrinsics expose vector instructions within ordinary C programs.
- Programmers combine C control flow with vector operations, which the compiler lowers to hardware instructions.
- This allows developers to exploit vector hardware without writing entire kernels in assembly.

**Paragraph 3: Agent optimization and correctness**

- C intrinsics provide a practical interface for agents to generate and optimize SIMD kernels.
- Intrinsic descriptions and hardware knowledge guide these transformations.
- Recent work demonstrates this approach through kernel translation and optimization.
- Agents may exploit gaps in test coverage, passing tests without preserving the intended behavior.
- Existing work uses testing and formal validation, including bounded equivalence checking.
- Our goal is to establish equivalence for all inputs permitted by the preconditions in the spec.

**Paragraph 4: Possible semantic foundations**

- Comparing kernels across ISAs requires a shared basis for reasoning about their behavior.
- At the assembly level, ISA models describe instructions and architectural state.
- Sail and Islaris support reasoning at this level.
- At the IR level, vector operations can be expressed and verified using the IR’s semantics.
- Alive2 and Rake demonstrate verification through intermediate representations.
- At the C level, semantic shims interpret intrinsics as C operations.
- This turns SIMD kernel verification into C program verification.

**Paragraph 5: Why we choose C**

- We aim to prove equivalent outputs for all inputs satisfying the preconditions in the spec.
- NEON and RVV are described by separate ISA models with different architectural states and vector execution rules.
- Proving equivalence requires relating these states and showing that fixed-width SIMD and vector-length-agnostic execution perform the same computation.
- Detailed ISA models also cover exception handling and privileged execution, which are outside the scope of our kernel verification.
- We choose the C level to reason directly about the kernel’s source code, including its loops, pointers, and intrinsic calls.
- We give each supported intrinsic an explicit C definition of its numerical and memory behavior.
- Human experts review these definitions against ISA documentation.
- Using these definitions, existing C verification tools can prove that both kernels satisfy the common spec.

**Paragraph 6: The Vekto framework**

- We present Vekto, a framework for checking kernel equivalence across ISAs.
- Reusable C semantic shims cover supported NEON, RVV, AVX, and Hexagon HVX intrinsics.
- Each kernel pair uses the corresponding shims and a common output specification.
- QCP generates verification conditions for the annotated C programs.
- These conditions cover loop invariants, memory accesses, and postconditions.
- Implementations, specifications, and proofs remain separate.
- Agents either prove or investigate failed obligations for concrete counterexamples.
- A failed proof alone does not establish that the kernels differ.

**Paragraph 7: Human review and repair**

- Experts review the calling specification and verification feedback.
- Counterexamples are checked against the original caller’s requirements.
- Missing caller constraints can be added to the specification when justified.
- Strengthening the specification must preserve all legitimate calls.
- Feasible behavioral discrepancies guide repairs to the target kernel.
- Repairs should preserve the optimized structure wherever possible.
- The revised kernel is verified again, and its performance cost is measured.

**Paragraph 8: Three applications**

- Validate that optimized kernels preserve their reference behavior.
- Translate existing NEON or AVX kernels to RVV or HVX libraries that lack the corresponding operation.
- Cross-check independent implementations of the same operation under a shared contract.
- Use concrete discrepancies to distinguish implementation defects from permitted numerical differences.
- Use the findings to guide repairs and clarify library behavior.

**Paragraph 9: Evaluation**

- Evaluate Vekto on 35 final optimized RVV kernels from SALTyRN.
- Report **[TBD]** verified pairs and **[TBD]** speedup over the handwritten RVV baseline.
- Translate five AVX operations to RVV and HVX, and report their verification results.
- Cross-check corresponding XNNPACK implementations and report **[TBD]** discrepancies and upstream outcomes.
- Evaluate a composed SIMD program, with softmax as the candidate.
- Report verification time, token cost, implementation changes, and performance before and after repairs.
