#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

#ifndef XNN_OOB_READS
#define XNN_OOB_READS
#endif

/**
 * @brief High-performance RVV Max Pooling across channels optimized for Saturn.
 * 
 * Performance Strategies:
 * 1. LMUL=8: Maximizes chime length to hide the 4-stage FMA/Arithmetic pipeline latency 
 *    and reduces scalar instruction pressure.
 * 2. Loop Unrolling: Unrolls the inner spatial pooling loop by 2 to reduce scalar 
 *    bookkeeping overhead and provide more back-to-back vector operations for the DAE.
 * 3. Chaining & Decoupling: Interleaves scalar address calculations and vector 
 *    loads (VLS) with vector arithmetic (VXS) to allow sequencers to operate in parallel.
 * 4. Register Pressure Management: Strictly orders instructions to keep only three 
 *    LMUL=8 vector groups (vmax, vidx, vi) live at any point, preventing spills.
 * 5. Dependency Reduction: Orders vfmax before vmerge to shorten the loop-carried 
 *    dependency on vmax and to hide the mask generation latency for vm0. This 
 *    optimization targets Split execute configurations by maximizing instruction 
 *    distance between the producer of the mask (VXS-FP) and its consumer (VXS-Int).
 */
void test_rvv(
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
    size_t index_increment) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(pooling_elements != 0);
  assert(channels != 0);

  do {
    size_t c = channels;
    size_t c_offset = 0;

    // Outer loop: Processes channels in chunks of VLMAX using LMUL=8.
    while (c > 0) {
      const size_t vl = __riscv_vsetvl_e32m8(c);

      // Hoist address arithmetic: Pre-calculate channel-wise byte offset.
      const size_t total_byte_offset = input_offset + c_offset * sizeof(float);

      const float** id = input;
      // Initialize running maximum and index with the first element of the pooling window.
      const float* i_ptr = *id++;
      const float* i_first = (const float*) ((uintptr_t) i_ptr + total_byte_offset);
      
      vfloat32m8_t vmax = __riscv_vle32_v_f32m8(i_first, vl);
      vuint32m8_t vidx = __riscv_vmv_v_x_u32m8(0, vl);

      uint32_t current_idx = 1;
      int k = (int) pooling_elements - 1;

      if (k > 0) {
        // Prime the scalar address for the first element in the loop.
        const float* i_next_ptr = *id++;
        const float* i_next = (const float*) ((uintptr_t) i_next_ptr + total_byte_offset);

        // Inner loop: Unrolled by 2 to maximize sequencer occupancy.
        for (; k > 2; k -= 2) {
          // --- First Element of Unroll ---
          vfloat32m8_t vi0 = __riscv_vle32_v_f32m8(i_next, vl);
          
          // Interleave scalar work for the second element while vi0 is loading.
          const float* i_next_ptr1 = *id++;
          const float* i_next1 = (const float*) ((uintptr_t) i_next_ptr1 + total_byte_offset);

          // Arithmetic Strategy: Swap vfmax and vmerge.
          // Distance between vmfgt (mask producer) and vmerge (mask consumer) is increased.
          vbool4_t vm0 = __riscv_vmfgt_vv_f32m8_b4(vi0, vmax, vl);
          vmax = __riscv_vfmax_vv_f32m8(vmax, vi0, vl); // Shorten loop-carried dependency on vmax
          vidx = __riscv_vmerge_vxm_u32m8(vidx, current_idx, vm0, vl); // Hide mask generation latency

          // --- Second Element of Unroll ---
          // Register reuse: vi0 is dead; vi1 can occupy the same physical registers.
          vfloat32m8_t vi1 = __riscv_vle32_v_f32m8(i_next1, vl);
          
          // Interleave scalar work for the next iteration while vi1 is loading.
          i_next_ptr = *id++;
          i_next = (const float*) ((uintptr_t) i_next_ptr + total_byte_offset);

          vbool4_t vm1 = __riscv_vmfgt_vv_f32m8_b4(vi1, vmax, vl);
          vmax = __riscv_vfmax_vv_f32m8(vmax, vi1, vl);
          vidx = __riscv_vmerge_vxm_u32m8(vidx, current_idx + 1, vm1, vl);

          current_idx += 2;
        }

        // Handle remainder if k was even (1 element left before the peeled iteration).
        if (k > 1) {
          vfloat32m8_t vi = __riscv_vle32_v_f32m8(i_next, vl);
          vbool4_t vm = __riscv_vmfgt_vv_f32m8_b4(vi, vmax, vl);
          
          // Scalar update to correctly feed the final peeled iteration.
          i_next_ptr = *id++;
          i_next = (const float*) ((uintptr_t) i_next_ptr + total_byte_offset);

          vmax = __riscv_vfmax_vv_f32m8(vmax, vi, vl);
          vidx = __riscv_vmerge_vxm_u32m8(vidx, current_idx, vm, vl);

          current_idx += 1;
        }

        // Final Iteration (Peeled): Processes the last spatial element.
        vfloat32m8_t vi = __riscv_vle32_v_f32m8(i_next, vl);
        vbool4_t vm = __riscv_vmfgt_vv_f32m8_b4(vi, vmax, vl);
        vmax = __riscv_vfmax_vv_f32m8(vmax, vi, vl);
        vidx = __riscv_vmerge_vxm_u32m8(vidx, current_idx, vm, vl);
      }

      // Store results using VSS sequencer.
      __riscv_vse32_v_f32m8(output + c_offset, vmax, vl);
      __riscv_vse32_v_u32m8(index + c_offset, vidx, vl);

      c -= vl;
      c_offset += vl;
    }

    // Scalar updates for the next pixel.
    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    index = (uint32_t*) ((uintptr_t) index + index_increment);
  } while (--output_pixels != 0);
}
