#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f16_vtanh_ukernel__rvv_expm1minus_rr1_p3h2ts_div(
        size_t n,
        const xnn_float16* input,
        xnn_float16* output)
    {
        union { uint16_t u; _Float16 f; } sat_cutoff = {.u = UINT16_C(0x4482)};
        union { uint16_t u; _Float16 f; } magic_bias = {.u = UINT16_C(0x620F)};
        union { uint16_t u; _Float16 f; } minus_log2e = {.u = UINT16_C(0xBDC5)};
        union { uint16_t u; _Float16 f; } ln2 = {.u = UINT16_C(0x398C)};
        union { uint16_t u; _Float16 f; } c3 = {.u = UINT16_C(0xBD5B)};
        union { uint16_t u; _Float16 f; } c2 = {.u = UINT16_C(0x4008)};
        union { uint16_t u; _Float16 f; } two = {.u = UINT16_C(0x4000)};
        union { uint16_t u; _Float16 f; } minus_one = {.u = UINT16_C(0xBC00)};
    
        const uint16_t* i = (const uint16_t*)input;
        uint16_t* o = (uint16_t*)output;
    
        size_t count = n / sizeof(uint16_t);
    
        while (count > 0) {
            size_t vl = __riscv_vsetvl_e16m4(count);
    
            vuint16m4_t vx_u = __riscv_vle16_v_u16m4(i, vl);
            i += vl;
    
            vfloat16m4_t vx = __riscv_vreinterpret_v_u16m4_f16m4(vx_u);
    
            vfloat16m4_t vz = __riscv_vfabs_v_f16m4(vx, vl);
    
            vz = __riscv_vfmin_vf_f16m4(vz, sat_cutoff.f, vl);
    
            vfloat16m4_t vn = __riscv_vfmv_v_f_f16m4(magic_bias.f, vl);
            vn = __riscv_vfmacc_vf_f16m4(vn, minus_log2e.f, vz, vl);
    
            vint16m4_t vn_i = __riscv_vreinterpret_v_f16m4_i16m4(vn);
            vint16m4_t vs_i = __riscv_vsll_vx_i16m4(vn_i, 10, vl);
            vfloat16m4_t vs = __riscv_vreinterpret_v_i16m4_f16m4(vs_i);
    
            vn = __riscv_vfsub_vf_f16m4(vn, magic_bias.f, vl);
    
            vfloat16m4_t vt = __riscv_vfmacc_vf_f16m4(vz, ln2.f, vn, vl);
    
            vfloat16m4_t vp = __riscv_vfmv_v_f_f16m4(c2.f, vl);
            vp = __riscv_vfmacc_vf_f16m4(vp, c3.f, vt, vl);
    
            vfloat16m4_t vtwo_v = __riscv_vfmv_v_f_f16m4(two.f, vl);
            vp = __riscv_vfnmsac_vv_f16m4(vtwo_v, vp, vt, vl);
    
            vfloat16m4_t vts = __riscv_vfmul_vv_f16m4(vt, vs, vl);
    
            vfloat16m4_t vsmo = __riscv_vfadd_vf_f16m4(vs, minus_one.f, vl);
    
            vfloat16m4_t vemo = __riscv_vfnmsac_vv_f16m4(vsmo, vp, vts, vl);
    
            vfloat16m4_t vepo = __riscv_vfadd_vf_f16m4(vemo, two.f, vl);
    
            vfloat16m4_t vy = __riscv_vfdiv_vv_f16m4(vemo, vepo, vl);
    
            vuint16m4_t vy_u = __riscv_vreinterpret_v_f16m4_u16m4(vy);
            vuint16m4_t vx_sign = __riscv_vand_vx_u16m4(vx_u, UINT16_C(0x8000), vl);
            vuint16m4_t vy_nosign = __riscv_vand_vx_u16m4(vy_u, UINT16_C(0x7FFF), vl);
            vuint16m4_t vout = __riscv_vor_vv_u16m4(vx_sign, vy_nosign, vl);
    
            __riscv_vse16_v_u16m4(o, vout, vl);
            o += vl;
    
            count -= vl;
        }
    }
}
