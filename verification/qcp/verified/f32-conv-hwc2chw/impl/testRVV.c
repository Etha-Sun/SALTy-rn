#include "../shim/hc_rvv_pixel9.h"
#include "../shim/nan_helpers.h"
#include "../shim/read_api.h"
void test_rvv(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(input_width != 0);
  assert(output_y_end > output_y_start);
  assert(input_padding_top <= 1);
  assert(output_channels != 0);

  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(float);

  // Adjustment for padding processed below
  const float* i0 = (const float*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const float* i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
  const float* i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  float* output0 = (float*) ((uintptr_t) output + output_height_stride * output_y_start);
  float* output1 = (float*) ((uintptr_t) output0 + output_height_stride);

  if XNN_UNPREDICTABLE(output_y_start < input_padding_top) {
    i0 = zero;
  }

  for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if XNN_UNPREDICTABLE(input_y2 >= input_height) {
      i2 = zero;
    }
    if XNN_UNPREDICTABLE(input_y4 > input_height) {
      i3 = zero;
    }
    if XNN_UNPREDICTABLE(input_y4 >= input_height) {
      i4 = zero;
    }
    if XNN_UNPREDICTABLE(output_y + 2 > output_y_end) {
      output1 = output0;
    }

    const float* w = weights;
    size_t c = output_channels;
    float* o0c0 = output0;
    float* o1c0 = output1;
    float* o0c1 = (float*) ((uintptr_t) o0c0 + output_channel_stride);
    float* o1c1 = (float*) ((uintptr_t) o1c0 + output_channel_stride);
    float* o0c2 = (float*) ((uintptr_t) o0c1 + output_channel_stride);
    float* o1c2 = (float*) ((uintptr_t) o1c1 + output_channel_stride);
    float* o0c3 = (float*) ((uintptr_t) o0c2 + output_channel_stride);
    float* o1c3 = (float*) ((uintptr_t) o1c2 + output_channel_stride);
    do {
      if XNN_UNPREDICTABLE(c < 2) {
        o0c1 = o0c0;
        o1c1 = o1c0;
      }
      if XNN_UNPREDICTABLE(c <= 2) {
        o0c2 = o0c1;
        o1c2 = o1c1;
      }
      if XNN_UNPREDICTABLE(c < 4) {
        o0c3 = o0c2;
        o1c3 = o1c2;
      }

      size_t ow = output_width;
      size_t ow_done = 0;
      
      float* current_o0c0 = o0c0;
      float* current_o0c1 = o0c1;
      float* current_o0c2 = o0c2;
      float* current_o0c3 = o0c3;
      float* current_o1c0 = o1c0;
      float* current_o1c1 = o1c1;
      float* current_o1c2 = o1c2;
      float* current_o1c3 = o1c3;

      while (ow > 0) {
        size_t vl = __riscv_vsetvl_e32m1(ow);
        vfloat32m1_t v_o0c0 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,0u,vl);
        vfloat32m1_t v_o0c1 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,1u,vl);
        vfloat32m1_t v_o0c2 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,2u,vl);
        vfloat32m1_t v_o0c3 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,3u,vl);
        vfloat32m1_t v_o1c0 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,0u,vl);
        vfloat32m1_t v_o1c1 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,1u,vl);
        vfloat32m1_t v_o1c2 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,2u,vl);
        vfloat32m1_t v_o1c3 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,3u,vl);

        v_o0c0 = hc_max_f32m1(&v_o0c0, hc_read_scalar(&(params->scalar.min)), vl);
        v_o0c1 = hc_max_f32m1(&v_o0c1, hc_read_scalar(&(params->scalar.min)), vl);
        v_o0c2 = hc_max_f32m1(&v_o0c2, hc_read_scalar(&(params->scalar.min)), vl);
        v_o0c3 = hc_max_f32m1(&v_o0c3, hc_read_scalar(&(params->scalar.min)), vl);

        v_o1c0 = hc_max_f32m1(&v_o1c0, hc_read_scalar(&(params->scalar.min)), vl);
        v_o1c1 = hc_max_f32m1(&v_o1c1, hc_read_scalar(&(params->scalar.min)), vl);
        v_o1c2 = hc_max_f32m1(&v_o1c2, hc_read_scalar(&(params->scalar.min)), vl);
        v_o1c3 = hc_max_f32m1(&v_o1c3, hc_read_scalar(&(params->scalar.min)), vl);

        v_o0c0 = hc_min_f32m1(&v_o0c0, hc_read_scalar(&(params->scalar.max)), vl);
        v_o0c1 = hc_min_f32m1(&v_o0c1, hc_read_scalar(&(params->scalar.max)), vl);
        v_o0c2 = hc_min_f32m1(&v_o0c2, hc_read_scalar(&(params->scalar.max)), vl);
        v_o0c3 = hc_min_f32m1(&v_o0c3, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c0 = hc_min_f32m1(&v_o1c0, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c1 = hc_min_f32m1(&v_o1c1, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c2 = hc_min_f32m1(&v_o1c2, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c3 = hc_min_f32m1(&v_o1c3, hc_read_scalar(&(params->scalar.max)), vl);

        // Store row 1 BEFORE row 0: when there is a single output row the caller
        // aliases output1==output0, so the LAST store must be the valid row 0
        // (matches the NEON gold; storing o0 last fixes the row-1-overwrites-row-0 bug).
        __riscv_vse32_v_f32m1(current_o1c0, v_o1c0, vl); current_o1c0 += vl;
        __riscv_vse32_v_f32m1(current_o1c1, v_o1c1, vl); current_o1c1 += vl;
        __riscv_vse32_v_f32m1(current_o1c2, v_o1c2, vl); current_o1c2 += vl;
        __riscv_vse32_v_f32m1(current_o1c3, v_o1c3, vl); current_o1c3 += vl;

        __riscv_vse32_v_f32m1(current_o0c0, v_o0c0, vl); current_o0c0 += vl;
        __riscv_vse32_v_f32m1(current_o0c1, v_o0c1, vl); current_o0c1 += vl;
        __riscv_vse32_v_f32m1(current_o0c2, v_o0c2, vl); current_o0c2 += vl;
        __riscv_vse32_v_f32m1(current_o0c3, v_o0c3, vl); current_o0c3 += vl;

        ow -= vl;
        ow_done += vl;
      }

      o0c0 = (float*) ((uintptr_t) current_o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) current_o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) current_o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) current_o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) current_o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) current_o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) current_o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) current_o1c3 + output_channel_increment);

      w += 112;
      c = (c > 4) ? c - 4 : 0;
    } while (c != 0);

    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);

    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}
