# SaltyRN Project State

Last updated: 2026-07-14 (Asia/Seoul)

## Objective

The project objective is to replace or complement SaltyRN's bounded SMT
translation validation with an automated Lean (or comparable prover) harness that
can establish unbounded Neon/RVV kernel equivalence. The intended claim is stronger
than testing a finite set of batch sizes and one VLEN.

## Claim Ladder

Keep these claims separate:

1. A Lean proof term typechecks for the theorem that was stated.
2. The two Lean implementation models are equivalent.
3. Each Lean model faithfully denotes the corresponding C kernel.
4. The C source and target are observationally equivalent under explicit contracts.
5. Compiled Arm and RISC-V machine code implement those C-level semantics.

The current repository has meaningful progress on levels 1-2 for a small model
subset. It has not established levels 3-5 end to end.

## Repository Snapshot

Remote audit date: 2026-07-11. The claims below are pinned to upstream
`main@6acdf7a522e2b97b96831f8e95b578e6edf42a83` and
`lean-verification@dd1c0ab12dedccc8d1e0296c82cbc3b72c32249f`.

- `main` is the integration baseline for LLM translation, Spike testing, bounded
  CVC5/Bitwuzla verification, and the current kernel corpus.
- `XNNPACK-verfication` and `pawat` have been fully merged into `main`.
- `bitwuzla` is an early, superseded proof of concept.
- `lean-verification` is an isolated prototype: relative to `main`, it is missing
  16 main commits and has one branch-only aggregate commit.
- `vlen128` is the newest unmerged work and adds 35 `*-128.c` RVV target files; it
  does not add Lean or verifier changes.
- No public roadmap, open issue, or open PR described a Lean integration plan at
  the time of the audit.

## Existing Lean Architecture

The current prototype is layered as:

```text
CoreOp scalar semantics
  -> Lane/List lifting
  -> Neon and RVV intrinsic wrappers
  -> per-kernel element functions and loop models
  -> generic map/zip/broadcast equivalence theorems
```

For `qs8-vadd`, each hand-authored loop is proved equal to a `List.zipWith`
functional model, then the two element functions are proved equal. This is an
unbounded theorem over Lean lists, but the C-to-Lean correspondence is not proved.

`Core/Adequacy.lean` contains definitional (`rfl`) wrapper-to-CoreOp equalities. It
does not prove adequacy against Arm ACLE, the RISC-V ISA, or compiler headers.

## Intrinsic Semantics Status

**Confirmed:** no reproducible generator from `arm_neon.h`, `riscv_vector.h`, or an
official ISA model to `Neon.lean`/`RVV.lean` is committed. The files were checked in
with references to local `op-semantics` documents and symbolic C++ shims.

**Confirmed:** many definitions are kernel-specialized rather than complete
intrinsic models. Examples include arbitrary-length Lists in place of fixed Neon
register widths, vector operands specialized to broadcast scalars, a uniform
right-shift-only model for `vrshlq_s32`, and simplified RVV `vnclip`/`vsetvl`.

**Current defensible claim:** the active-lane integer value semantics used by the
existing QS8 examples are broadly plausible under their restricted parameter domain
and output-only observation. Full C/ISA correspondence has not been established.

## Float32 Status

**Confirmed:** the Lean branch uses Lean core `Float32` directly. In Lean 4.29,
`Float32.add/sub/mul/div` and bit conversions are opaque extern-backed operations;
they do not reduce to an IEEE-754 definition in the kernel.

**Confirmed:** Float32 is not a peripheral concern in the current corpus. Twenty-
eight of the 40 current-main source kernels contain floating-point operations, and
21 source/target pairs are `f32-*`. An integer-only first slice is useful, but an
end-to-end project cannot defer the Float32 semantic choice indefinitely.

**Confirmed:** `F32VELU` defines Neon and RVV element functions to be definitionally
equal to one shared `coreElem`. Its equivalence theorem therefore establishes
equality inside that shared opaque model, not independent C/ISA faithfulness.

**Confirmed:** `FiniteF32` and `InDomain` are declared, but the current
`f32_velu_equiv` theorem does not take them as hypotheses. The referenced
`kernels/source/f32-velu.c` and target are also absent from the current kernel
directory.

**Confirmed concrete mismatch:** the historical Neon F32 VELU code uses
`vmlaq_f32`, whose ACLE semantics are a non-fused multiply followed by add. Its
RVV counterpart uses fused `vfmacc`. The current Lean Neon and RVV models both use
separate `Float32.mul` and `Float32.add`, so the RVV model is not faithful to that
C implementation. Fused and non-fused results can differ even for ordinary finite
inputs. The historical Neon loop processes 16 elements per main iteration, while
the Lean loop uses 12/4 chunks, providing a second direct C/model provenance gap.
One deterministic host check with contraction disabled found all-normal finite
operands `a=0x3620B2AC`, `b=0x2ED17056`, `c=0x1BADB75B`: fused FMA returns
`0x2583786D`, while rounded multiply followed by add returns `0x2583786E`.

**Confirmed concrete mismatch:** the current helper
`fmax a b := if b <= a then a else b` is not a complete model of either Arm `FMAX`
or RISC-V `vfmax`: NaN selection, signed-zero ordering, payload/canonicalization,
and architectural FP state require explicit policies.

**Open design choice:** for bit-exact floating-point claims, use an explicit
binary32 model (likely `BitVec 32` plus classification, exact arithmetic, rounding,
NaN/zero/subnormal rules, and FP environment) or bridge to an existing formally
specified IEEE-754 model. Native `Float32` remains useful for executable differential
tests but is not an adequate semantic foundation for nontrivial proofs by itself.

**Reuse candidate:** Gondolin/TorchLean contains a pure-Lean `IEEE32Exec` bit-level
binary32 value model and bridge layers. It is a useful implementation source, not
yet an authority: the project is young, its runtime `Float32` bridge has explicit
trust assumptions, and SaltyRN still needs ISA-specific wrappers for FMA versus
mul-add, min/max, NaN policy, FP control state, and observable flags. Audit it and
differential-test it against SoftFloat plus Arm/RISC-V execution before adoption.

**Float32 status clarification:** saying "Float32 is solved" conflates six layers.
Bit-pattern representation is solved; pure-Lean executable binary32 value semantics
now exists; and Gondolin has substantial finite/no-overflow refinement theorems.
However, a mature standard-library model, all IEEE rounding modes and exception
flags, native/C/ISA correspondence, and scalable program-proof automation remain
open. At pinned commit `fb352077`, Gondolin's core is fixed to RNE, has a chosen
deterministic NaN policy, and does not model FP exception flags. Its bridge to Lean's
opaque runtime `Float32` is explicitly assumption-based. This is enough to accelerate
a scoped SaltyRN value-semantics layer, not enough to inherit full C/ISA correctness.

**Recommended FP scope:** start with `structure F32 where bits : BitVec 32`, fixed
RNE and gradual underflow, then implement only the operations required by the first
kernel. Keep FMA distinct from `mul` followed by `add`; make min/max and FP
environment ISA-specific. Add exception flags only if the theorem observes them,
but state explicitly when they are quotiented away. The existing SMT layer already
records an `RNE, FZ=0, DN=0, AH=0` profile; Lean currently does not carry that
profile, and RISC-V canonical-NaN behavior still needs reconciliation.

Official/reuse references:

- Lean core Float32: <https://github.com/leanprover/lean4/blob/v4.29.0/src/Init/Data/Float32.lean>
- Arm Neon ACLE: <https://arm-software.github.io/acle/neon_intrinsics/advsimd.html>
- RISC-V scalar FP: <https://docs.riscv.org/reference/isa/unpriv/f-st-ext.html>
- RISC-V vector ISA: <https://docs.riscv.org/reference/isa/unpriv/v-st-ext>
- Gondolin float model: <https://github.com/nktkt/gondolin/blob/main/NN/Floats/README.md>

## Proof Audit

**Confirmed:** all 50 Lean modules compile when checked individually; the source
contains no `sorry`, `admit`, explicit `axiom`, or `unsafe`. Eleven final
equivalence theorems compile, and none has contradictory premises.

**Important trust qualification:** the eight QS8 add/addc final theorems transitively
depend on 31 generated `..._native.bv_decide.ax_*` axioms originating at
`SALT/Proof/RoundingEquiv.lean`. Lean's native `bv_decide` validates an LRAT proof
but injects the compiled checker result as an axiom, adding the Lean compiler/native
runtime to the trusted base. The repository's inline axiom-check helper misses these
transitive dependencies. CI must audit each exported theorem with `#print axioms`
and either reject native axioms or document that trust choice.

The F32VELU, F32VELUEmit, and QS8ClampEmit theorems use only standard Lean axioms.
That makes their proof objects logically cleaner; it does not validate their C/ISA
models. In particular, F32VELU proves two definitions that are both `rfl` to the
same `coreElem`.

**Current correctness statement:** the existing theorems are valid proofs of their
stated Lean propositions (with the native `bv_decide` trust qualification above).
They are not proofs that the checked-in C source and target are equivalent. No final
theorem mentions a C AST, C memory model, translation derivation, or source hash.
`Emit`/`Parsed` names and duplicated definitions do not by themselves establish
frontend provenance.

## Trusted Automation Boundary

Proof search may be nondeterministic and delegated to an untrusted agent if Lean
checks the final proof and CI rejects `sorry` and new axioms. The agent must not be
free to change the semantic definitions, theorem header, observation relation, or
preconditions.

Even after intrinsic coverage exists, the pipeline still needs:

- a fail-closed full-body C frontend with typed casts and source hashes;
- preprocessing, compilation flags, ABI, and supported-C-subset control;
- memory, pointer, alias, OOB-read, partial-store, and undefined-behavior contracts;
- control-flow, loop, termination, and frame-property semantics;
- legal RVV VLEN/LMUL/vl/mask/tail behavior;
- FP rounding mode, FMA, NaN, signed-zero, subnormal, and exception policy;
- validated preconditions and a fixed observational-equivalence theorem;
- artifact binding, coverage manifests, mutation tests, and CI checks;
- a separate compiler-correctness bridge if the claim extends to machine code.

Generating an implementation and an asserted API specification from the same
unchecked IR has common-mode-error risk. Automation may safely generate a fixed
equivalence theorem and an optional normal-form witness, because Lean must still
prove both refinements. It must not infer/weaken contracts, observations, or intrinsic
semantics to make the proof pass. Direct source-IR/target-IR equivalence is primary;
an independently reviewed functional spec is additional assurance.

### IR Scope Correction

The earlier list of post-coverage gaps mixed IR acceptance criteria with genuinely
later work. A production pipeline should have three checked artifacts:

```text
ArtifactEnvelope  = translation-unit hashes, headers, Clang/target/flags/ABI
KernelIR          = typed control flow, byte memory/effects, intrinsic operations
Contract/Observe  = valid inputs, UB boundary, state and observable outputs
```

Together with a reviewed Lean interpreter and a fail-closed extractor, this pipeline
can absorb preprocessing/provenance, memory and supported-C semantics, contracts,
RVV configuration, and the selected FP profile. These are gates for declaring a
function's Lean denotation complete, not tasks to postpone until after equivalence.

IR alone cannot establish its own C/ISA adequacy, eliminate common-mode semantic
errors, infer external XNN API intent, or prove compiled machine code correct. If
"every function has a Lean implementation" means a fixed translation unit already
has a checked full-function denotation under an explicit contract, the true remaining
work is source-IR/target-IR equivalence, independent model assurance and CI, caller
contract composition when required, and the optional machine-code bridge.

### Integer-First Scope

**Proposal:** defer Float32 operation semantics and FP kernel proofs, but do not
defer the IR extension points needed to add them without redesign. The production
schema should distinguish integer, FP, and mask types; preserve exact intrinsic
identity before lowering; parameterize architecture/effect semantics; use byte-
addressed partial memory; and make the observation relation explicit. The extractor
must reject every reachable FP type, cast, operation, or contraction while the
integer-only feature set is active.

All binary32 algorithms, rounding/NaN/subnormal/flag rules, Gondolin integration,
FP ISA bridges, and FP differential tests can then be added later as a semantic
module. Do not install a placeholder or native-`Float32` default denotation.

**Accepted target theorem profile:** compare the written output prefix and require
a frame property; quotient away architectural status not used by the C API; quantify
over every legal RVV `vl` schedule rather than one deterministic schedule; initially
trust a pinned Clang typed AST while requiring fail-closed 100% body coverage and a
Lean-checkable extraction manifest/certificate.

**Accepted real-kernel vertical slice:** generalize the generated microcase and
verify current-main `s8-vclamp`, because both Neon source and RVV target exist. It
exercises signed parameter truncation, three source loop/tail regions, OOB tail
reads, 4/2/1 partial stores, dynamic RVV `vl`, and exact output framing without FP.

The proposed first contract is `batch > 0`, representable ordered parameters
`-128 <= min <= max <= 127`, input readable through `roundUp(batch, 8)`, output
writable exactly through `batch`, and either disjoint buffers or exact in-place
operation. The representability bound avoids implementation-defined `int32_t` to
`int8_t` conversion. The theorem should cover the 64-byte, 8-byte, and 1--7-byte
Neon regions plus every legal RVV `vl` schedule, proving memory safety, termination,
the exact write footprint/frame, refinement of both sides to signed clamp, and final
observational equivalence.

## Current Prototype Status

**Confirmed (2026-07-14):** synthetic `s8-clamp16` is the first generated semantic-IR
E2E. A fail-closed Clang frontend translates all 47 Neon and 71 RVV body nodes to typed
parameters, operations, or structured control with zero `AST_AUDIT_ONLY` entries. Lean
rechecks provenance, descriptors, registry, coverage, and local SSA use order, then
directly interprets the generated `KernelIR` operations.

**Confirmed theorem:** under a fixed 16-byte readable/writable, disjoint-or-in-place
contract, both programs succeed for every positive RVV progress partition; final
memories and outputs agree, exactly 16 output addresses are reported written, and the
outside frame is unchanged. Exported theorems use only `propext` and `Quot.sound`. A
supported `vmin -> vmax` mutation lowers and passes structural checks, but executes
differently in Lean.

**Confirmed boundary:** this uses synthetic C, a parse facade, restricted Python,
single-block operations plus structured loop control, and transactional final memory.
Positive partitions overapproximate progress, not all ISA-realizable `vsetvl` traces.
Clang/C and intrinsic/ISA adequacy remain external; general CFG is not implemented.

**Confirmed real-kernel status:** current-main `s8-vclamp` still has 399/399 Neon and
121/121 RVV nodes only under strict `AST_AUDIT_ONLY` shape auditing. Its handwritten
value theorems do not execute emitted IR and do not yet prove real memory/frame or C
correspondence. The next task is to generalize the microcase frontend/interpreter to
that real arbitrary-batch kernel without reinstating answer-shaped extraction.

**Confirmed reproducibility:** `prototype/neon2lean/tools/check_e2e.py` regenerates
artifacts, tests failure gates, builds Lean, scans proof tokens, and audits axioms.

## Open Questions

- What exact claim does the intended paper require: C-source equivalence, intrinsic
  program equivalence, or compiled machine-code equivalence?
- Which compiler, flags, FP control state, XNNPACK parameter contracts, and OOB-read
  assumptions are authoritative?
- Is the intended RVV theorem per fixed implementation/VLEN or portable across all
  legal `vsetvl` choices?
- Which official or third-party IEEE-754 formal model can be reused in Lean without
  making an SMT solver or native runtime part of the trusted proof kernel?
- Which current-main kernel pairs are considered canonical acceptance tests by the
  project authors?
