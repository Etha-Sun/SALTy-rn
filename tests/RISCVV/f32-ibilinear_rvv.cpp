#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_ibilinear_chw_ukernel__rvv_p8(
        size_t output_pixels,
        size_t channels,
        const float** input,
        size_t input_offset,
        const float* weights,
        float* output,
        size_t input_increment) XNN_OOB_READS
    {
      assert(output_pixels != 0);
      assert(channels != 0);
      assert(input_increment % sizeof(float) == 0);

      do {
        const float** i = input;
        const float* w = weights;
        size_t p = output_pixels;

        // Process 16 pixels at a time (matching NEON p>=16 loop)
        for (; p >= 16; p -= 16) {
          size_t vl4 = 4;
          size_t vl2 = 2;

          // First batch of 4 pixels
          const float* itl0 = (const float*) ((uintptr_t) i[0] + input_offset);
          const float* ibl0 = (const float*) ((uintptr_t) i[1] + input_offset);
          const float* itl1 = (const float*) ((uintptr_t) i[2] + input_offset);
          const float* ibl1 = (const float*) ((uintptr_t) i[3] + input_offset);
          const float* itl2 = (const float*) ((uintptr_t) i[4] + input_offset);
          const float* ibl2 = (const float*) ((uintptr_t) i[5] + input_offset);
          const float* itl3 = (const float*) ((uintptr_t) i[6] + input_offset);
          const float* ibl3 = (const float*) ((uintptr_t) i[7] + input_offset);

          // Load weights for first 4 pixels
          vfloat32m1_t vw0 = __riscv_vle32_v_f32m1(w, 8);
          vuint32m1_t idx_even4 = __riscv_vmul_vx_u32m1(__riscv_vid_v_u32m1(vl4), 2, vl4);
          vuint32m1_t idx_odd4 = __riscv_vadd_vx_u32m1(idx_even4, 1, vl4);
          vfloat32m1_t valphah0 = __riscv_vrgather_vv_f32m1(vw0, idx_even4, vl4);
          vfloat32m1_t valphav0 = __riscv_vrgather_vv_f32m1(vw0, idx_odd4, vl4);

          // Load pixel pairs for first 4 pixels
          vfloat32m1_t vtltr0 = __riscv_vle32_v_f32m1(itl0, vl2);
          vfloat32m1_t vblbr0 = __riscv_vle32_v_f32m1(ibl0, vl2);
          vfloat32m1_t vtltr1 = __riscv_vle32_v_f32m1(itl1, vl2);
          vfloat32m1_t vblbr1 = __riscv_vle32_v_f32m1(ibl1, vl2);
          vfloat32m1_t vtltr2 = __riscv_vle32_v_f32m1(itl2, vl2);
          vfloat32m1_t vblbr2 = __riscv_vle32_v_f32m1(ibl2, vl2);
          vfloat32m1_t vtltr3 = __riscv_vle32_v_f32m1(itl3, vl2);
          vfloat32m1_t vblbr3 = __riscv_vle32_v_f32m1(ibl3, vl2);

          // Combine pairs
          vfloat32m1_t vtltr01 = __riscv_vslideup_vx_f32m1(vtltr0, vtltr1, 2, vl4);
          vfloat32m1_t vblbr01 = __riscv_vslideup_vx_f32m1(vblbr0, vblbr1, 2, vl4);
          vfloat32m1_t vtltr23 = __riscv_vslideup_vx_f32m1(vtltr2, vtltr3, 2, vl4);
          vfloat32m1_t vblbr23 = __riscv_vslideup_vx_f32m1(vblbr2, vblbr3, 2, vl4);

          vfloat32m1_t vldrd01 = __riscv_vfsub_vv_f32m1(vblbr01, vtltr01, vl4);
          vfloat32m1_t vldrd23 = __riscv_vfsub_vv_f32m1(vblbr23, vtltr23, vl4);

          vfloat32m1_t vtltr_all0 = __riscv_vslideup_vx_f32m1(vtltr01, vtltr23, 4, 8);
          vfloat32m1_t vldrd_all0 = __riscv_vslideup_vx_f32m1(vldrd01, vldrd23, 4, 8);

          vfloat32m1_t vtl0 = __riscv_vrgather_vv_f32m1(vtltr_all0, idx_even4, vl4);
          vfloat32m1_t vtr0 = __riscv_vrgather_vv_f32m1(vtltr_all0, idx_odd4, vl4);
          vfloat32m1_t vld0 = __riscv_vrgather_vv_f32m1(vldrd_all0, idx_even4, vl4);
          vfloat32m1_t vrd0 = __riscv_vrgather_vv_f32m1(vldrd_all0, idx_odd4, vl4);

          vfloat32m1_t vl_interp0 = __riscv_vfmacc_vv_f32m1(vtl0, vld0, valphav0, vl4);
          vfloat32m1_t vr_interp0 = __riscv_vfmacc_vv_f32m1(vtr0, vrd0, valphav0, vl4);
          vfloat32m1_t vd0 = __riscv_vfsub_vv_f32m1(vr_interp0, vl_interp0, vl4);
          vfloat32m1_t vo0 = __riscv_vfmacc_vv_f32m1(vl_interp0, vd0, valphah0, vl4);

          __riscv_vse32_v_f32m1(output, vo0, vl4);

          // Second batch of 4 pixels (pixels 4-7)
          const float* itl4 = (const float*) ((uintptr_t) i[8] + input_offset);
          const float* ibl4 = (const float*) ((uintptr_t) i[9] + input_offset);
          const float* itl5 = (const float*) ((uintptr_t) i[10] + input_offset);
          const float* ibl5 = (const float*) ((uintptr_t) i[11] + input_offset);
          const float* itl6 = (const float*) ((uintptr_t) i[12] + input_offset);
          const float* ibl6 = (const float*) ((uintptr_t) i[13] + input_offset);
          const float* itl7 = (const float*) ((uintptr_t) i[14] + input_offset);
          const float* ibl7 = (const float*) ((uintptr_t) i[15] + input_offset);

          vfloat32m1_t vw1 = __riscv_vle32_v_f32m1(w + 8, 8);
          vfloat32m1_t valphah1 = __riscv_vrgather_vv_f32m1(vw1, idx_even4, vl4);
          vfloat32m1_t valphav1 = __riscv_vrgather_vv_f32m1(vw1, idx_odd4, vl4);

          vfloat32m1_t vtltr4 = __riscv_vle32_v_f32m1(itl4, vl2);
          vfloat32m1_t vblbr4 = __riscv_vle32_v_f32m1(ibl4, vl2);
          vfloat32m1_t vtltr5 = __riscv_vle32_v_f32m1(itl5, vl2);
          vfloat32m1_t vblbr5 = __riscv_vle32_v_f32m1(ibl5, vl2);
          vfloat32m1_t vtltr6 = __riscv_vle32_v_f32m1(itl6, vl2);
          vfloat32m1_t vblbr6 = __riscv_vle32_v_f32m1(ibl6, vl2);
          vfloat32m1_t vtltr7 = __riscv_vle32_v_f32m1(itl7, vl2);
          vfloat32m1_t vblbr7 = __riscv_vle32_v_f32m1(ibl7, vl2);

          vfloat32m1_t vtltr45 = __riscv_vslideup_vx_f32m1(vtltr4, vtltr5, 2, vl4);
          vfloat32m1_t vblbr45 = __riscv_vslideup_vx_f32m1(vblbr4, vblbr5, 2, vl4);
          vfloat32m1_t vtltr67 = __riscv_vslideup_vx_f32m1(vtltr6, vtltr7, 2, vl4);
          vfloat32m1_t vblbr67 = __riscv_vslideup_vx_f32m1(vblbr6, vblbr7, 2, vl4);

          vfloat32m1_t vldrd45 = __riscv_vfsub_vv_f32m1(vblbr45, vtltr45, vl4);
          vfloat32m1_t vldrd67 = __riscv_vfsub_vv_f32m1(vblbr67, vtltr67, vl4);

          vfloat32m1_t vtltr_all1 = __riscv_vslideup_vx_f32m1(vtltr45, vtltr67, 4, 8);
          vfloat32m1_t vldrd_all1 = __riscv_vslideup_vx_f32m1(vldrd45, vldrd67, 4, 8);

          vfloat32m1_t vtl1 = __riscv_vrgather_vv_f32m1(vtltr_all1, idx_even4, vl4);
          vfloat32m1_t vtr1 = __riscv_vrgather_vv_f32m1(vtltr_all1, idx_odd4, vl4);
          vfloat32m1_t vld1 = __riscv_vrgather_vv_f32m1(vldrd_all1, idx_even4, vl4);
          vfloat32m1_t vrd1 = __riscv_vrgather_vv_f32m1(vldrd_all1, idx_odd4, vl4);

          vfloat32m1_t vl_interp1 = __riscv_vfmacc_vv_f32m1(vtl1, vld1, valphav1, vl4);
          vfloat32m1_t vr_interp1 = __riscv_vfmacc_vv_f32m1(vtr1, vrd1, valphav1, vl4);
          vfloat32m1_t vd1 = __riscv_vfsub_vv_f32m1(vr_interp1, vl_interp1, vl4);
          vfloat32m1_t vo1 = __riscv_vfmacc_vv_f32m1(vl_interp1, vd1, valphah1, vl4);

          __riscv_vse32_v_f32m1(output + 4, vo1, vl4);

          // Third batch of 4 pixels (pixels 8-11)
          const float* itl8 = (const float*) ((uintptr_t) i[16] + input_offset);
          const float* ibl8 = (const float*) ((uintptr_t) i[17] + input_offset);
          const float* itl9 = (const float*) ((uintptr_t) i[18] + input_offset);
          const float* ibl9 = (const float*) ((uintptr_t) i[19] + input_offset);
          const float* itlA = (const float*) ((uintptr_t) i[20] + input_offset);
          const float* iblA = (const float*) ((uintptr_t) i[21] + input_offset);
          const float* itlB = (const float*) ((uintptr_t) i[22] + input_offset);
          const float* iblB = (const float*) ((uintptr_t) i[23] + input_offset);

          vfloat32m1_t vw2 = __riscv_vle32_v_f32m1(w + 16, 8);
          vfloat32m1_t valphah2 = __riscv_vrgather_vv_f32m1(vw2, idx_even4, vl4);
          vfloat32m1_t valphav2 = __riscv_vrgather_vv_f32m1(vw2, idx_odd4, vl4);

          vfloat32m1_t vtltr8 = __riscv_vle32_v_f32m1(itl8, vl2);
          vfloat32m1_t vblbr8 = __riscv_vle32_v_f32m1(ibl8, vl2);
          vfloat32m1_t vtltr9 = __riscv_vle32_v_f32m1(itl9, vl2);
          vfloat32m1_t vblbr9 = __riscv_vle32_v_f32m1(ibl9, vl2);
          vfloat32m1_t vtltrA = __riscv_vle32_v_f32m1(itlA, vl2);
          vfloat32m1_t vblbrA = __riscv_vle32_v_f32m1(iblA, vl2);
          vfloat32m1_t vtltrB = __riscv_vle32_v_f32m1(itlB, vl2);
          vfloat32m1_t vblbrB = __riscv_vle32_v_f32m1(iblB, vl2);

          vfloat32m1_t vtltr89 = __riscv_vslideup_vx_f32m1(vtltr8, vtltr9, 2, vl4);
          vfloat32m1_t vblbr89 = __riscv_vslideup_vx_f32m1(vblbr8, vblbr9, 2, vl4);
          vfloat32m1_t vtltrAB = __riscv_vslideup_vx_f32m1(vtltrA, vtltrB, 2, vl4);
          vfloat32m1_t vblbrAB = __riscv_vslideup_vx_f32m1(vblbrA, vblbrB, 2, vl4);

          vfloat32m1_t vldrd89 = __riscv_vfsub_vv_f32m1(vblbr89, vtltr89, vl4);
          vfloat32m1_t vldrdAB = __riscv_vfsub_vv_f32m1(vblbrAB, vtltrAB, vl4);

          vfloat32m1_t vtltr_all2 = __riscv_vslideup_vx_f32m1(vtltr89, vtltrAB, 4, 8);
          vfloat32m1_t vldrd_all2 = __riscv_vslideup_vx_f32m1(vldrd89, vldrdAB, 4, 8);

          vfloat32m1_t vtl2 = __riscv_vrgather_vv_f32m1(vtltr_all2, idx_even4, vl4);
          vfloat32m1_t vtr2 = __riscv_vrgather_vv_f32m1(vtltr_all2, idx_odd4, vl4);
          vfloat32m1_t vld2 = __riscv_vrgather_vv_f32m1(vldrd_all2, idx_even4, vl4);
          vfloat32m1_t vrd2 = __riscv_vrgather_vv_f32m1(vldrd_all2, idx_odd4, vl4);

          vfloat32m1_t vl_interp2 = __riscv_vfmacc_vv_f32m1(vtl2, vld2, valphav2, vl4);
          vfloat32m1_t vr_interp2 = __riscv_vfmacc_vv_f32m1(vtr2, vrd2, valphav2, vl4);
          vfloat32m1_t vd2 = __riscv_vfsub_vv_f32m1(vr_interp2, vl_interp2, vl4);
          vfloat32m1_t vo2 = __riscv_vfmacc_vv_f32m1(vl_interp2, vd2, valphah2, vl4);

          __riscv_vse32_v_f32m1(output + 8, vo2, vl4);

          // Fourth batch of 4 pixels (pixels 12-15)
          const float* itlC = (const float*) ((uintptr_t) i[24] + input_offset);
          const float* iblC = (const float*) ((uintptr_t) i[25] + input_offset);
          const float* itlD = (const float*) ((uintptr_t) i[26] + input_offset);
          const float* iblD = (const float*) ((uintptr_t) i[27] + input_offset);
          const float* itlE = (const float*) ((uintptr_t) i[28] + input_offset);
          const float* iblE = (const float*) ((uintptr_t) i[29] + input_offset);
          const float* itlF = (const float*) ((uintptr_t) i[30] + input_offset);
          const float* iblF = (const float*) ((uintptr_t) i[31] + input_offset);

          vfloat32m1_t vw3 = __riscv_vle32_v_f32m1(w + 24, 8);
          vfloat32m1_t valphah3 = __riscv_vrgather_vv_f32m1(vw3, idx_even4, vl4);
          vfloat32m1_t valphav3 = __riscv_vrgather_vv_f32m1(vw3, idx_odd4, vl4);

          vfloat32m1_t vtltrC = __riscv_vle32_v_f32m1(itlC, vl2);
          vfloat32m1_t vblbrC = __riscv_vle32_v_f32m1(iblC, vl2);
          vfloat32m1_t vtltrD = __riscv_vle32_v_f32m1(itlD, vl2);
          vfloat32m1_t vblbrD = __riscv_vle32_v_f32m1(iblD, vl2);
          vfloat32m1_t vtltrE = __riscv_vle32_v_f32m1(itlE, vl2);
          vfloat32m1_t vblbrE = __riscv_vle32_v_f32m1(iblE, vl2);
          vfloat32m1_t vtltrF = __riscv_vle32_v_f32m1(itlF, vl2);
          vfloat32m1_t vblbrF = __riscv_vle32_v_f32m1(iblF, vl2);

          vfloat32m1_t vtltrCD = __riscv_vslideup_vx_f32m1(vtltrC, vtltrD, 2, vl4);
          vfloat32m1_t vblbrCD = __riscv_vslideup_vx_f32m1(vblbrC, vblbrD, 2, vl4);
          vfloat32m1_t vtltrEF = __riscv_vslideup_vx_f32m1(vtltrE, vtltrF, 2, vl4);
          vfloat32m1_t vblbrEF = __riscv_vslideup_vx_f32m1(vblbrE, vblbrF, 2, vl4);

          vfloat32m1_t vldrdCD = __riscv_vfsub_vv_f32m1(vblbrCD, vtltrCD, vl4);
          vfloat32m1_t vldrdEF = __riscv_vfsub_vv_f32m1(vblbrEF, vtltrEF, vl4);

          vfloat32m1_t vtltr_all3 = __riscv_vslideup_vx_f32m1(vtltrCD, vtltrEF, 4, 8);
          vfloat32m1_t vldrd_all3 = __riscv_vslideup_vx_f32m1(vldrdCD, vldrdEF, 4, 8);

          vfloat32m1_t vtl3 = __riscv_vrgather_vv_f32m1(vtltr_all3, idx_even4, vl4);
          vfloat32m1_t vtr3 = __riscv_vrgather_vv_f32m1(vtltr_all3, idx_odd4, vl4);
          vfloat32m1_t vld3 = __riscv_vrgather_vv_f32m1(vldrd_all3, idx_even4, vl4);
          vfloat32m1_t vrd3 = __riscv_vrgather_vv_f32m1(vldrd_all3, idx_odd4, vl4);

          vfloat32m1_t vl_interp3 = __riscv_vfmacc_vv_f32m1(vtl3, vld3, valphav3, vl4);
          vfloat32m1_t vr_interp3 = __riscv_vfmacc_vv_f32m1(vtr3, vrd3, valphav3, vl4);
          vfloat32m1_t vd3 = __riscv_vfsub_vv_f32m1(vr_interp3, vl_interp3, vl4);
          vfloat32m1_t vo3 = __riscv_vfmacc_vv_f32m1(vl_interp3, vd3, valphah3, vl4);

          __riscv_vse32_v_f32m1(output + 12, vo3, vl4);

          i += 32;
          w += 32;
          output += 16;
        }

        // Process 4 pixels at a time (matching NEON p>=4 loop)
        for (; p >= 4; p -= 4) {
          size_t vl4 = __riscv_vsetvl_e32m1(4);
          size_t vl2 = 2;

          const float* itl0 = (const float*) ((uintptr_t) i[0] + input_offset);
          const float* ibl0 = (const float*) ((uintptr_t) i[1] + input_offset);
          const float* itl1 = (const float*) ((uintptr_t) i[2] + input_offset);
          const float* ibl1 = (const float*) ((uintptr_t) i[3] + input_offset);
          const float* itl2 = (const float*) ((uintptr_t) i[4] + input_offset);
          const float* ibl2 = (const float*) ((uintptr_t) i[5] + input_offset);
          const float* itl3 = (const float*) ((uintptr_t) i[6] + input_offset);
          const float* ibl3 = (const float*) ((uintptr_t) i[7] + input_offset);
          i += 8;

          vfloat32m1_t vw = __riscv_vle32_v_f32m1(w, 8);
          w += 8;

          vuint32m1_t idx_even4 = __riscv_vmul_vx_u32m1(__riscv_vid_v_u32m1(vl4), 2, vl4);
          vuint32m1_t idx_odd4 = __riscv_vadd_vx_u32m1(idx_even4, 1, vl4);

          vfloat32m1_t valphah = __riscv_vrgather_vv_f32m1(vw, idx_even4, vl4);
          vfloat32m1_t valphav = __riscv_vrgather_vv_f32m1(vw, idx_odd4, vl4);

          // Load pixel pairs [tl, tr] and [bl, br] using vector loads
          vfloat32m1_t vtltr0 = __riscv_vle32_v_f32m1(itl0, vl2);
          vfloat32m1_t vblbr0 = __riscv_vle32_v_f32m1(ibl0, vl2);
          vfloat32m1_t vtltr1 = __riscv_vle32_v_f32m1(itl1, vl2);
          vfloat32m1_t vblbr1 = __riscv_vle32_v_f32m1(ibl1, vl2);
          vfloat32m1_t vtltr2 = __riscv_vle32_v_f32m1(itl2, vl2);
          vfloat32m1_t vblbr2 = __riscv_vle32_v_f32m1(ibl2, vl2);
          vfloat32m1_t vtltr3 = __riscv_vle32_v_f32m1(itl3, vl2);
          vfloat32m1_t vblbr3 = __riscv_vle32_v_f32m1(ibl3, vl2);

          // Combine pairs: vtltr01 = [tl0, tr0, tl1, tr1]
          vfloat32m1_t vtltr01 = __riscv_vslideup_vx_f32m1(vtltr0, vtltr1, 2, vl4);
          vfloat32m1_t vblbr01 = __riscv_vslideup_vx_f32m1(vblbr0, vblbr1, 2, vl4);
          vfloat32m1_t vtltr23 = __riscv_vslideup_vx_f32m1(vtltr2, vtltr3, 2, vl4);
          vfloat32m1_t vblbr23 = __riscv_vslideup_vx_f32m1(vblbr2, vblbr3, 2, vl4);

          // Compute difference (bl-tl, br-tr)
          vfloat32m1_t vldrd01 = __riscv_vfsub_vv_f32m1(vblbr01, vtltr01, vl4);
          vfloat32m1_t vldrd23 = __riscv_vfsub_vv_f32m1(vblbr23, vtltr23, vl4);

          // Build combined vector [tl0, tr0, tl1, tr1, tl2, tr2, tl3, tr3]
          vfloat32m1_t vtltr_all = __riscv_vslideup_vx_f32m1(vtltr01, vtltr23, 4, 8);
          vfloat32m1_t vldrd_all = __riscv_vslideup_vx_f32m1(vldrd01, vldrd23, 4, 8);

          // Gather even/odd indices: [0,2,4,6] for tl/ld, [1,3,5,7] for tr/rd
          vfloat32m1_t vtl = __riscv_vrgather_vv_f32m1(vtltr_all, idx_even4, vl4);
          vfloat32m1_t vtr = __riscv_vrgather_vv_f32m1(vtltr_all, idx_odd4, vl4);
          vfloat32m1_t vld = __riscv_vrgather_vv_f32m1(vldrd_all, idx_even4, vl4);
          vfloat32m1_t vrd = __riscv_vrgather_vv_f32m1(vldrd_all, idx_odd4, vl4);

          vfloat32m1_t vl_interp = __riscv_vfmacc_vv_f32m1(vtl, vld, valphav, vl4);
          vfloat32m1_t vr_interp = __riscv_vfmacc_vv_f32m1(vtr, vrd, valphav, vl4);

          vfloat32m1_t vd = __riscv_vfsub_vv_f32m1(vr_interp, vl_interp, vl4);
          vfloat32m1_t vo = __riscv_vfmacc_vv_f32m1(vl_interp, vd, valphah, vl4);

          __riscv_vse32_v_f32m1(output, vo, vl4);
          output += 4;
        }

        if XNN_UNLIKELY(p != 0) {
          if (p & 2) {
            size_t vl2 = __riscv_vsetvl_e32m1(2);

            const float* itl0 = (const float*) ((uintptr_t) i[0] + input_offset);
            const float* ibl0 = (const float*) ((uintptr_t) i[1] + input_offset);
            const float* itl1 = (const float*) ((uintptr_t) i[2] + input_offset);
            const float* ibl1 = (const float*) ((uintptr_t) i[3] + input_offset);
            i += 4;

            vfloat32m1_t vw = __riscv_vle32_v_f32m1(w, 4);
            w += 4;

            vuint32m1_t idx_even2 = __riscv_vmul_vx_u32m1(__riscv_vid_v_u32m1(vl2), 2, vl2);
            vuint32m1_t idx_odd2 = __riscv_vadd_vx_u32m1(idx_even2, 1, vl2);

            vfloat32m1_t valphah = __riscv_vrgather_vv_f32m1(vw, idx_even2, vl2);
            vfloat32m1_t valphav = __riscv_vrgather_vv_f32m1(vw, idx_odd2, vl2);

            // Load pixel pairs using vector loads
            vfloat32m1_t vtltr0 = __riscv_vle32_v_f32m1(itl0, vl2);
            vfloat32m1_t vblbr0 = __riscv_vle32_v_f32m1(ibl0, vl2);
            vfloat32m1_t vtltr1 = __riscv_vle32_v_f32m1(itl1, vl2);
            vfloat32m1_t vblbr1 = __riscv_vle32_v_f32m1(ibl1, vl2);

            // Combine pairs
            vfloat32m1_t vtltr_all = __riscv_vslideup_vx_f32m1(vtltr0, vtltr1, 2, 4);
            vfloat32m1_t vblbr_all = __riscv_vslideup_vx_f32m1(vblbr0, vblbr1, 2, 4);

            vfloat32m1_t vldrd_all = __riscv_vfsub_vv_f32m1(vblbr_all, vtltr_all, 4);

            vfloat32m1_t vtl = __riscv_vrgather_vv_f32m1(vtltr_all, idx_even2, vl2);
            vfloat32m1_t vtr = __riscv_vrgather_vv_f32m1(vtltr_all, idx_odd2, vl2);
            vfloat32m1_t vld = __riscv_vrgather_vv_f32m1(vldrd_all, idx_even2, vl2);
            vfloat32m1_t vrd = __riscv_vrgather_vv_f32m1(vldrd_all, idx_odd2, vl2);

            vfloat32m1_t vl_interp = __riscv_vfmacc_vv_f32m1(vtl, vld, valphav, vl2);
            vfloat32m1_t vr_interp = __riscv_vfmacc_vv_f32m1(vtr, vrd, valphav, vl2);

            vfloat32m1_t vd = __riscv_vfsub_vv_f32m1(vr_interp, vl_interp, vl2);
            vfloat32m1_t vo = __riscv_vfmacc_vv_f32m1(vl_interp, vd, valphah, vl2);

            __riscv_vse32_v_f32m1(output, vo, vl2);
            output += 2;
          }

          if (p & 1) {
            const float alphah = *w;
            const float alphav = *(w + 1);
            w += 2;

            const float* itl = (const float*) ((uintptr_t) i[0] + input_offset);
            const float* ibl = (const float*) ((uintptr_t) i[1] + input_offset);
            i += 2;

            const float tl = itl[0];
            const float tr = itl[1];
            const float bl = ibl[0];
            const float br = ibl[1];

            const float ld = bl - tl;
            const float rd = br - tr;

            const float l = tl + ld * alphav;
            const float r = tr + rd * alphav;

            *output++ = l + alphah * (r - l);
          }
        }

        input_offset += input_increment;
      } while (--channels != 0);
    }
}
