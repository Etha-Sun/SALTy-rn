# NEON-to-RVV Translation Examples

Three annotated XNNPACK kernel translations, ordered by complexity. Each example shows the complete NEON source and its RVV translation with inline annotations referencing the translation rules.

---

## Example 1: Floating-Point Scalar Multiply (`f32-vmulc`)

**What it does**: Multiplies every element of `input_a` by a single scalar from `input_b[0]`.

**Key patterns**: Loop structure change (rule 1), tail handling elimination (rule 2), broadcast load removal, scalar operand form (rule 54).

### NEON (source)

```c
void xnn_f32_vmulc_ukernel__neon_u4(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  // Broadcast scalar into all 4 lanes of a 128-bit register
  const float32x4_t vb = vld1q_dup_f32(input_b);

  // Main loop: 4 floats (128 bits) per iteration
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    const float32x4_t va = vld1q_f32(input_a); input_a += 4;
    float32x4_t vacc = vmulq_f32(va, vb);
    vst1q_f32(output, vacc); output += 4;
  }

  // Tail: handle remaining 1-3 elements with half-register ops
  if XNN_UNLIKELY(batch != 0) {
    const float32x4_t va = vld1q_f32(input_a);
    float32x4_t vacc = vmulq_f32(va, vb);

    float32x2_t vacc_lo = vget_low_f32(vacc);
    if (batch & (2 * sizeof(float))) {
      vst1_f32(output, vacc_lo); output += 2;
      vacc_lo = vget_high_f32(vacc);
    }
    if (batch & (1 * sizeof(float))) {
      vst1_lane_f32(output, vacc_lo, 0);
    }
  }
}
```

### RVV (translation)

```c
void xnn_f32_vmulc_ukernel__rvv_u4(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params)
{
    assert(batch != 0);
    assert(batch % sizeof(float) == 0);
    assert(input_a != NULL);
    assert(input_b != NULL);
    assert(output != NULL);

    // [Rule 1] Convert byte count to element count for vsetvl
    size_t n = batch / sizeof(float);

    // [Rule 1] Single VLA stripmine loop replaces main loop + tail
    // [Rule 2] No separate tail handling needed — final iteration
    //          naturally uses a smaller vl
    while (n > 0) {
        size_t vl = __riscv_vsetvl_e32m2(n);
        vfloat32m2_t va = __riscv_vle32_v_f32m2(input_a, vl);

        // [Rule 54] NEON vld1q_dup_f32 + vmulq_f32 collapses to
        //           the _vf scalar-operand form. The broadcast
        //           is implicit in the instruction.
        vfloat32m2_t vacc = __riscv_vfmul_vf_f32m2(va, *input_b, vl);

        __riscv_vse32_v_f32m2(output, vacc, vl);
        input_a += vl;
        output += vl;
        n -= vl;
    }
}
```

### Translation notes

| NEON construct | RVV replacement | Rule |
|---|---|---|
| Fixed 128-bit loop `batch >= 4 * sizeof(float)` | `vsetvl_e32m2(n)` stripmine loop | 1 |
| Bitwise tail: `batch & (2*sizeof)`, `batch & (1*sizeof)` | Eliminated — VLA loop handles all sizes | 2 |
| `vld1q_dup_f32(input_b)` broadcast + `vmulq_f32` | `vfmul_vf` scalar operand form | 54 |
| `vget_low_f32`, `vget_high_f32` half-register ops | Not needed — no tail split | 3 |

---

## Example 2: Quantized Int8 Addition with Constant (`qs8-vaddc`)

**What it does**: Quantized addition of `input_a[i]` + `input_b[0]` with per-channel zero-point subtraction, scaling via integer multiply + rounding shift, and output clamping.

**Key patterns**: Widening chains (rules 12, 46), integer multiply-accumulate (rule 25), rounding shift right (rules 19-20), saturating narrow (rule 47), LMUL replaces manual unrolling (pattern 7.1).

### NEON (source)

```c
void xnn_qs8_vaddc_minmax_ukernel__neon_ld128_u16(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const int8x16_t va_zero_point = vdupq_n_s8(params->scalar.a_zero_point);
  const int32x4_t va_multiplier = vdupq_n_s32(params->scalar.a_multiplier);
  const int32x4_t vright_shift = vdupq_n_s32(-params->scalar.shift);
  const int16x8_t voutput_zero_point = vdupq_n_s16(params->scalar.output_zero_point);
  const int8x16_t voutput_min = vdupq_n_s8(params->scalar.output_min);
  const int8x16_t voutput_max = vdupq_n_s8(params->scalar.output_max);

  // Pre-compute bias: (input_b - b_zero_point) * b_multiplier
  const int32_t vxb = (int32_t)*input_b - (int32_t)params->scalar.b_zero_point;
  const int32_t vb = params->scalar.b_multiplier;
  const int32x4_t vbias = vdupq_n_s32(vxb * vb);

  // Main loop: 16 int8 elements per iteration
  for (; batch >= 16 * sizeof(int8_t); batch -= 16 * sizeof(int8_t)) {
    const int8x16_t va0123456789ABCDEF = vld1q_s8(input_a); input_a += 16;

    // Widen: int8 -> int16 via subtract zero point
    const int16x8_t vxa01234567 = vsubl_s8(
        vget_low_s8(va0123456789ABCDEF), vget_low_s8(va_zero_point));
    const int16x8_t vxa89ABCDEF = vsubl_high_s8(
        va0123456789ABCDEF, va_zero_point);

    // Widen + multiply-accumulate: int16 -> int32
    // bias + (zero-pointed input * multiplier)
    int32x4_t vacc0123 = vmlaq_s32(vbias,
        vmovl_s16(vget_low_s16(vxa01234567)), va_multiplier);
    int32x4_t vacc4567 = vmlaq_s32(vbias,
        vmovl_s16(vget_high_s16(vxa01234567)), va_multiplier);
    int32x4_t vacc89AB = vmlaq_s32(vbias,
        vmovl_s16(vget_low_s16(vxa89ABCDEF)), va_multiplier);
    int32x4_t vaccCDEF = vmlaq_s32(vbias,
        vmovl_s16(vget_high_s16(vxa89ABCDEF)), va_multiplier);

    // Rounding shift right (negative shift = right shift in vrshl)
    vacc0123 = vrshlq_s32(vacc0123, vright_shift);
    vacc4567 = vrshlq_s32(vacc4567, vright_shift);
    vacc89AB = vrshlq_s32(vacc89AB, vright_shift);
    vaccCDEF = vrshlq_s32(vaccCDEF, vright_shift);

    // Saturating narrow int32 -> int16, add output zero point
    const int16x8_t vacc01234567 = vqaddq_s16(
        vcombine_s16(vqmovn_s32(vacc0123), vqmovn_s32(vacc4567)),
        voutput_zero_point);
    const int16x8_t vacc89ABCDEF = vqaddq_s16(
        vcombine_s16(vqmovn_s32(vacc89AB), vqmovn_s32(vaccCDEF)),
        voutput_zero_point);

    // Saturating narrow int16 -> int8
    int8x16_t vout0123456789ABCDEF = vcombine_s8(
        vqmovn_s16(vacc01234567), vqmovn_s16(vacc89ABCDEF));

    // Clamp
    vout0123456789ABCDEF = vmaxq_s8(vout0123456789ABCDEF, voutput_min);
    vout0123456789ABCDEF = vminq_s8(vout0123456789ABCDEF, voutput_max);

    vst1q_s8(output, vout0123456789ABCDEF); output += 16;
  }
  // ... tail handling with 8-element and scalar fallbacks omitted ...
}
```

### RVV (translation)

```c
void xnn_qs8_vaddc_minmax_ukernel__rvv_u1v(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* params)
{
    assert(batch != 0);
    assert(batch % sizeof(int8_t) == 0);
    assert(input_a != NULL);
    assert(input_b != NULL);
    assert(output != NULL);

    // --- Scalar Pre-computation ---

    // Same bias calculation as NEON
    const int32_t b_val = (int32_t)*input_b - (int32_t)params->scalar.b_zero_point;
    int32_t scalar_bias = b_val * params->scalar.b_multiplier;

    // KERNEL-SPECIFIC REWRITE — not the general translation rule.
    // The general rule (rule 20) maps vrshr to vssra/vssrl with
    // __RISCV_VXRM_RNU. This kernel instead pre-adds the rounding
    // offset (1 << (shift-1)) into the bias and uses plain vsra,
    // which is algebraically equivalent but folds the rounding cost
    // into the scalar preamble. This works here because there is a
    // single shared bias that every element uses.
    // For the general case, prefer vssra/vssrl with explicit vxrm.
    const uint32_t shift = (uint32_t)params->scalar.shift;
    if (shift > 0) {
        scalar_bias += (1 << (shift - 1));
    }

    const int8_t a_zp = params->scalar.a_zero_point;
    const int32_t a_mult = params->scalar.a_multiplier;
    const int16_t out_zp = params->scalar.output_zero_point;
    const int8_t out_min = params->scalar.output_min;
    const int8_t out_max = params->scalar.output_max;

    // [Rule 1, Pattern 7.1] Single VLA loop replaces 16-element
    // main loop + 8-element + scalar tail paths.
    // LMUL=2 at int8 -> LMUL=4 at int16 -> LMUL=8 at int32.
    size_t vl;

    for (; batch > 0; batch -= vl, input_a += vl, output += vl) {
        // [Rule 14] SEW/LMUL ratio stays constant across widths:
        // e8m2 -> e16m4 -> e32m8
        vl = __riscv_vsetvl_e8m2(batch);

        vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);

        // [Rule 12, 46] Widening chain replaces NEON's split-half pattern:
        //   NEON: vsubl_s8(vget_low) + vsubl_high_s8 (two halves)
        //   RVV: single vwsub covers all elements at once
        vint16m4_t va_16 = __riscv_vwsub_vx_i16m4(va, a_zp, vl);

        // [Rule 12] Continue widening: int16 -> int32
        //   NEON: vmovl_s16(vget_low/high) (four quarter-vectors)
        //   RVV: single vsext_vf2
        vint32m8_t va_32 = __riscv_vsext_vf2_i32m8(va_16, vl);

        // [Rule 25] Integer multiply-accumulate
        //   NEON: vmlaq_s32(bias, widened_input, multiplier)
        //   RVV: vmv(bias) + vmacc(multiplier, input)
        vint32m8_t vacc = __riscv_vmv_v_x_i32m8(scalar_bias, vl);
        vacc = __riscv_vmacc_vx_i32m8(vacc, a_mult, va_32, vl);

        // Rounding shift right (kernel-specific rewrite — see preamble)
        //   NEON: vrshlq_s32(acc, -shift) — rounds to nearest
        //   RVV: plain vsra — rounding offset was folded into bias above.
        //   General rule (rule 20): use vssra with __RISCV_VXRM_RNU.
        vacc = __riscv_vsra_vx_i32m8(vacc, shift, vl);

        // [Rule 47] Saturating narrow: int32 -> int16
        //   NEON: vqmovn_s32 (four calls + vcombine)
        //   RVV: vnclip shift 0 (single instruction, all elements)
        vint16m4_t vout_16 = __riscv_vnclip_wi_i16m4(vacc, 0, vl);

        // [Rule 17] Saturating add: output zero point
        //   NEON: vqaddq_s16
        //   RVV: vsadd_vx
        vout_16 = __riscv_vsadd_vx_i16m4(vout_16, out_zp, vl);

        // [Rule 47] Saturating narrow: int16 -> int8
        vint8m2_t vout_8 = __riscv_vnclip_wi_i8m2(vout_16, 0, vl);

        // Clamp: integer vmax/vmin map directly
        vout_8 = __riscv_vmax_vx_i8m2(vout_8, out_min, vl);
        vout_8 = __riscv_vmin_vx_i8m2(vout_8, out_max, vl);

        __riscv_vse8_v_i8m2(output, vout_8, vl);
    }
}
```

### Translation notes

| NEON construct | RVV replacement | Rule |
|---|---|---|
| `vsubl_s8` + `vsubl_high_s8` (two halves) | Single `vwsub_vx` widening subtract | 12, 46 |
| `vmovl_s16(vget_low/high)` (four quarters) | Single `vsext_vf2` | 12, 46 |
| `vmlaq_s32(bias, input, mult)` | `vmv(bias)` + `vmacc_vx` | 25 |
| `vrshlq_s32(acc, -shift)` (rounding shift) | Pre-add `(1 << (shift-1))` to bias + `vsra` (kernel-specific; general rule 20: use `vssra` + `vxrm=RNU`) | Special case |
| `vqmovn_s32` + `vcombine_s16` (four narrows) | Single `vnclip_wi` shift 0 | 47 |
| `vqaddq_s16` (saturating add) | `vsadd_vx` | 17 |
| `vqmovn_s16` + `vcombine_s8` | Single `vnclip_wi` shift 0 | 47 |
| 16-element main loop + 8/4/2/1 tail | Single `vsetvl_e8m2` loop | 1, 2 |
| Four parallel 4-lane accumulators | One wide-LMUL accumulator (m8) | 7.1 |

---

## Example 3: Quantized Int8 Multiply with FP Scaling (`qs8-vmul`)

**What it does**: Elementwise quantized multiply: subtract zero-points, widening int8 multiply to int32, convert to float, scale, convert back to int32, saturating narrow to int8 with clamping.

**Key patterns**: Widening multiply (rule 25), int-to-float and float-to-int conversions (section 6), magic-bias recognition (rule 9), saturating narrow chains (rule 47), algorithmic rewrite where magic-bias is replaced by direct conversion.

### NEON (source)

```c
void xnn_qs8_vmul_minmax_fp32_ukernel__neon_ld128_u16(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const union xnn_qs8_mul_minmax_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(int8_t) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const int8x16_t va_zero_point = vdupq_n_s8(params->scalar.a_zero_point);
  const int8x16_t vb_zero_point = vdupq_n_s8(params->scalar.b_zero_point);
  const float32x4_t vscale = vdupq_n_f32(params->scalar.scale);

  // [Rule 9] Magic-bias constants for IEEE-754-based float-to-int rounding
  const float32x4_t vmagic_bias = vdupq_n_f32(12582912.0f);
  const int32x4_t vmagic_bias_less_output_zero_point =
      vdupq_n_s32(INT32_C(0x4B400000) - (int32_t)params->scalar.output_zero_point);

  const int8x16_t voutput_min = vdupq_n_s8(params->scalar.output_min);
  const int8x16_t voutput_max = vdupq_n_s8(params->scalar.output_max);

  for (; batch >= 16 * sizeof(int8_t); batch -= 16 * sizeof(int8_t)) {
    const int8x16_t va0123456789ABCDEF = vld1q_s8(input_a); input_a += 16;
    const int8x16_t vb0123456789ABCDEF = vld1q_s8(input_b); input_b += 16;

    // Widen: int8 -> int16, subtract zero points
    const int16x8_t vxa01234567 = vsubl_s8(
        vget_low_s8(va0123456789ABCDEF), vget_low_s8(va_zero_point));
    const int16x8_t vxa89ABCDEF = vsubl_high_s8(
        va0123456789ABCDEF, va_zero_point);
    const int16x8_t vxb01234567 = vsubl_s8(
        vget_low_s8(vb0123456789ABCDEF), vget_low_s8(vb_zero_point));
    const int16x8_t vxb89ABCDEF = vsubl_high_s8(
        vb0123456789ABCDEF, vb_zero_point);

    // Widening multiply: int16 * int16 -> int32
    int32x4_t vacc0123 = vmull_s16(
        vget_low_s16(vxa01234567), vget_low_s16(vxb01234567));
    int32x4_t vacc4567 = vmull_s16(
        vget_high_s16(vxa01234567), vget_high_s16(vxb01234567));
    int32x4_t vacc89AB = vmull_s16(
        vget_low_s16(vxa89ABCDEF), vget_low_s16(vxb89ABCDEF));
    int32x4_t vaccCDEF = vmull_s16(
        vget_high_s16(vxa89ABCDEF), vget_high_s16(vxb89ABCDEF));

    // Convert int32 -> float32, apply scale
    float32x4_t vfpacc0123 = vcvtq_f32_s32(vacc0123);
    float32x4_t vfpacc4567 = vcvtq_f32_s32(vacc4567);
    float32x4_t vfpacc89AB = vcvtq_f32_s32(vacc89AB);
    float32x4_t vfpaccCDEF = vcvtq_f32_s32(vaccCDEF);

    vfpacc0123 = vmulq_f32(vfpacc0123, vscale);
    vfpacc4567 = vmulq_f32(vfpacc4567, vscale);
    vfpacc89AB = vmulq_f32(vfpacc89AB, vscale);
    vfpaccCDEF = vmulq_f32(vfpaccCDEF, vscale);

    // [Rule 9] Magic-bias round-to-nearest trick:
    //   Add 12582912.0f (1.5 * 2^23), reinterpret as int32.
    //   The mantissa bits now hold the correctly-rounded integer
    //   value offset by the magic bias. Subtract the adjusted bias
    //   to get the final int32 with output_zero_point baked in.
    vacc0123 = vreinterpretq_s32_f32(vaddq_f32(vfpacc0123, vmagic_bias));
    vacc4567 = vreinterpretq_s32_f32(vaddq_f32(vfpacc4567, vmagic_bias));
    vacc89AB = vreinterpretq_s32_f32(vaddq_f32(vfpacc89AB, vmagic_bias));
    vaccCDEF = vreinterpretq_s32_f32(vaddq_f32(vfpaccCDEF, vmagic_bias));

    vacc0123 = vqsubq_s32(vacc0123, vmagic_bias_less_output_zero_point);
    vacc4567 = vqsubq_s32(vacc4567, vmagic_bias_less_output_zero_point);
    vacc89AB = vqsubq_s32(vacc89AB, vmagic_bias_less_output_zero_point);
    vaccCDEF = vqsubq_s32(vaccCDEF, vmagic_bias_less_output_zero_point);

    // Saturating narrow: int32 -> int16 -> int8
    int16x8_t vacc01234567 = vqmovn_high_s32(vqmovn_s32(vacc0123), vacc4567);
    int16x8_t vacc89ABCDEF = vqmovn_high_s32(vqmovn_s32(vacc89AB), vaccCDEF);

    int8x16_t vout0123456789ABCDEF = vqmovn_high_s16(
        vqmovn_s16(vacc01234567), vacc89ABCDEF);

    // Clamp
    vout0123456789ABCDEF = vmaxq_s8(vout0123456789ABCDEF, voutput_min);
    vout0123456789ABCDEF = vminq_s8(vout0123456789ABCDEF, voutput_max);

    vst1q_s8(output, vout0123456789ABCDEF); output += 16;
  }
  // ... tail handling omitted ...
}
```

### RVV (translation)

```c
void xnn_qs8_vmul_minmax_fp32_ukernel__rvv_u16(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const union xnn_qs8_mul_minmax_params* params)
{
    const int8_t a_zero_point = params->scalar.a_zero_point;
    const int8_t b_zero_point = params->scalar.b_zero_point;
    const float scale = params->scalar.scale;
    const int16_t output_zero_point = params->scalar.output_zero_point;
    const int8_t output_min = params->scalar.output_min;
    const int8_t output_max = params->scalar.output_max;

    // [Rule 1] Single VLA loop — no tail handling
    while (batch > 0) {
        size_t vl = __riscv_vsetvl_e8m2(batch);

        vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);
        vint8m2_t vb = __riscv_vle8_v_i8m2(input_b, vl);

        // [Rule 12] Widen int8 -> int16, subtract zero points
        //   NEON: vsubl_s8 (widening subtract in one step)
        //   RVV: vsext_vf2 then vsub_vx (extend + subtract)
        vint16m4_t vxa = __riscv_vsub_vx_i16m4(
            __riscv_vsext_vf2_i16m4(va, vl), (int16_t)a_zero_point, vl);
        vint16m4_t vxb = __riscv_vsub_vx_i16m4(
            __riscv_vsext_vf2_i16m4(vb, vl), (int16_t)b_zero_point, vl);

        // [Rule 25] Widening multiply: int16 * int16 -> int32
        //   NEON: vmull_s16 on four quarter-vectors
        //   RVV: single vwmul_vv covers all elements
        vint32m8_t vacc = __riscv_vwmul_vv_i32m8(vxa, vxb, vl);

        // Int32 -> float32 conversion, then scale
        //   NEON: vcvtq_f32_s32 + vmulq_f32 (four register sets)
        //   RVV: vfcvt_f_x + vfmul_vf (one pass)
        vfloat32m8_t vfpacc = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);
        vfpacc = __riscv_vfmul_vf_f32m8(vfpacc, scale, vl);

        // [Rule 9] ALGORITHMIC CHANGE: Magic-bias trick replaced by
        //   direct float-to-int conversion + add zero point.
        //
        //   NEON uses:
        //     vaddq_f32(scaled, 12582912.0f)  ->  vreinterpretq_s32_f32
        //     -> vqsubq_s32(result, magic_bias_less_zp)
        //   This is a bitwise IEEE-754 trick for round-to-nearest.
        //
        //   RVV uses:
        //     vfcvt_x_f (implicit frm) + vadd_vx(zp)
        //   This relies on the frozen FP environment where frm=RNE
        //   (the RISC-V default, matching the frozen AArch64 profile).
        //   Under that assumption both produce the same RNE-rounded
        //   integer. If frm were changed by surrounding code, this
        //   would silently produce wrong results — the _rm explicit
        //   form (__riscv_vfcvt_x_f_v_i32m8_rm with __RISCV_FRM_RNE)
        //   would be safer but is not used by this XNNPACK kernel.
        //   See "Correctness domain" below.
        vacc = __riscv_vfcvt_x_f_v_i32m8(vfpacc, vl);
        vacc = __riscv_vadd_vx_i32m8(vacc, (int32_t)output_zero_point, vl);

        // [Rule 47] Saturating narrow: int32 -> int16 -> int8
        //   NEON: vqmovn_s32 + vcombine + vqmovn_s16 + vcombine
        //         (eight intrinsic calls for 16 elements)
        //   RVV: two vnclip calls (all elements at once)
        vint16m4_t vout16 = __riscv_vnclip_wx_i16m4(
            vacc, 0, __RISCV_VXRM_RDN, vl);
        vint8m2_t vout = __riscv_vnclip_wx_i8m2(
            vout16, 0, __RISCV_VXRM_RDN, vl);

        // Clamp
        vout = __riscv_vmax_vx_i8m2(vout, output_min, vl);
        vout = __riscv_vmin_vx_i8m2(vout, output_max, vl);

        __riscv_vse8_v_i8m2(output, vout, vl);

        input_a += vl;
        input_b += vl;
        output += vl;
        batch -= vl;
    }
}
```

### Translation notes

| NEON construct | RVV replacement | Rule |
|---|---|---|
| `vsubl_s8` (widening subtract) | `vsext_vf2` + `vsub_vx` | 12 |
| `vmull_s16` (four quarter-vector calls) | Single `vwmul_vv` | 25, 46 |
| `vcvtq_f32_s32` / `vmulq_f32` (four sets) | `vfcvt_f_x` + `vfmul_vf` (one pass) | Section 6 |
| Magic-bias: `vaddq_f32(x, 12582912.0f)` + `vreinterpretq_s32_f32` + `vqsubq_s32` | Direct `vfcvt_x_f` (implicit `frm=RNE`) + `vadd_vx(zp)` — relies on frozen FP env | 9 |
| `vqmovn_s32` + `vcombine` + `vqmovn_s16` + `vcombine` | Two `vnclip` calls | 47 |
| 16-element main loop + 8/4/2/1 tail | Single `vsetvl_e8m2` loop | 1, 2 |

### Correctness domain for the magic-bias replacement

The NEON magic-bias pattern `vaddq_f32(x, 1.5f * 2^23f)` followed by `vreinterpretq_s32_f32` and `vqsubq_s32(result, 0x4B400000 - zp)` implements round-to-nearest-even float-to-int conversion by exploiting IEEE-754 mantissa alignment. The result is mathematically identical to `(int32_t)roundf(x) + output_zero_point` for values whose magnitude fits in 23 mantissa bits (roughly ±2^23).

The RVV translation replaces this with `vfcvt_x_f` followed by `vadd_vx(output_zero_point)`.

**Frozen-environment requirement**: `vfcvt_x_f` (without the `_rm` suffix) uses the implicit `frm` CSR. This kernel assumes the frozen FP environment (`frm = RNE`), which is the RISC-V default and matches the frozen AArch64 `RMode = RNE` profile. If `frm` were changed by surrounding code, the conversion would silently use the wrong rounding mode. New translations should prefer the explicit `_rm` form (`__riscv_vfcvt_x_f_v_i32m8_rm(src, __RISCV_FRM_RNE, vl)`) per rule 19's guidance that rounding-sensitive ops should not rely on ambient state.

**Restricted domain**: This rewrite is exact under the following preconditions, which hold by construction in quantized XNNPACK kernels:

1. **`frm = RNE`** — the frozen FP environment guarantees this.
2. **Inputs are finite and in int32 range** — the scaled products of two int8 values (range ±127²·scale) are always far within ±2^31. NaN and ±Inf cannot arise from `vfcvt_f_x` on a finite integer followed by `vfmul_vf` with a finite scale, so the NaN fixup from translation rule section 6 is not needed here.
3. **Both sides use RNE** — the magic-bias trick produces an RNE-rounded integer by construction; `vfcvt_x_f` under `frm=RNE` produces the same RNE-rounded integer.

Under these preconditions, both sides produce bit-identical int32 values before clamping. The min/max clamp is a functional requirement of the kernel (output must be in `[output_min, output_max]`), not a correctness patch for the conversion.

**This is a kernel-specific algorithmic rewrite, not a general conversion rule.** For the general case of `vcvt[q]_s32_f32` (which uses RTZ, not RNE), see the conversion table in translation_rules.md section 6.
