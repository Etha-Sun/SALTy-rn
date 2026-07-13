# SaltyRN Discussion Log

Entries are append-only. The canonical current conclusions live in
`PROJECT_STATE.md`.

## 2026-07-11: Repository and Intrinsic Audit

**Questions:** How are Lean intrinsics produced, do they match the original C/ISA,
what is each remote branch doing, and is current work aligned with the project goal?

**Conclusions:** No reproducible intrinsic-to-Lean generator was found. Existing
Lean models are hand-authored/kernel-specialized shallow embeddings. Their current
QS8 proofs are meaningful inside the Lean model but are not yet C/ISA correspondence
proofs. `lean-verification` is stale relative to main; `vlen128` is the latest active
branch and only adds translated targets. The formal-verification research objective
is aligned with the original project discussion, while the active engineering path is not yet integrated
with Lean automation.

**Detailed note:** `../neon-to-lean-mapping.md`.

## 2026-07-12: Durable Memory and Float32 Questions

**Questions:** Establish project memory; assess whether Float32 is a blocker, whether
to model it from lower-level binary32 definitions, whether current Lean is aligned
with C, whether generated proofs are correct, and what remains after complete
intrinsic coverage.

**Initial confirmed findings:** Lean 4.29's core `Float32` arithmetic is opaque and
extern-backed rather than kernel-reducible IEEE-754 semantics. Current `F32VELU`
Neon/RVV models share one definition, so their theorem does not independently
validate either C implementation. Complete intrinsic coverage alone would still
leave C frontend, memory/UB contracts, control flow, RVV configuration, FP
environment, theorem binding, and proof/CI obligations.

**Proof audit result:** all 50 Lean modules and 11 exported equivalence theorems
compile with no source-level `sorry`/`admit`/explicit axiom. Eight QS8 add/addc
theorems nevertheless depend transitively on 31 native `bv_decide` axioms, so they
extend the TCB to Lean's compiler/native checker. The F32 and clamp proofs use only
standard axioms. All are correct relative to their Lean statements, but none proves
C-to-Lean correspondence.

**Float32 result:** Float32 affects 28/40 current source kernels. Native Lean
`Float32` is executable but kernel-opaque. The historical F32VELU pair has a concrete
fused/non-fused mismatch: Neon `vmlaq_f32` is non-fused, RVV `vfmacc` is fused, while
Lean models both as separate multiply then add. The current `fmax` helper also omits
NaN and signed-zero distinctions, and its Neon loop chunking does not reproduce the
historical C loop. Therefore the existing F32 theorem must not be used as C
equivalence evidence. A host-level binary32 check produced an all-normal finite
counterexample (`3620B2AC * 2ED17056 + 1BADB75B`): fused result `2583786D`,
non-fused result `2583786E`.

**Decision proposal:** use an explicit bit-level binary32 value semantics, initially
fixed to RNE and gradual underflow, with distinct FMA and ISA-specific min/max
wrappers. Audit Gondolin/TorchLean's `IEEE32Exec` as a reuse candidate and validate
it differentially; native `Float32` remains a testing oracle only. Begin the first
vertical slice with an integer kernel, then add a simple current-main FP kernel and
explicit FMA/minmax stress cases.

## 2026-07-12: Float32 "Solved" and IR Scope Correction

**Question:** If binary32 can be defined from bits, why is Float32 still considered
a Lean pain point, and which of the previously listed gaps should the IR solve?

**Conclusion:** representation and a pure-Lean fixed-RNE executable value model are
now available, but proof of complete IEEE behavior, all FP state, runtime/C/ISA
bridges, and scalable automation are not generally solved. Gondolin materially
reduces implementation work but does not close those bridges.

The previous nine-item list was too broad. The intended production design is
`ArtifactEnvelope + KernelIR + Contract/Observe`, interpreted in Lean. That complete
pipeline should make preprocessing/provenance, supported memory/UB semantics,
contracts, RVV configuration, selected FP semantics, and artifact binding part of
the definition of a completed translation. What remains outside it is independent
semantic assurance/common-mode-error control, equivalence proof automation, caller
composition where needed, CI policy, and an optional machine-code bridge.

## 2026-07-12: Integer-First Decision Proposal

**Question:** Can Float32 be deferred, what IR questions remain, and what should be
implemented next?

**Proposal:** defer FP denotation and proofs, while reserving typed FP/mask syntax,
pluggable semantic/effect state, byte memory, explicit observation, build provenance,
and fail-closed FP feature detection. This makes FP a later semantics module rather
than a rewrite of the integer executor.

Use current-main `s8-vclamp` as the first complete paired slice. Default theorem
choices are output-prefix plus frame observation, all legal RVV `vl` schedules, and
a pinned Clang typed-AST frontend with 100% body coverage plus a Lean-checkable
extraction manifest. These remain proposals until the production schema is accepted.

**Slice audit:** `s8-vclamp` needs parameter representability
`-128 <= min <= max <= 127`, input padding to `roundUp(batch,8)`, output extent
`batch`, and an alias decision; the proposed alias contract is disjoint buffers or
exact in-place. Its source has 64/8/tail paths while the RVV target strip-mines, so
it provides the smallest current-main pair that exercises the intended memory,
schedule, termination, and frame semantics.

## 2026-07-12: Memory Protocol and First Integer Prototype

**Question:** Create durable planning/decision memory and begin implementing the
accepted integer-first default.

**Conclusion:** Added `DECISIONS.md` and `PLAN.md`, expanded the root memory protocol,
and implemented the first S8 prototype under `prototype/neon2lean`. The production
schema now separates artifact provenance, typed `KernelIR`, contract/observation,
byte memory, and the integer feature gate. Translation acceptance is deliberately
layered: audit completeness and emitter translation claims are not concrete IR
binding; the structural relation checks typed references, ranges, consistency, and
bidirectional coverage against an actual IR, but does not prove semantic preservation.

**Evidence:** pinned-signature Clang extraction audits all 399 source and 121 target
nodes. Regression tests reject unknown intrinsic spellings, reachable float syntax,
signature changes, nested integer casts, malformed emitter numbers, and a
`vminq_s8` to `vmaxq_s8` semantic mutation. RVV descriptors now bind exact SEW/LMUL.
JSON and generated Lean regenerate byte-for-byte. `lake build` passes all 18 jobs.
The four exported S8 value theorems report only `propext` and `Quot.sound`; generated
source/target envelopes evaluate to internally bound `true` and translation-claim
`false`.

**Unresolved:** all coverage entries remain `AST_AUDIT_ONLY`; no semantic C-to-IR
lowering or artifact-bound kernel theorem exists. The abstract RVV progress proof
still needs a real `vsetvl`/ISA bridge, and memory safety, partial-store footprint,
frame, alias, and final observational-equivalence proofs remain. The reviewed
descriptor registry also needs a version/hash in artifact provenance.
Before interpreting emitted IR, the reference-shape checker must gain SSA use-order
and CFG-dominance checks, and coverage must bind function identity plus per-entry
kind/range lowering certificates; the current relation deliberately checks only
reference/range set consistency.

## 2026-07-12: IR Completeness and Minimal E2E Clarification

**Question:** Is the IR finished, how extensible is it, and what end-to-end case or
concrete output exists now?

**Conclusion:** The current production files are an IR schema and validation shell,
not an executable semantic IR. They define typed parameters/operations/blocks,
provenance, byte memory, contracts, observations, and registry checks, but have no
operation interpreter, explicit branch terminators, phi/block arguments, dominance,
or generated semantic IR. The S8 extractor is a kernel-specific AST shape audit; all
520 entries remain `AST_AUDIT_ONLY`. Therefore there is no C-to-Lean verification E2E.

**Concrete current demo:** for input `[-128,-100,-4,0,5,20,100,127]`, bounds
`[-10,20]`, and abstract RVV chunks `[3,3,2]`, both Lean value models evaluate to
`[-10,-10,-4,0,5,20,20,20]`, and their executable equality check returns `true`.
Separately, real-C auditing reports 399/399 source and 121/121 target AST nodes, with
internally-bound envelopes `true` and semantic-translation claims `false`.

**Proposal:** first build a synthetic paired `s8-clamp16` semantic E2E: one fixed
16-lane Neon block and an RVV `while + vsetvl` loop over the same 16 bytes, quantified
over every legal positive `vl` schedule. This closes C AST -> generated IR ->
interpreter -> memory/frame theorem without the real kernel's Neon tail complexity.
It is not arbitrary-batch verification. Then reuse the machinery for real
`s8-vclamp`, physical tail behavior, and all legal RVV schedules.

## 2026-07-13: Viability of C-to-IR-to-Lean and Generated Specs

**Question:** Is `C -> IR -> Lean`, followed by automatic spec generation, a viable
route?

**Conclusion:** Yes for a fail-closed, deliberately restricted C/intrinsic subset.
The approach matches established formal-compiler and translation-validation patterns:
give an IR precise semantics, interpret or symbolically execute it, and prove a fixed
refinement/equivalence obligation. The decisive difficulty is the checked C-to-IR and
intrinsic/ISA correspondence bridge, not Lean proof checking itself.

**Spec boundary:** automate IR emission, per-node lowering certificates, theorem
headers, and optionally an architecture-neutral normal form used as a proof witness.
Do not treat a functional spec generated from the same unchecked IR as independent
evidence. Contract/UB assumptions, observation, intrinsic denotations, and axiom policy
must be versioned reviewed inputs; direct source/target observational equivalence is
the primary theorem.

**Evidence:** CompCert uses formally specified source/intermediate languages and
semantic-preservation simulations; Vellvm provides formal LLVM semantics and a
refining executable interpreter; Alive2 converts LLVM to its IR and checks refinement;
Lean-MLIR provides typed SSA/dialect denotations and verified rewrites. These validate
the architecture pattern, while none removes SaltyRN's Neon/RVV and C-boundary work.

## 2026-07-14: First Generated Semantic-IR E2E and Fork Preparation

**Question:** Continue the chosen route, organize the past several days into about five
chronological commits on `Etha-Sun/SALTy-rn`, and make further concrete progress.

**Conclusion:** Implemented synthetic `s8-clamp16` as the first paired generated
semantic-IR E2E. The restricted frontend consumes real C translation units and emits
typed operation graphs plus 100% translated coverage. A reviewed registry now binds
each spelling to type/config, semantic opcode, and effect. Lean checks artifact/function
identity and local use order, directly executes both generated IRs, and proves success,
final-memory/output equality, frame, and exact 16-address write summaries for every
positive RVV progress partition under the fixed contract.

**Mutation result:** replacing RVV min with a second supported max succeeds in the
frontend, emits different IR, and still passes registry/shape checks; Lean proves a
concrete inequivalence. Unknown calls and unsupported AST still fail closed. This
supersedes the idea that every semantic mutation should be rejected by extraction.

**Evidence:** `lake build` passes 25 jobs; both Python regression suites pass;
checked JSON/Lean regeneration is byte deterministic; new exported theorems depend
only on `propext` and `Quot.sound`. A demo input produces identical signed outputs for
Neon and RVV chunks `[3,5,8]`.

**Boundary:** the microcase is synthetic and uses a parse facade, restricted Python
lowering, structured single-block control, and transactional final-state memory. It is
not the real XNN kernel or an Arm/RISC-V ISA theorem. Positive progress schedules are
an overapproximation until the `vsetvl` bridge is proved. The real `s8-vclamp` artifact
remains audit-only and is the next generalization target.

## 2026-07-14: Public Fork Integration and Reproducibility Gate

**Question:** How should the accumulated work be organized into reviewable Git history
on the public fork, while removing local/private provenance and preserving evidence?

**Conclusion:** Created local branch `research/lean-ir-e2e` from upstream
`main@6acdf7a` and reconstructed five staged commits dated July 10--14: U8 typed IR,
the production IR foundation, signed-clamp value proof, real-S8 fail-closed audit, and
the generated semantic E2E plus project memory. Private correspondence is excluded.
Repository artifacts now contain only repository-relative paths.

**Evidence:** direct-checkout regeneration preserves 399/399 source and 121/121 target
audit coverage; `check_e2e.py` passes both frontend suites, 25-job Lean build,
forbidden-token scan, and an exported-axiom whitelist of only `propext`/`Quot.sound`.

**Unresolved:** the branch is local and has not been pushed. The next semantic step is
still generalizing normalized lowering and structured control to real `s8-vclamp`.
