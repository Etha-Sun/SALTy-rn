#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

void test_rvv(
    size_t batch,
    const uint8_t* input_a,
    const uint8_t* input_b,
    uint8_t* output,
    const struct xnn_qu8_add_minmax_params* restrict params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  const uint8_t a_zp = params->scalar.a_zero_point;
  const uint8_t b_zp = params->scalar.b_zero_point;
  const int32_t a_mult = params->scalar.a_multiplier;
  const int32_t b_mult = params->scalar.b_multiplier;
  const int32_t shift = params->scalar.shift;
  const int32_t out_zp = (int32_t)params->scalar.output_zero_point;
  const uint8_t out_min = params->scalar.output_min;
  const uint8_t out_max = params->scalar.output_max;

  // Base bias calculation: - (a_zero_point * a_multiplier + b_zero_point * b_multiplier)
  // Using modulo 2^32 arithmetic handles any potential overflow natively.
  const int32_t bias = (int32_t)(-(uint32_t)a_zp * (uint32_t)a_mult - (uint32_t)b_zp * (uint32_t)b_mult);

  // OPTIMIZATION: Loop unswitching and kernel specialization.
  // When a_mult == b_mult, we can pre-add the 8-bit inputs using a widening add.
  // This reduces the number of 3-cycle MulPipe instructions per loop by 50%.
  if (shift >= 0) {
    const int32_t rounding_const = (shift > 0) ? (1 << (shift - 1)) : 0;
    const int32_t fused_bias = bias + rounding_const + (out_zp << shift);
    
    const size_t vlmax = __riscv_vsetvlmax_e32m8();
    vint32m8_t vfbias = __riscv_vmv_v_x_i32m8(fused_bias, vlmax);

    if (a_mult == b_mult) {
      // Specialized path for symmetric multipliers
      while (batch > 0) {
        const size_t vl = __riscv_vsetvl_e8m2(batch);

        vuint8m2_t va8 = __riscv_vle8_v_u8m2(input_a, vl);
        vuint8m2_t vb8 = __riscv_vle8_v_u8m2(input_b, vl);

        // Pre-add inputs: u8 + u8 -> u16 (vwaddu uses IntPipe, 1 cycle)
        vuint16m4_t vsum16 = __riscv_vwaddu_vv_u16m4(va8, vb8, vl);
        // Extend to 32-bit (vzext uses IntPipe, 1 cycle)
        vuint32m8_t vsum32_u = __riscv_vzext_vf2_u32m8(vsum16, vl);
        vint32m8_t vsum32 = __riscv_vreinterpret_v_u32m8_i32m8(vsum32_u);

        // Single multiplication: vacc = (vsum32 * a_mult) + fused_bias (MulPipe, 3 cycles)
        vint32m8_t vacc = __riscv_vmadd_vx_i32m8(vsum32, a_mult, vfbias, vl);

        vint16m4_t vacc16 = __riscv_vnsra_wx_i16m4(vacc, (size_t)shift, vl);
        vuint16m4_t vacc16_u = __riscv_vreinterpret_v_i16m4_u16m4(vacc16);
        vuint8m2_t vout = __riscv_vnclipu_wx_u8m2(vacc16_u, 0, __RISCV_VXRM_RDN, vl);

        vout = __riscv_vmaxu_vx_u8m2(vout, out_min, vl);
        vout = __riscv_vminu_vx_u8m2(vout, out_max, vl);

        __riscv_vse8_v_u8m2(output, vout, vl);

        input_a += vl;
        input_b += vl;
        output += vl;
        batch -= vl;
      }
    } else {
      // Fallback path for differing multipliers
      while (batch > 0) {
        const size_t vl = __riscv_vsetvl_e8m2(batch);
        vuint8m2_t va8 = __riscv_vle8_v_u8m2(input_a, vl);
        vuint8m2_t vb8 = __riscv_vle8_v_u8m2(input_b, vl);

        vuint32m8_t va32_u = __riscv_vzext_vf4_u32m8(va8, vl);
        vint32m8_t va32 = __riscv_vreinterpret_v_u32m8_i32m8(va32_u);
        vint32m8_t vacc = __riscv_vmadd_vx_i32m8(va32, a_mult, vfbias, vl);

        vuint32m8_t vb32_u = __riscv_vzext_vf4_u32m8(vb8, vl);
        vint32m8_t vb32 = __riscv_vreinterpret_v_u32m8_i32m8(vb32_u);
        vacc = __riscv_vmacc_vx_i32m8(vacc, b_mult, vb32, vl);

        vint16m4_t vacc16 = __riscv_vnsra_wx_i16m4(vacc, (size_t)shift, vl);
        vuint16m4_t vacc16_u = __riscv_vreinterpret_v_i16m4_u16m4(vacc16);
        vuint8m2_t vout = __riscv_vnclipu_wx_u8m2(vacc16_u, 0, __RISCV_VXRM_RDN, vl);

        vout = __riscv_vmaxu_vx_u8m2(vout, out_min, vl);
        vout = __riscv_vminu_vx_u8m2(vout, out_max, vl);

        __riscv_vse8_v_u8m2(output, vout, vl);

        input_a += vl;
        input_b += vl;
        output += vl;
        batch -= vl;
      }
    }
  } else {
    // shift < 0
    const int32_t s = (int32_t)-(uint32_t)shift;
    const int32_t fused_a_mult = a_mult << s;
    const int32_t fused_b_mult = b_mult << s;
    const int32_t fused_bias = (bias << s) + out_zp;

    const size_t vlmax = __riscv_vsetvlmax_e32m8();
    vint32m8_t vfbias = __riscv_vmv_v_x_i32m8(fused_bias, vlmax);

    if (a_mult == b_mult) {
      while (batch > 0) {
        const size_t vl = __riscv_vsetvl_e8m2(batch);
        vuint8m2_t va8 = __riscv_vle8_v_u8m2(input_a, vl);
        vuint8m2_t vb8 = __riscv_vle8_v_u8m2(input_b, vl);

        vuint16m4_t vsum16 = __riscv_vwaddu_vv_u16m4(va8, vb8, vl);
        vuint32m8_t vsum32_u = __riscv_vzext_vf2_u32m8(vsum16, vl);
        vint32m8_t vsum32 = __riscv_vreinterpret_v_u32m8_i32m8(vsum32_u);

        vint32m8_t vacc = __riscv_vmadd_vx_i32m8(vsum32, fused_a_mult, vfbias, vl);

        vint16m4_t vacc16 = __riscv_vnsra_wx_i16m4(vacc, 0, vl);
        vuint16m4_t vacc16_u = __riscv_vreinterpret_v_i16m4_u16m4(vacc16);
        vuint8m2_t vout = __riscv_vnclipu_wx_u8m2(vacc16_u, 0, __RISCV_VXRM_RDN, vl);

        vout = __riscv_vmaxu_vx_u8m2(vout, out_min, vl);
        vout = __riscv_vminu_vx_u8m2(vout, out_max, vl);

        __riscv_vse8_v_u8m2(output, vout, vl);

        input_a += vl;
        input_b += vl;
        output += vl;
        batch -= vl;
      }
    } else {
      while (batch > 0) {
        const size_t vl = __riscv_vsetvl_e8m2(batch);
        vuint8m2_t va8 = __riscv_vle8_v_u8m2(input_a, vl);
        vuint8m2_t vb8 = __riscv_vle8_v_u8m2(input_b, vl);

        vuint32m8_t va32_u = __riscv_vzext_vf4_u32m8(va8, vl);
        vint32m8_t va32 = __riscv_vreinterpret_v_u32m8_i32m8(va32_u);
        vint32m8_t vacc = __riscv_vmadd_vx_i32m8(va32, fused_a_mult, vfbias, vl);

        vuint32m8_t vb32_u = __riscv_vzext_vf4_u32m8(vb8, vl);
        vint32m8_t vb32 = __riscv_vreinterpret_v_u32m8_i32m8(vb32_u);
        vacc = __riscv_vmacc_vx_i32m8(vacc, fused_b_mult, vb32, vl);

        vint16m4_t vacc16 = __riscv_vnsra_wx_i16m4(vacc, 0, vl);
        vuint16m4_t vacc16_u = __riscv_vreinterpret_v_i16m4_u16m4(vacc16);
        vuint8m2_t vout = __riscv_vnclipu_wx_u8m2(vacc16_u, 0, __RISCV_VXRM_RDN, vl);

        vout = __riscv_vmaxu_vx_u8m2(vout, out_min, vl);
        vout = __riscv_vminu_vx_u8m2(vout, out_max, vl);

        __riscv_vse8_v_u8m2(output, vout, vl);

        input_a += vl;
        input_b += vl;
        output += vl;
        batch -= vl;
      }
    }
  }
}
