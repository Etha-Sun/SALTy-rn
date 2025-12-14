#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vsigmoid_ukernel__rvv_rr2_p2_div(
    size_t batch,
    const xnn_float16* input,
    xnn_float16* output,
    const struct xnn_f16_default_params* params)
{
  // Constants matching NEON implementation
  const uint16_t magic_bias_bits = 0x660F;      // 0x1.83Cp+10h
  const uint16_t minus_log2e_bits = 0xBDC5;     // -0x1.714p+0h
  const uint16_t ln2_hi_bits = 0x398C;          // 0x1.630p-1h
  const uint16_t ln2_lo_bits = 0x8AF4;          // -0x1.BD0p-13h
  const uint16_t c2_bits = 0x37F9;              // 0x1.FE4p-2h
  const uint16_t c1_bits = 0xBC0E;              // -0x1.038p+0h
  const uint16_t one_bits = 0x3C00;             // 1.0h
  const uint16_t denorm_cutoff_bits = 0xC8DA;   // -0x1.368p+3h (negative)
  const uint16_t abs_denorm_cutoff_bits = 0x48DA; // 0x1.368p+3h (positive, |denorm_cutoff|)

  const _Float16 vmagic_bias = *(_Float16*)&magic_bias_bits;
  const _Float16 vminus_log2e = *(_Float16*)&minus_log2e_bits;
  const _Float16 vln2_hi = *(_Float16*)&ln2_hi_bits;
  const _Float16 vln2_lo = *(_Float16*)&ln2_lo_bits;
  const _Float16 vc2 = *(_Float16*)&c2_bits;
  const _Float16 vc1 = *(_Float16*)&c1_bits;
  const _Float16 vone = *(_Float16*)&one_bits;
  // Use absolute value of denorm_cutoff for comparison (matches NEON vcagtq_f16 behavior)
  const _Float16 vabs_denorm_cutoff = *(_Float16*)&abs_denorm_cutoff_bits;

  const uint16_t* i = (const uint16_t*)input;
  uint16_t* o = (uint16_t*)output;

  size_t n = batch / sizeof(uint16_t);

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m1(n);

    vfloat16m1_t vx = __riscv_vle16_v_f16m1((const _Float16*)i, vl);
    i += vl;

    // vz = |vx|
    vfloat16m1_t vz = __riscv_vfabs_v_f16m1(vx, vl);

    // vn = vmagic_bias + vz * vminus_log2e
    vfloat16m1_t vn = __riscv_vfmacc_vf_f16m1(
        __riscv_vfmv_v_f_f16m1(vmagic_bias, vl), vminus_log2e, vz, vl);

    // vs = (int16)(vn) << 10, reinterpreted as f16
    vint16m1_t vn_i = __riscv_vreinterpret_v_f16m1_i16m1(vn);
    vint16m1_t vs_i = __riscv_vsll_vx_i16m1(vn_i, 10, vl);
    vfloat16m1_t vs = __riscv_vreinterpret_v_i16m1_f16m1(vs_i);

    // vn = vn - vmagic_bias
    vn = __riscv_vfsub_vf_f16m1(vn, vmagic_bias, vl);

    // vt = vz + vn * vln2_hi
    vfloat16m1_t vt = __riscv_vfmacc_vf_f16m1(vz, vln2_hi, vn, vl);
    // vt = vt + vn * vln2_lo
    vt = __riscv_vfmacc_vf_f16m1(vt, vln2_lo, vn, vl);

    // vp = vc1 + vt * vc2
    vfloat16m1_t vp = __riscv_vfmacc_vv_f16m1(
        __riscv_vfmv_v_f_f16m1(vc1, vl), vt, __riscv_vfmv_v_f_f16m1(vc2, vl), vl);

    // vt = vt * vs
    vt = __riscv_vfmul_vv_f16m1(vt, vs, vl);

    // ve = vs + vp * vt
    vfloat16m1_t ve = __riscv_vfmacc_vv_f16m1(vs, vp, vt, vl);

    // vd = ve + 1.0
    vfloat16m1_t vd = __riscv_vfadd_vf_f16m1(ve, vone, vl);

    // vf = ve / vd
    vfloat16m1_t vf = __riscv_vfdiv_vv_f16m1(ve, vd, vl);

    // Denorm handling: if |vx| > |vdenorm_cutoff|, set vf to 0
    // This matches NEON: vbicq_u16(vf, vcagtq_f16(vx, vdenorm_cutoff))
    // vcagtq compares |vx| > |vdenorm_cutoff|
    vfloat16m1_t vabs_x = __riscv_vfabs_v_f16m1(vx, vl);
    vbool16_t vdenorm_mask = __riscv_vmfgt_vf_f16m1_b16(vabs_x, vabs_denorm_cutoff, vl);

    vuint16m1_t vf_u = __riscv_vreinterpret_v_f16m1_u16m1(vf);
    vf_u = __riscv_vmerge_vxm_u16m1(vf_u, 0, vdenorm_mask, vl);
    vf = __riscv_vreinterpret_v_u16m1_f16m1(vf_u);

    // Final selection: if vx < 0, keep vf; else use (1 - vf)
    // This matches NEON: vbslq_f16(vm, vf, vsubq_f16(vone, vf))
    vbool16_t vm = __riscv_vmflt_vf_f16m1_b16(vx, (_Float16)0.0f, vl);

    vfloat16m1_t vone_minus_f = __riscv_vfrsub_vf_f16m1(vf, vone, vl);
    vf = __riscv_vmerge_vvm_f16m1(vone_minus_f, vf, vm, vl);

    __riscv_vse16_v_f16m1((_Float16*)o, vf, vl);
    o += vl;
    n -= vl;
  }
}
}
