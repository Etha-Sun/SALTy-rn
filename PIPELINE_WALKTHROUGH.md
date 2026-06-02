# SALTy-RN End-to-End Walkthrough

A live tour of the whole pipeline using one kernel, **`qs8-vadd-minmax`**. We start
from a raw upstream XNNPACK NEON file, **translate** it to RVV with an LLM, sanity-
check it on **Spike**, and finally **formally verify** it equivalent with cvc5 —
stopping along the way to explain each moving part, including the **intrinsics
trap** that the verifier is built on.

The example file we follow in:

```
benchmark/XNNPACK/src/qs8-vadd/gen/qs8-vadd-minmax-neon-ld128-u16.c
```

# Act I — Translation (NEON → RVV)

## 1. Pick & prep the NEON kernel

Here is the raw starting point — straight from upstream XNNPACK, untouched:

```c
// benchmark/XNNPACK/src/qs8-vadd/gen/qs8-vadd-minmax-neon-ld128-u16.c
#include <arm_neon.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/microparams.h"
#include "src/xnnpack/vbinary.h"

void xnn_qs8_vadd_minmax_ukernel__neon_ld128_u16(
    size_t batch, const int8_t* input_a, const int8_t* input_b,
    int8_t* output, const struct xnn_qs8_add_minmax_params* restrict params) XNN_OOB_READS
{
  const int8x16_t va_zero_point = vdupq_n_s8(params->scalar.a_zero_point);    // 16-wide
  const int32x4_t va_multiplier = vdupq_n_s32(params->scalar.a_multiplier);
  const int32x4_t vright_shift  = vdupq_n_s32(-params->scalar.shift);
  ...
  for (; batch >= 16 * sizeof(int8_t); batch -= 16 * sizeof(int8_t)) {
    const int8x16_t va = vld1q_s8(input_a); input_a += 16;                    // load 16 lanes (128-bit)
    const int8x16_t vb = vld1q_s8(input_b); input_b += 16;
    const int16x8_t vxa_lo = vsubl_s8(vget_low_s8(va), vget_low_s8(va_zero_point)); // widen − zero-point
    const int16x8_t vxa_hi = vsubl_high_s8(va, va_zero_point);                //   …both 8-lane halves
    int32x4_t vacc0123 = vmulq_s32(vmovl_s16(vget_low_s16(vxa_lo)), va_multiplier);
    vacc0123 = vmlaq_s32(vacc0123, vmovl_s16(...), vb_multiplier);            // 4 acc: 0123/4567/89AB/CDEF
    vacc0123 = vrshlq_s32(vacc0123, vright_shift);                            // rounding shift
    const int16x8_t vacc = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123),
                                      vqmovn_s32(vacc4567)), voutput_zero_point);
    int8x16_t vout = vcombine_s8(vqmovn_s16(vacc /*lo*/), vqmovn_s16(/*hi*/));
    vout = vmaxq_s8(vout, voutput_min);
    vout = vminq_s8(vout, voutput_max);
    vst1q_s8(output, vout); output += 16;
  }
  if XNN_UNLIKELY(batch != 0) {
    do { /* 8-lane body, then 4/2/1-lane tail stores */ } while (batch != 0);
  }
}
```

This is the **`ld128-u16`** variant: a fixed **16-lane** main loop (128-bit `vld1q_s8`
loads, four `int32x4` accumulators) plus an 8-lane `do/while` tail with 4/2/1-lane
stores. (It is one of the "self-contained NEON intrinsics" kernels — it uses only
real `<arm_neon.h>` intrinsics, nothing that bottoms out in an XNNPACK helper.)

**Prep step → `kernels/source/qs8-vadd.c`.** Two normalizations make this file
consumable by the rest of the pipeline:

1. **Rename the ukernel to `test_neon`.** The Spike harness and the verifier both
   look for the fixed names `test_neon` (reference) / `test_rvv` (translation).
2. **Prepend a `/* struct xnn_qs8_add_minmax_params { … }; */` comment** describing
   the params struct, so `extract_params()` can hand it to the model.

```c
// kernels/source/qs8-vadd.c  (the prepped source the pipeline reads)
/*
struct xnn_qs8_add_minmax_params {
  struct { int8_t a_zero_point, b_zero_point; int32_t bias, a_multiplier,
           b_multiplier, shift; int16_t output_zero_point;
           int8_t output_min, output_max; } scalar;
};
*/
void test_neon(size_t batch, const int8_t* input_a, const int8_t* input_b,
               int8_t* output, const struct xnn_qs8_add_minmax_params* restrict params) { ... }
```

That's the only manual touch. Everything downstream is automatic.

## 2. Translate (the LLM step)

`translate_kernel()` in `pipeline.py` drives it. It assembles two prompts:

- **System prompt** = `load_reference_docs("Neon")` — concatenates, in order:
  `translation_rules.md` (correctness hazards), `source_background.md` (NEON),
  `target_background.md` (RVV), `example_translation.md` (annotated examples).
- **User prompt** = `load_translation_prompt(...)` — fills `prompts/Neon/prompt.md`
  with the prepped source and the extracted params struct.

`prompts/Neon/prompt.md` pins the contract. The load-bearing rules:

> - *"Goal:the RVV output must produce the exact same result
>   bits as the NEON source for every input."*
> - *Frozen FP environment:* `RMode=RNE, FZ=0, DN=0` (matches RVV defaults).
> - **Consolidate unroll variants** into ONE RVV ukernel (`_u8`/`_u16`/`_u32` →
>   a single function).
> - **Replace fixed-width loops + scalar tail with one RVV `vsetvl` stripmine
>   loop**: each iteration sets `vl` from the remaining count, processes `vl`
>   elements, advances pointers by `vl`. RVV's dynamic `vl` *is* the tail handler.
> - Keep SEW/LMUL ratio constant across width stages (`e8m2 → e16m4 → e32m8`),
>   widest type within `LMUL=8`.
> - *"Preserve exact operation semantics — fused vs non-fused FMA, rounding modes,
>   NaN fixups, conversions."*

The model also gets **intrinsic-search tools** (`prompts_pkg/tools.py`):
`search_neon_intrinsics` / `search_rvv_intrinsics` grep the big semantics docs
(`op-semantics/neon-intrinsics.md`, `op-semantics/rvv-intrinsics.md`) so it can
look up the exact behavior of, say, `vrshlq_s32` or `__riscv_vnclip_wx` before
committing to a lowering.

The model returns C, and `extract_code()` strips the markdown fence **and every
`#include` line** (the verifier inlines the body into a namespace and shims the
intrinsics, so upstream includes would only clash). The result is written to
`kernels/target/qs8-vadd.c`:

```c
// kernels/target/qs8-vadd.c  (LLM output — note test_rvv, single vl loop, no tail)
void test_rvv(size_t batch, const int8_t* input_a, const int8_t* input_b,
              int8_t* output, const struct xnn_qs8_add_minmax_params* restrict params) {
  const int8_t  a_zero_point = params->scalar.a_zero_point;
  ...
  while (batch > 0) {
    size_t vl = __riscv_vsetvl_e8m2(batch);                       // tail = just a smaller vl
    vint8m2_t  va  = __riscv_vle8_v_i8m2(input_a, vl);
    vint16m4_t vxa = __riscv_vwsub_vx_i16m4(va, a_zero_point, vl); // widen − zero-point
    vint32m8_t vxa32 = __riscv_vsext_vf2_i32m8(vxa, vl);
    vint32m8_t vacc  = __riscv_vmul_vx_i32m8(vxa32, a_multiplier, vl);
    vacc = __riscv_vmacc_vx_i32m8(vacc, b_multiplier, vxb32, vl);  // multiply-accumulate
    vacc = __riscv_vssra_vx_i32m8(vacc, shift, __RISCV_VXRM_RNU, vl); // rounding shift
    vint16m4_t v16 = __riscv_vnclip_wx_i16m4(vacc, 0, __RISCV_VXRM_RDN, vl);
    v16 = __riscv_vsadd_vx_i16m4(v16, output_zero_point, vl);
    vint8m2_t vout = __riscv_vnclip_wx_i8m2(v16, 0, __RISCV_VXRM_RDN, vl);
    vout = __riscv_vmax_vx_i8m2(vout, output_min, vl);
    vout = __riscv_vmin_vx_i8m2(vout, output_max, vl);
    __riscv_vse8_v_i8m2(output, vout, vl);
    input_a += vl; input_b += vl; output += vl; batch -= vl;
  }
}
```

The 16-lane loop + 8/4/2/1 scalar tail collapsed into a single `vl`-driven loop — and
the named NEON ops mapped to their RVV counterparts (`vsubl`→`vwsub`,
`vmlaq`→`vmacc`, `vrshlq`→`vssra`, `vqmovn`+saturate→`vnclip`, …). **Whether this
mapping is actually correct is exactly what Act II proves.**

> **▶ Run it** — translation is stage 1 of the full pipeline (it then continues into
> Spike + verify):
> ```bash
> salty-rn -k qs8-vadd          # LLM translate → kernels/target/qs8-vadd.c, then verify
> ```

## 3. Compile + Spike — the fast sanity gate

Before the (slower) proof, `_compile_and_run()` builds the RVV kernel into a Zephyr
app (`build/compiler.py: build_kernel`) and runs it on **Spike** (`run_spike`)
against a **differential test**. The test driver is `kernels/harness/qs8-vadd.c`:

```c
// kernels/harness/qs8-vadd.c
static void reference_qs8_vadd(...) { /* XNNPACK's SCALAR reference, bit-for-bit */ }
#include "qs8-vadd.c"                 // the generated RVV kernel (test_rvv)

#define BATCH_SIZE 33                 // deliberately NOT a multiple of 8 → exercises the tail
int main() {
    /* fixed params, random inputs */
    reference_qs8_vadd(batch, input_a, input_b, output_ref, &params);  // scalar truth
    test_rvv          (batch, input_a, input_b, output_rvv, &params);  // our RVV
    puts(is_equal(output_rvv, output_ref, BATCH_SIZE) ? "PASS" : "FAIL");
}
```

This catches gross errors (miscompiles, obviously-wrong lowerings) on **one random
input** in seconds. It is **not** a proof — one input, fixed params. If it `FAIL`s,
the pipeline enters an **execution-repair** loop (re-prompt the model with the
mismatch). If Spike isn't configured (`CHIPYARD_PATH` unset) the stage is skipped
and we go straight to the proof.

> Why keep both Spike and the solver? Spike is cheap and concrete — great for
> shaking out compile errors and blunders fast. The solver is exhaustive — it's
> what actually certifies equivalence. Spike narrows; cvc5 proves.

> **▶ Run just this gate** (build + Spike, no translation, no proof):
> ```bash
> salty-compile qs8-vadd        # add --build-only to skip the Spike run
> ```

---

# Act II — Verification (prove it)

This is where the **intrinsics trap** lives. The goal: prove `test_rvv` produces the
same bytes as `test_neon` for **every** input, not just the one Spike tried.

## 4. The one-sentence idea

We compile *both* kernels into one C++ program in which every SIMD intrinsic has
been **redefined to build an SMT formula instead of computing numbers**, then ask
cvc5:

> *"Does there exist any input for which these two kernels produce different
> outputs?"*

**UNSAT** ("no such input") = proven equivalent. **SAT** = here's a counterexample.

## 5. The intrinsics trap — the heart of it

We never run the kernels on a CPU. We compile their **unmodified C source** into the
harness, but arrange for every intrinsic name to resolve to *our* code. Three moves.

### (a) Block the real headers

`src/verification_cvc5/salt.hpp` pre-defines the header include-guards **before**
anything else:

```cpp
#define _RISCV_VECTOR_H     // riscv_vector.h's guard
#define __ARM_NEON_H        // arm_neon.h's guard
```

So if a kernel `#include`s `<arm_neon.h>` / `<riscv_vector.h>`, the preprocessor
sees the guard already defined and expands it to **nothing**. The compiler's real
intrinsics never enter the translation unit. (The generator also strips the
`#include` lines, belt-and-suspenders.)

### (b) Provide our own intrinsics — as formula builders

In their place, `salt.hpp` includes our shims (`neon/intrinsics.hpp`,
`rvv/intrinsics.hpp`). The SIMD *types* are not registers — they're arrays of
symbolic bit-vectors:

```cpp
using int8x16_t = NeonVector<8, 16>;   // 16 lanes, each an 8-bit cvc5 Term
using int32x4_t = NeonVector<32, 4>;   //  4 lanes, each a 32-bit Term
```

…and each *intrinsic* emits formula nodes. The integer multiply-accumulate:

```cpp
// neon/intrinsics.hpp — vmlaq_s32 (integer multiply-accumulate, NOT fused)
inline int32x4_t vmlaq_s32(const int32x4_t& acc, const int32x4_t& b, const int32x4_t& c) {
    for (int i = 0; i < 4; i++) {
        Term prod = tm.mkTerm(Kind::BITVECTOR_MULT, {b.getLane(i), c.getLane(i)});
        lanes[i]  = tm.mkTerm(Kind::BITVECTOR_ADD,  {acc.getLane(i), prod});  // a formula node
    }
    return int32x4_t(tm, lanes);
}
```

…and its RVV counterpart builds the *same* mul-then-add:

```cpp
// rvv/intrinsics.hpp — __riscv_vmacc_vx_i32m8
inline vint32m8_t __riscv_vmacc_vx_i32m8(const vint32m8_t& vd, int32_t rs1,
                                          const vint32m8_t& vs2, size_t vl) {
    for (size_t i = 0; i < vl; i++) {
        Term prod = fold_bvmul(tm, rs1_bv, vs2.getElement(i));
        r.push_back(fold_bvadd(tm, vd.getElement(i), prod));
    }
    return RVVVector(tm, 32, r);
}
```

Loads/stores read/write symbolic bytes; `__riscv_vsetvl_e8m2(batch)` returns a
*concrete* `vl` from the target `VLEN`; `vnclip` is encoded as a rounding-shift plus
a saturating-clip ITE chain. **Each shim is the exact spec of one instruction** —
including the rounding/saturation that the translation rules warned about.

### (c) Inline both kernels, verbatim, in separate namespaces

The generator drops the two bodies in untouched, each behind its own namespace:

```cpp
namespace neon_kernel { /* exact text of kernels/source/qs8-vadd.c */ }
namespace rvv_kernel  { /* exact text of kernels/target/qs8-vadd.c */ }
```

The kernel code is **unchanged** — same loops, same intrinsic *names*. But the names
now resolve to our Term-builders, so "calling" a kernel doesn't compute a result: it
**traces the kernel's entire dataflow into one giant SMT expression**.

> **That is the trap.** The kernel believes it is crunching `int8`s. It is actually
> *authoring a formula* describing what it would compute for a fully symbolic input.
> We get its exact semantics for free, straight from its own source — no
> hand-translation, no model, no trust.

## 6. Building the harness (`engine/emit.py`)

`frontend.py` parses just the *signature* of `test_neon`/`test_rvv` via libclang
(bodies skipped, so the intrinsic types never need to parse) and tags each param:

| qs8-vadd param | type | role |
|---|---|---|
| `batch`   | `size_t` | **bound** — the sweep variable |
| `input_a` / `input_b` | `const int8_t*` | **inputs** (shared) |
| `output`  | `int8_t*` | **output** (split neon/rvv) |
| `params`  | `const struct …_params*` | **params** |

A *fixture* picks the memory shape — `qs8-vadd` matches the plain **elementwise**
fixture (one bound, flat buffers). `emit.py` then emits one `.cpp`: buffer setup,
the two namespaces, a `verify()` (one batch size), and `main()` (the sweep).

## 7. The symbolic substrate (buffers)

Each buffer is a `SymbolicBuffer` — byte-addressed Terms, **lazily minted** (a byte
becomes a fresh `BV8` constant the first time it's touched), over-allocated to
`batch+16`. `bind(ptr)` ties it to the real C array address so the inlined kernel's
`vld1_s8(input_a)` resolves via `findBuffer(input_a)`.

- **Inputs are SHARED** — both kernels read the *same* symbolic bytes (same input to
  both sides is the premise of the question).
- **Outputs are SPLIT** — `output_neon` vs `output_rvv`, so we can compare them.

## 8. The equivalence question

The three lines that matter, at the end of `verify()`:

```cpp
neon_kernel::test_neon(batch, input_a, input_b, output_neon, &params);
rvv_kernel ::test_rvv (batch, input_a, input_b, output_rvv,  &params);

Term eq = buffers_equal(ctx.tm, _b_output_neon, _b_output_rvv, batch, sizeof(int8_t), ElementKind::SINT);
ctx.assert_(ctx.lnot_(eq));        // ASSUME the outputs differ
CheckResult r = ctx.check();       // can the solver satisfy that?
```

We assert the **negation** of the goal and let the solver try to satisfy it:

| `check()` | meaning | verdict |
|---|---|---|
| **Unsat** | no input can make them differ | ✅ **VERIFIED** |
| **Sat**   | found inputs that differ → counterexample | ❌ **COUNTEREXAMPLE** |
| **Unknown** | solver hit its time limit | ⏳ **TIMEOUT** (not pass, not fail) |

Integer/mask elements compare with exact `EQUAL`; float elements use FP-aware
equality (`NaN == NaN`, `+0 == -0`). `qs8-vadd` is integer → exact bitwise equality.

## 9. Trace one lane

Take lane `i`. Inputs `a_i`, `b_i` are symbolic `BV8`. Both kernels author a formula
for `output[i]`:

```
NEON:  vsubl(a_i−za) → vmovl→s32 → vmulq·a_mult → vmlaq(+b·b_mult)
       → vrshlq(round-shift) → vqmovn→s16 → vqaddq(+ozp) → vqmovn→s8 → vmax → vmin
RVV:   vwsub(a_i−za) → vsext→s32 → vmul·a_mult → vmacc(+b·b_mult)
       → vssra(round-shift) → vnclip→s16 → vsadd(+ozp) → vnclip→s8 → vmax → vmin
```

Different ops, different order — but they denote the **same function** of
`(a_i, b_i, params)`. The harness asserts `output_neon[i] != output_rvv[i]`; cvc5
proves no assignment satisfies it → equal **for all `a_i`, `b_i`, and all params at
once**. Because this is pure **bit-vector** reasoning it's *bit-exact*, which is why
integer kernels verify fast and need no `--input-range`. (The FP-multiply families —
`gemm`, `dwconv`, `vmulcaddc`, … — need `--input-range=-1,1` to fence off NaN/inf in
`min`/`max`.)

## 10. Params: concrete vs. symbolic

`xnn_qs8_add_minmax_params` is all-integer (zero points, multipliers, `shift`,
`output_min/max`):

- **Concrete (pipeline default).** `emit.py` builds a small table of *boundary*
  param combinations; the sweep runs each. Both kernels read the same concrete
  params.
- **Symbolic (`--symbolic-params` / `--params symbolic`).** Params become
  *constrained symbolic* BVs (validity asserts: `shift∈[0,31]`,
  `output_min ≤ output_max`, per-field ranges); struct-field reads are rewritten to
  symbolic accessors; both kernels read the same symbolic params. One UNSAT then
  covers the **entire valid parameter space**.

## 11. The batch sweep & time budget

`verify(b)` builds a **fresh** context for batch size `b`. `main()` sweeps
`b = 1, 2, 3, …` under **one total wall-clock budget**; each query gets whatever is
left. `end == 0` = unbounded: keep growing the batch until the budget runs out
(→ `PARTIAL`) or a counterexample appears. Increasing sizes matter because bugs hide
at structural seams — the 16-lane loop vs. the scalar tail, or a vector-length
boundary — that only a particular `b` exercises.

> **▶ Run the proof** on the existing RVV kernel (skip the LLM), 2-minute budget:
> ```bash
> salty-rn -k qs8-vadd --skip-translation --verification-timeout 120
> ```

---

## 12. Repair loops (what happens on failure)

Each stage has a feedback loop that re-prompts the model with the failure:

| Stage | Failure | Repair prompt | Budget |
|---|---|---|---|
| Compile | won't build | `build_compile_repair_prompt` (rules-only context + compiler error) | `max_compile_retries` |
| Spike   | `FAIL` on the differential test | `build_execution_repair_prompt` (full docs + mismatch) | shares compile budget |
| Verify  | `COUNTEREXAMPLE` | `build_verification_repair_prompt` (the failing input/outputs) | `max_verification_retries` |

A `COUNTEREXAMPLE` from cvc5 is the gold signal: a *specific* `(input_a, input_b,
params)` and the differing element, handed back to the model to fix the lowering.

---

## 13. How you actually run it

With the venv active, `salty-rn` / `salty-compile` are on your `PATH` (and run from
anywhere — paths are anchored to the repo). The `python -m …` tools run from the
repo root.

**The whole flow** (translate → Spike → verify) for one kernel:

```bash
salty-rn -k qs8-vadd                       # by name → kernels/source/qs8-vadd.c
salty-rn -f kernels/source/qs8-vadd.c      # or by file
salty-rn -b                                # every kernel in kernels/source/
# --verification-timeout S : TOTAL wall-clock budget for the sweep (default 600)
# --verify-batch N         : pin a single batch size
# --input-range=-1,1       : finite F32 band (FP-multiply families only)
# --model / --temperature / --thinking : translation LLM knobs
# --dry-run                : assemble the prompt, no LLM call
```

**Verify only** — skip the LLM, reuse `kernels/target/qs8-vadd.c`, 2-minute budget:

```bash
salty-rn -k qs8-vadd --skip-translation --verification-timeout 120
# --skip-spike : also bypass the Spike gate (Spike auto-skips if CHIPYARD_PATH unset)
```

**Compile + Spike only** (no translation, no proof):

```bash
salty-compile qs8-vadd                     # build + run on Spike
salty-compile qs8-vadd --build-only        # build only
```

**Standalone verifier** (generate + compile + run + verdict for any NEON/RVV pair):

```bash
python -m src.workflow.verification.orchestrator \
    --neon kernels/source/qs8-vadd.c --rvv kernels/target/qs8-vadd.c \
    --vlen 256 --timeout 60
# --symbolic-params : prove over ALL valid params
# --max-batch N     : cap the sweep (0 = unbounded, bounded only by --timeout)
```

**Emit the harness only** (debug the engine), or **run the parity/regression sweep**:

```bash
python -m src.workflow.verification.engine.generate \
    --neon kernels/source/qs8-vadd.c --rvv kernels/target/qs8-vadd.c --name qs8-vadd
# → build/verification_cvc5/harnesses/verify_qs8-vadd_gen.cpp

python -m src.workflow.verification.engine.parity_sweep    # all supported kernels
```

---

## 14. Verdict glossary

| Verdict | Meaning |
|---|---|
| `ALL_PASSED`        | every swept batch verified (UNSAT) |
| `PARTIAL`           | verified up to some batch, then ran out of budget |
| `COUNTEREXAMPLE`    | solver found inputs where the outputs differ |
| `TIMEOUT`           | a query returned Unknown within its budget |
| `MISSING_INTRINSIC` | the harness used an intrinsic with no shim |
| `COMPILE_ERROR`     | harness didn't compile for another reason |
| `UNSUPPORTED`       | no fixture matches this kernel's shape yet |
| `EMPTY_RANGE`       | alignment skipped the whole requested range |
| `CRASH`             | the harness process died unexpectedly |

---

## 15. What it proves (and what it doesn't)

**Proves.** For every input of the swept sizes — and, in symbolic-param mode, every
*valid* param — the RVV kernel writes byte-for-byte the same output as the NEON
kernel, at the chosen `VLEN`. Bit-exact for integer kernels; FP-aware-exact (NaN/±0
normalized) for float.

**Doesn't.** Sizes beyond the swept range (it's *bounded*), `VLEN`s other than the
one passed, or inputs outside `--input-range` when used. This is translation
**validation** of *this specific pair* — strong, machine-checked evidence for the
kernels you ran it on, not a once-and-for-all proof of the translator.

---

### TL;DR

> **Act I:** prep a self-contained NEON ukernel into `kernels/source/` as
> `test_neon`, and an LLM (steered by the translation rules + intrinsic-semantics
> tools) rewrites it into one `vl`-driven RVV kernel, `test_rvv`. Spike differential-
> tests it against XNNPACK's scalar reference as a fast sanity gate.
> **Act II:** pre-define the NEON/RVV header guards so the real intrinsics vanish,
> swap in shims that turn each intrinsic into an SMT formula, inline both kernels'
> untouched source so "running" them traces their semantics into bit-vector
> expressions over shared symbolic inputs, then ask cvc5 whether the two outputs can
> ever differ. **UNSAT = proven equivalent.** Everything else is plumbing around
> those two ideas.
