#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};

#define XNN_UNPREDICTABLE(x) (x)
#define XNN_OOB_READS

void test_rvv(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(channels != 0);
  assert(output_width != 0);

  // Hoist scalar min/max parameters to reduce scalar memory accesses in the loop
  const float v_min = params->scalar.min;
  const float v_max = params->scalar.max;

  size_t c_rem = channels;
  const float* w = weights;
  size_t channel_idx = 0;

  // Outer loop: Strip-mine the channels (C-dimension)
  while (c_rem > 0) {
    const size_t vl = __riscv_vsetvl_e32m4(c_rem);

    // Hoist weight loads: weights are stored in blocks of 'vl' for each kernel parameter.
    // Saturn's VLS handles these unit-stride loads efficiently.
    vfloat32m4_t vb  = __riscv_vle32_v_f32m4(w, vl); w += vl;
    vfloat32m4_t vk0 = __riscv_vle32_v_f32m4(w, vl); w += vl;
    vfloat32m4_t vk1 = __riscv_vle32_v_f32m4(w, vl); w += vl;
    vfloat32m4_t vk2 = __riscv_vle32_v_f32m4(w, vl); w += vl;

    const float** current_input = input;
    size_t current_input_offset = input_offset;
    uintptr_t current_output = (uintptr_t)output + (channel_idx * sizeof(float));
    const size_t output_step = (channels * sizeof(float)) + output_increment;

    // Pre-load the first pixel's vector inputs to initialize the software pipeline.
    const float* i0 = current_input[0];
    const float* i1 = current_input[1];
    const float* i2 = current_input[2];
    if XNN_UNPREDICTABLE(i0 != zero) i0 = (const float*)((uintptr_t)i0 + current_input_offset);
    if XNN_UNPREDICTABLE(i1 != zero) i1 = (const float*)((uintptr_t)i1 + current_input_offset);
    if XNN_UNPREDICTABLE(i2 != zero) i2 = (const float*)((uintptr_t)i2 + current_input_offset);

    vfloat32m4_t vi0 = __riscv_vle32_v_f32m4(i0 + channel_idx, vl);
    vfloat32m4_t vi1 = __riscv_vle32_v_f32m4(i1 + channel_idx, vl);
    vfloat32m4_t vi2 = __riscv_vle32_v_f32m4(i2 + channel_idx, vl);

    size_t ow = 0;
    // Software Pipelined Loop: Overlap arithmetic of current pixel with loads of next pixel.
    // LMUL=4 provides a long chime (8+ cycles depending on DLEN) to hide FMA latency.
    if (output_width > 1) {
      for (; ow < output_width - 1; ow++) {
        // Resolve pointers for the NEXT pixel ahead of time.
        const float** next_input = (const float**) ((uintptr_t) current_input + input_stride);
        size_t next_input_offset = current_input_offset + input_pixel_stride;

        const float* ni0 = next_input[0];
        const float* ni1 = next_input[1];
        const float* ni2 = next_input[2];
        if XNN_UNPREDICTABLE(ni0 != zero) ni0 = (const float*)((uintptr_t)ni0 + next_input_offset);
        if XNN_UNPREDICTABLE(ni1 != zero) ni1 = (const float*)((uintptr_t)ni1 + next_input_offset);
        if XNN_UNPREDICTABLE(ni2 != zero) ni2 = (const float*)((uintptr_t)ni2 + next_input_offset);

        // Interleaving strategy: Once an input is read by the VXS (arithmetic),
        // we immediately issue a VLS (load) to the same register group for the next pixel.
        vfloat32m4_t vacc = vb; // Initial accumulator = bias
        
        vacc = __riscv_vfmacc_vv_f32m4(vacc, vi0, vk0, vl);
        vi0 = __riscv_vle32_v_f32m4(ni0 + channel_idx, vl); // Load next i0 while FMA1 runs

        vacc = __riscv_vfmacc_vv_f32m4(vacc, vi1, vk1, vl);
        vi1 = __riscv_vle32_v_f32m4(ni1 + channel_idx, vl); // Load next i1 while FMA2 runs

        vacc = __riscv_vfmacc_vv_f32m4(vacc, vi2, vk2, vl);
        vi2 = __riscv_vle32_v_f32m4(ni2 + channel_idx, vl); // Load next i2 while FMA3 runs

        // Apply clamping
        vacc = __riscv_vfmax_vf_f32m4(vacc, v_min, vl);
        vacc = __riscv_vfmin_vf_f32m4(vacc, v_max, vl);

        // Store result. VSS operates concurrently with VXS and VLS in Saturn.
        __riscv_vse32_v_f32m4((float*)current_output, vacc, vl);

        // Advance scalar pointers for next iteration
        current_input = next_input;
        current_input_offset = next_input_offset;
        current_output += output_step;
      }
    }

    // Drain the pipeline: Process the final pixel segment.
    vfloat32m4_t vacc = vb;
    vacc = __riscv_vfmacc_vv_f32m4(vacc, vi0, vk0, vl);
    vacc = __riscv_vfmacc_vv_f32m4(vacc, vi1, vk1, vl);
    vacc = __riscv_vfmacc_vv_f32m4(vacc, vi2, vk2, vl);

    vacc = __riscv_vfmax_vf_f32m4(vacc, v_min, vl);
    vacc = __riscv_vfmin_vf_f32m4(vacc, v_max, vl);

    __riscv_vse32_v_f32m4((float*)current_output, vacc, vl);

    // Strip-mining bookkeeping
    c_rem -= vl;
    channel_idx += vl;
  }
}
