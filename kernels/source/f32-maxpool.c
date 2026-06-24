/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/

void test_neon(
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

  const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
  const float32x4_t vmax = vdupq_n_f32(params->scalar.max);

  do {
    const float** i = (const float**) input;

    // First pass: load the inputs, store the max pool in the output.
    const float* i0 = *i++;
    const float* i1 = 1 < kernel_elements ? *i++ : i0;
    const float* i2 = 2 < kernel_elements ? *i++ : i0;
    const float* i3 = 3 < kernel_elements ? *i++ : i0;
    const float* i4 = 4 < kernel_elements ? *i++ : i0;
    const float* i5 = 5 < kernel_elements ? *i++ : i0;
    const float* i6 = 6 < kernel_elements ? *i++ : i0;
    const float* i7 = 7 < kernel_elements ? *i++ : i0;
    const float* i8 = 8 < kernel_elements ? *i++ : i0;
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
    size_t c = channels;
    for (; c >= 4; c -= 4) {
      const float32x4_t vi0 = vld1q_f32(i0); i0 += 4;
      const float32x4_t vi1 = vld1q_f32(i1); i1 += 4;
      const float32x4_t vi2 = vld1q_f32(i2); i2 += 4;
      const float32x4_t vi3 = vld1q_f32(i3); i3 += 4;
      const float32x4_t vi4 = vld1q_f32(i4); i4 += 4;
      const float32x4_t vi5 = vld1q_f32(i5); i5 += 4;
      const float32x4_t vi6 = vld1q_f32(i6); i6 += 4;
      const float32x4_t vi7 = vld1q_f32(i7); i7 += 4;
      const float32x4_t vi8 = vld1q_f32(i8); i8 += 4;

      const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
      const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
      const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
      const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

      const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
      const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
      float32x4_t vacc = vmaxq_f32(vmax2345, vmax01678);

      vacc = vmaxq_f32(vacc, vmin);
      vacc = vminq_f32(vacc, vmax);

      vst1q_f32(o, vacc); o += 4;
    }
    if (c != 0) {
      const float32x4_t vi0 = vld1q_f32(i0);
      const float32x4_t vi1 = vld1q_f32(i1);
      const float32x4_t vi2 = vld1q_f32(i2);
      const float32x4_t vi3 = vld1q_f32(i3);
      const float32x4_t vi4 = vld1q_f32(i4);
      const float32x4_t vi5 = vld1q_f32(i5);
      const float32x4_t vi6 = vld1q_f32(i6);
      const float32x4_t vi7 = vld1q_f32(i7);
      const float32x4_t vi8 = vld1q_f32(i8);

      const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
      const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
      const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
      const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

      const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
      const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
      float32x4_t vacc = vmaxq_f32(vmax2345, vmax01678);

      vacc = vmaxq_f32(vacc, vmin);
      vacc = vminq_f32(vacc, vmax);

      float32x2_t vacc_lo = vget_low_f32(vacc);
      if (c & 2) {
        vst1_f32(o, vacc_lo); o += 2;
        vacc_lo = vget_high_f32(vacc);
      }
      if (c & 1) {
        vst1_lane_f32(o, vacc_lo, 0); o += 1;
      }
    }

    // Passes 1 - n: Max more inputs to the output.
    for (int k = (int) kernel_elements - 9; k > 0; k -= 9) {
      const float* i0 = *i++;
      const float* i1 = 1 < k ? *i++ : i0;
      const float* i2 = 2 < k ? *i++ : i0;
      const float* i3 = 3 < k ? *i++ : i0;
      const float* i4 = 4 < k ? *i++ : i0;
      const float* i5 = 5 < k ? *i++ : i0;
      const float* i6 = 6 < k ? *i++ : i0;
      const float* i7 = 7 < k ? *i++ : i0;
      const float* i8 = 8 < k ? *i++ : i0;
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
      size_t c = channels;
      for (; c >= 4; c -= 4) {
        const float32x4_t vi0 = vld1q_f32(i0); i0 += 4;
        const float32x4_t vi1 = vld1q_f32(i1); i1 += 4;
        const float32x4_t vi2 = vld1q_f32(i2); i2 += 4;
        const float32x4_t vi3 = vld1q_f32(i3); i3 += 4;
        const float32x4_t vi4 = vld1q_f32(i4); i4 += 4;
        const float32x4_t vi5 = vld1q_f32(i5); i5 += 4;
        const float32x4_t vi6 = vld1q_f32(i6); i6 += 4;
        const float32x4_t vi7 = vld1q_f32(i7); i7 += 4;
        const float32x4_t vi8 = vld1q_f32(i8); i8 += 4;
        const float32x4_t vprev = vld1q_f32(o);

        const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
        const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
        const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
        const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

        const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
        const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
        const float32x4_t vmax012345678 = vmaxq_f32(vmax2345, vmax01678);

        float32x4_t vacc = vmaxq_f32(vprev, vmax012345678);

        vacc = vminq_f32(vacc, vmax);

        vst1q_f32(o, vacc); o += 4;
      }
      if (c != 0) {
        const float32x4_t vi0 = vld1q_f32(i0);
        const float32x4_t vi1 = vld1q_f32(i1);
        const float32x4_t vi2 = vld1q_f32(i2);
        const float32x4_t vi3 = vld1q_f32(i3);
        const float32x4_t vi4 = vld1q_f32(i4);
        const float32x4_t vi5 = vld1q_f32(i5);
        const float32x4_t vi6 = vld1q_f32(i6);
        const float32x4_t vi7 = vld1q_f32(i7);
        const float32x4_t vi8 = vld1q_f32(i8);
        const float32x4_t vprev = vld1q_f32(o);

        const float32x4_t vmax018 = vmaxq_f32(vmaxq_f32(vi0, vi1), vi8);
        const float32x4_t vmax23 = vmaxq_f32(vi2, vi3);
        const float32x4_t vmax45 = vmaxq_f32(vi4, vi5);
        const float32x4_t vmax67 = vmaxq_f32(vi6, vi7);

        const float32x4_t vmax2345 = vmaxq_f32(vmax23, vmax45);
        const float32x4_t vmax01678 = vmaxq_f32(vmax018, vmax67);
        const float32x4_t vmax012345678 = vmaxq_f32(vmax2345, vmax01678);

        float32x4_t vacc = vmaxq_f32(vprev, vmax012345678);

        vacc = vminq_f32(vacc, vmax);

        float32x2_t vacc_lo = vget_low_f32(vacc);
        if (c & 2) {
          vst1_f32(o, vacc_lo); o += 2;
          vacc_lo = vget_high_f32(vacc);
        }
        if (c & 1) {
          vst1_lane_f32(o, vacc_lo, 0); o += 1;
        }
      }
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
  } while (--output_pixels != 0);
}
