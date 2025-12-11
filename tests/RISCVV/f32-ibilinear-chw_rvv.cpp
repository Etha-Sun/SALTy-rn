#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_ibilinear_chw_ukernel__rvv_p4(
        size_t output_pixels,
        size_t channels,
        const float** input,
        size_t input_offset,
        const float*  weights,
        float*  output,
        size_t input_increment)
    {
      do {
        const float** i = input;
        const float* w = weights;
        size_t p = output_pixels;

        for (; p >= 4; p -= 4) {
          const float* itl0 = (const float*) ((uintptr_t) i[0] + input_offset);
          const float* ibl0 = (const float*) ((uintptr_t) i[1] + input_offset);
          const float* itl1 = (const float*) ((uintptr_t) i[2] + input_offset);
          const float* ibl1 = (const float*) ((uintptr_t) i[3] + input_offset);
          const float* itl2 = (const float*) ((uintptr_t) i[4] + input_offset);
          const float* ibl2 = (const float*) ((uintptr_t) i[5] + input_offset);
          const float* itl3 = (const float*) ((uintptr_t) i[6] + input_offset);
          const float* ibl3 = (const float*) ((uintptr_t) i[7] + input_offset);
          i += 8;

          size_t vl = __riscv_vsetvl_e32m1(4);

          vfloat32m1x2_t vw_seg = __riscv_vlseg2e32_v_f32m1x2(w, vl);
          vfloat32m1_t valphah = __riscv_vget_v_f32m1x2_f32m1(vw_seg, 0);
          vfloat32m1_t valphav = __riscv_vget_v_f32m1x2_f32m1(vw_seg, 1);
          w += 8;

          // Use symbolic_float32_t arrays to track symbolic values through scalar operations
          symbolic_float32_t tl[4], tr[4], bl[4], br[4];
          tl[0] = riscv_symbolic_float_load(&itl0[0]); tr[0] = riscv_symbolic_float_load(&itl0[1]);
          tl[1] = riscv_symbolic_float_load(&itl1[0]); tr[1] = riscv_symbolic_float_load(&itl1[1]);
          tl[2] = riscv_symbolic_float_load(&itl2[0]); tr[2] = riscv_symbolic_float_load(&itl2[1]);
          tl[3] = riscv_symbolic_float_load(&itl3[0]); tr[3] = riscv_symbolic_float_load(&itl3[1]);
          bl[0] = riscv_symbolic_float_load(&ibl0[0]); br[0] = riscv_symbolic_float_load(&ibl0[1]);
          bl[1] = riscv_symbolic_float_load(&ibl1[0]); br[1] = riscv_symbolic_float_load(&ibl1[1]);
          bl[2] = riscv_symbolic_float_load(&ibl2[0]); br[2] = riscv_symbolic_float_load(&ibl2[1]);
          bl[3] = riscv_symbolic_float_load(&ibl3[0]); br[3] = riscv_symbolic_float_load(&ibl3[1]);

          vfloat32m1_t vtl = __riscv_vle32_v_f32m1(tl, vl);
          vfloat32m1_t vtr = __riscv_vle32_v_f32m1(tr, vl);
          vfloat32m1_t vbl = __riscv_vle32_v_f32m1(bl, vl);
          vfloat32m1_t vbr = __riscv_vle32_v_f32m1(br, vl);

          vfloat32m1_t vld = __riscv_vfsub_vv_f32m1(vbl, vtl, vl);
          vfloat32m1_t vrd = __riscv_vfsub_vv_f32m1(vbr, vtr, vl);

          vfloat32m1_t vl_interp = __riscv_vfmacc_vv_f32m1(vtl, vld, valphav, vl);
          vfloat32m1_t vr_interp = __riscv_vfmacc_vv_f32m1(vtr, vrd, valphav, vl);

          vfloat32m1_t vd = __riscv_vfsub_vv_f32m1(vr_interp, vl_interp, vl);
          vfloat32m1_t vo = __riscv_vfmacc_vv_f32m1(vl_interp, vd, valphah, vl);

          __riscv_vse32_v_f32m1(output, vo, vl);
          output += 4;
        }

        if (p != 0) {
          if (p & 2) {
            size_t vl = __riscv_vsetvl_e32m1(2);

            vfloat32m1x2_t vw_seg = __riscv_vlseg2e32_v_f32m1x2(w, vl);
            vfloat32m1_t valphah = __riscv_vget_v_f32m1x2_f32m1(vw_seg, 0);
            vfloat32m1_t valphav = __riscv_vget_v_f32m1x2_f32m1(vw_seg, 1);
            w += 4;

            const float* itl0 = (const float*) ((uintptr_t) i[0] + input_offset);
            const float* ibl0 = (const float*) ((uintptr_t) i[1] + input_offset);
            const float* itl1 = (const float*) ((uintptr_t) i[2] + input_offset);
            const float* ibl1 = (const float*) ((uintptr_t) i[3] + input_offset);
            i += 4;

            // Use symbolic_float32_t arrays to track symbolic values through scalar operations
            symbolic_float32_t tl[2], tr[2], bl[2], br[2];
            tl[0] = riscv_symbolic_float_load(&itl0[0]); tr[0] = riscv_symbolic_float_load(&itl0[1]);
            tl[1] = riscv_symbolic_float_load(&itl1[0]); tr[1] = riscv_symbolic_float_load(&itl1[1]);
            bl[0] = riscv_symbolic_float_load(&ibl0[0]); br[0] = riscv_symbolic_float_load(&ibl0[1]);
            bl[1] = riscv_symbolic_float_load(&ibl1[0]); br[1] = riscv_symbolic_float_load(&ibl1[1]);

            vfloat32m1_t vtl = __riscv_vle32_v_f32m1(tl, vl);
            vfloat32m1_t vtr = __riscv_vle32_v_f32m1(tr, vl);
            vfloat32m1_t vbl = __riscv_vle32_v_f32m1(bl, vl);
            vfloat32m1_t vbr = __riscv_vle32_v_f32m1(br, vl);

            vfloat32m1_t vld = __riscv_vfsub_vv_f32m1(vbl, vtl, vl);
            vfloat32m1_t vrd = __riscv_vfsub_vv_f32m1(vbr, vtr, vl);

            vfloat32m1_t vl_interp = __riscv_vfmacc_vv_f32m1(vtl, vld, valphav, vl);
            vfloat32m1_t vr_interp = __riscv_vfmacc_vv_f32m1(vtr, vrd, valphav, vl);

            vfloat32m1_t vd = __riscv_vfsub_vv_f32m1(vr_interp, vl_interp, vl);
            vfloat32m1_t vo = __riscv_vfmacc_vv_f32m1(vl_interp, vd, valphah, vl);

            __riscv_vse32_v_f32m1(output, vo, vl);
            output += 2;
          }

          if (p & 1) {
            const float alphah = *w;
            const float alphav = *(w + 1);
            w += 2;

            const float* itl = (const float*) ((uintptr_t) i[0] + input_offset);
            const float* ibl = (const float*) ((uintptr_t) i[1] + input_offset);
            i += 2;

            const float tl_val = itl[0];
            const float tr_val = itl[1];
            const float bl_val = ibl[0];
            const float br_val = ibl[1];

            const float l = tl_val + alphav * (bl_val - tl_val);
            const float r = tr_val + alphav * (br_val - tr_val);

            *output++ = l + alphah * (r - l);
          }
        }

        input_offset += input_increment;
      } while (--channels != 0);
    }
}
