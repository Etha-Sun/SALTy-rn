Translate AArch64 NEON intrinsic code into semantically equivalent RVV 1.0 C using only intrinsics from `<riscv_vector.h>`.

**Goal: Arm-correct mode.** The RVV output must produce the exact same result bits as the NEON source for every input. Do not accept approximations or behavioral differences.

**Target:** Saturn — RVV 1.0, ELEN=64, VLEN=256.

**Frozen AArch64 FP environment:** RMode=RNE, FZ=0, FZ16=0, DN=0, AH=0. RVV defaults (frm=RNE, subnormals preserved) match this profile.

Requirements:
1. **Function signature and naming:** Keep the exact function signature and parameter order from the selected source variant. Rename only the function suffix from `__neon...` to `__rvv...`.
2. **Consolidate equivalent NEON variants:** If the source contains multiple ukernel variants of the same algorithm, emit exactly ONE consolidated RVV ukernel. Consolidate variants that differ only in NEON blocking, manual-unroll factor, or accumulator count, such as `_u8`/`_u16`/`_u32` or `_acc2`/`_acc4`. Use the highest-numbered variant as the canonical RVV entry point, preserving its signature and name structure except for the `__neon` → `__rvv` rename. Do not emit separate RVV functions or wrappers for the smaller variants.
3. **Shared helpers:** Translate shared static helpers exactly once. Helpers such as `xnn_setexp_*`, `xnn_qd_round_*`, polynomial approximation helpers, clamp helpers, conversion helpers, and other shared utilities must not be duplicated per source variant. Keep helpers as helpers; do not inline all helper logic into the ukernel merely because variants were consolidated.
4. **RVV loop structure:** Replace NEON fixed-width loops, manual unroll loops, and separate scalar/vector tail paths with a single RVV VLA stripmine loop. Each iteration must call `vsetvl`/`__riscv_vsetvl_*` using the remaining element count, process exactly `vl` elements, advance all input/output pointers by `vl`, and decrement the remaining count by `vl`. Do not preserve NEON loop widths such as 8, 16, or 32 elements; RVV's dynamic `vl` handles both full chunks and tails.
5. **Correctness for consolidated variants:** The single RVV ukernel must produce the same per-element result as every original NEON variant for every batch size. Before finalizing, mentally verify batches smaller than the smallest NEON unroll, equal to a NEON tail case, equal to the largest NEON unroll, larger than and divisible by the largest unroll, and larger than but not divisible by any original unroll.
6. Choose LMUL so the widest type in the kernel stays within LMUL=8. Keep the SEW/LMUL ratio constant across width stages (e.g., e8m2 → e16m4 → e32m8).
7. Preserve exact operation semantics. Follow the attached translation rules for correctness hazards (fused vs non-fused FMA, rounding modes, NaN fixups, conversions, estimates).
8. Use only legal explicit (non-overloaded) RVV intrinsics. Do not invent instructions.
9. If an exact lowering is unclear, emit the safest legal code and add a `TODO` comment.
10. Return only C code. No markdown, no explanation outside the code.

Refer to the attached translation rules, NEON/RVV background references, and annotated examples for detailed guidance.

Parameter struct:
{parameter}

NEON Code:
{source_code}
