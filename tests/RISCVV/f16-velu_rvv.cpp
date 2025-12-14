#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
   void xnn_f16_velu_ukernel__rvv_rr1_p3(
    size_t batch,
    const _Float16* input,
    _Float16* output,
    const struct xnn_f16_elu_params* params)
{
  const uint16_t sat_cutoff_bits = UINT16_C(0xC829);
  const uint16_t magic_bias_bits = UINT16_C(0x660F);
  const uint16_t log2e_bits = UINT16_C(0x3DC5);
  const uint16_t minus_ln2_bits = UINT16_C(0xB98C);
  const uint16_t c3_bits = UINT16_C(0x315B);
  const uint16_t c2_bits = UINT16_C(0x3808);

  _Float16 vsat_cutoff;
  _Float16 vmagic_bias;
  _Float16 vlog2e;
  _Float16 vminus_ln2;
  _Float16 vc3;
  _Float16 vc2;

  __builtin_memcpy(&vsat_cutoff, &sat_cutoff_bits, sizeof(vsat_cutoff));
  __builtin_memcpy(&vmagic_bias, &magic_bias_bits, sizeof(vmagic_bias));
  __builtin_memcpy(&vlog2e, &log2e_bits, sizeof(vlog2e));
  __builtin_memcpy(&vminus_ln2, &minus_ln2_bits, sizeof(vminus_ln2));
  __builtin_memcpy(&vc3, &c3_bits, sizeof(vc3));
  __builtin_memcpy(&vc2, &c2_bits, sizeof(vc2));

  _Float16 vprescale;
  _Float16 valpha;
  _Float16 vbeta;
  __builtin_memcpy(&vprescale, &params->scalar.prescale, sizeof(vprescale));
  __builtin_memcpy(&valpha, &params->scalar.alpha, sizeof(valpha));
  __builtin_memcpy(&vbeta, &params->scalar.beta, sizeof(vbeta));
  _Float16 vminus_alpha = -valpha;

  size_t n = batch / sizeof(uint16_t);
  const _Float16* i = input;
  _Float16* o = output;

  while (n > 0) {
    size_t vl = __riscv_vsetvl_e16m1(n);

    vfloat16m1_t vx = __riscv_vle16_v_f16m1(i, vl);
    i += vl;

    vfloat16m1_t vz = __riscv_vfmul_vf_f16m1(vx, vprescale, vl);
    vz = __riscv_vfmax_vf_f16m1(vz, vsat_cutoff, vl);

    vfloat16m1_t vn = __riscv_vfmacc_vf_f16m1(__riscv_vfmv_v_f_f16m1(vmagic_bias, vl), vlog2e, vz, vl);

    vint16m1_t vn_i = __riscv_vreinterpret_v_f16m1_i16m1(vn);
    vint16m1_t vs_i = __riscv_vsll_vx_i16m1(vn_i, 10, vl);
    vfloat16m1_t vs = __riscv_vreinterpret_v_i16m1_f16m1(vs_i);

    vn = __riscv_vfsub_vf_f16m1(vn, vmagic_bias, vl);

    vfloat16m1_t vt = __riscv_vfmacc_vf_f16m1(vz, vminus_ln2, vn, vl);

    vfloat16m1_t vp = __riscv_vfmacc_vf_f16m1(__riscv_vfmv_v_f_f16m1(vc2, vl), vc3, vt, vl);
    vp = __riscv_vfmul_vv_f16m1(vp, vt, vl);

    vt = __riscv_vfmul_vv_f16m1(vt, vs, vl);

    vs = __riscv_vfnmsac_vf_f16m1(__riscv_vfmv_v_f_f16m1(vminus_alpha, vl), vminus_alpha, vs, vl);

    vp = __riscv_vfmacc_vv_f16m1(vt, vp, vt, vl);

    vfloat16m1_t ve = __riscv_vfnmsac_vf_f16m1(vs, vminus_alpha, vp, vl);

    vint16m1_t vx_i = __riscv_vreinterpret_v_f16m1_i16m1(vx);
    vbool16_t vm = __riscv_vmslt_vx_i16m1_b16(vx_i, 0, vl);

    vfloat16m1_t vx_scaled = __riscv_vfmul_vf_f16m1(vx, vbeta, vl);

    vfloat16m1_t vy = __riscv_vmerge_vvm_f16m1(vx_scaled, ve, vm, vl);

    __riscv_vse16_v_f16m1(o, vy, vl);
    o += vl;

    n -= vl;
  }
}
}
