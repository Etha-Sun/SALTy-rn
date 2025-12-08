#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {
    void xnn_f32_argmaxpool_ukernel_9p8x__rvv_c4(
        size_t output_pixels,
        size_t pooling_elements,
        size_t channels,
        const float** input,
        size_t input_offset,
        size_t input_pixel_stride,
        float* output,
        uint32_t* index,
        size_t input_increment,
        size_t output_increment,
        size_t index_increment)
    {
      assert(output_pixels != 0);
      assert(pooling_elements != 0);
      assert(channels != 0);
    
      do {
        const float* ab = NULL;
        const uint32_t* ib = NULL;
        const float** id = input;
    
        uint32_t idx_base = 0;
    
        ptrdiff_t k = pooling_elements;
        for (; k > 0; k -= 9) {
          const float* i0 = *id++;
          const float* i1 = 1 < k ? *id++ : i0;
          const float* i2 = 2 < k ? *id++ : i0;
          const float* i3 = 3 < k ? *id++ : i0;
          const float* i4 = 4 < k ? *id++ : i0;
          const float* i5 = 5 < k ? *id++ : i0;
          const float* i6 = 6 < k ? *id++ : i0;
          const float* i7 = 7 < k ? *id++ : i0;
          const float* i8 = 8 < k ? *id++ : i0;
          i0 = (const float*) ((uintptr_t) i0 + input_offset);
          i1 = (const float*) ((uintptr_t) i1 + input_offset);
          i2 = (const float*) ((uintptr_t) i2 + input_offset);
          i3 = (const float*) ((uintptr_t) i3 + input_offset);
          i4 = (const float*) ((uintptr_t) i4 + input_offset);
          i5 = (const float*) ((uintptr_t) i5 + input_offset);
          i6 = (const float*) ((uintptr_t) i6 + input_offset);
          i7 = (const float*) ((uintptr_t) i7 + input_offset);
          i8 = (const float*) ((uintptr_t) i8 + input_offset);
    
          float* o = output;
          uint32_t* ix = index;
          size_t c = channels;
    
          while (c > 0) {
            size_t vl = __riscv_vsetvl_e32m1(c);
    
            vfloat32m1_t vi0 = __riscv_vle32_v_f32m1(i0, vl); i0 += vl;
            vfloat32m1_t vi1 = __riscv_vle32_v_f32m1(i1, vl); i1 += vl;
            vfloat32m1_t vi2 = __riscv_vle32_v_f32m1(i2, vl); i2 += vl;
            vfloat32m1_t vi3 = __riscv_vle32_v_f32m1(i3, vl); i3 += vl;
            vfloat32m1_t vi4 = __riscv_vle32_v_f32m1(i4, vl); i4 += vl;
            vfloat32m1_t vi5 = __riscv_vle32_v_f32m1(i5, vl); i5 += vl;
            vfloat32m1_t vi6 = __riscv_vle32_v_f32m1(i6, vl); i6 += vl;
            vfloat32m1_t vi7 = __riscv_vle32_v_f32m1(i7, vl); i7 += vl;
            vfloat32m1_t vi8 = __riscv_vle32_v_f32m1(i8, vl); i8 += vl;
    
            vfloat32m1_t vmax;
            vuint32m1_t vidx;
            vuint32m1_t vidx0 = __riscv_vmv_v_x_u32m1(idx_base, vl);
    
            if (ab) {
              vmax = __riscv_vle32_v_f32m1(ab, vl); ab += vl;
              vidx = __riscv_vle32_v_u32m1(ib, vl); ib += vl;
    
              vbool32_t vm0 = __riscv_vmfgt_vv_f32m1_b32(vi0, vmax, vl);
              vmax = __riscv_vmerge_vvm_f32m1(vmax, vi0, vm0, vl);
              vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx0, vm0, vl);
            } else {
              vmax = vi0;
              vidx = vidx0;
            }
    
            vuint32m1_t vidx1 = __riscv_vadd_vx_u32m1(vidx0, 1, vl);
            vbool32_t vm1 = __riscv_vmfgt_vv_f32m1_b32(vi1, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi1, vm1, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx1, vm1, vl);
    
            vuint32m1_t vidx2 = __riscv_vadd_vx_u32m1(vidx1, 1, vl);
            vbool32_t vm2 = __riscv_vmfgt_vv_f32m1_b32(vi2, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi2, vm2, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx2, vm2, vl);
    
            vuint32m1_t vidx3 = __riscv_vadd_vx_u32m1(vidx2, 1, vl);
            vbool32_t vm3 = __riscv_vmfgt_vv_f32m1_b32(vi3, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi3, vm3, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx3, vm3, vl);
    
            vuint32m1_t vidx4 = __riscv_vadd_vx_u32m1(vidx3, 1, vl);
            vbool32_t vm4 = __riscv_vmfgt_vv_f32m1_b32(vi4, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi4, vm4, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx4, vm4, vl);
    
            vuint32m1_t vidx5 = __riscv_vadd_vx_u32m1(vidx4, 1, vl);
            vbool32_t vm5 = __riscv_vmfgt_vv_f32m1_b32(vi5, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi5, vm5, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx5, vm5, vl);
    
            vuint32m1_t vidx6 = __riscv_vadd_vx_u32m1(vidx5, 1, vl);
            vbool32_t vm6 = __riscv_vmfgt_vv_f32m1_b32(vi6, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi6, vm6, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx6, vm6, vl);
    
            vuint32m1_t vidx7 = __riscv_vadd_vx_u32m1(vidx6, 1, vl);
            vbool32_t vm7 = __riscv_vmfgt_vv_f32m1_b32(vi7, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi7, vm7, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx7, vm7, vl);
    
            vuint32m1_t vidx8 = __riscv_vadd_vx_u32m1(vidx7, 1, vl);
            vbool32_t vm8 = __riscv_vmfgt_vv_f32m1_b32(vi8, vmax, vl);
            vmax = __riscv_vmerge_vvm_f32m1(vmax, vi8, vm8, vl);
            vidx = __riscv_vmerge_vvm_u32m1(vidx, vidx8, vm8, vl);
    
            __riscv_vse32_v_f32m1(o, vmax, vl); o += vl;
            __riscv_vse32_v_u32m1(ix, vidx, vl); ix += vl;
    
            c -= vl;
          }
    
          idx_base += 9;
          ab = output;
          ib = index;
        }
    
        input = (const float**) ((uintptr_t) input + input_increment);
        input_offset += input_pixel_stride;
        output = (float*) ((uintptr_t) output + output_increment);
        index = (uint32_t*) ((uintptr_t) index + index_increment);
      } while (--output_pixels != 0);
    }
}
