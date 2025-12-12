#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_vsigmoid_ukernel__rvv_rr1_p5_div(
        size_t batch,
        const float* input,
        float* output,
        const struct xnn_f32_default_params* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(float) == 0);
        assert(input != NULL);
        assert(output != NULL);
    
        const float vmagic_bias = 0x1.8000FEp23f;
        const float vminus_log2e = -0x1.715476p0f;
        const float vc5 = -0x1.0F9F9Cp-7f;
        const float vc4 = 0x1.573A1Ap-5f;
        const float vc3 = -0x1.555A80p-3f;
        const float vc2 = 0x1.FFFDC6p-2f;
        const float vc1 = -0x1.FFFFF6p-1f;
        const float vone = 1.0f;
        const float vdenorm_cutoff = 0x1.5D589Ep+6f;
        const float vln2 = 0x1.62E430p-1f;
    
        size_t n = batch / sizeof(float);
    
        while (n > 0) {
            size_t vl = __riscv_vsetvl_e32m1(n);
    
            vfloat32m1_t vx = __riscv_vle32_v_f32m1(input, vl);
            input += vl;
    
            vfloat32m1_t vz = __riscv_vfabs_v_f32m1(vx, vl);
    
            vfloat32m1_t vn = __riscv_vfmv_v_f_f32m1(vmagic_bias, vl);
            vn = __riscv_vfmacc_vf_f32m1(vn, vminus_log2e, vz, vl);
    
            vint32m1_t vn_int = __riscv_vreinterpret_v_f32m1_i32m1(vn);
            vint32m1_t vs_int = __riscv_vsll_vx_i32m1(vn_int, 23, vl);
            vfloat32m1_t vs = __riscv_vreinterpret_v_i32m1_f32m1(vs_int);
    
            vn = __riscv_vfsub_vf_f32m1(vn, vmagic_bias, vl);
    
            vfloat32m1_t vt = __riscv_vfmacc_vf_f32m1(vz, vln2, vn, vl);
    
            vfloat32m1_t vp = __riscv_vfmv_v_f_f32m1(vc4, vl);
            vp = __riscv_vfmacc_vf_f32m1(vp, vc5, vt, vl);
    
            vfloat32m1_t vc3_vec = __riscv_vfmv_v_f_f32m1(vc3, vl);
            vp = __riscv_vfmadd_vv_f32m1(vp, vt, vc3_vec, vl);
    
            vfloat32m1_t vc2_vec = __riscv_vfmv_v_f_f32m1(vc2, vl);
            vp = __riscv_vfmadd_vv_f32m1(vp, vt, vc2_vec, vl);
    
            vfloat32m1_t vc1_vec = __riscv_vfmv_v_f_f32m1(vc1, vl);
            vp = __riscv_vfmadd_vv_f32m1(vp, vt, vc1_vec, vl);
    
            vt = __riscv_vfmul_vv_f32m1(vt, vs, vl);
    
            vfloat32m1_t ve = __riscv_vfmacc_vv_f32m1(vs, vp, vt, vl);
    
            vfloat32m1_t vd = __riscv_vfadd_vf_f32m1(ve, vone, vl);

            // Reciprocal estimate + 2x Newton-Raphson (matches NEON approach)
            vfloat32m1_t vr = __riscv_vfrec7_v_f32m1(vd, vl);
            // Newton-Raphson iteration 1: r = r + r * (1 - r * d)
            vfloat32m1_t vone_vec = __riscv_vfmv_v_f_f32m1(vone, vl);
            vr = __riscv_vfmacc_vv_f32m1(vr, vr, __riscv_vfnmsac_vv_f32m1(vone_vec, vr, vd, vl), vl);
            // Newton-Raphson iteration 2
            vone_vec = __riscv_vfmv_v_f_f32m1(vone, vl);
            vr = __riscv_vfmacc_vv_f32m1(vr, vr, __riscv_vfnmsac_vv_f32m1(vone_vec, vr, vd, vl), vl);

            vfloat32m1_t vf = __riscv_vfmul_vv_f32m1(ve, vr, vl);
    
            vbool32_t vcutoff_mask = __riscv_vmfgt_vf_f32m1_b32(vz, vdenorm_cutoff, vl);
            vf = __riscv_vfmerge_vfm_f32m1(vf, 0.0f, vcutoff_mask, vl);
    
            vbool32_t vm = __riscv_vmflt_vf_f32m1_b32(vx, 0.0f, vl);
            vfloat32m1_t vf_alt = __riscv_vfrsub_vf_f32m1(vf, vone, vl);
            vf = __riscv_vmerge_vvm_f32m1(vf_alt, vf, vm, vl);
    
            __riscv_vse32_v_f32m1(output, vf, vl);
            output += vl;
            n -= vl;
        }
}
}