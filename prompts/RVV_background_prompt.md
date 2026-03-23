# RISC-V Vector (RVV) Intrinsics Reference

## 0. Toolchain and Availability

- Include `<riscv_vector.h>` to use the standard C intrinsics.
- Guard on `__riscv_v_intrinsic >= 1000000` if you need to check for the v1.0 intrinsic API explicitly.
- Availability depends on the enabled architecture (`-march`) and profile (`V`, `Zve*`, floating-point support, `ELEN >= 64`, etc.). Do **not** assume every RVV type or intrinsic exists on every target.
- Both explicit and overloaded intrinsics exist. Overloaded forms are convenient, but not every intrinsic family has one.

## 1. Architecture Overview

RVV is RISC-V's **variable-length** vector extension. RVV vectors have an implementation-defined length (VLEN) and software uses a **Vector Length Agnostic (VLA)** programming model. The hardware tells software how many elements it can process per iteration via `vsetvl`.

Key parameters:
- **VLEN**: number of bits in one vector register (implementation-defined; portable code must not assume a fixed vector width)
- **ELEN**: maximum element width supported (typically 64 bits)
- **SEW** (Selected Element Width): current element width (8/16/32/64 bits), set via `vsetvl`
- **LMUL** (Length MULtiplier): groups multiple vector registers (1/8, 1/4, 1/2, 1, 2, 4, 8). Higher LMUL = longer vectors but fewer register groups
- **VLMAX** = LMUL × VLEN / SEW: maximum elements per vector operation
- **AVL**: application vector length, the `size_t vl` argument you pass to most intrinsics
- **vl**: the hardware vector length chosen by the implementation for that operation (≤ VLMAX)

The canonical VLA loop pattern:
```c
size_t n = count;
while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m1(n);  // stripmine count for this iteration
    vfloat32m1_t va = __riscv_vle32_v_f32m1(ptr_a, vl);
    vfloat32m1_t vb = __riscv_vle32_v_f32m1(ptr_b, vl);
    vfloat32m1_t vc = __riscv_vfadd_vv_f32m1(va, vb, vl);
    __riscv_vse32_v_f32m1(ptr_out, vc, vl);
    ptr_a += vl; ptr_b += vl; ptr_out += vl;
    n -= vl;
}
```
No separate tail handling is needed. The final iteration naturally uses a smaller stripmine count.

Important intrinsics-model notes:
- The `size_t vl` argument in most RVV intrinsics is an **AVL**, not a direct write to the `vl` CSR.
- The compiler/runtime is responsible for bookkeeping of `vl`, `vtype`, `vxrm`, and `frm` to preserve the intrinsic semantics.
- `__riscv_vsetvl_*` / `__riscv_vsetvlmax_*` are pseudo intrinsics that help with stripmining; they do **not** guarantee a one-to-one visible `vsetvli` of that exact spelling.
- Not every intrinsic takes a trailing `vl`; scalar moves and several pseudo intrinsics do not.

## 2. Type System

### 2.1 Non-mask vector types

Types encode element type, SEW, and LMUL:

```
v{int|uint|float}{SEW}m{LMUL}_t
```

Examples:
- `vint32m1_t` — signed 32-bit elements, LMUL=1
- `vuint8m4_t` — unsigned 8-bit elements, LMUL=4
- `vfloat32m2_t` — float32 elements, LMUL=2
- `vint16mf2_t` — signed 16-bit elements, LMUL=1/2 (fractional: `mf2`, `mf4`, `mf8`)

LMUL controls how many physical registers a vector register group occupies:
- LMUL=1: 1 register → 32 register groups available
- LMUL=2: 2 registers per group → 16 groups available
- LMUL=4: 4 registers → 8 groups
- LMUL=8: 8 registers → 4 groups
- LMUL=1/2,1/4,1/8: fractional, uses portion of one register → 32 groups available

Higher LMUL processes more elements per instruction but consumes more registers. SEW and LMUL together determine VLMAX and register-group pressure across operations.

### 2.2 Mask types

Mask types encode the ratio SEW/LMUL:

```
vbool{N}_t    where N = SEW/LMUL
```

Examples:
- `vbool32_t` — mask for SEW=32/LMUL=1, or SEW=16/LMUL=1/2, etc.
- `vbool8_t` — mask for SEW=8/LMUL=1, or SEW=32/LMUL=4, etc.

Each mask element is a single bit. The mask for element `i` is bit `i` of the mask register.

### 2.3 Tuple types

For segment load/store: `v{type}m{LMUL}x{NFIELD}_t` (e.g., `vuint8m1x3_t` for 3-field segments). Constraint: EMUL × NFIELDS ≤ 8.

## 3. Intrinsic Naming Scheme

### 3.1 Explicit (non-overloaded) naming

```
__riscv_{MNEMONIC}_{OPERANDS}_{RETURN_TYPE}[_rm][_POLICY](args..., vl)
```

Components:
- `MNEMONIC`: instruction name (`vadd`, `vfmacc`, `vle32`, `vse32`, etc.)
- `OPERANDS`: operand shapes (`vv` = vector-vector, `vx` = vector-scalar int, `vf` = vector-scalar float; see §3.4 for immediates)
- `RETURN_TYPE`: `{i|u|f}{SEW}m{LMUL}` for data, `b{N}` for masks
- `_rm`: explicit FP rounding mode (adds `frm` parameter)
- `_POLICY`: tail/mask policy suffix (see §4)

Examples:
```c
__riscv_vadd_vv_i32m1(vs2, vs1, vl)          // int32 vector-vector add, LMUL=1
__riscv_vfmacc_vf_f32m2(vd, scalar, vs2, vl) // FP32 multiply-accumulate, LMUL=2
__riscv_vle32_v_f32m1(ptr, vl)                // load 32-bit floats
__riscv_vmseq_vv_i32m1_b32(vs2, vs1, vl)     // compare equal, returns mask
```

This rule is a strong guide, not a universal law. Scalar moves, reductions, `vreinterpret`, `vset`/`vget`, and other pseudo intrinsics are naming exceptions.

### 3.2 Overloaded naming

Omits operand mnemonics and type suffixes; the compiler resolves from argument types:
```c
__riscv_vadd(vs2, vs1, vl)                    // type inferred from arguments
```

Policy suffixes (`_tu`, `_tum`, etc.) are still present in overloaded forms.

Not every intrinsic family has an overloaded form, and some overloaded spellings still encode part of the type or operation shape to avoid collisions.

### 3.3 Widening and narrowing naming

- Widening: `vw` prefix (e.g., `__riscv_vwadd_vv_i32m1`). Result is 2×SEW. Source types with `.wv`/`.wx` have one wide and one narrow operand.
- Narrowing: `vn` prefix (e.g., `__riscv_vnsrl_wv_u16m1`). Source is 2×SEW, result is SEW. The `w` in operand suffix indicates the wide source.
- FP widening: `vfw` prefix. FP narrowing: `vfn` prefix.

### 3.4 Immediate forms in C intrinsics

The RVV C intrinsics generally expose `vv` and `vx` forms, but not separate `vi` forms.

- Pass constants to the `_vx` form in C.
- If the constant fits the ISA's immediate encoding, the compiler may lower that intrinsic to a `...vi` instruction.
- Do not assume a `__riscv_*_vi_*` intrinsic exists for a family unless you have checked the concrete headers/docs.

## 4. Policies (Tail and Mask Handling)

RVV controls what happens to **tail elements** (index ≥ vl) and **inactive masked-off elements**:

| Suffix | Mask | Tail | Mask-off elements |
|---|---|---|---|
| (none) | unmasked | agnostic | N/A |
| `_tu` | unmasked | undisturbed | N/A |
| `_m` | masked | agnostic | agnostic |
| `_tum` | masked | undisturbed | agnostic |
| `_mu` | masked | agnostic | undisturbed |
| `_tumu` | masked | undisturbed | undisturbed |

- **Agnostic**: implementation may leave the prior bits or write all-1s, but portable code must treat those elements as **indeterminate** and never rely on reading them
- **Undisturbed**: elements retain their previous value (requires a passthrough `vd` argument)

Default (no suffix) = unmasked, tail-agnostic. For masked operations, `_m` is the default masked tail-agnostic/mask-agnostic form. Agnostic elements are semantically dead data, not stable values.

Masked variants take `vbool{N}_t vm` as the first argument. Undisturbed variants take `vd` (destination passthrough) as the first argument.

## 5. Configuration and Vector Length

### 5.1 vsetvl intrinsics

```c
size_t __riscv_vsetvl_e{SEW}m{LMUL}(size_t avl);    // returns vl
size_t __riscv_vsetvlmax_e{SEW}m{LMUL}(void);        // returns VLMAX
```

`vsetvl` takes an Application Vector Length (AVL) and returns the actual `vl` that the hardware will use:
- If AVL ≤ VLMAX → vl = AVL
- If AVL ≥ 2×VLMAX → vl = VLMAX
- Otherwise → ceil(AVL/2) ≤ vl ≤ VLMAX

Most operational vector intrinsics take `vl` as their last argument. Scalar moves (`vmv.x.s`, `vfmv.f.s`, etc.) and several pseudo intrinsics (`vlenb`, `vreinterpret`, `vget`, `vset`, `vcreate`, `vundefined`) do not.

### 5.2 Choosing LMUL

LMUL trade-offs:
- Higher LMUL → more elements per iteration → fewer loop iterations → but fewer available vector registers
- Lower LMUL → fewer elements per iteration → more register groups available → better for high-register-pressure code
- For mixed-width operations: keep SEW/LMUL constant. E.g., 8-bit at LMUL=1 pairs with 32-bit at LMUL=4 (same VLMAX).

## 6. Memory Operations

### 6.1 Unit-stride load/store

```c
vint32m1_t __riscv_vle32_v_i32m1(const int32_t* ptr, size_t vl);
void __riscv_vse32_v_i32m1(int32_t* ptr, vint32m1_t vs3, size_t vl);
```

Available for 8/16/32/64-bit element widths. EEW is encoded in the instruction name.

### 6.2 Strided load/store

```c
vint32m1_t __riscv_vlse32_v_i32m1(const int32_t* ptr, ptrdiff_t stride, size_t vl);
void __riscv_vsse32_v_i32m1(int32_t* ptr, ptrdiff_t stride, vint32m1_t vs3, size_t vl);
```

Stride is in bytes. Zero and negative strides are supported.

### 6.3 Indexed (gather/scatter) load/store

```c
vint32m1_t __riscv_vluxei32_v_i32m1(const int32_t* ptr, vuint32m1_t idx, size_t vl);
void __riscv_vsoxei32_v_i32m1(int32_t* ptr, vuint32m1_t idx, vint32m1_t vs3, size_t vl);
```

Index values are byte offsets. `vluxei` = unordered, `vloxei` = ordered.

### 6.4 Segment load/store

De-interleave/interleave N contiguous fields per element:

```c
vuint8m1x3_t __riscv_vlseg3e8_v_u8m1x3(const uint8_t* ptr, size_t vl);  // RGB
void __riscv_vsseg3e8_v_u8m1x3(uint8_t* ptr, vuint8m1x3_t vs3, size_t vl);
```

Use `__riscv_vget` / `__riscv_vset` to extract/insert individual fields from tuple types.

### 6.5 Mask load/store

```c
vbool8_t __riscv_vlm_v_b8(const uint8_t* ptr, size_t vl);
void __riscv_vsm_v_b8(uint8_t* ptr, vbool8_t vs3, size_t vl);
```

### 6.6 Practical memory notes

- Strides are in **bytes**.
- A stride of 0 on `vlse*` / `vsse*` does **not** guarantee that every memory access is performed. If you truly need all accesses, use indexed operations with zero indices instead.
- Segment load/store tuple elements are extracted/combined with `__riscv_vget` / `__riscv_vset`; the tuple helpers themselves are pseudo intrinsics and may compile to zero or more instructions.

## 7. Integer Arithmetic

### 7.1 Basic arithmetic

| Operation | Intrinsic pattern |
|---|---|
| Add | `__riscv_vadd_vv`, `_vx` |
| Subtract | `__riscv_vsub_vv`, `_vx` |
| Reverse subtract | `__riscv_vrsub_vx` |
| Min (signed) | `__riscv_vmin_vv`, `_vx` |
| Min (unsigned) | `__riscv_vminu_vv`, `_vx` |
| Max (signed) | `__riscv_vmax_vv`, `_vx` |
| Max (unsigned) | `__riscv_vmaxu_vv`, `_vx` |
| Multiply (low) | `__riscv_vmul_vv`, `_vx` |
| Multiply high (signed) | `__riscv_vmulh_vv`, `_vx` |
| Multiply high (unsigned) | `__riscv_vmulhu_vv`, `_vx` |
| Multiply high (signed×unsigned) | `__riscv_vmulhsu_vv`, `_vx` |
| Divide | `__riscv_vdiv_vv`/`vdivu_vv`, `_vx` |
| Remainder | `__riscv_vrem_vv`/`vremu_vv`, `_vx` |
| Negate | `__riscv_vrsub_vx(vs, 0, vl)` or `vneg.v` pseudo |

### 7.2 Widening integer

```c
// 2*SEW = SEW op SEW
__riscv_vwadd_vv_i32m2(vs2_i16m1, vs1_i16m1, vl)   // signed widening add
__riscv_vwaddu_vv_u32m2(vs2_u16m1, vs1_u16m1, vl)   // unsigned widening add
__riscv_vwmul_vv_i32m2(vs2_i16m1, vs1_i16m1, vl)    // signed widening multiply
// 2*SEW = 2*SEW op SEW
__riscv_vwadd_wv_i32m2(vs2_i32m2, vs1_i16m1, vl)    // wide + narrow
```

### 7.3 Narrowing integer

```c
// SEW = (2*SEW) >> SEW
__riscv_vnsrl_wv_u16m1(vs2_u32m2, vs1_u16m1, vl)   // narrowing shift right logical
__riscv_vnsra_wv_i16m1(vs2_i32m2, vs1_i16m1, vl)   // narrowing shift right arithmetic
__riscv_vnsrl_wx_u16m1(vs2_u32m2, shift, vl)
// pass constants to the _wx form; the compiler may emit a ...wi instruction
__riscv_vnsrl_wx_u16m1(vs2_u32m2, imm, vl)
```

### 7.4 Integer multiply-add

Destructive (overwrites one operand):
```c
// Overwrite addend: vd = vs1 * vs2 + vd
__riscv_vmacc_vv_i32m1(vd, vs1, vs2, vl)
__riscv_vmacc_vx_i32m1(vd, scalar, vs2, vl)
// Overwrite multiplicand: vd = vs1 * vd + vs2
__riscv_vmadd_vv_i32m1(vd, vs1, vs2, vl)
// Negative: vd = -(vs1 * vs2) + vd
__riscv_vnmsac_vv_i32m1(vd, vs1, vs2, vl)
// Widening multiply-add: vd = +(vs1 * vs2) + vd  (all 2*SEW result)
__riscv_vwmacc_vv_i32m2(vd, vs1_i16m1, vs2_i16m1, vl)
```

### 7.5 Shifts

```c
__riscv_vsll_vv_u32m1(vs2, vs1, vl)   // shift left by vector
__riscv_vsll_vx_u32m1(vs2, shift, vl) // shift left by scalar
__riscv_vsll_vx_u32m1(vs2, imm, vl)   // constant scalar; compiler may lower to ...vi
__riscv_vsrl_vv_u32m1(vs2, vs1, vl)   // logical shift right
__riscv_vsra_vv_i32m1(vs2, vs1, vl)   // arithmetic shift right
```

Only the low lg2(SEW) bits of the shift amount are used.

### 7.6 Bitwise logical

```c
__riscv_vand_vv_u32m1(vs2, vs1, vl)
__riscv_vor_vv_u32m1(vs2, vs1, vl)
__riscv_vxor_vv_u32m1(vs2, vs1, vl)
__riscv_vnot_v_u32m1(vs2, vl)          // pseudo: vxor with -1
```

### 7.7 Integer extension

```c
__riscv_vzext_vf2_u32m1(vs2_u16mf2, vl)  // zero-extend SEW/2 → SEW
__riscv_vsext_vf2_i32m1(vs2_i16mf2, vl)  // sign-extend SEW/2 → SEW
__riscv_vzext_vf4_u32m1(vs2_u8mf4, vl)   // zero-extend SEW/4 → SEW
```

## 8. Fixed-Point Arithmetic

### 8.1 Saturating operations

```c
__riscv_vsaddu_vv_u32m1(vs2, vs1, vl)   // unsigned saturating add
__riscv_vsadd_vv_i32m1(vs2, vs1, vl)    // signed saturating add
__riscv_vssubu_vv_u32m1(vs2, vs1, vl)   // unsigned saturating subtract
__riscv_vssub_vv_i32m1(vs2, vs1, vl)    // signed saturating subtract
```

### 8.2 Averaging operations

```c
// result = roundoff((a + b), 1) — average with rounding per vxrm
__riscv_vaaddu_vv_u32m1(vs2, vs1, __RISCV_VXRM_RNU, vl)  // unsigned
__riscv_vaadd_vv_i32m1(vs2, vs1, __RISCV_VXRM_RNU, vl)   // signed
```

Rounding modes (`vxrm`):
- `__RISCV_VXRM_RNU` (0): round to nearest, ties up
- `__RISCV_VXRM_RNE` (1): round to nearest, ties to even
- `__RISCV_VXRM_RDN` (2): round down (truncate)
- `__RISCV_VXRM_ROD` (3): round to odd

### 8.3 Fractional multiply with saturation

```c
// Signed: vd = clip(roundoff_signed(vs2 * vs1, SEW-1))
__riscv_vsmul_vv_i32m1(vs2, vs1, __RISCV_VXRM_RNU, vl)
```

**`vsmul` is NOT equivalent to NEON `vqrdmulh` / `vqdmulh`.** `vsmul` computes `sat((a*b + round) >> (SEW-1))` — a single fractional product without a 2× doubling factor. NEON's `vqrdmulh` computes `sat((2*a*b + round) >> (SEW-1))`. The factor-of-two difference means `vsmul` cannot substitute for `vqrdmulh` or `vqdmulh`. The correct RVV expansion is: widening multiply → double (`vsll` by 1 in the widened type) → `vnclip` with the appropriate `vxrm`.

### 8.4 Narrowing clip

```c
// Narrowing with rounding and saturation: SEW = clip(roundoff(2*SEW, shift))
__riscv_vnclipu_wv_u16m1(vs2_u32m2, vs1_u16m1, __RISCV_VXRM_RNU, vl)  // unsigned
__riscv_vnclip_wv_i16m1(vs2_i32m2, vs1_i16m1, __RISCV_VXRM_RNU, vl)   // signed
```

### 8.5 Scaling shifts

```c
// Shift right with rounding per vxrm
__riscv_vssrl_vx_u32m1(vs2, shift, __RISCV_VXRM_RNU, vl)  // unsigned (logical)
__riscv_vssra_vx_i32m1(vs2, shift, __RISCV_VXRM_RNU, vl)  // signed (arithmetic)
```

## 9. Floating-Point Behavior and Arithmetic

All RVV vector FP instructions treat elements as **IEEE 754-2008** values (RVV Spec v1.0, Ch. 13). If the EEW does not correspond to a supported IEEE FP type, the encoding is reserved. The V extension mandates FP32/FP64; FP16 requires the Zvfh/Zvfhmin extensions.

### 9.1 IEEE-754 behavioral properties

- **Subnormals**: fully supported. Subnormal inputs and outputs are preserved, not flushed to zero.
- **NaN**: invalid operations produce the **canonical NaN** (a single quiet NaN value). Input NaN payloads are not propagated through arithmetic. This follows the RISC-V scalar FP convention.
- **FMA**: `vfmacc` / `vfmsac` / `vfnmacc` / `vfnmsac` / `vfmadd` / `vfmsub` / `vfnmadd` / `vfnmsub` are all **truly fused** — one rounding at the end of the multiply-add, not two separate roundings.
- **Rounding**: controlled by the `frm` CSR (default: round-to-nearest-even). Per-instruction rounding via `_rm` suffix intrinsics; the `frm` argument must be a compile-time constant.
- **Min/Max**: `vfmin` / `vfmax` use IEEE-754 `minNum` / `maxNum` semantics (matching RISC-V scalar `fmin` / `fmax`). If one operand is NaN, the non-NaN value is returned. Both NaN → canonical NaN. For signed zeros, `vfmin(-0.0, +0.0) = -0.0` and `vfmax(-0.0, +0.0) = +0.0`.
- **Divide and square root**: native vector instructions (`vfdiv`, `vfsqrt`).
- **Classify**: `vfclass` returns a 10-bit unsigned integer per element identifying the FP class (±inf, ±normal, ±subnormal, ±zero, sNaN, qNaN).
- **FP reductions**: `vfredosum` is strictly ordered (left-to-right accumulation). `vfredusum` allows unordered tree reduction with intermediate precision ≥ SEW. `vfredmin` / `vfredmax` are order-independent.

### 9.2 Exception flags

Vector FP operations on **active** elements can set the standard `fflags` bits (NV, DZ, OF, UF, NX). Masked-off or inactive elements do not contribute.

Compare-specific NaN behavior:
- `vmfeq`, `vmfne`: raise Invalid (NV) only on **signaling** NaN inputs.
- `vmflt`, `vmfle`, `vmfgt`, `vmfge`: raise Invalid (NV) on **both** signaling and quiet NaN inputs.
- `vmfne` writes 1 when either operand is NaN; all other compares write 0 when either operand is NaN.

The intrinsics v1.0 API does not expose a direct `fflags` read/clear interface.

### 9.3 Rounding modes

**Floating-point rounding** (`frm` CSR):

| Value | Enum | Mode |
|---|---|---|
| 0 | `__RISCV_FRM_RNE` | Round to Nearest, ties to Even (default) |
| 1 | `__RISCV_FRM_RTZ` | Round towards Zero |
| 2 | `__RISCV_FRM_RDN` | Round Down (towards −∞) |
| 3 | `__RISCV_FRM_RUP` | Round Up (towards +∞) |
| 4 | `__RISCV_FRM_RMM` | Round to Nearest, ties to Max Magnitude |

Two ways to use rounding modes in intrinsics:

1. **Implicit** (no `_rm` suffix): uses the dynamic `frm` register. Default is RNE (set by environment init). Behaves like normal C floating-point expressions.

2. **Explicit** (`_rm` suffix): adds a `frm` argument. Enables compiler optimization while giving per-instruction rounding control. The `frm` argument must be a compile-time constant.

```c
// Implicit: uses whatever frm is currently set to
__riscv_vfadd_vv_f32m1(vs2, vs1, vl)
// Explicit: force round-towards-zero for this operation
__riscv_vfadd_vv_f32m1_rm(vs2, vs1, __RISCV_FRM_RTZ, vl)
```

**Fixed-point rounding** (`vxrm` CSR) — used by integer averaging, scaling shift, and clip instructions:

| Value | Enum | Mode |
|---|---|---|
| 0 | `__RISCV_VXRM_RNU` | Round to Nearest, ties Up |
| 1 | `__RISCV_VXRM_RNE` | Round to Nearest, ties to Even |
| 2 | `__RISCV_VXRM_RDN` | Round Down (truncate) |
| 3 | `__RISCV_VXRM_ROD` | Round to Odd |

Fixed-point rounding is passed as an explicit argument to the relevant intrinsics (e.g., `vaadd`, `vssrl`, `vnclip`, `vsmul`). It is always a compile-time constant.

### 9.4 Reciprocal and sqrt estimates

RVV provides **exactly-specified** 7-bit accuracy estimate instructions:

- `vfrec7.v`: reciprocal estimate (1/x), 7 MSBs of significand via defined lookup table
- `vfrsqrt7.v`: reciprocal square-root estimate (1/√x), 7 MSBs via defined lookup table

These are estimate instructions with defined semantics. The 7-bit accuracy means:
- 0 Newton-Raphson iterations ≈ bfloat16 accuracy
- 1 iteration ≈ FP16 accuracy
- 2 iterations ≈ FP32 accuracy
- 3 iterations ≈ FP64 accuracy

Newton-Raphson refinement for reciprocal (C intrinsics):
```c
vfloat32m1_t est = __riscv_vfrec7_v_f32m1(x, vl);          // est ≈ 1/x
vfloat32m1_t two = __riscv_vfmv_v_f_f32m1(2.0f, vl);       // splat 2.0
two = __riscv_vfnmsac_vv_f32m1(two, x, est, vl);            // 2.0 - x * est
est = __riscv_vfmul_vv_f32m1(est, two, vl);                 // refined est
// repeat for more precision
```

These estimate instructions have architecturally defined lookup-table semantics, so refinement starts from a deterministic baseline.

### 9.5 Scalar operand sourcing for FP

For vector-scalar FP operations (`_vf` suffix), the scalar comes from an `f` register:
- If FLEN > SEW: the `f` register is checked for valid NaN-boxing; if invalid, canonical NaN is used
- Vector instructions where any FP operand's EEW is not a supported FP width are reserved

### 9.6 Basic FP operations

| Operation | Intrinsic |
|---|---|
| Add | `__riscv_vfadd_vv_f32m1` / `_vf` |
| Subtract | `__riscv_vfsub_vv_f32m1` / `_vf` |
| Reverse subtract | `__riscv_vfrsub_vf_f32m1` |
| Multiply | `__riscv_vfmul_vv_f32m1` / `_vf` |
| Divide | `__riscv_vfdiv_vv_f32m1` / `_vf` |
| Reverse divide | `__riscv_vfrdiv_vf_f32m1` |
| Square root | `__riscv_vfsqrt_v_f32m1` |
| Min | `__riscv_vfmin_vv_f32m1` / `_vf` |
| Max | `__riscv_vfmax_vv_f32m1` / `_vf` |
| Negate | `__riscv_vfneg_v_f32m1` (pseudo for `vfsgnjn`) |
| Absolute | `__riscv_vfabs_v_f32m1` (pseudo for `vfsgnjx`) |
| Sign injection | `__riscv_vfsgnj_vv` / `vfsgnjn_vv` / `vfsgnjx_vv` |
| Reciprocal estimate (7-bit) | `__riscv_vfrec7_v_f32m1` |
| Reciprocal sqrt estimate (7-bit) | `__riscv_vfrsqrt7_v_f32m1` |
| Classify | `__riscv_vfclass_v_u32m1` |

### 9.7 Fused multiply-add (FMA)

All FMA variants are destructive. Two forms: overwrite addend or overwrite multiplicand.

```c
// Overwrite addend: vd = +(vs1 * vs2) + vd
__riscv_vfmacc_vv_f32m1(vd, vs1, vs2, vl)
__riscv_vfmacc_vf_f32m1(vd, scalar, vs2, vl)
// Overwrite addend: vd = -(vs1 * vs2) + vd
__riscv_vfnmsac_vv_f32m1(vd, vs1, vs2, vl)
// Overwrite addend: vd = +(vs1 * vs2) - vd
__riscv_vfmsac_vv_f32m1(vd, vs1, vs2, vl)
// Overwrite addend: vd = -(vs1 * vs2) - vd
__riscv_vfnmacc_vv_f32m1(vd, vs1, vs2, vl)
// Overwrite multiplicand: vd = +(vs1 * vd) + vs2
__riscv_vfmadd_vv_f32m1(vd, vs1, vs2, vl)
```

### 9.8 Widening FP

```c
__riscv_vfwadd_vv_f64m2(vs2_f32m1, vs1_f32m1, vl)  // f64 = f32 + f32
__riscv_vfwmul_vv_f64m2(vs2_f32m1, vs1_f32m1, vl)  // f64 = f32 * f32
__riscv_vfwmacc_vv_f64m2(vd_f64m2, vs1_f32m1, vs2_f32m1, vl)  // f64 += f32 * f32
```

### 9.9 FP conversions

```c
__riscv_vfcvt_x_f_v_i32m1(vs2_f32m1, vl)           // float → signed int
__riscv_vfcvt_xu_f_v_u32m1(vs2_f32m1, vl)           // float → unsigned int
__riscv_vfcvt_rtz_x_f_v_i32m1(vs2_f32m1, vl)        // float → signed int, truncating
__riscv_vfcvt_f_x_v_f32m1(vs2_i32m1, vl)            // signed int → float
__riscv_vfcvt_f_xu_v_f32m1(vs2_u32m1, vl)           // unsigned int → float
// Widening: SEW → 2*SEW
__riscv_vfwcvt_f_f_v_f64m2(vs2_f32m1, vl)           // f32 → f64
__riscv_vfwcvt_f_x_v_f32m2(vs2_i16m1, vl)           // i16 → f32
// Narrowing: 2*SEW → SEW
__riscv_vfncvt_f_f_w_f32m1(vs2_f64m2, vl)           // f64 → f32
```

**NaN behavior for float-to-int**: RVV float-to-int conversions follow the RISC-V scalar convention for invalid conversions. NaN inputs produce the destination type's saturation endpoint: signed destination max for signed conversions, unsigned destination max for unsigned conversions. This differs from AArch64, which produces integer `0` for NaN inputs. Overflow and ±∞ saturate to the destination min/max on both architectures.

## 10. Comparisons

Compare instructions write to **mask registers** (`vbool{N}_t`):

```c
__riscv_vmseq_vv_i32m1_b32(vs2, vs1, vl)   // ==
__riscv_vmsne_vv_i32m1_b32(vs2, vs1, vl)   // !=
__riscv_vmslt_vv_i32m1_b32(vs2, vs1, vl)   // < (signed)
__riscv_vmsltu_vv_u32m1_b32(vs2, vs1, vl)  // < (unsigned)
__riscv_vmsle_vv_i32m1_b32(vs2, vs1, vl)   // <= (signed)
__riscv_vmsleu_vv_u32m1_b32(vs2, vs1, vl)  // <= (unsigned)
__riscv_vmsgt_vx_i32m1_b32(vs2, scalar, vl) // > (signed, scalar form)
__riscv_vmsgtu_vx_u32m1_b32(vs2, scalar, vl)// > (unsigned, scalar form)
```

FP comparisons:
```c
__riscv_vmfeq_vv_f32m1_b32(vs2, vs1, vl)   // ==
__riscv_vmfne_vv_f32m1_b32(vs2, vs1, vl)   // != (true if either NaN)
__riscv_vmflt_vv_f32m1_b32(vs2, vs1, vl)   // <
__riscv_vmfle_vv_f32m1_b32(vs2, vs1, vl)   // <=
__riscv_vmfgt_vf_f32m1_b32(vs2, scalar, vl) // >
__riscv_vmfge_vf_f32m1_b32(vs2, scalar, vl) // >=
```

## 11. Mask Operations

### 11.1 Mask logical

```c
__riscv_vmand_mm_b32(vs2, vs1, vl)    // AND
__riscv_vmnand_mm_b32(vs2, vs1, vl)   // NAND
__riscv_vmandn_mm_b32(vs2, vs1, vl)   // AND-NOT (vs2 & ~vs1)
__riscv_vmor_mm_b32(vs2, vs1, vl)     // OR
__riscv_vmnor_mm_b32(vs2, vs1, vl)    // NOR
__riscv_vmorn_mm_b32(vs2, vs1, vl)    // OR-NOT
__riscv_vmxor_mm_b32(vs2, vs1, vl)    // XOR
__riscv_vmxnor_mm_b32(vs2, vs1, vl)   // XNOR
__riscv_vmnot_m_b32(vs, vl)           // NOT (pseudo)
```

### 11.2 Mask queries

```c
long __riscv_vcpop_m_b32(vs2, vl)      // count set bits in mask
long __riscv_vfirst_m_b32(vs2, vl)     // index of first set bit (-1 if none)
```

### 11.3 Mask set operations

```c
__riscv_vmsbf_m_b32(vs2, vl)   // set-before-first: 1s before first set bit
__riscv_vmsif_m_b32(vs2, vl)   // set-including-first: 1s up to and including first set bit
__riscv_vmsof_m_b32(vs2, vl)   // set-only-first: only the first set bit
__riscv_viota_m_u32m1(vs2, vl) // prefix sum of mask bits (useful for compress)
```

## 12. Merge, Move, and Reinterpret

### 12.1 Merge (conditional select)

```c
// vd[i] = mask[i] ? vs1[i] : vs2[i]
__riscv_vmerge_vvm_i32m1(vs2, vs1, mask, vl)   // vector-vector
__riscv_vmerge_vxm_i32m1(vs2, scalar, mask, vl) // vector-scalar
__riscv_vfmerge_vfm_f32m1(vs2, fscalar, mask, vl) // FP vector-scalar
```

### 12.2 Move / splat

```c
__riscv_vmv_v_v_i32m1(vs1, vl)       // vector copy
__riscv_vmv_v_x_i32m1(scalar, vl)    // integer splat
__riscv_vfmv_v_f_f32m1(fscalar, vl)  // FP splat
```

### 12.3 Scalar move

```c
int32_t __riscv_vmv_x_s_i32m1_i32(vs2)    // extract element 0 to scalar
__riscv_vmv_s_x_i32m1(scalar, vl)          // insert scalar to element 0
float __riscv_vfmv_f_s_f32m1_f32(vs2)      // extract FP element 0
__riscv_vfmv_s_f_f32m1(fscalar, vl)        // insert FP scalar to element 0
```

### 12.4 Reinterpret

```c
// No-op bitcast between same-LMUL types
__riscv_vreinterpret_v_i32m1_f32m1(src)   // int32 → float32 (bits unchanged)
__riscv_vreinterpret_v_u32m1_i32m1(src)   // uint32 → int32
__riscv_vreinterpret_v_i32m1_i8m1(src)    // reinterpret as different element width (same register count)
```

## 13. Reductions

Reductions take a vector source and a scalar initial value (in element 0 of a vector register), producing a scalar result in element 0:

```c
// Integer reductions
__riscv_vredsum_vs_i32m1_i32m1(vs2, vs1_scalar, vl)   // sum
__riscv_vredmax_vs_i32m1_i32m1(vs2, vs1_scalar, vl)   // max (signed)
__riscv_vredmaxu_vs_u32m1_u32m1(vs2, vs1_scalar, vl)  // max (unsigned)
__riscv_vredmin_vs_i32m1_i32m1(vs2, vs1_scalar, vl)   // min (signed)
__riscv_vredminu_vs_u32m1_u32m1(vs2, vs1_scalar, vl)  // min (unsigned)
__riscv_vredor_vs_u32m1_u32m1(vs2, vs1_scalar, vl)    // OR
__riscv_vredand_vs_u32m1_u32m1(vs2, vs1_scalar, vl)   // AND
__riscv_vredxor_vs_u32m1_u32m1(vs2, vs1_scalar, vl)   // XOR

// Widening integer reduction
__riscv_vwredsum_vs_i16m1_i32m1(vs2_i16m1, vs1_scalar, vl)   // widen sum

// FP reductions
__riscv_vfredosum_vs_f32m1_f32m1(vs2, vs1_scalar, vl) // ordered sum
__riscv_vfredusum_vs_f32m1_f32m1(vs2, vs1_scalar, vl) // unordered sum
__riscv_vfredmax_vs_f32m1_f32m1(vs2, vs1_scalar, vl)  // max
__riscv_vfredmin_vs_f32m1_f32m1(vs2, vs1_scalar, vl)  // min
```

The scalar operand `vs1` is always included in the reduction. Extract the result with `vmv_x_s` or `vfmv_f_s`.

## 14. Permutation

### 14.1 Slide

```c
__riscv_vslideup_vx_i32m1(dest, vs2, offset, vl)    // vd[i+offset] = vs2[i]
__riscv_vslidedown_vx_i32m1(vs2, offset, vl)         // vd[i] = vs2[i+offset]
__riscv_vslide1up_vx_i32m1(vs2, scalar, vl)          // vd[0]=scalar, vd[i+1]=vs2[i]
__riscv_vslide1down_vx_i32m1(vs2, scalar, vl)        // vd[i]=vs2[i+1], vd[vl-1]=scalar
__riscv_vfslide1up_vf_f32m1(vs2, fscalar, vl)        // FP variant
__riscv_vfslide1down_vf_f32m1(vs2, fscalar, vl)      // FP variant
```

### 14.2 Gather (arbitrary permutation)

```c
__riscv_vrgather_vv_i32m1(vs2, vs1_indices, vl)  // vd[i] = vs2[vs1[i]]
__riscv_vrgather_vx_i32m1(vs2, index, vl)         // splat one element
__riscv_vrgather_vx_i32m1(vs2, imm, vl)            // constant index; compiler may lower to ...vi
__riscv_vrgatherei16_vv_i32m1(vs2, vs1_idx16, vl)  // 16-bit indices for large vectors
```

If index ≥ VLMAX, result is 0.

### 14.3 Compress

```c
__riscv_vcompress_vm_i32m1(vs2, mask, vl)  // pack elements where mask=1
```

### 14.4 Whole-group copy

There is no dedicated C intrinsic that directly exposes the `vmv<nr>r.v` whole-register-group move instructions.

Use plain assignment for full register-group copies:
```c
vint32m4_t dst = src;                  // whole group copy
vint32m1_t dst2 = __riscv_vmv_v_v_i32m1(src2, vl);  // explicit vl-sized copy
```

## 15. Pseudo Intrinsics

```c
// vsetvl / vsetvlmax — see §5
// vreinterpret — see §12.4
// vundefined — placeholder for unspecified values; do not read before overwrite
__riscv_vundefined_i32m1()
// vget / vset — extract/insert from LMUL groups or tuple types; index must be compile-time constant
__riscv_vget_v_i32m2_i32m1(src, index)
__riscv_vset_v_i32m1_i32m2(dest, index, value)
// vlmul_trunc / vlmul_ext — truncate/extend LMUL (syntactic sugar for vget/vset with index 0)
__riscv_vlmul_trunc_v_i32m2_i32m1(src)
__riscv_vlmul_ext_v_i32m1_i32m2(src)
// vcreate — build larger LMUL from smaller pieces
__riscv_vcreate_v_i32m1_i32m2(v0, v1)
// vlenb — returns VLEN/8 (vector register length in bytes)
unsigned __riscv_vlenb()
// vid — write element index to each element
__riscv_vid_v_u32m1(vl)   // vd[i] = i
```
