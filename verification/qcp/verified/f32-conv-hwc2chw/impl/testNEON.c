#include "../shim/store_half.h"
#include "../shim/neon_rows_pixel.h"
/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/

void test_neon(
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
  const size_t input_width_increment = round_down_po2(input_width, 4) * 3 /* channels */ * sizeof(float);
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

  const float32x4_t vmin = vld1q_dup_f32(&params->scalar.min);
  const float32x4_t vmax = vld1q_dup_f32(&params->scalar.max);

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

      // viMx0 = ( iM0c2, iM0c1, iM0c0, --- )

      const float *hc_row0=i0;
      const float *hc_row1=i1;
      const float *hc_row2=i2;
      const float *hc_row3=i3;
      const float *hc_row4=i4;
      size_t iw = input_width;
      for (; iw >= 4; iw -= 4) {
        const size_t hc_x=(input_width-iw)/2;
        float32x4_t vo0x0=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x);
        float32x4_t vo1x0=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x);
        float32x4_t vo0x1=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x+1);
        float32x4_t vo1x1=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x+1);
        i0+=12;
        i1+=12;
        i2+=12;
        i3+=12;
        i4+=12;
        vo0x0 = vmaxq_f32(vo0x0, vmin);
        vo1x0 = vmaxq_f32(vo1x0, vmin);
        vo0x1 = vmaxq_f32(vo0x1, vmin);
        vo1x1 = vmaxq_f32(vo1x1, vmin);

        vo0x0 = vminq_f32(vo0x0, vmax);
        vo1x0 = vminq_f32(vo1x0, vmax);
        vo0x1 = vminq_f32(vo0x1, vmax);
        vo1x1 = vminq_f32(vo1x1, vmax);

        const float32x4_t vo0c01 = vzip1q_f32(vo0x0, vo0x1);
        const float32x4_t vo0c23 = vzip2q_f32(vo0x0, vo0x1);
        const float32x4_t vo1c01 = vzip1q_f32(vo1x0, vo1x1);
        const float32x4_t vo1c23 = vzip2q_f32(vo1x0, vo1x1);

        // Always 2+ output width elements remaining
        hc_store_low_half(o1c0,&vo1c01); o1c0 += 2;
        hc_store_high_half(o1c1,&vo1c01); o1c1 += 2;
        hc_store_low_half(o1c2,&vo1c23); o1c2 += 2;
        hc_store_high_half(o1c3,&vo1c23); o1c3 += 2;

        hc_store_low_half(o0c0,&vo0c01); o0c0 += 2;
        hc_store_high_half(o0c1,&vo0c01); o0c1 += 2;
        hc_store_low_half(o0c2,&vo0c23); o0c2 += 2;
        hc_store_high_half(o0c3,&vo0c23); o0c3 += 2;
      }
      assert(iw < 4);
      if XNN_UNLIKELY(iw != 0) {
        const size_t hc_x=(input_width-iw)/2;
        float32x4_t vo0x0=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x);
        float32x4_t vo1x0=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x);
        float32x4_t vo0x1=vmovq_n_f32(0.0f);
        float32x4_t vo1x1=vmovq_n_f32(0.0f);
        if(iw==3){
          vo0x1=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x+1);
          vo1x1=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x+1);
        }
        vo0x0 = vmaxq_f32(vo0x0, vmin);
        vo1x0 = vmaxq_f32(vo1x0, vmin);
        vo0x1 = vmaxq_f32(vo0x1, vmin);
        vo1x1 = vmaxq_f32(vo1x1, vmin);

        vo0x0 = vminq_f32(vo0x0, vmax);
        vo1x0 = vminq_f32(vo1x0, vmax);
        vo0x1 = vminq_f32(vo0x1, vmax);
        vo1x1 = vminq_f32(vo1x1, vmax);

        if (iw == 3) {
          // Exactly 2 output width elements remaining
          const float32x4_t vo0c01 = vzip1q_f32(vo0x0, vo0x1);
          const float32x4_t vo0c23 = vzip2q_f32(vo0x0, vo0x1);
          const float32x4_t vo1c01 = vzip1q_f32(vo1x0, vo1x1);
          const float32x4_t vo1c23 = vzip2q_f32(vo1x0, vo1x1);

          hc_store_low_half(o1c0,&vo1c01); o1c0 += 2;
          hc_store_high_half(o1c1,&vo1c01); o1c1 += 2;
          hc_store_low_half(o1c2,&vo1c23); o1c2 += 2;
          hc_store_high_half(o1c3,&vo1c23); o1c3 += 2;

          hc_store_low_half(o0c0,&vo0c01); o0c0 += 2;
          hc_store_high_half(o0c1,&vo0c01); o0c1 += 2;
          hc_store_low_half(o0c2,&vo0c23); o0c2 += 2;
          hc_store_high_half(o0c3,&vo0c23); o0c3 += 2;
        } else {
          // Exactly 1 output width element remaining

          vst1q_lane_f32(o1c0, vo1x0, 0); o1c0 += 1;
          vst1q_lane_f32(o1c1, vo1x0, 1); o1c1 += 1;
          vst1q_lane_f32(o1c2, vo1x0, 2); o1c2 += 1;
          vst1q_lane_f32(o1c3, vo1x0, 3); o1c3 += 1;

          vst1q_lane_f32(o0c0, vo0x0, 0); o0c0 += 1;
          vst1q_lane_f32(o0c1, vo0x0, 1); o0c1 += 1;
          vst1q_lane_f32(o0c2, vo0x0, 2); o0c2 += 1;
          vst1q_lane_f32(o0c3, vo0x0, 3); o0c3 += 1;
        }
      }
      // Move output pointers back to the position of the first pixel in a row,
      // and forward to the next block of output channels.
      o0c0 = (float*) ((uintptr_t) o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) o1c3 + output_channel_increment);
      // Revert input pointers to the position of the first pixel in a row
      i0 = (const float*) ((uintptr_t) i0 - input_width_increment);
      i1 = (const float*) ((uintptr_t) i1 - input_width_increment);
      i2 = (const float*) ((uintptr_t) i2 - input_width_increment);
      i3 = (const float*) ((uintptr_t) i3 - input_width_increment);
      i4 = (const float*) ((uintptr_t) i4 - input_width_increment);
      // Move to the block of weights for the next 4 output channels
      w += 112;
      c = doz(c, 4);
    } while (c != 0);
    // Move output pointers forward to the next two rows
    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);
    // Move input pointers forward to the next four rows
    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}
