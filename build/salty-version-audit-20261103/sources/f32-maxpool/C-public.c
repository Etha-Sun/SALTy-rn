#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

// Forward declaration for the params structure
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};

// Assuming XNN_OOB_READS is a macro defined elsewhere, we leave it empty if not defined
#ifndef XNN_OOB_READS
#define XNN_OOB_READS
#endif

void test_rvv(
    size_t output_pixels,
    size_t kernel_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    size_t input_increment,
    size_t output_increment,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(channels != 0);

  const float vmin = params->scalar.min;
  const float vmax = params->scalar.max;

  do {
    size_t c = channels;
    float* out_ptr = output;
    size_t channel_chunk_offset = 0;

    // Process channels in blocks of VLMAX (LMUL=8 to maximize chime length)
    while (c > 0) {
      const size_t vl = __riscv_vsetvl_e32m8(c);
      const float** k_ptr_base = input;
      
      // Hoist the combined byte-wise offset calculation out of the kernel loop.
      const size_t total_byte_offset = input_offset + (channel_chunk_offset * sizeof(float));

      // Initialize accumulator with the first kernel element.
      // Use char* casting for direct byte-wise offset application.
      const char* i0_base = (const char*) k_ptr_base[0];
      vfloat32m8_t vacc = __riscv_vle32_v_f32m8((const float*) (i0_base + total_byte_offset), vl);

      // Accumulate remaining kernel elements directly into the register.
      size_t k = 1;
      for (; k + 3 < kernel_elements; k += 4) {
        const char* ik0_base = (const char*) k_ptr_base[k];
        const char* ik1_base = (const char*) k_ptr_base[k+1];
        const char* ik2_base = (const char*) k_ptr_base[k+2];
        const char* ik3_base = (const char*) k_ptr_base[k+3];

        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8((const float*) (ik0_base + total_byte_offset), vl), vl);
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8((const float*) (ik1_base + total_byte_offset), vl), vl);
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8((const float*) (ik2_base + total_byte_offset), vl), vl);
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8((const float*) (ik3_base + total_byte_offset), vl), vl);
      }
      // Process remaining kernel elements
      for (; k < kernel_elements; k++) {
        const char* ik_base = (const char*) k_ptr_base[k];
        vacc = __riscv_vfmax_vv_f32m8(vacc, __riscv_vle32_v_f32m8((const float*) (ik_base + total_byte_offset), vl), vl);
      }

      // Apply activation clamping (Min/Max) at the end of the kernel reduction
      vacc = __riscv_vfmax_vf_f32m8(vacc, vmin, vl);
      vacc = __riscv_vfmin_vf_f32m8(vacc, vmax, vl);

      // Store the final result for this channel block exactly once
      __riscv_vse32_v_f32m8(out_ptr, vacc, vl);

      // Increment pointers for the next channel block within the same pixel
      out_ptr += vl;
      channel_chunk_offset += vl;
      c -= vl;
    }

    // Scalar bookkeeping for the next output pixel using byte-wise arithmetic
    input = (const float**) ((const char*) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((const char*) output + output_increment);
  } while (--output_pixels != 0);
}
