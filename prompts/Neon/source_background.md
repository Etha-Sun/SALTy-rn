# ARM NEON Intrinsics Reference for Code Translation

## 1. Architecture Overview

NEON is ARM's fixed-width SIMD ISA. Most intrinsics operate **lane-wise**: each lane is processed independently unless the intrinsic explicitly permutes lanes, widens/narrows values, or performs a reduction.

- **AArch32 / ARMv7-A**: 32 `D` registers (64-bit) alias 16 `Q` registers (128-bit). `Qn` is two adjacent `D` registers.
- **AArch64**: 32 `V` registers, each 128-bit. 64-bit operations use the low half. Intrinsic names still use `...q...` to mean the 128-bit form.
- **Lane count** = register width / element width.
- **Prototype types are authoritative**: the intrinsic's C type tells you the true width and lane shape.
- `vget_low`, `vget_high`, `vcombine`, and `vreinterpret` often compile to no instructions because they usually just change the compiler's view of the same bits.

The ideal NEON pattern is:

1. load source data into vectors
2. do as much work as possible while data stays in registers
3. store late

## 2. Intrinsic Naming

Many intrinsics resemble:

```text
v<op>[q]_<type>
v<shape/op>[q]_<type>
```

Memory, reinterpret, conversion, and some scalar forms use special layouts such as `vld...`, `vst...`, `vreinterpret...`, and `vcvt...`.

### 2.1 Common name pieces

| Piece | Meaning | Example |
|---|---|---|
| `v` | NEON / Advanced SIMD intrinsic prefix | `vaddq_u32` |
| `q` after op | 128-bit same-width form | `vaddq_u32` |
| `q` in op prefix | saturating, not vector width | `vqaddq_s16` |
| `l` | long: wider result | `vaddl_u8` |
| `w` | wide: first operand/result wider than second operand | `vaddw_u8` |
| `n` inside op | narrow result | `vqmovn_s32` |
| `h` | halving | `vhadd_u8` |
| `r` | rounding | `vrshrq_n_s32` |
| `d` | doubling | `vqdmulh_s16` |
| `p` | pairwise | `vpadd_u32` |

### 2.2 Common suffix forms

| Suffix | Meaning | Example |
|---|---|---|
| `_n` | scalar operand or immediate-style form | `vmul_n_f32` |
| `_lane` | scalar taken from a lane of another vector | `vmulq_lane_f32` |
| `_laneq` | lane taken from a 128-bit source vector | `vfmaq_laneq_f32` |
| `_high` | operate on or produce the upper half of a 128-bit vector | `vaddl_high_u8` |

**Important**:

- lane indices must be compile-time constants
- immediate shift counts must be compile-time constants
- `_n` does **not** always mean compile-time constant; for many arithmetic intrinsics it means scalar operand, while shift families with `_n` use immediate counts

## 3. Type System

### 3.1 Vector type pattern

Vector types follow:

```text
<base><bits>x<lanes>_t
```

Examples:

- `uint8x16_t` = 16 lanes of unsigned 8-bit integers
- `int16x4_t` = 4 lanes of signed 16-bit integers
- `float32x4_t` = 4 lanes of 32-bit floats

### 3.2 Type suffixes

| Suffix | Meaning |
|---|---|
| `s8`, `s16`, `s32`, `s64` | signed integers |
| `u8`, `u16`, `u32`, `u64` | unsigned integers |
| `f16`, `f32`, `f64` | floating point |
| `p8`, `p16` | polynomial lanes |
| `bf16` | bfloat16 extension type |

### 3.3 Multi-vector types

Multi-vector types follow:

```text
<type>x<count>_t
```

Example:

- `uint8x16x3_t` is a C struct with `.val[0]`, `.val[1]`, `.val[2]`

These are used by:

- structured load/store (`vld2`, `vld3`, `vld4`, `vst2`, `vst3`, `vst4`)
- shuffle families returning two vectors (`vzip`, `vuzp`, `vtrn`)

### 3.4 Practical type notes

- Move and permute operations often only care about lane size.
- Arithmetic, saturation, comparisons, and right shifts care about signedness and data type.

## 4. Memory Access and Initialization

### 4.1 Contiguous and structured memory ops

| Operation | Pattern | Meaning |
|---|---|---|
| Load one vector | `vld1[q]_<type>(ptr)` | contiguous load |
| Store one vector | `vst1[q]_<type>(ptr, vec)` | contiguous store |
| Broadcast load | `vld1[q]_dup_<type>(ptr)` | load one scalar and replicate |
| Load one lane | `vld1[q]_lane_<type>(ptr, vec, lane)` | overwrite one lane |
| Store one lane | `vst1[q]_lane_<type>(ptr, vec, lane)` | store one lane |
| Structured load | `vld{2,3,4}[q]_<type>(ptr)` | de-interleave from memory |
| Structured store | `vst{2,3,4}[q]_<type>(ptr, vecs)` | interleave to memory |

Structured load/store is one of NEON's most important strengths:

- `vld3q_u8` can de-interleave RGB bytes into 3 channel vectors
- `vld2q_s16` can split interleaved stereo samples into left/right vectors

### 4.2 Vector construction and lane access

| Operation | Pattern | Meaning |
|---|---|---|
| Broadcast scalar | `vdup[q]_n_<type>` / `vmov[q]_n_<type>` | fill all lanes |
| Create from bits | `vcreate_<type>(uint64_t)` | build a 64-bit vector from raw bits |
| Combine | `vcombine_<type>(lo, hi)` | join two 64-bit halves |
| Split low | `vget_low_<type>(qvec)` | take low 64-bit half |
| Split high | `vget_high_<type>(qvec)` | take high 64-bit half |
| Extract lane | `vget[_q]_lane_<type>(vec, lane)` | scalar result |
| Insert lane | `vset[_q]_lane_<type>(scalar, vec, lane)` | replace one lane |

### 4.3 Memory notes

- NEON generally supports unaligned accesses; there are no separate "aligned" intrinsics.
- Alignment still matters for performance.
- In AArch32 assembly there are alignment hints on some load/store instructions, but the intrinsics do not expose separate aligned APIs.
- Single-lane loads/stores are useful but usually worse for throughput than full-vector accesses.

## 5. Arithmetic: Floating Point

ARMv7 NEON fundamentally centers on **single-precision `f32`**. AArch64 adds broader `f64` support and many newer floating-point forms.

| Operation | Pattern | Notes |
|---|---|---|
| Add | `vadd[q]_f32` | per-lane |
| Subtract | `vsub[q]_f32` | per-lane |
| Multiply | `vmul[q]_f32` | per-lane |
| Multiply by scalar | `vmul[q]_n_f32` | scalar from C variable |
| Multiply by lane | `vmul[q]_lane_f32` | scalar from vector lane |
| Multiply-accumulate | `vmla[q]_f32` | `a + b*c`, NOT fused (two roundings) |
| Multiply-subtract | `vmls[q]_f32` | `a - b*c`, NOT fused (two roundings) |
| True fused multiply-add | `vfma[q]_f32` | requires FMA support (`__ARM_FEATURE_FMA`) |
| Negate | `vneg[q]_f32` | direct instruction |
| Absolute | `vabs[q]_f32` | direct instruction |
| Absolute difference | `vabd[q]_f32` | `abs(a-b)` |
| Min / max | `vmin[q]_f32`, `vmax[q]_f32` | per-lane |
| Reciprocal estimate | `vrecpe[q]_f32` | approximate `1/x` |
| Reciprocal step | `vrecps[q]_f32` | Newton-Raphson refinement helper |
| Reciprocal sqrt estimate | `vrsqrte[q]_f32` | approximate `1/sqrt(x)` |
| Reciprocal sqrt step | `vrsqrts[q]_f32` | refinement helper |
| Divide | `vdiv...` | native in AArch64, not ARMv7 NEON |
| Square root | `vsqrt...` | native in AArch64, not ARMv7 NEON |


## 6. Arithmetic: Integer

| Operation | Pattern | Notes |
|---|---|---|
| Add | `vadd[q]_<type>` | all major integer widths |
| Saturating add | `vqadd[q]_<type>` | clamp to destination range |
| Halving add | `vhadd[q]_<type>` | average-like, truncated |
| Rounding halving add | `vrhadd[q]_<type>` | rounded average-like |
| Widening add | `vaddl_<type>` | 64-bit inputs, 128-bit wider result |
| Wide add | `vaddw_<type>` | wide accumulator + narrow input |
| Narrowing add high half | `vaddhn_<type>` | keep high half of widened result |
| Subtract | `vsub[q]_<type>` | per-lane |
| Saturating subtract | `vqsub[q]_<type>` | clamp |
| Widening subtract | `vsubl_<type>` | wider result |
| Multiply | `vmul[q]_<type>` | unlike SSE, many integer widths are supported |
| Widening multiply | `vmull_<type>` | wider result |
| Multiply-accumulate | `vmla[q]_<type>` | `a + b*c` |
| Multiply-subtract | `vmls[q]_<type>` | `a - b*c` |
| Widening multiply-accumulate | `vmlal_<type>` | wide accumulator |
| Absolute difference | `vabd[q]_<type>` | `abs(a-b)` |
| Abs diff accumulate | `vaba[q]_<type>` | `a + abs(b-c)` |
| Wide abs diff accumulate | `vabal_<type>` | wider accumulator |
| Min / max | `vmin[q]_<type>`, `vmax[q]_<type>` | many older forms exclude 64-bit integer lanes |
| Negate | `vneg[q]_<type>` | signed only |
| Saturating negate | `vqneg[q]_<type>` | signed only |
| Absolute | `vabs[q]_<type>` | signed only |
| Saturating absolute | `vqabs[q]_<type>` | signed only |
| Sat doubling multiply high | `vqdmulh...` | fixed-point style |
| Sat rounding doubling mul high | `vqrdmulh...` | rounded variant |


## 7. Comparisons and Select

All NEON compare intrinsics produce **mask vectors**, not scalar booleans.

| Operation | Pattern |
|---|---|
| Equal | `vceq[q]_<type>` |
| Greater than | `vcgt[q]_<type>` |
| Greater or equal | `vcge[q]_<type>` |
| Less than | `vclt[q]_<type>` |
| Less or equal | `vcle[q]_<type>` |
| Absolute greater than | `vcagt[q]_f32` |
| Absolute greater or equal | `vcage[q]_f32` |
| Test bits | `vtst[q]_<type>` |

Mask semantics:

- true lane = all ones
- false lane = all zeros
- mask width matches the lane width

Selection:

- `vbsl(mask, a, b)` = per-bit select from `a` or `b`

Important:

- there is no direct `_mm_movemask_*` equivalent
- if scalar control flow is needed, the mask usually has to be reduced manually with integer operations

## 8. Bitwise / Logical

| Operation | Pattern | Meaning |
|---|---|---|
| AND | `vand[q]_<type>` | bitwise and |
| OR | `vorr[q]_<type>` | bitwise or |
| XOR / EOR | `veor[q]_<type>` | bitwise xor |
| NOT | `vmvn[q]_<type>` | bitwise complement |
| OR-NOT | `vorn[q]_<type>` | `a | ~b` |
| Bit clear | `vbic[q]_<type>` | `a & ~b` |
| Bitwise select | `vbsl[q]_<type>` | bitwise conditional select |

`vbsl` is the standard way to turn compare masks into branchless value selection.

## 9. Shifts

| Operation | Pattern | Notes |
|---|---|---|
| Shift left by constant | `vshl[q]_n_<type>` | immediate count |
| Shift by per-lane signed vector | `vshl[q]_<type>` | positive = left, negative = right |
| Shift right by constant | `vshr[q]_n_<type>` | immediate count |
| Rounding shift right | `vrshr[q]_n_<type>` | rounded |
| Saturating shift left | `vqshl[q]_<type>` | clamp on overflow |
| Shift right and accumulate | `vsra[q]_n_<type>` | add shifted result |
| Rounding shift right and accumulate | `vrsra[q]_n_<type>` | rounded accumulate |
| Shift left and insert | `vsli[q]_n_<type>` | merge shifted bits |
| Shift right and insert | `vsri[q]_n_<type>` | merge shifted bits |
| Narrowing shift right | `vshrn_n_<type>` | narrow result |
| Saturating narrowing shift right | `vqshrn_n_<type>` | saturating narrow |
| Long shift left | `vshll_n_<type>` | widen then shift |

Shift notes:

- right shift of signed types is arithmetic
- right shift of unsigned types is logical
- variable-count shifts use **signed** shift vectors

## 10. Conversion and Reinterpretation

| Operation | Pattern | Meaning |
|---|---|---|
| Reinterpret cast | `vreinterpret[_q]_<dst>_<src>` | bits unchanged |
| Float -> signed int | `vcvt[_q]_s32_f32` | round toward zero |
| Float -> unsigned int | `vcvt[_q]_u32_f32` | round toward zero |
| Signed int -> float | `vcvt[_q]_f32_s32` | follows FP rounding mode |
| Unsigned int -> float | `vcvt[_q]_f32_u32` | follows FP rounding mode |
| Fixed-point convert | `vcvt[_q]_n_...` | explicit fractional-bit count |
| Widen move | `vmovl_<type>` | extend lanes |
| Narrow move | `vmovn_<type>` | truncate lanes |
| Saturating narrow | `vqmovn_<type>` | narrow with clamp |

Important:

- `vreinterpret` never changes the bits
- conversions and reinterprets are very different operations

## 11. Horizontal, Pairwise, and Reduction

| Operation | Pattern | Notes |
|---|---|---|
| Pairwise add | `vpadd_<type>` | adjacent pairs |
| Pairwise min | `vpmin_<type>` | adjacent pairs |
| Pairwise max | `vpmax_<type>` | adjacent pairs |
| Widening pairwise add | `vpaddl[q]_<type>` | pairs -> wider lanes |
| Pairwise add and accumulate | `vpadal[q]_<type>` | accumulate widened pairwise sums |
| Across-vector add | `vaddv...` | AArch64 reduction |
| Across-vector min/max | `vminv...`, `vmaxv...` | AArch64 reduction |

Notes:

- on ARMv7, many pairwise ops like `vpadd`, `vpmin`, and `vpmax` are 64-bit only
- AArch64 adds broader reduction coverage
- reductions often require a mix of pairwise ops plus lane extraction on older NEON

## 12. Permutation / Shuffle

NEON has **no single generic shuffle** like SSE `_mm_shuffle_ps`. Instead it provides a toolbox of narrower permutation operations.

| Operation | Pattern | Meaning |
|---|---|---|
| Extract / slide window | `vext[q]_<type>(a, b, n)` | concatenate then extract by byte offset |
| Broadcast one lane | `vdup[q]_lane_<type>` | duplicate one lane |
| Zip | `vzip[q]_<type>` | interleave two vectors |
| Unzip | `vuzp[q]_<type>` | de-interleave two vectors |
| Transpose | `vtrn[q]_<type>` | pairwise transpose |
| Reverse within 64-bit blocks | `vrev64[q]_<type>` | reverse within each 64-bit chunk |
| Reverse within 32-bit blocks | `vrev32[q]_<type>` | reverse within each 32-bit chunk |
| Reverse within 16-bit blocks | `vrev16[q]_<type>` | reverse within each 16-bit chunk |
| Table lookup | `vtbl{1,2,3,4}_<type>` | byte-wise arbitrary lookup |
| Table lookup extend | `vtbx{1,2,3,4}_<type>` | preserve destination on out-of-range index |

Permutation notes:

- `vzip`, `vuzp`, and `vtrn` usually return `...x2_t` structs
- `vtbl` / `vtbx` are **byte-wise** permutation tools
- using the same vector for both inputs often creates useful one-vector shuffles
- structured loads/stores can eliminate many explicit permutes

## 13. Bit Manipulation

| Operation | Pattern | Meaning |
|---|---|---|
| Population count | `vcnt[q]_u8` | popcount per byte |
| Count leading zeros | `vclz[q]_<type>` | per lane |
| Count leading sign bits | `vcls[q]_<type>` | signed lanes only |

- `vcnt` counts bits per **byte only**; wider popcounts require additional horizontal adds

## 14. Floating-Point Behavior on AArch64

For AArch64 AdvSIMD, floating-point behavior is defined in terms of the current `FPCR[]` state. If you are translating AArch64 code, treat the chosen `FPCR` configuration as part of the source semantics rather than assuming generic NEON behavior.

### 14.1 Precision and Width

- AArch64 AdvSIMD supports `f32` and `f64` arithmetic.
- `f16` arithmetic is feature-dependent rather than a blanket property of all AArch64 targets.

### 14.2 Relevant FPCR Fields

`FPCR` (Floating-Point Control Register) is the AArch64 control register that many floating-point and AdvSIMD arithmetic and conversion instructions read implicitly. For the current translation target, the relevant fields are:

| Bit | Field | What it controls |
|---|---|---|
| 26 | `AH` | Alternative handling for floating-point min/max. `0` follows IEEE signed-zero ordering; `1` returns the second operand when both inputs are zero. |
| 25 | `DN` | Default NaN mode. `0` preserves ordinary NaN propagation behavior; `1` forces default NaN behavior. |
| 24 | `FZ` | Flush-to-zero for `f32` / `f64`. `0` preserves subnormals; `1` flushes subnormal arithmetic operands and results. |
| 23:22 | `RMode` | Rounding mode. `00` = Round to Nearest, ties to Even (`RNE`); `01` = round toward `+Inf`; `10` = round toward `-Inf`; `11` = round toward zero. |
| 19 | `FZ16` | Flush-to-zero for `f16` data-processing when FP16 arithmetic is present. |

Other FPCR fields exist, but they are out of scope here unless a source kernel explicitly depends on them.

### 14.3 Frozen AArch64 FP Environment

For the current AArch64 target, assume the following FPCR configuration as the source semantics:

| Field | Value | Effect |
|---|---|---|
| `RMode` | `00` (RNE) | Round to nearest, ties to even |
| `FZ` | `0` | Preserve f32/f64 subnormals |
| `FZ16` | `0` | Preserve f16 subnormals |
| `DN` | `0` | Propagate NaN payloads (do not force default NaN) |
| `AH` | `0` | Negative zero compares less than positive zero in min/max |

Under this profile, floating-point arithmetic uses round-to-nearest-even, preserves f32 and f16 subnormals, keeps ordinary NaN propagation behavior, and treats negative zero as less than positive zero in min/max operations.

### 14.4 Rounding and Conversion

- Floating-point arithmetic follows the active `FPCR` rounding mode. For the frozen profile above, arithmetic uses `RNE`.
- Float-to-integer conversions use round toward zero.
- Integer-to-float and FP widen/narrow conversions use the active FP environment.
- Fixed-point conversions (`vcvt_n_`) convert between float and fixed-point integers using an explicit fractional-bit count. For example, `vcvtq_n_s32_f32(v, 8)` converts `1.0f` to `0x100` (24.8 fixed-point format).

### 14.5 Division and Square Root

- `vdiv` and `vsqrt` are native floating-point instructions on AArch64.
- Correct translation of `vdiv` / `vsqrt` depends on matching the same frozen FP environment on both sides.

### 14.6 Multiply-Accumulate vs Fused Multiply-Add

- `vmla[q]_f32/f64` and `vmls[q]_f32/f64` are multiply-accumulate instructions with two rounding steps. They are **not fused**.
- `vfma[q]_f32/f64` and `vfms[q]_f32/f64` are truly fused multiply-add/subtract with one final rounding.
- The distinction matters for last-bit accuracy: fused FMA rounds only once, while non-fused MLA rounds the product before the add/subtract.

### 14.7 Comparison, Min/Max, and Special Values

- Floating-point comparisons (`vceq`, `vcge`, `vcgt`, `vcle`, `vclt`) produce all-ones/all-zeros masks per lane, same as integer comparisons.
- `vcage[q]_f32/f64` and `vcagt[q]_f32/f64` compare absolute values of two FP vectors.
- There is no inequality (`!=`) comparison intrinsic; use `vceq` plus bitwise NOT on the mask.
- `vmin` / `vmax` and `vminnm` / `vmaxnm` are different families and should not be treated as interchangeable when NaNs or signed zeros matter.
