# NEON → RVV Translation Rules

These are guidelines informed by common patterns seen in NEON-to-RVV translations. They are not rigid rules — use judgment based on the specific code and target hardware.

**Arm-correct mode** means the RVV translation must produce the same output bits as the AArch64 NEON source for every input in the stated domain. Where this document says "in Arm-correct mode," it means: do not accept an approximation or behavioral difference — preserve exact Arm semantics.

- Prefer explicit (non-overloaded) RVV intrinsics in generated translations. Overloaded forms are convenient, but explicit spellings are easier to audit and are available more consistently across intrinsic families.

## 1. Loop Structure

1. **Fixed-width → VLA loop, when translating algorithms**: When converting NEON loop code to native RVV, replace the fixed 128-bit loop plus tail handling with a single `vsetvl`-based stripmine loop. The final iteration naturally uses a smaller `vl`; no separate tail code is needed.

2. **NEON tail handling recognition**: A loop that tests leftover element count with bitwise masks (`if (batch & (4 * sizeof(type)))`) and uses `vext` only to pack or slide the final partial vector is fixed-width tail handling. In RVV this usually collapses into the VLA loop. Keep `vext` semantics only if it encodes a real sliding-window or alignment operation.

3. **No separate 64-bit vs 128-bit forms in native RVV code**: RVV does not need separate `vadd` vs `vaddq` APIs; vector length comes from `vl`, SEW, and LMUL. If you are building a NEON-compatibility wrapper rather than rewriting the algorithm, fixed lane counts may still be intentional.

## 2. Understanding NEON Semantics

4. **Lane-wise default**: Treat most NEON arithmetic and logical intrinsics as lane-wise. Re-check semantics when the name indicates pairwise/reduction, zip/unzip/transpose/reverse/table lookup, lane extraction/insertion, structured load/store, or width-changing behavior.

5. **Distinguish `q` meanings**: In NEON naming, `q` after the op name means 128-bit vector width (`vaddq`). `q` in the op prefix means saturating (`vqadd`). These are unrelated.

6. **`_high` suffixed intrinsics**: These are AArch64 convenience forms. Some mean "use the upper half of a 128-bit source" (e.g., `vsubl_high_s8` ≈ `vget_high` + base op). Others mean "write into the upper half of a destination" (e.g., `vqmovn_high_s32` ≈ base narrow + `vcombine`).

7. **Immediates and lane indices**: If a lane index or shift count appears in a NEON intrinsic, treat it as a compile-time constant unless the family explicitly uses a vector of counts (e.g., `vshl` with a signed shift vector).

8. **Floating-point `vmla` is NOT fused FMA**: NEON floating `vmla`/`vmls` perform multiply then add/subtract with two roundings. Only `vfma`/`vfms` are truly fused. Integer `vmla_*` does not have this FP-rounding caveat.

9. **Magic-bias conversion pattern**: The pattern `vaddq_f32(val, 12582912.0f)` followed by `vreinterpretq_s32_f32` is a common IEEE-754-based float-to-int round-to-nearest idiom. Recognize the whole sequence as a conversion trick, not ordinary FP math.

10. **`vqrdmulh` is fixed-point**: `vqrdmulhq_s16(a, b)` computes a rounded high-half fixed-point product per lane. This is not a regular integer multiply.

## 3. Data Type and Width Mapping

11. **Comparisons produce masks**: NEON compare results are usually full-width all-ones/all-zeros per lane. RVV compare results are 1-bit-per-element masks. The logical truth value is the same, but the representation is different.

12. **Widening/narrowing is semantic**: Keep track of lane width changes explicitly. Widening and narrowing are part of the semantics, not an optimization detail.

13. **Reinterpret = no-op bitcast**: NEON `vreinterpret` → RVV `__riscv_vreinterpret`. Both leave bits unchanged. Conversions and reinterprets are fundamentally different operations.

14. **Mixed-width operations**: Keep the SEW/LMUL ratio constant so all stages see the same element count. E.g., 8-bit at LMUL=1 pairs with 32-bit at LMUL=4. Use the matching `__riscv_vsetvl_*` for each width stage.

## 4. Instruction Mapping

### 4.1 Memory

15. **Structured whole-vector loads/stores**: NEON `vld2`/`vld3`/`vld4` and `vst2`/`vst3`/`vst4` map naturally to RVV `vlseg2`/`vlseg3`/`vlseg4` and `vsseg2`/`vsseg3`/`vsseg4`. Use `__riscv_vget`/`__riscv_vset` to access tuple fields.

16. **Lane and duplicate memory forms are scalar-plus-lane operations**: `vld1_lane`/`vst1_lane` and `vldN_lane`/`vstN_lane` are not whole-vector loads/stores; translate them as scalar load/store plus lane insert/extract. `vld1_dup`/`vldN_dup` are scalar load plus broadcast, one destination field at a time.

### 4.2 Arithmetic

17. **Saturating arithmetic**: NEON `vqadd` → RVV `vsadd`/`vsaddu`. NEON `vqsub` → RVV `vssub`/`vssubu`. Signedness is explicit in the RVV intrinsic name.

18. **Halving add**: NEON `vhadd` / `vrhadd` map to `vaadd` or `vaaddu` with the appropriate `vxrm` (`__RISCV_VXRM_RDN` for truncating behavior, `__RISCV_VXRM_RNU` for round-to-nearest-up behavior).

19. **Rounding-sensitive integer ops must choose `vxrm` explicitly**: If the RVV lowering uses `vaadd`, `vnclip`, `vnclipu`, `vsmul`, `vssra`, `vssrl`, or other rounding/narrowing helpers, do not rely on ambient rounding state. Pick the `vxrm` that matches the NEON operation.

20. **Rounding shift right**: NEON `vrshr[q]_n_<type>(a, n)` computes `(a + (1 << (n-1))) >> n` with rounding. Map signed to `__riscv_vssra_vx_<type>(a, n, __RISCV_VXRM_RNU, vl)` and unsigned to `__riscv_vssrl_vx_<type>(a, n, __RISCV_VXRM_RNU, vl)`. The `vxrm=RNU` mode adds bit `[n-1]` of the original value after shifting, which is equivalent to NEON's rounding behavior.

21. **Rounding shift right and accumulate**: NEON `vrsra[q]_n_<type>(acc, a, n)` computes `acc + vrshr(a, n)`. Expand as two steps: rounding shift with `vssra`/`vssrl` using `__RISCV_VXRM_RNU`, then `vadd` to accumulate.

22. **Rounding narrowing shift right**: NEON `vrshrn_n_<type>(a, n)` rounds the shift then narrows to half width **without saturating**. Do **not** use `vnclip`/`vnclipu` — those saturate. Instead, expand as two steps: rounding shift at the wide type with `vssra`/`vssrl` using `__RISCV_VXRM_RNU`, then truncating narrow with `vnsrl` shift 0 (same pattern as `vmovn` in rule 23). For the saturating variant `vqrshrn`, use `vnclip`/`vnclipu` with `__RISCV_VXRM_RNU` instead — that combines rounding, shift, narrow, and saturation in one step.

23. **Widening/narrowing moves**: NEON `vmovl` (widen) → RVV `vzext`/`vsext` or widening arithmetic. NEON `vmovn` (truncating narrow) → RVV `vnsrl`/`vnsra` with shift 0.

24. **Floating-point FMA mapping**: Keep the fused and non-fused families distinct.

    - NEON `vmla[q]_f32/f64(a, b, c)` = `a + b*c` with two roundings. In Arm-correct mode, lower it as:

      ```c
      temp = __riscv_vfmul_vv_f32m1(b, c, vl);
      res  = __riscv_vfadd_vv_f32m1(a, temp, vl);
      ```

      Do **not** replace it with `__riscv_vfmacc_vv_f32m1(a, b, c, vl)`, because that is fused.

    - NEON `vmls[q]_f32/f64(a, b, c)` = `a - b*c` with two roundings. In Arm-correct mode, lower it as:

      ```c
      temp = __riscv_vfmul_vv_f32m1(b, c, vl);
      res  = __riscv_vfsub_vv_f32m1(a, temp, vl);
      ```

    - NEON `vfma[q]_f32/f64(a, b, c)` = `a + b*c` (fused) and maps naturally to `__riscv_vfmacc_vv_f32m1(a, b, c, vl)`.

    - NEON `vfms[q]_f32/f64(a, b, c)` = `a - b*c` (fused) and maps to `__riscv_vfnmsac_vv_f32m1(a, b, c, vl)`, not `vfmsac`. `vfmsac` computes `b*c - a`.

    - Integer `vmla`/`vmlaq` maps naturally to `vmacc`; the fused-vs-non-fused issue is specific to floating point.

25. **Integer multiply**: NEON supports many integer multiply widths directly. RVV `vmul` supports all SEW widths. Widening multiply is `vwmul`/`vwmulu`/`vwmulsu`.

26. **Doubling saturating multiply high**: NEON `vqdmulh`/`vqrdmulh` should be expanded as widening multiply → double (`vsll` by 1 in the widened type) → `vnclip` with the appropriate `vxrm` (`RDN` for `vqdmulh`, `RNU` for `vqrdmulh`). Do **not** use `vsmul` as a substitute — `vsmul` computes `sat((a*b + round) >> (SEW-1))` without the 2× doubling factor that `vqdmulh`/`vqrdmulh` require, so the results differ.

27. **Absolute difference**: No single `vabd` instruction in RVV. For unsigned same-width cases, `vmax(a,b) - vmin(a,b)` is a good match. Signed cases usually need widen → subtract → absolute value, with narrowing only if the destination width requires it.

28. **Popcount**: NEON `vcnt` works per **byte only**. RVV has no direct vector popcount; wider popcounts require additional horizontal adds on both architectures.

### 4.2b Bit Manipulation

29. **Shift-and-insert (vsli/vsri)**: NEON `vsli(a, b, n)` keeps the lower `n` bits of `a` and fills the upper bits from `b` shifted left by `n`. `vsri` is the mirror. RVV has no single instruction — expand as mask + shift + OR: compute a bitmask, AND each input with its portion of the mask, then OR the results together.

30. **Bitwise test (vtst)**: NEON `vtst(a, b)` returns all-ones per lane where `(a & b) != 0`. In RVV: `vand` the two vectors, compare against zero with `vmsgtu(..., 0)`, then materialize the boolean mask as all-ones/all-zeros via `vmerge`.

31. **Count leading sign bits (vcls)**: NEON `vcls` returns the number of consecutive bits matching the sign bit, minus one. RVV has no direct equivalent. One approach is to XOR with an arithmetic-right-shifted copy (`vsra(a, SEW-1)`) to flip sign-matching bits to zero, then apply `vclz` on the XOR result and subtract 1.

### 4.3 Comparison and Selection

32. **Bitwise select → merge only for compare-style masks**: NEON `vbsl(mask, a, b)` maps directly to RVV `vmerge_vvm(b, a, mask, vl)` only when `mask` is effectively all-zero/all-one per lane, such as a compare result. Arbitrary `vbsl` bit-pattern masks need ordinary bitwise logic. Note operand order: RVV selects `vs1` (second vector arg) when mask=1, `vs2` (first vector arg) when mask=0.

33. **Mask operations for control flow**: NEON often uses compare → bitwise-select. RVV uses compare → masked operations or merge.

34. **Materializing NEON-style masks from RVV bool masks**: RVV comparisons produce 1-bit boolean masks (`vbool8_t`, etc.), but NEON comparisons return full-width all-ones/all-zeros per lane. To produce NEON-compatible mask vectors from an RVV comparison, merge between zero and all-ones: `__riscv_vmerge_vvm(zeros, all_ones, bool_mask, vl)`.

35. **Absolute-value comparisons (vcage/vcagt)**: NEON `vcage`/`vcagt` compare the absolute values of two FP vectors. In RVV, take `vfabs` of both inputs first, then apply the standard FP comparison (`vmfge`/`vmfgt`), then materialize the mask.

### 4.4 Permutation and Shuffle

36. **Broadcast**: NEON `vdupq_n_f32(x)` → RVV `vfmv_v_f_f32m1(x, vl)`. NEON `vdup_lane` → RVV `vrgather_vx` with a constant lane index.

37. **Split/combine helpers are first-class translation glue**: `vcombine(low, high)` maps naturally to `vslideup(low, high, lanes/2)`. `vget_high(v)` maps to `vslidedown(v, lanes/2)`. `vget_low(v)` is usually a no-op on the low lanes or an LMUL truncation.

38. **Table lookup is byte-oriented**: NEON `vtbl` is a byte-table lookup. Translate it with RVV byte vectors (`SEW=8`) and `vrgather_vv`, making the table length explicit. Out-of-range indices return 0 for `vtbl`; `vtbx` instead preserves the destination byte for out-of-range indices.

39. **`vext` as slidedown + slideup**: NEON `vext(a, b, n)` concatenates two vectors and extracts by element offset. A common RVV pattern is `vslidedown(a, n)` then `vslideup(result, b, len - n)`. This works when the offset is an integer number of elements. For byte-granularity offsets at non-byte SEW, translate at `SEW=8`.

40. **`vzip` is interleave, not concatenate**: `vzip(a, b)` returns two outputs with alternating lanes from `a` and `b`; AArch64 `vzip1`/`vzip2` are just the low/high outputs. Common RVV lowerings use widen/pack bit tricks or another verified two-output permutation pattern.

41. **`vuzp` is de-interleave**: `vuzp(a, b)` collects even lanes into one result and odd lanes into the other; `vuzp1`/`vuzp2` are the individual outputs. A common RVV lowering is concatenate → reinterpret as wider elements → narrow/extract the desired sublanes.

42. **`vtrn` swaps adjacent lane groups**: `vtrn(a, b)` is a two-output transpose of adjacent 1-lane groups at the current element width; `vtrn1`/`vtrn2` are the individual outputs. A common RVV lowering uses reinterpret-to-wider-type plus shifts/or to splice low and high subelements.

43. **Pairwise ops**: No direct RVV equivalents. Use even/odd extraction, widening plus narrowing, or reduction-style patterns as appropriate. A plain `vslidedown(..., 1) + add` produces overlapping sums and is not equivalent to NEON adjacent-pair operations. The common pattern for `vpadd`/`vpmax`/`vpmin`/`vpaddl`/`vpadal` is: form the adjacent pairs, apply the pairwise op against a `vslidedown(..., 1)` copy, then keep only the even-lane results with a fixed even-lane mask or equivalent compress/narrow step before any widening accumulate.

44. **Reverse (`vrev`)**: NEON `vrev64`, `vrev32`, `vrev16` reverse sub-elements within each chunk. In RVV, use `vrgather_vv` with a precomputed reversed index vector (e.g., generate indices with `vid` then subtract from the chunk boundary).

45. **Lane extraction and insertion**: RVV has no direct per-lane access. Extract a lane by sliding the target element to position 0 (`vslidedown(v, lane_idx)`) then moving to scalar (`vmv_x_s`). Insert a lane by sliding the scalar into position (`vslide1up` / merge with a single-element mask).

### 4.5 Widening and Narrowing Mechanics

46. **Widening via LMUL doubling**: RVV widening operations produce results at double the LMUL (e.g., `vwadd` on `m1` inputs yields `m2` output). If the result must stay at `m1`, truncate with `vlmul_trunc` after the widening operation. This is the standard pattern for NEON long (`_l`) operations.

47. **Narrowing via narrowing shifts**: RVV narrowing instructions (`vnsrl`, `vnsra`, `vnclip`, `vnclipu`) take a wider input and produce a half-width result. For NEON's truncating narrow (`vmovn`), use `vnsrl` with a shift of 0. For saturating narrow (`vqmovn`), use `vnclip`/`vnclipu`.

48. **Signed-to-unsigned saturating narrow (vqmovun)**: NEON `vqmovun` narrows a signed wider type to an unsigned narrower type, clamping negatives to 0. In RVV, first clamp to non-negative with `vmax(a, 0)`, reinterpret as unsigned, then apply `vnclipu` for the saturating narrow.

49. **Extracting high halves**: NEON `_high` suffixed intrinsics operate on the upper half of a 128-bit vector. In RVV, extract the high half with `vslidedown(v, element_count / 2)` before applying the operation.

### 4.6 Variable-Width Shifts

50. **NEON signed shift vectors encode direction**: NEON `vshl(a, b)` uses a signed shift vector where positive values shift left and negative values shift right. RVV has separate `vsll` (left) and `vsra`/`vsrl` (right) instructions. Translate by splitting on sign: compare the shift vector against 0, compute both left and right shifts, then merge based on the sign mask. Preserve NEON's defined shift-count domain; if counts may be out of range for the element width, review explicitly rather than assuming RVV's native behavior matches.

51. **Widening shift left (vshll)**: NEON `vshll` widens each lane then shifts left. In RVV, this is sign/zero-extend (`vsext_vf2`/`vzext_vf2`) followed by `vlmul_trunc` to bring the result back to the expected LMUL, then `vsll`. The extend and shift are separate steps.

## 5. Policy and Tail Handling

52. **Agnostic tails are dead data**: Tail-agnostic and mask-agnostic (no suffix or `_m`) are the default and most performant. Only use undisturbed (`_tu`, `_mu`, `_tum`, `_tumu`) when later code reads those tail or masked-off elements.

53. **Undisturbed needs a passthrough**: Undisturbed policy variants take an extra `vd` argument as the first parameter — the prior value that inactive/tail elements will retain.

### 5.1 Scalar Operand Forms

54. **`_n` suffix → `_vx` or `_vf` in RVV**: NEON intrinsics with `_n` take a scalar operand (e.g., `vmulq_n_f32`, `vaddq_n_s32`). RVV expresses this with the `_vx` (integer scalar) or `_vf` (float scalar) suffix. The scalar is passed directly as a C value, not broadcast into a vector first.

55. **`_lane` suffix → extract scalar then use `_vx`/`_vf`**: NEON `vmul_lane` takes a scalar from a specific lane of another vector. In RVV there is no lane-operand form — extract the lane to a scalar first (`vslidedown` + `vmv_x_s` or `vfmv_f_s`), then use the scalar-operand intrinsic.

## 6. Floating-Point Translation Notes

- **Translations assume the AArch64 FP profile**: `RMode = RNE`, `FZ = 0`, `FZ16 = 0`, `DN = 0`, and `AH = 0`.
- **Preserve the frozen AArch64 semantics directly**: Under `RMode = RNE`, arithmetic follows round-to-nearest-even. With `FZ = 0` and `FZ16 = 0`, subnormals are preserved rather than flushed. With `DN = 0`, ordinary NaN behavior is preserved rather than forcing default NaNs. With `AH = 0`, negative zero compares less than positive zero in min/max operations.
- **Non-fused vs fused multiply-add must be preserved**: `vmla`/`vmls` are not fused; RVV FMA is fused. In Arm-correct mode, use separate multiply then add/subtract for `vmla`/`vmls`. `vfma`/`vfms` may map to RVV fused FMA.
- **Native divide and sqrt map naturally**: AArch64 `vdiv` / `vsqrt` can map to RVV `vfdiv` / `vfsqrt`. Both sides must still preserve the same frozen FP semantics for rounding, subnormals, and NaN handling.
- **Estimate instructions are not interchangeable**: `vrecpe`, `vrsqrte`, `vrecps`, and `vrsqrts` should not be replaced by `vfrec7` / `vfrsqrt7` or another estimate family in Arm-correct mode unless you emulate the Arm algorithm exactly. Otherwise, mark them unsupported.
- **Preserve reduction structure, not just "orderedness"**: Match the actual Arm reduction tree. Use `vfredosum` only when the source really is a left-to-right fold over the same partial sums. If the source uses a pairwise tree such as `vpadd`, `FADDP`, or `vaddvq_f32`, keep that pairwise structure explicitly with RVV adds; `vfredosum` is not equivalent to a pairwise tree. `vfredusum` is only acceptable when the source semantics do not depend on accumulation order.
- **Min/max clamping maps directly — no NaN save/restore needed**: NEON `vmaxq_f32` / `vminq_f32` (which map to AArch64 `FMAXNM` / `FMINNM`) and RVV `vfmax` / `vfmin` both follow NaN-suppressing semantics: if one operand is NaN and the other is a number, the non-NaN operand is returned. This means `vfmax(NaN, lo) = lo` and `vfmin(NaN, hi) = hi` on both architectures. For the common clamping pattern `vmin(vmax(x, lo), hi)`, the RVV translation is simply `vfmax` then `vfmin` with no NaN detection, save, or restore. Adding a NaN save/restore (detect NaN with `vmfne(x,x)`, clamp, then merge NaN back) **breaks** equivalence with NEON — it causes RVV to propagate NaN through the clamp while NEON suppresses it to `lo`.
- **Min/max families — full scoping**: Keep `vmin` / `vmax` distinct from `vminnm` / `vmaxnm`. `vminnm` / `vmaxnm` map naturally to RVV `vfmin` / `vfmax` (both NaN-suppressing). For the IEEE 754 NaN-propagating `vmin` / `vmax` (AArch64 `FMIN` / `FMAX`), plain `vfmin` / `vfmax` is only exact when the source domain excludes NaNs and FPCR.AH matches. Under the frozen profile (`AH = 0`), negative zero compares less than positive zero on both ARM and RVV, so signed zero does not add a restriction. Compare families (`vceq`, `vcge`, `vcgt`, etc.) do not have signed-zero hazards; review only NaN behavior for those.

- **Conversions need exact Arm rounding behavior**: Match the specific Arm conversion variant, not just the source and destination types. For `f32 -> i32/u32`, the common AArch64 mappings are:

  | NEON intrinsic family | Arm instruction | Rounding | RVV pattern |
  |---|---|---|---|
  | `vcvt[_q]_s32_f32` | `FCVTZS` | RTZ | `__riscv_vfcvt_rtz_x_f_v_i32m1(src, vl)` |
  | `vcvt[_q]_u32_f32` | `FCVTZU` | RTZ | `__riscv_vfcvt_rtz_xu_f_v_u32m1(src, vl)` |
  | `vcvtn[_q]_s32_f32` | `FCVTNS` | RNE | `__riscv_vfcvt_x_f_v_i32m1_rm(src, __RISCV_FRM_RNE, vl)` |
  | `vcvtn[_q]_u32_f32` | `FCVTNU` | RNE | `__riscv_vfcvt_xu_f_v_u32m1_rm(src, __RISCV_FRM_RNE, vl)` |
  | `vcvtm[_q]_s32_f32` | `FCVTMS` | RDN | `__riscv_vfcvt_x_f_v_i32m1_rm(src, __RISCV_FRM_RDN, vl)` |
  | `vcvtm[_q]_u32_f32` | `FCVTMU` | RDN | `__riscv_vfcvt_xu_f_v_u32m1_rm(src, __RISCV_FRM_RDN, vl)` |
  | `vcvtp[_q]_s32_f32` | `FCVTPS` | RUP | `__riscv_vfcvt_x_f_v_i32m1_rm(src, __RISCV_FRM_RUP, vl)` |
  | `vcvtp[_q]_u32_f32` | `FCVTPU` | RUP | `__riscv_vfcvt_xu_f_v_u32m1_rm(src, __RISCV_FRM_RUP, vl)` |
  | `vcvta[_q]_s32_f32` | `FCVTAS` | ties-away | `__riscv_vfcvt_x_f_v_i32m1_rm(src, __RISCV_FRM_RMM, vl)` |
  | `vcvta[_q]_u32_f32` | `FCVTAU` | ties-away | `__riscv_vfcvt_xu_f_v_u32m1_rm(src, __RISCV_FRM_RMM, vl)` |

  For the ordinary AArch64 `FCVT*` float-to-int families, do not use a bare RVV `vfcvt*` and stop there: Arm returns integer `0` on NaN inputs, while RVV clips NaN as an invalid conversion. Preserve the Arm result by applying an unconditional NaN fixup around the RVV conversion: detect NaNs with `vmfne(src, src)`, perform the matching `vfcvt*`, then merge integer zero into those NaN lanes. For example:

  ```c
  vbool32_t nan_mask = __riscv_vmfne_vv_f32m1_b32(src, src, vl);
  vint32m1_t result = __riscv_vfcvt_rtz_x_f_v_i32m1(src, vl);
  result = __riscv_vmerge_vxm_i32m1(result, 0, nan_mask, vl);
  ```

  Only the middle RVV conversion changes across rounding variants, signedness, and width relationship. Use the same-width `vfcvt*` family when source and destination FP/int widths match, the widening `vfwcvt*` family when the integer destination is wider than the FP source (for example `f16 -> i32` or `f32 -> i64`), and the narrowing `vfncvt*` family when the integer destination is narrower than the FP source (for example `f64 -> i32`). The same lane-wise NaN fixup applies in all three cases because the Arm vector forms also convert each lane independently.

  The signed and unsigned `vcvt_n_*` fixed-point families (`FCVTZS`/`FCVTZU` with `#n`) have the same NaN mismatch and the same fixup resolves it. Arm `FPToFixed` returns integer `0` for NaN regardless of `n`; the RVV expansion (scale then convert) produces the destination-type signed or unsigned saturation endpoint for NaN lanes before the zero-merge fixup is applied. The fixup detects NaN on `src` before the scale step. Use an exact power-of-two scale such as `ldexpf(1.0f, n)` / `ldexp(1.0, n)` — do not use `(float)(1 << n)` which is UB for large `n`. No other rounding-variant fixed-point forms (`vcvtn_n_*`, `vcvtm_n_*`, `vcvtp_n_*`, `vcvta_n_*`) exist in AArch64 AdvSIMD, so this applies only to the RTZ fixed-point families.

  Int-to-float and FP widen/narrow conversions follow the frozen Arm FP environment, so under the current `RNE` profile the ordinary RVV forms usually match as long as the kernel does not change `frm`. Magic-bias rewrites are valid only if they produce the same Arm result bits.
- **Algorithmic rewrites are not automatically ISA translations**: If the RVV code clamps inputs, flushes outputs, changes a polynomial structure, or changes a reduction strategy, that is an algorithmic change, not just an instruction substitution. Do not assume it is a correct translation without verifying the outputs still match the Arm source.
- **Absolute value and negate remain straightforward**: NEON `vabs`/`vneg` for floats → RVV `__riscv_vfabs`/`__riscv_vfneg`. Do not replace with manual bit tricks.
- **Absolute difference remains an expansion**: NEON `vabd[q]_f32` → expand as `__riscv_vfabs(__riscv_vfsub(a, b))`.
- **Multiply by scalar keeps the scalar form**: NEON `vmul[q]_n_f32(v, s)` → RVV `__riscv_vfmul_vf_f32m1(v, s, vl)` (the `_vf` suffix is vector-scalar form).

## 7. Algorithmic-Level Patterns

These patterns describe structural differences that go beyond single-instruction mappings. They emerge from comparing full NEON and RVV implementations of the same algorithms. For example, a NEON loop that processes 16 `f32` values per iteration with four `float32x4_t` registers plus separate 8/4/scalar cleanup loops can often become one `vsetvl`-driven RVV loop with a larger LMUL and no distinct tail path.

### 7.1 LMUL Replaces Manual Loop Unrolling

NEON code often manually unrolls loops to process multiple 128-bit registers per iteration (e.g., 4 registers × 4 lanes = 16 f32 elements), with cascading fallback loops for 8, 4, and scalar remainders. In RVV, a single `vsetvl`-based loop with a higher LMUL (e.g., `m4` or `m8`) can process a comparable number of elements per iteration without unrolling. The NEON multi-register unroll maps conceptually to the RVV LMUL choice — but note that higher LMUL uses more architectural registers and may limit the number of live vectors in flight.

### 7.2 Reductions Replace Manual Horizontal Collapse

NEON code often keeps a vector accumulator in the main loop and then performs a separate horizontal collapse step with `vaddvq`/`vmaxvq` or a manual reduction tree. In RVV, use `vfred*` reductions only if they preserve the required source semantics. Match the actual source reduction tree, not just the fact that it is "ordered": use `vfredosum` only for true left-to-right folds, and keep pairwise reductions such as `vpadd`, `FADDP`, or `vaddvq_f32` as explicit pairwise RVV add trees. Reject `vfredusum` whenever reassociation can change the result. If later vector code still needs the scalar result replicated across lanes, broadcast lane 0 back with `vrgather(..., 0)` or a scalar splat.

### 7.3 Strided Loads and Stores Can Replace Permutation or Channel Gather/Scatter

When NEON code loads data contiguously and then rearranges it with permutation instructions (`vuzp`, `vtrn`, `vzip`, `vext`), consider whether RVV strided memory ops can access the desired lanes directly from memory. `vlse` is especially effective for column-wise access of row-major matrices, subsampling patterns, or reading one channel from interleaved RGB-style data. The same applies on the write side: `vsse` can write one field directly into an interleaved destination without a separate merge step. Not always a win — strided memory can have lower throughput than contiguous loads/stores on some microarchitectures, so this is a judgment call.

### 7.4 Segment Loads/Stores Are the Natural AoS Split/Merge Primitive

When the source layout is interleaved and all fields are needed together, RVV segment memory ops are usually the cleanest translation. `vlseg2/3/4` and `vsseg2/3/4` naturally implement split/merge, channel reorder, and packed image-format kernels that NEON expresses with `vld2/3/4` and `vst2/3/4`. For wider channel counts or grouped handling, the strided segment forms (`vlsseg*` / `vssseg*`) extend the same pattern.

### 7.5 Masked Predicates Replace Compare-Then-Blend

NEON conditional logic typically follows a two-step pattern: compare → produce mask → `vbsl` to blend. RVV can often fold the conditional directly into the operation using masked variants (`_mu`, `_tumu`) when one branch is the old value or another simple masked arithmetic form. For example, NEON's `vbslq_f32(mask, vsubq_f32(v_180, v_a), v_a)` can become a single masked reverse-subtract in RVV: `vfrsub_mu(mask, a, a, 180.0f, vl)`. If both branches require unrelated computations, you still need both computations plus `vmerge`.

### 7.6 Widening Chains Without Half-Splitting

NEON widening operations work on 64-bit inputs and produce 128-bit outputs, so widening a full 128-bit vector often requires splitting it with `vget_low`/`vget_high` and processing each half separately. RVV's LMUL-doubling widening (e.g., `vwcvtu` from `m2` to `m4`) operates on the full vector at once. A NEON chain like `vmovl(vget_low(v))` + `vmovl(vget_high(v))` can collapse into one or more full-width RVV widening steps without half-splitting.

### 7.7 Polynomial Evaluation Structure Is Preserved

Polynomial approximations (Horner's method chains like `((p7*x + p5)*x + p3)*x + p1`) translate directly between NEON and RVV with only intrinsic-name changes. Preserve the source fusion behavior: use RVV fused FMA only for source fused ops such as `vfma`, and keep source non-fused chains as separate multiply and add/subtract steps in Arm-correct mode.

## 8. Operations Without Clean Single-Instruction RVV Mappings

Some NEON operations have no single-instruction RVV equivalent and require multi-step expansions, or are poorly suited to blind mechanical substitution. Flag these for manual review rather than assuming a direct intrinsic replacement exists:

- **Polynomial multiply (`vmul_p8`, `vmull_p8`)**: GF(2) carryless multiply. RVV has no polynomial arithmetic support. Must be emulated with shift-and-XOR loops or scalar fallback.
- **Cross-signed saturating add (`vuqadd`, `vsqadd`)**: Adding an unsigned value to a signed accumulator (or vice versa) with saturation in the destination's signedness. Requires careful range checking
- **Unsigned integer reciprocal estimate (`vrecpe_u32`)**: NEON provides a lookup-table-based unsigned integer reciprocal estimate. RVV's `vfrec7` is floating-point only. This needs a scalar lookup or floating-point round-trip if the source relies on it.
