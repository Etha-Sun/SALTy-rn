#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    extern const uint32_t xnn_table_exp2minus_k_over_16[16];

void xnn_f32_velu_ukernel__rvv_rr2_lut16_p3(
    size_t batch,
    const float* input,
    float* output,
    const struct xnn_f32_elu_params* params)
{
    const float vsat_cutoff = -0x1.154246p+4f;
    const float vmagic_bias = 0x1.800000p19f;
    const float vlog2e = 0x1.715476p+0f;
    const float vc3 = 0x1.55561Cp-3f;
    const float vc2 = 0x1.0001ECp-1f;
    const float vone = 1.0f;
    const float vminus_ln2_hi = -0x1.62E400p-1f;
    const float vminus_ln2_lo = -0x1.7F7D1Cp-20f;
    const float vprescale = params->scalar.prescale;
    const float valpha = params->scalar.alpha;
    const float vbeta = params->scalar.beta;

    size_t n = batch / sizeof(float);

    while (n > 0) {
        size_t vl = __riscv_vsetvl_e32m4(n);

        vfloat32m4_t vx = __riscv_vle32_v_f32m4(input, vl);
        input += vl;

        // vz = max(vx * prescale, sat_cutoff)
        vfloat32m4_t vz = __riscv_vfmul_vf_f32m4(vx, vprescale, vl);
        vz = __riscv_vfmax_vf_f32m4(vz, vsat_cutoff, vl);

        // vn = magic_bias + vz * log2e
        vfloat32m4_t vn = __riscv_vfmacc_vf_f32m4(__riscv_vfmv_v_f_f32m4(vmagic_bias, vl), vlog2e, vz, vl);

        // Extract index and exponent from vn
        vint32m4_t vn_i = __riscv_vreinterpret_v_f32m4_i32m4(vn);
        vint32m4_t vidx = __riscv_vand_vx_i32m4(vn_i, 0xF, vl);
        vuint32m4_t vidx_u = __riscv_vreinterpret_v_i32m4_u32m4(vidx);

        vint32m4_t ven = __riscv_vsll_vx_i32m4(vn_i, 19, vl);

        // LUT lookup
        vuint32m4_t vl_lut = __riscv_vluxei32_v_u32m4((const uint32_t*)xnn_table_exp2minus_k_over_16, __riscv_vsll_vx_u32m4(vidx_u, 2, vl), vl);
        vint32m4_t vl_i = __riscv_vreinterpret_v_u32m4_i32m4(vl_lut);

        // vn = vn - magic_bias
        vn = __riscv_vfsub_vf_f32m4(vn, vmagic_bias, vl);

        // vs = reinterpret(vl + ven) as float
        vint32m4_t vs_i = __riscv_vadd_vv_i32m4(vl_i, ven, vl);
        vfloat32m4_t vs = __riscv_vreinterpret_v_i32m4_f32m4(vs_i);

        // vt = vz + vn * minus_ln2_hi
        vfloat32m4_t vt = __riscv_vfmacc_vf_f32m4(vz, vminus_ln2_hi, vn, vl);
        // vt = vt + vn * minus_ln2_lo
        vt = __riscv_vfmacc_vf_f32m4(vt, vminus_ln2_lo, vn, vl);

        // Polynomial approximation: vp = vc2 + vc3 * vt
        vfloat32m4_t vp = __riscv_vfmacc_vf_f32m4(__riscv_vfmv_v_f_f32m4(vc2, vl), vc3, vt, vl);
        // vp = vp * vt
        vp = __riscv_vfmul_vv_f32m4(vp, vt, vl);

        // vt = vt * vs
        vt = __riscv_vfmul_vv_f32m4(vt, vs, vl);
        // vs = vs - 1
        vs = __riscv_vfsub_vf_f32m4(vs, vone, vl);

        // vp = vt + vp * vt
        vp = __riscv_vfmacc_vv_f32m4(vt, vp, vt, vl);

        // ve = (vp + vs) * alpha
        vfloat32m4_t ve = __riscv_vfmul_vf_f32m4(__riscv_vfadd_vv_f32m4(vp, vs, vl), valpha, vl);

        // Create mask: vm = (vx < 0)
        vbool8_t vm = __riscv_vmflt_vf_f32m4_b8(vx, 0.0f, vl);

        // vx_scaled = vx * beta
        vfloat32m4_t vx_scaled = __riscv_vfmul_vf_f32m4(vx, vbeta, vl);

        // Use bitwise select like NEON's vbslq_f32 for exact equivalence
        // vbslq_f32(mask, a, b) = (mask & a) | (~mask & b)
        // where mask is all 1s or all 0s per element
        // vm = true (vx < 0) means select ve, else select vx_scaled
        // In RVV vmerge: result = mask ? b : a, so vmerge(vx_scaled, ve, vm) gives ve when vm=true
        vfloat32m4_t vy = __riscv_vmerge_vvm_f32m4(vx_scaled, ve, vm, vl);

        __riscv_vse32_v_f32m4(output, vy, vl);
        output += vl;
        n -= vl;
    }
}
}
