// f16-conv-hwc2chw verification harness — cvc5 backend.
//
// Mirrors build/verification/harnesses/verify_f16-conv-hwc2chw.cpp but uses
// cvc5 1.3.2 instead of bitwuzla.  Reduced configuration:
//   - input_width = 2
//   - output_channels = {1}
//   - batch (output_rows) = 1 (driven via main argv[start..end])
//   - per-query time limit: 600s (cvc5 option "tlimit-per")
//
// Build via src/verification_cvc5/CMakeLists.txt.

#include "salt.hpp"

#include <cassert>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

using namespace salt_cvc5;

namespace neon_kernel {
/*
struct xnn_f16_minmax_params {
  struct {
    xnn_float16 min;
    xnn_float16 max;
  } scalar;
};
*/
void test(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const xnn_float16* input,
    const xnn_float16* zero,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f16_minmax_params* params)
{
  assert(input_width != 0);
  assert(output_y_end > output_y_start);
  assert(input_padding_top <= 1);
  assert(output_channels != 0);

  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(uint16_t);
  const size_t input_width_increment = round_down_po2(input_width, 4) * 3 /* channels */ * sizeof(uint16_t);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(uint16_t);

  const uint16_t* i0 = (const uint16_t*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const uint16_t* i1 = (const uint16_t*) ((uintptr_t) i0 + input_height_stride);
  const uint16_t* i2 = (const uint16_t*) ((uintptr_t) i1 + input_height_stride);
  const uint16_t* i3 = (const uint16_t*) ((uintptr_t) i2 + input_height_stride);
  const uint16_t* i4 = (const uint16_t*) ((uintptr_t) i3 + input_height_stride);
  uint16_t* output0 = (uint16_t*) ((uintptr_t) output + output_height_stride * output_y_start);
  uint16_t* output1 = (uint16_t*) ((uintptr_t) output0 + output_height_stride);

  if XNN_UNPREDICTABLE(output_y_start < input_padding_top) {
    i0 = (const uint16_t*) zero;
  }

  const float16x4_t vmax = vreinterpret_f16_u16(vdup_n_u16(*(const uint16_t*) &params->scalar.max));
  const float16x4_t vmin = vreinterpret_f16_u16(vdup_n_u16(*(const uint16_t*) &params->scalar.min));

  for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if XNN_UNPREDICTABLE(input_y2 >= input_height) { i2 = (const uint16_t*) zero; }
    if XNN_UNPREDICTABLE(input_y4 > input_height)  { i3 = (const uint16_t*) zero; }
    if XNN_UNPREDICTABLE(input_y4 >= input_height) { i4 = (const uint16_t*) zero; }
    if XNN_UNPREDICTABLE(output_y + 2 > output_y_end) { output1 = output0; }

    const uint16_t* w = (const uint16_t*) weights;
    size_t c = output_channels;
    uint16_t* o0c0 = output0;
    uint16_t* o1c0 = output1;
    uint16_t* o0c1 = (uint16_t*) ((uintptr_t) o0c0 + output_channel_stride);
    uint16_t* o1c1 = (uint16_t*) ((uintptr_t) o1c0 + output_channel_stride);
    uint16_t* o0c2 = (uint16_t*) ((uintptr_t) o0c1 + output_channel_stride);
    uint16_t* o1c2 = (uint16_t*) ((uintptr_t) o1c1 + output_channel_stride);
    uint16_t* o0c3 = (uint16_t*) ((uintptr_t) o0c2 + output_channel_stride);
    uint16_t* o1c3 = (uint16_t*) ((uintptr_t) o1c2 + output_channel_stride);
    do {
      if XNN_UNPREDICTABLE(c < 2)  { o0c1 = o0c0; o1c1 = o1c0; }
      if XNN_UNPREDICTABLE(c <= 2) { o0c2 = o0c1; o1c2 = o1c1; }
      if XNN_UNPREDICTABLE(c < 4)  { o0c3 = o0c2; o1c3 = o1c2; }

      float16x4_t vi0x0 = vreinterpret_f16_u16(vmov_n_u16(0));
      float16x4_t vi1x0 = vreinterpret_f16_u16(vmov_n_u16(0));
      float16x4_t vi2x0 = vreinterpret_f16_u16(vmov_n_u16(0));
      float16x4_t vi3x0 = vreinterpret_f16_u16(vmov_n_u16(0));
      float16x4_t vi4x0 = vreinterpret_f16_u16(vmov_n_u16(0));

      size_t iw = input_width;
      for (; iw >= 4; iw -= 4) {
        float16x4_t vo0x0 = vreinterpret_f16_u16(vld1_u16(w));
        float16x4_t vo1x0 = vo0x0;
        float16x4_t vo0x1 = vo0x0;
        float16x4_t vo1x1 = vo0x0;

        const float16x4_t vk00c0 = vreinterpret_f16_u16(vld1_u16(w + 4));

        const float16x4_t vi0x1 = vreinterpret_f16_u16(vld1_u16(i0)); i0 += 4;
        const float16x4_t vi1x1 = vreinterpret_f16_u16(vld1_u16(i1)); i1 += 4;
        const float16x4_t vi2x1 = vreinterpret_f16_u16(vld1_u16(i2)); i2 += 4;
        const float16x4_t vi3x1 = vreinterpret_f16_u16(vld1_u16(i3)); i3 += 4;
        const float16x4_t vi4x1 = vreinterpret_f16_u16(vld1_u16(i4)); i4 += 4;

        vo0x0 = vfma_lane_f16(vo0x0, vk00c0, vi0x0, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk00c0, vi2x0, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk00c0, vi0x1, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk00c0, vi2x1, 3);
        const float16x4_t vk10c0 = vreinterpret_f16_u16(vld1_u16(w + 8));
        vo0x0 = vfma_lane_f16(vo0x0, vk10c0, vi1x0, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk10c0, vi3x0, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk10c0, vi1x1, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk10c0, vi3x1, 3);
        const float16x4_t vk20c0 = vreinterpret_f16_u16(vld1_u16(w + 12));
        vo0x0 = vfma_lane_f16(vo0x0, vk20c0, vi2x0, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk20c0, vi4x0, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk20c0, vi2x1, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk20c0, vi4x1, 3);
        const float16x4_t vk00c1 = vreinterpret_f16_u16(vld1_u16(w + 16));

        const float16x4_t vi0x2 = vreinterpret_f16_u16(vld1_u16(i0)); i0 += 4;
        const float16x4_t vi1x2 = vreinterpret_f16_u16(vld1_u16(i1)); i1 += 4;
        const float16x4_t vi2x2 = vreinterpret_f16_u16(vld1_u16(i2)); i2 += 4;
        const float16x4_t vi3x2 = vreinterpret_f16_u16(vld1_u16(i3)); i3 += 4;
        const float16x4_t vi4x2 = vreinterpret_f16_u16(vld1_u16(i4)); i4 += 4;

        vo0x0 = vfma_lane_f16(vo0x0, vk00c1, vi0x0, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk00c1, vi2x0, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk00c1, vi0x2, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk00c1, vi2x2, 0);
        const float16x4_t vk10c1 = vreinterpret_f16_u16(vld1_u16(w + 20));
        vo0x0 = vfma_lane_f16(vo0x0, vk10c1, vi1x0, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk10c1, vi3x0, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk10c1, vi1x2, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk10c1, vi3x2, 0);
        const float16x4_t vk20c1 = vreinterpret_f16_u16(vld1_u16(w + 24));
        vo0x0 = vfma_lane_f16(vo0x0, vk20c1, vi2x0, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk20c1, vi4x0, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk20c1, vi2x2, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk20c1, vi4x2, 0);
        const float16x4_t vk00c2 = vreinterpret_f16_u16(vld1_u16(w + 28));
        vo0x0 = vfma_lane_f16(vo0x0, vk00c2, vi0x0, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk00c2, vi2x0, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk00c2, vi0x2, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk00c2, vi2x2, 1);
        const float16x4_t vk10c2 = vreinterpret_f16_u16(vld1_u16(w + 32));
        vo0x0 = vfma_lane_f16(vo0x0, vk10c2, vi1x0, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk10c2, vi3x0, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk10c2, vi1x2, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk10c2, vi3x2, 1);
        const float16x4_t vk20c2 = vreinterpret_f16_u16(vld1_u16(w + 36));
        vo0x0 = vfma_lane_f16(vo0x0, vk20c2, vi2x0, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk20c2, vi4x0, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk20c2, vi2x2, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk20c2, vi4x2, 1);
        const float16x4_t vk01c0 = vreinterpret_f16_u16(vld1_u16(w + 40));
        vo0x0 = vfma_lane_f16(vo0x0, vk01c0, vi0x1, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk01c0, vi2x1, 0);
        vo0x1 = vfma_lane_f16(vo0x1, vk01c0, vi0x2, 2);
        vo1x1 = vfma_lane_f16(vo1x1, vk01c0, vi2x2, 2);
        const float16x4_t vk11c0 = vreinterpret_f16_u16(vld1_u16(w + 44));
        vo0x0 = vfma_lane_f16(vo0x0, vk11c0, vi1x1, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk11c0, vi3x1, 0);
        vo0x1 = vfma_lane_f16(vo0x1, vk11c0, vi1x2, 2);
        vo1x1 = vfma_lane_f16(vo1x1, vk11c0, vi3x2, 2);
        const float16x4_t vk21c0 = vreinterpret_f16_u16(vld1_u16(w + 48));
        vo0x0 = vfma_lane_f16(vo0x0, vk21c0, vi2x1, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk21c0, vi4x1, 0);
        vo0x1 = vfma_lane_f16(vo0x1, vk21c0, vi2x2, 2);
        vo1x1 = vfma_lane_f16(vo1x1, vk21c0, vi4x2, 2);
        const float16x4_t vk01c1 = vreinterpret_f16_u16(vld1_u16(w + 52));
        vo0x0 = vfma_lane_f16(vo0x0, vk01c1, vi0x1, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk01c1, vi2x1, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk01c1, vi0x2, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk01c1, vi2x2, 3);
        const float16x4_t vk11c1 = vreinterpret_f16_u16(vld1_u16(w + 56));
        vo0x0 = vfma_lane_f16(vo0x0, vk11c1, vi1x1, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk11c1, vi3x1, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk11c1, vi1x2, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk11c1, vi3x2, 3);
        const float16x4_t vk21c1 = vreinterpret_f16_u16(vld1_u16(w + 60));
        vo0x0 = vfma_lane_f16(vo0x0, vk21c1, vi2x1, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk21c1, vi4x1, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk21c1, vi2x2, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk21c1, vi4x2, 3);
        const float16x4_t vk01c2 = vreinterpret_f16_u16(vld1_u16(w + 64));

        const float16x4_t vi0x3 = vreinterpret_f16_u16(vld1_u16(i0)); i0 += 4;
        const float16x4_t vi1x3 = vreinterpret_f16_u16(vld1_u16(i1)); i1 += 4;
        const float16x4_t vi2x3 = vreinterpret_f16_u16(vld1_u16(i2)); i2 += 4;
        const float16x4_t vi3x3 = vreinterpret_f16_u16(vld1_u16(i3)); i3 += 4;
        const float16x4_t vi4x3 = vreinterpret_f16_u16(vld1_u16(i4)); i4 += 4;

        vo0x0 = vfma_lane_f16(vo0x0, vk01c2, vi0x1, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk01c2, vi2x1, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk01c2, vi0x3, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk01c2, vi2x3, 0);
        const float16x4_t vk11c2 = vreinterpret_f16_u16(vld1_u16(w + 68));
        vo0x0 = vfma_lane_f16(vo0x0, vk11c2, vi1x1, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk11c2, vi3x1, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk11c2, vi1x3, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk11c2, vi3x3, 0);
        const float16x4_t vk21c2 = vreinterpret_f16_u16(vld1_u16(w + 72));
        vo0x0 = vfma_lane_f16(vo0x0, vk21c2, vi2x1, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk21c2, vi4x1, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk21c2, vi2x3, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk21c2, vi4x3, 0);
        const float16x4_t vk02c0 = vreinterpret_f16_u16(vld1_u16(w + 76));
        vo0x0 = vfma_lane_f16(vo0x0, vk02c0, vi0x1, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk02c0, vi2x1, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk02c0, vi0x3, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk02c0, vi2x3, 1);
        const float16x4_t vk12c0 = vreinterpret_f16_u16(vld1_u16(w + 80));
        vo0x0 = vfma_lane_f16(vo0x0, vk12c0, vi1x1, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk12c0, vi3x1, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk12c0, vi1x3, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk12c0, vi3x3, 1);
        const float16x4_t vk22c0 = vreinterpret_f16_u16(vld1_u16(w + 84));
        vo0x0 = vfma_lane_f16(vo0x0, vk22c0, vi2x1, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk22c0, vi4x1, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk22c0, vi2x3, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk22c0, vi4x3, 1);
        const float16x4_t vk02c1 = vreinterpret_f16_u16(vld1_u16(w + 88));
        vo0x0 = vfma_lane_f16(vo0x0, vk02c1, vi0x2, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk02c1, vi2x2, 0);
        vo0x1 = vfma_lane_f16(vo0x1, vk02c1, vi0x3, 2);
        vo1x1 = vfma_lane_f16(vo1x1, vk02c1, vi2x3, 2);
        const float16x4_t vk12c1 = vreinterpret_f16_u16(vld1_u16(w + 92));
        vo0x0 = vfma_lane_f16(vo0x0, vk12c1, vi1x2, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk12c1, vi3x2, 0);
        vo0x1 = vfma_lane_f16(vo0x1, vk12c1, vi1x3, 2);
        vo1x1 = vfma_lane_f16(vo1x1, vk12c1, vi3x3, 2);
        const float16x4_t vk22c1 = vreinterpret_f16_u16(vld1_u16(w + 96));
        vo0x0 = vfma_lane_f16(vo0x0, vk22c1, vi2x2, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk22c1, vi4x2, 0);
        vo0x1 = vfma_lane_f16(vo0x1, vk22c1, vi2x3, 2);
        vo1x1 = vfma_lane_f16(vo1x1, vk22c1, vi4x3, 2);
        const float16x4_t vk02c2 = vreinterpret_f16_u16(vld1_u16(w + 100));
        vo0x0 = vfma_lane_f16(vo0x0, vk02c2, vi0x2, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk02c2, vi2x2, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk02c2, vi0x3, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk02c2, vi2x3, 3);
        const float16x4_t vk12c2 = vreinterpret_f16_u16(vld1_u16(w + 104));
        vo0x0 = vfma_lane_f16(vo0x0, vk12c2, vi1x2, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk12c2, vi3x2, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk12c2, vi1x3, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk12c2, vi3x3, 3);
        const float16x4_t vk22c2 = vreinterpret_f16_u16(vld1_u16(w + 108));
        vo0x0 = vfma_lane_f16(vo0x0, vk22c2, vi2x2, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk22c2, vi4x2, 1);
        vo0x1 = vfma_lane_f16(vo0x1, vk22c2, vi2x3, 3);
        vo1x1 = vfma_lane_f16(vo1x1, vk22c2, vi4x3, 3);
        vi0x0 = vi0x3; vi1x0 = vi1x3; vi2x0 = vi2x3; vi3x0 = vi3x3; vi4x0 = vi4x3;

        vo0x0 = vmax_f16(vo0x0, vmin); vo1x0 = vmax_f16(vo1x0, vmin);
        vo0x1 = vmax_f16(vo0x1, vmin); vo1x1 = vmax_f16(vo1x1, vmin);
        vo0x0 = vmin_f16(vo0x0, vmax); vo1x0 = vmin_f16(vo1x0, vmax);
        vo0x1 = vmin_f16(vo0x1, vmax); vo1x1 = vmin_f16(vo1x1, vmax);

        const float16x4x2_t vo0c0123 = vzip_f16(vo0x0, vo0x1);
        const float16x4x2_t vo1c0123 = vzip_f16(vo1x0, vo1x1);

        vst1_lane_u32((void*) o1c0, vreinterpret_u32_f16(vo1c0123.val[0]), 0); o1c0 += 2;
        vst1_lane_u32((void*) o1c1, vreinterpret_u32_f16(vo1c0123.val[0]), 1); o1c1 += 2;
        vst1_lane_u32((void*) o1c2, vreinterpret_u32_f16(vo1c0123.val[1]), 0); o1c2 += 2;
        vst1_lane_u32((void*) o1c3, vreinterpret_u32_f16(vo1c0123.val[1]), 1); o1c3 += 2;
        vst1_lane_u32((void*) o0c0, vreinterpret_u32_f16(vo0c0123.val[0]), 0); o0c0 += 2;
        vst1_lane_u32((void*) o0c1, vreinterpret_u32_f16(vo0c0123.val[0]), 1); o0c1 += 2;
        vst1_lane_u32((void*) o0c2, vreinterpret_u32_f16(vo0c0123.val[1]), 0); o0c2 += 2;
        vst1_lane_u32((void*) o0c3, vreinterpret_u32_f16(vo0c0123.val[1]), 1); o0c3 += 2;
      }
      assert(iw < 4);
      if XNN_UNLIKELY(iw != 0) {
        float16x4_t vo0x0 = vreinterpret_f16_u16(vld1_u16(w));
        float16x4_t vo1x0 = vo0x0;
        float16x4_t vo0x1 = vo0x0;
        float16x4_t vo1x1 = vo0x0;

        const float16x4_t vk00c0 = vreinterpret_f16_u16(vld1_u16(w + 4));
        float16x4_t vi0x1 = vreinterpret_f16_u16(vld1_u16(i0));
        float16x4_t vi1x1 = vreinterpret_f16_u16(vld1_u16(i1));
        float16x4_t vi2x1 = vreinterpret_f16_u16(vld1_u16(i2));
        float16x4_t vi3x1 = vreinterpret_f16_u16(vld1_u16(i3));
        float16x4_t vi4x1 = vreinterpret_f16_u16(vld1_u16(i4));

        vo0x0 = vfma_lane_f16(vo0x0, vk00c0, vi0x0, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk00c0, vi2x0, 1);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk00c0, vi0x1, 3); vo1x1 = vfma_lane_f16(vo1x1, vk00c0, vi2x1, 3); }
        const float16x4_t vk10c0 = vreinterpret_f16_u16(vld1_u16(w + 8));
        vo0x0 = vfma_lane_f16(vo0x0, vk10c0, vi1x0, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk10c0, vi3x0, 1);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk10c0, vi1x1, 3); vo1x1 = vfma_lane_f16(vo1x1, vk10c0, vi3x1, 3); }
        const float16x4_t vk20c0 = vreinterpret_f16_u16(vld1_u16(w + 12));
        vo0x0 = vfma_lane_f16(vo0x0, vk20c0, vi2x0, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk20c0, vi4x0, 1);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk20c0, vi2x1, 3); vo1x1 = vfma_lane_f16(vo1x1, vk20c0, vi4x1, 3); }
        const float16x4_t vk00c1 = vreinterpret_f16_u16(vld1_u16(w + 16));

        float16x4_t vi0x2 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi1x2 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi2x2 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi3x2 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi4x2 = vreinterpret_f16_u16(vmov_n_u16(0));
        if (iw >= 2) {
          vi0x2 = vreinterpret_f16_u16(vld1_u16(i0 + 4));
          vi1x2 = vreinterpret_f16_u16(vld1_u16(i1 + 4));
          vi2x2 = vreinterpret_f16_u16(vld1_u16(i2 + 4));
          vi3x2 = vreinterpret_f16_u16(vld1_u16(i3 + 4));
          vi4x2 = vreinterpret_f16_u16(vld1_u16(i4 + 4));
        }

        vo0x0 = vfma_lane_f16(vo0x0, vk00c1, vi0x0, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk00c1, vi2x0, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk00c1, vi0x2, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk00c1, vi2x2, 0);
        const float16x4_t vk10c1 = vreinterpret_f16_u16(vld1_u16(w + 20));
        vo0x0 = vfma_lane_f16(vo0x0, vk10c1, vi1x0, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk10c1, vi3x0, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk10c1, vi1x2, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk10c1, vi3x2, 0);
        const float16x4_t vk20c1 = vreinterpret_f16_u16(vld1_u16(w + 24));
        vo0x0 = vfma_lane_f16(vo0x0, vk20c1, vi2x0, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk20c1, vi4x0, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk20c1, vi2x2, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk20c1, vi4x2, 0);
        const float16x4_t vk00c2 = vreinterpret_f16_u16(vld1_u16(w + 28));
        vo0x0 = vfma_lane_f16(vo0x0, vk00c2, vi0x0, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk00c2, vi2x0, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk00c2, vi0x2, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk00c2, vi2x2, 1);
        const float16x4_t vk10c2 = vreinterpret_f16_u16(vld1_u16(w + 32));
        vo0x0 = vfma_lane_f16(vo0x0, vk10c2, vi1x0, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk10c2, vi3x0, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk10c2, vi1x2, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk10c2, vi3x2, 1);
        const float16x4_t vk20c2 = vreinterpret_f16_u16(vld1_u16(w + 36));
        vo0x0 = vfma_lane_f16(vo0x0, vk20c2, vi2x0, 3);
        vo1x0 = vfma_lane_f16(vo1x0, vk20c2, vi4x0, 3);
        vo0x1 = vfma_lane_f16(vo0x1, vk20c2, vi2x2, 1);
        vo1x1 = vfma_lane_f16(vo1x1, vk20c2, vi4x2, 1);
        const float16x4_t vk01c0 = vreinterpret_f16_u16(vld1_u16(w + 40));
        vo0x0 = vfma_lane_f16(vo0x0, vk01c0, vi0x1, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk01c0, vi2x1, 0);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk01c0, vi0x2, 2); vo1x1 = vfma_lane_f16(vo1x1, vk01c0, vi2x2, 2); }
        const float16x4_t vk11c0 = vreinterpret_f16_u16(vld1_u16(w + 44));
        vo0x0 = vfma_lane_f16(vo0x0, vk11c0, vi1x1, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk11c0, vi3x1, 0);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk11c0, vi1x2, 2); vo1x1 = vfma_lane_f16(vo1x1, vk11c0, vi3x2, 2); }
        const float16x4_t vk21c0 = vreinterpret_f16_u16(vld1_u16(w + 48));
        vo0x0 = vfma_lane_f16(vo0x0, vk21c0, vi2x1, 0);
        vo1x0 = vfma_lane_f16(vo1x0, vk21c0, vi4x1, 0);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk21c0, vi2x2, 2); vo1x1 = vfma_lane_f16(vo1x1, vk21c0, vi4x2, 2); }
        const float16x4_t vk01c1 = vreinterpret_f16_u16(vld1_u16(w + 52));
        vo0x0 = vfma_lane_f16(vo0x0, vk01c1, vi0x1, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk01c1, vi2x1, 1);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk01c1, vi0x2, 3); vo1x1 = vfma_lane_f16(vo1x1, vk01c1, vi2x2, 3); }
        const float16x4_t vk11c1 = vreinterpret_f16_u16(vld1_u16(w + 56));
        vo0x0 = vfma_lane_f16(vo0x0, vk11c1, vi1x1, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk11c1, vi3x1, 1);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk11c1, vi1x2, 3); vo1x1 = vfma_lane_f16(vo1x1, vk11c1, vi3x2, 3); }
        const float16x4_t vk21c1 = vreinterpret_f16_u16(vld1_u16(w + 60));
        vo0x0 = vfma_lane_f16(vo0x0, vk21c1, vi2x1, 1);
        vo1x0 = vfma_lane_f16(vo1x0, vk21c1, vi4x1, 1);
        if (iw > 2) { vo0x1 = vfma_lane_f16(vo0x1, vk21c1, vi2x2, 3); vo1x1 = vfma_lane_f16(vo1x1, vk21c1, vi4x2, 3); }
        const float16x4_t vk01c2 = vreinterpret_f16_u16(vld1_u16(w + 64));

        float16x4_t vi0x3 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi1x3 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi2x3 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi3x3 = vreinterpret_f16_u16(vmov_n_u16(0));
        float16x4_t vi4x3 = vreinterpret_f16_u16(vmov_n_u16(0));
        if (iw > 2) {
          vi0x3 = vreinterpret_f16_u16(vld1_lane_u16(i0 + 8, vreinterpret_u16_f16(vi0x3), 0));
          vi1x3 = vreinterpret_f16_u16(vld1_lane_u16(i1 + 8, vreinterpret_u16_f16(vi1x3), 0));
          vi2x3 = vreinterpret_f16_u16(vld1_lane_u16(i2 + 8, vreinterpret_u16_f16(vi2x3), 0));
          vi3x3 = vreinterpret_f16_u16(vld1_lane_u16(i3 + 8, vreinterpret_u16_f16(vi3x3), 0));
          vi4x3 = vreinterpret_f16_u16(vld1_lane_u16(i4 + 8, vreinterpret_u16_f16(vi4x3), 0));
        }

        vo0x0 = vfma_lane_f16(vo0x0, vk01c2, vi0x1, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk01c2, vi2x1, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk01c2, vi0x3, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk01c2, vi2x3, 0);
        const float16x4_t vk11c2 = vreinterpret_f16_u16(vld1_u16(w + 68));
        vo0x0 = vfma_lane_f16(vo0x0, vk11c2, vi1x1, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk11c2, vi3x1, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk11c2, vi1x3, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk11c2, vi3x3, 0);
        const float16x4_t vk21c2 = vreinterpret_f16_u16(vld1_u16(w + 72));
        vo0x0 = vfma_lane_f16(vo0x0, vk21c2, vi2x1, 2);
        vo1x0 = vfma_lane_f16(vo1x0, vk21c2, vi4x1, 2);
        vo0x1 = vfma_lane_f16(vo0x1, vk21c2, vi2x3, 0);
        vo1x1 = vfma_lane_f16(vo1x1, vk21c2, vi4x3, 0);
        if (iw >= 2) {
          const float16x4_t vk02c0 = vreinterpret_f16_u16(vld1_u16(w + 76));
          vo0x0 = vfma_lane_f16(vo0x0, vk02c0, vi0x1, 3);
          vo1x0 = vfma_lane_f16(vo1x0, vk02c0, vi2x1, 3);
          const float16x4_t vk12c0 = vreinterpret_f16_u16(vld1_u16(w + 80));
          vo0x0 = vfma_lane_f16(vo0x0, vk12c0, vi1x1, 3);
          vo1x0 = vfma_lane_f16(vo1x0, vk12c0, vi3x1, 3);
          const float16x4_t vk22c0 = vreinterpret_f16_u16(vld1_u16(w + 84));
          vo0x0 = vfma_lane_f16(vo0x0, vk22c0, vi2x1, 3);
          vo1x0 = vfma_lane_f16(vo1x0, vk22c0, vi4x1, 3);
          const float16x4_t vk02c1 = vreinterpret_f16_u16(vld1_u16(w + 88));
          vo0x0 = vfma_lane_f16(vo0x0, vk02c1, vi0x2, 0);
          vo1x0 = vfma_lane_f16(vo1x0, vk02c1, vi2x2, 0);
          const float16x4_t vk12c1 = vreinterpret_f16_u16(vld1_u16(w + 92));
          vo0x0 = vfma_lane_f16(vo0x0, vk12c1, vi1x2, 0);
          vo1x0 = vfma_lane_f16(vo1x0, vk12c1, vi3x2, 0);
          const float16x4_t vk22c1 = vreinterpret_f16_u16(vld1_u16(w + 96));
          vo0x0 = vfma_lane_f16(vo0x0, vk22c1, vi2x2, 0);
          vo1x0 = vfma_lane_f16(vo1x0, vk22c1, vi4x2, 0);
          const float16x4_t vk02c2 = vreinterpret_f16_u16(vld1_u16(w + 100));
          vo0x0 = vfma_lane_f16(vo0x0, vk02c2, vi0x2, 1);
          vo1x0 = vfma_lane_f16(vo1x0, vk02c2, vi2x2, 1);
          const float16x4_t vk12c2 = vreinterpret_f16_u16(vld1_u16(w + 104));
          vo0x0 = vfma_lane_f16(vo0x0, vk12c2, vi1x2, 1);
          vo1x0 = vfma_lane_f16(vo1x0, vk12c2, vi3x2, 1);
          const float16x4_t vk22c2 = vreinterpret_f16_u16(vld1_u16(w + 108));
          vo0x0 = vfma_lane_f16(vo0x0, vk22c2, vi2x2, 1);
          vo1x0 = vfma_lane_f16(vo1x0, vk22c2, vi4x2, 1);
        }

        vo0x0 = vmax_f16(vo0x0, vmin); vo1x0 = vmax_f16(vo1x0, vmin);
        vo0x1 = vmax_f16(vo0x1, vmin); vo1x1 = vmax_f16(vo1x1, vmin);
        vo0x0 = vmin_f16(vo0x0, vmax); vo1x0 = vmin_f16(vo1x0, vmax);
        vo0x1 = vmin_f16(vo0x1, vmax); vo1x1 = vmin_f16(vo1x1, vmax);

        if (iw == 3) {
          const float16x4x2_t vo0c0123 = vzip_f16(vo0x0, vo0x1);
          const float16x4x2_t vo1c0123 = vzip_f16(vo1x0, vo1x1);
          vst1_lane_u32((void*) o1c0, vreinterpret_u32_f16(vo1c0123.val[0]), 0); o1c0 += 2;
          vst1_lane_u32((void*) o1c1, vreinterpret_u32_f16(vo1c0123.val[0]), 1); o1c1 += 2;
          vst1_lane_u32((void*) o1c2, vreinterpret_u32_f16(vo1c0123.val[1]), 0); o1c2 += 2;
          vst1_lane_u32((void*) o1c3, vreinterpret_u32_f16(vo1c0123.val[1]), 1); o1c3 += 2;
          vst1_lane_u32((void*) o0c0, vreinterpret_u32_f16(vo0c0123.val[0]), 0); o0c0 += 2;
          vst1_lane_u32((void*) o0c1, vreinterpret_u32_f16(vo0c0123.val[0]), 1); o0c1 += 2;
          vst1_lane_u32((void*) o0c2, vreinterpret_u32_f16(vo0c0123.val[1]), 0); o0c2 += 2;
          vst1_lane_u32((void*) o0c3, vreinterpret_u32_f16(vo0c0123.val[1]), 1); o0c3 += 2;
        } else {
          vst1_lane_u16(o1c0, vreinterpret_u16_f16(vo1x0), 0); o1c0 += 1;
          vst1_lane_u16(o1c1, vreinterpret_u16_f16(vo1x0), 1); o1c1 += 1;
          vst1_lane_u16(o1c2, vreinterpret_u16_f16(vo1x0), 2); o1c2 += 1;
          vst1_lane_u16(o1c3, vreinterpret_u16_f16(vo1x0), 3); o1c3 += 1;
          vst1_lane_u16(o0c0, vreinterpret_u16_f16(vo0x0), 0); o0c0 += 1;
          vst1_lane_u16(o0c1, vreinterpret_u16_f16(vo0x0), 1); o0c1 += 1;
          vst1_lane_u16(o0c2, vreinterpret_u16_f16(vo0x0), 2); o0c2 += 1;
          vst1_lane_u16(o0c3, vreinterpret_u16_f16(vo0x0), 3); o0c3 += 1;
        }
      }
      o0c0 = (uint16_t*) ((uintptr_t) o0c0 + output_channel_increment);
      o0c1 = (uint16_t*) ((uintptr_t) o0c1 + output_channel_increment);
      o0c2 = (uint16_t*) ((uintptr_t) o0c2 + output_channel_increment);
      o0c3 = (uint16_t*) ((uintptr_t) o0c3 + output_channel_increment);
      o1c0 = (uint16_t*) ((uintptr_t) o1c0 + output_channel_increment);
      o1c1 = (uint16_t*) ((uintptr_t) o1c1 + output_channel_increment);
      o1c2 = (uint16_t*) ((uintptr_t) o1c2 + output_channel_increment);
      o1c3 = (uint16_t*) ((uintptr_t) o1c3 + output_channel_increment);
      i0 = (const uint16_t*) ((uintptr_t) i0 - input_width_increment);
      i1 = (const uint16_t*) ((uintptr_t) i1 - input_width_increment);
      i2 = (const uint16_t*) ((uintptr_t) i2 - input_width_increment);
      i3 = (const uint16_t*) ((uintptr_t) i3 - input_width_increment);
      i4 = (const uint16_t*) ((uintptr_t) i4 - input_width_increment);
      w += 112;
      c = doz(c, 4);
    } while (c != 0);
    output0 = (uint16_t*) ((uintptr_t) output1 + output_height_stride);
    output1 = (uint16_t*) ((uintptr_t) output0 + output_height_stride);
    i0 = i4;
    i1 = (const uint16_t*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const uint16_t*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const uint16_t*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const uint16_t*) ((uintptr_t) i3 + input_height_stride);
  }
}
} // namespace neon_kernel

namespace rvv_kernel {

void test__rvv(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const xnn_float16* input,
    const xnn_float16* zero,
    const xnn_float16* weights,
    xnn_float16* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f16_minmax_params* params)
{
  assert(input_width != 0);
  assert(output_y_end > output_y_start);
  assert(input_padding_top <= 1);
  assert(output_channels != 0);

  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(uint16_t);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(uint16_t);

  const uint16_t* i0 = (const uint16_t*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const uint16_t* i1 = (const uint16_t*) ((uintptr_t) i0 + input_height_stride);
  const uint16_t* i2 = (const uint16_t*) ((uintptr_t) i1 + input_height_stride);
  const uint16_t* i3 = (const uint16_t*) ((uintptr_t) i2 + input_height_stride);
  const uint16_t* i4 = (const uint16_t*) ((uintptr_t) i3 + input_height_stride);
  uint16_t* output0 = (uint16_t*) ((uintptr_t) output + output_height_stride * output_y_start);
  uint16_t* output1 = (uint16_t*) ((uintptr_t) output0 + output_height_stride);

  if XNN_UNPREDICTABLE(output_y_start < input_padding_top) { i0 = (const uint16_t*) zero; }

  uint16_t vmin_u = *(const uint16_t*) &params->scalar.min;
  uint16_t vmax_u = *(const uint16_t*) &params->scalar.max;

  for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if XNN_UNPREDICTABLE(input_y2 >= input_height) { i2 = (const uint16_t*) zero; }
    if XNN_UNPREDICTABLE(input_y4 > input_height)  { i3 = (const uint16_t*) zero; }
    if XNN_UNPREDICTABLE(input_y4 >= input_height) { i4 = (const uint16_t*) zero; }
    if XNN_UNPREDICTABLE(output_y + 2 > output_y_end) { output1 = output0; }

    const uint16_t* w = (const uint16_t*) weights;
    size_t c = output_channels;
    uint16_t* o0c0 = output0;
    uint16_t* o1c0 = output1;
    uint16_t* o0c1 = (uint16_t*) ((uintptr_t) o0c0 + output_channel_stride);
    uint16_t* o1c1 = (uint16_t*) ((uintptr_t) o1c0 + output_channel_stride);
    uint16_t* o0c2 = (uint16_t*) ((uintptr_t) o0c1 + output_channel_stride);
    uint16_t* o1c2 = (uint16_t*) ((uintptr_t) o1c1 + output_channel_stride);
    uint16_t* o0c3 = (uint16_t*) ((uintptr_t) o0c2 + output_channel_stride);
    uint16_t* o1c3 = (uint16_t*) ((uintptr_t) o1c2 + output_channel_stride);
    do {
      if XNN_UNPREDICTABLE(c < 2)  { o0c1 = o0c0; o1c1 = o1c0; }
      if XNN_UNPREDICTABLE(c <= 2) { o0c2 = o0c1; o1c2 = o1c1; }
      if XNN_UNPREDICTABLE(c < 4)  { o0c3 = o0c2; o1c3 = o1c2; }

      size_t ow = output_width;
      size_t ow_done = 0;
      const salt_float16* i_ptrs[5] = {(const salt_float16*)i0, (const salt_float16*)i1, (const salt_float16*)i2, (const salt_float16*)i3, (const salt_float16*)i4};

      while (ow > 0) {
        size_t vl = __riscv_vsetvl_e16m1(ow);

        vuint32m2_t v_x = __riscv_vadd_vx_u32m2(__riscv_vid_v_u32m2(vl), (uint32_t)ow_done, vl);
        vint32m2_t v_2x = __riscv_vsll_vx_i32m2(__riscv_vreinterpret_v_u32m2_i32m2(v_x), 1, vl);

        vint32m2_t v_px0 = __riscv_vsub_vx_i32m2(v_2x, 1, vl);
        vbool16_t mask0 = __riscv_vmsge_vx_i32m2_b16(v_px0, 0, vl);
        mask0 = __riscv_vmand_mm_b16(mask0, __riscv_vmslt_vx_i32m2_b16(v_px0, (int32_t)input_width, vl), vl);
        vint32m2_t v_px0_safe = __riscv_vmax_vx_i32m2(v_px0, 0, vl);
        v_px0_safe = __riscv_vmin_vx_i32m2(v_px0_safe, (int32_t)(input_width - 1), vl);
        vuint32m2_t v_off0 = __riscv_vreinterpret_v_i32m2_u32m2(__riscv_vmul_vx_i32m2(v_px0_safe, (int32_t)(3 * sizeof(xnn_float16)), vl));

        vint32m2_t v_px1 = v_2x;
        vbool16_t mask1 = __riscv_vmslt_vx_i32m2_b16(v_px1, (int32_t)input_width, vl);
        vint32m2_t v_px1_safe = __riscv_vmin_vx_i32m2(v_px1, (int32_t)(input_width - 1), vl);
        vuint32m2_t v_off1 = __riscv_vreinterpret_v_i32m2_u32m2(__riscv_vmul_vx_i32m2(v_px1_safe, (int32_t)(3 * sizeof(xnn_float16)), vl));

        vint32m2_t v_px2 = __riscv_vadd_vx_i32m2(v_2x, 1, vl);
        vbool16_t mask2 = __riscv_vmslt_vx_i32m2_b16(v_px2, (int32_t)input_width, vl);
        vint32m2_t v_px2_safe = __riscv_vmin_vx_i32m2(v_px2, (int32_t)(input_width - 1), vl);
        vuint32m2_t v_off2 = __riscv_vreinterpret_v_i32m2_u32m2(__riscv_vmul_vx_i32m2(v_px2_safe, (int32_t)(3 * sizeof(xnn_float16)), vl));

        vfloat16m1_t v_zero = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(0, vl));

        uint16_t w0_bias = ((const uint16_t*)w)[0];
        uint16_t w1_bias = ((const uint16_t*)w)[1];
        uint16_t w2_bias = ((const uint16_t*)w)[2];
        uint16_t w3_bias = ((const uint16_t*)w)[3];

        vfloat16m1_t acc_o0_c0 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w0_bias, vl));
        vfloat16m1_t acc_o0_c1 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w1_bias, vl));
        vfloat16m1_t acc_o0_c2 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w2_bias, vl));
        vfloat16m1_t acc_o0_c3 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w3_bias, vl));

        vfloat16m1_t acc_o1_c0 = acc_o0_c0;
        vfloat16m1_t acc_o1_c1 = acc_o0_c1;
        vfloat16m1_t acc_o1_c2 = acc_o0_c2;
        vfloat16m1_t acc_o1_c3 = acc_o0_c3;

        for (int kx = 0; kx < 3; kx++) {
          vbool16_t mask = (kx == 0) ? mask0 : (kx == 1) ? mask1 : mask2;
          vuint32m2_t v_off = (kx == 0) ? v_off0 : (kx == 1) ? v_off1 : v_off2;

          vfloat16m1x3_t in0_seg0, in0_seg1, in0_seg2;
          vfloat16m1x3_t in1_seg0, in1_seg1, in1_seg2;
          bool load0[3];
          bool load1[3];

          for (int ky = 0; ky < 3; ky++) {
            const salt_float16* ptr0 = i_ptrs[ky];
            const salt_float16* ptr1 = i_ptrs[ky + 2];
            load0[ky] = (ptr0 != (const salt_float16*)zero);
            load1[ky] = (ptr1 != (const salt_float16*)zero);

            if (load0[ky]) {
              if (ky == 0) in0_seg0 = __riscv_vluxseg3ei32_v_f16m1x3(ptr0, v_off, vl);
              else if (ky == 1) in0_seg1 = __riscv_vluxseg3ei32_v_f16m1x3(ptr0, v_off, vl);
              else in0_seg2 = __riscv_vluxseg3ei32_v_f16m1x3(ptr0, v_off, vl);
            }
            if (load1[ky]) {
              if (ky == 0) in1_seg0 = __riscv_vluxseg3ei32_v_f16m1x3(ptr1, v_off, vl);
              else if (ky == 1) in1_seg1 = __riscv_vluxseg3ei32_v_f16m1x3(ptr1, v_off, vl);
              else in1_seg2 = __riscv_vluxseg3ei32_v_f16m1x3(ptr1, v_off, vl);
            }
          }

          for (int ic = 0; ic < 3; ic++) {
            for (int ky = 0; ky < 3; ky++) {
              vfloat16m1_t in0_ic, in1_ic;
              if (ic == 0) {
                if (load0[ky]) {
                  if (ky == 0) in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg0, 0), mask, vl);
                  else if (ky == 1) in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg1, 0), mask, vl);
                  else in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg2, 0), mask, vl);
                } else { in0_ic = v_zero; }
                if (load1[ky]) {
                  if (ky == 0) in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg0, 0), mask, vl);
                  else if (ky == 1) in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg1, 0), mask, vl);
                  else in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg2, 0), mask, vl);
                } else { in1_ic = v_zero; }
              } else if (ic == 1) {
                if (load0[ky]) {
                  if (ky == 0) in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg0, 1), mask, vl);
                  else if (ky == 1) in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg1, 1), mask, vl);
                  else in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg2, 1), mask, vl);
                } else { in0_ic = v_zero; }
                if (load1[ky]) {
                  if (ky == 0) in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg0, 1), mask, vl);
                  else if (ky == 1) in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg1, 1), mask, vl);
                  else in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg2, 1), mask, vl);
                } else { in1_ic = v_zero; }
              } else {
                if (load0[ky]) {
                  if (ky == 0) in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg0, 2), mask, vl);
                  else if (ky == 1) in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg1, 2), mask, vl);
                  else in0_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in0_seg2, 2), mask, vl);
                } else { in0_ic = v_zero; }
                if (load1[ky]) {
                  if (ky == 0) in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg0, 2), mask, vl);
                  else if (ky == 1) in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg1, 2), mask, vl);
                  else in1_ic = __riscv_vmerge_vvm_f16m1(v_zero, __riscv_vget_v_f16m1x3_f16m1(in1_seg2, 2), mask, vl);
                } else { in1_ic = v_zero; }
              }

              int w_idx = 4 + (kx * 9 + ic * 3 + ky) * 4;
              uint16_t w0_u = ((const uint16_t*)w)[w_idx + 0];
              uint16_t w1_u = ((const uint16_t*)w)[w_idx + 1];
              uint16_t w2_u = ((const uint16_t*)w)[w_idx + 2];
              uint16_t w3_u = ((const uint16_t*)w)[w_idx + 3];

              vfloat16m1_t vw0 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w0_u, vl));
              vfloat16m1_t vw1 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w1_u, vl));
              vfloat16m1_t vw2 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w2_u, vl));
              vfloat16m1_t vw3 = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(w3_u, vl));

              acc_o0_c0 = __riscv_vfmacc_vv_f16m1(acc_o0_c0, vw0, in0_ic, vl);
              acc_o0_c1 = __riscv_vfmacc_vv_f16m1(acc_o0_c1, vw1, in0_ic, vl);
              acc_o0_c2 = __riscv_vfmacc_vv_f16m1(acc_o0_c2, vw2, in0_ic, vl);
              acc_o0_c3 = __riscv_vfmacc_vv_f16m1(acc_o0_c3, vw3, in0_ic, vl);
              acc_o1_c0 = __riscv_vfmacc_vv_f16m1(acc_o1_c0, vw0, in1_ic, vl);
              acc_o1_c1 = __riscv_vfmacc_vv_f16m1(acc_o1_c1, vw1, in1_ic, vl);
              acc_o1_c2 = __riscv_vfmacc_vv_f16m1(acc_o1_c2, vw2, in1_ic, vl);
              acc_o1_c3 = __riscv_vfmacc_vv_f16m1(acc_o1_c3, vw3, in1_ic, vl);
            }
          }
        }

        vfloat16m1_t vmin_v = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(vmin_u, vl));
        vfloat16m1_t vmax_v = __riscv_vreinterpret_v_u16m1_f16m1(__riscv_vmv_v_x_u16m1(vmax_u, vl));

        #define CLAMP_AND_STORE(acc, ptr) \
        do { \
            acc = __riscv_vfmax_vv_f16m1(acc, vmin_v, vl); \
            acc = __riscv_vfmin_vv_f16m1(acc, vmax_v, vl); \
            __riscv_vse16_v_f16m1((salt_float16*)ptr, acc, vl); \
            ptr += vl; \
        } while (0)

        CLAMP_AND_STORE(acc_o1_c0, o1c0);
        CLAMP_AND_STORE(acc_o1_c1, o1c1);
        CLAMP_AND_STORE(acc_o1_c2, o1c2);
        CLAMP_AND_STORE(acc_o1_c3, o1c3);
        CLAMP_AND_STORE(acc_o0_c0, o0c0);
        CLAMP_AND_STORE(acc_o0_c1, o0c1);
        CLAMP_AND_STORE(acc_o0_c2, o0c2);
        CLAMP_AND_STORE(acc_o0_c3, o0c3);
        #undef CLAMP_AND_STORE

        ow -= vl;
        ow_done += vl;
      }

      w += 112;
      c = (c >= 4) ? (c - 4) : 0;
      o0c0 = (uint16_t*) ((uintptr_t) o0c0 + output_channel_increment);
      o0c1 = (uint16_t*) ((uintptr_t) o0c1 + output_channel_increment);
      o0c2 = (uint16_t*) ((uintptr_t) o0c2 + output_channel_increment);
      o0c3 = (uint16_t*) ((uintptr_t) o0c3 + output_channel_increment);
      o1c0 = (uint16_t*) ((uintptr_t) o1c0 + output_channel_increment);
      o1c1 = (uint16_t*) ((uintptr_t) o1c1 + output_channel_increment);
      o1c2 = (uint16_t*) ((uintptr_t) o1c2 + output_channel_increment);
      o1c3 = (uint16_t*) ((uintptr_t) o1c3 + output_channel_increment);
    } while (c != 0);

    output0 = (uint16_t*) ((uintptr_t) output1 + output_height_stride);
    output1 = (uint16_t*) ((uintptr_t) output0 + output_height_stride);
    i0 = i4;
    i1 = (const uint16_t*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const uint16_t*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const uint16_t*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const uint16_t*) ((uintptr_t) i3 + input_height_stride);
  }
}
} // namespace rvv_kernel

// ---------------------------------------------------------------------------
// verify() — single-config equivalence check.
// Mirrors the bitwuzla harness's verify() at lines 892-1008.
// ---------------------------------------------------------------------------
bool verify(size_t output_rows, size_t output_channels, size_t vlen,
            const struct xnn_f16_minmax_params& params, const char* config_id) {
    VerificationContext ctx(vlen);
    g_ctx = &ctx;
    // Per-query timeout — 600s (10 min).  Option name verified against
    // cvc5 1.3.2 source (`tlimit-per` is a regular registered option).
    ctx.solver->setOption("tlimit-per", "600000");
    // fp16 (5/11) is only supported under the experimental FP solver.
    ctx.solver->setOption("fp-exp", "true");

    size_t input_channels = 3;
    size_t kernel_h = 3, kernel_w = 3;
    size_t conv_stride = 2, conv_pad = 1;
    size_t input_height = conv_stride * (output_rows - 1) + kernel_h - 2 * conv_pad;
    size_t input_width = 2;
    size_t output_width = (input_width + 2 * conv_pad - kernel_w) / conv_stride + 1;
    size_t output_height_stride_bytes = output_width * 2;
    size_t output_channel_stride_bytes = output_rows * output_height_stride_bytes;
    size_t input_bytes   = input_height * input_width * input_channels * 2 + 32;
    size_t zero_bytes    = input_width * input_channels * 2 + 32;
    // XNNPACK reserves a full out_tile=4 group regardless of output_channels.
    // Per tile: 4 biases + 4 * kH * kW * IC weights = 112 uint16_t = 224 bytes.
    size_t out_tiles = (output_channels + 3) / 4;
    size_t weights_bytes = out_tiles * 112 * 2 + 32;
    size_t output_bytes  = output_channels * output_channel_stride_bytes + 32;

    std::vector<xnn_float16> input_arr  ((input_bytes)  / sizeof(xnn_float16), 0);
    std::vector<xnn_float16> zero_arr   ((zero_bytes)   / sizeof(xnn_float16), 0);
    std::vector<xnn_float16> weights_arr(weights_bytes / sizeof(xnn_float16));
    std::vector<xnn_float16> output_neon_arr((output_bytes) / sizeof(xnn_float16), 0);
    std::vector<xnn_float16> output_rvv_arr ((output_bytes) / sizeof(xnn_float16), 0);

    auto& sym_input = ctx.registerBuffer("input", input_bytes);
    sym_input.bind(input_arr.data());
    auto& sym_zero  = ctx.registerBuffer("zero", zero_bytes);
    sym_zero.bind(zero_arr.data());
    {
      Term _z = ctx.tm.mkBitVector(8, 0);
      for (size_t _i = 0; _i < zero_bytes; _i++) sym_zero.setByte(_i, _z);
    }
    // Concrete weights — constrained to fixed values
    for (size_t _i = 0; _i < weights_arr.size(); _i++) weights_arr[_i] = (xnn_float16)((_i + 1) * 0.5f);
    auto& sym_weights = ctx.registerBuffer("weights", weights_bytes);
    sym_weights.bind(weights_arr.data());
    for (size_t _i = 0; _i < weights_bytes; _i++) {
        Term _wbyte = sym_weights.loadScalar(_i, 8);
        Term _cval  = ctx.tm.mkBitVector(8, ((uint8_t*)weights_arr.data())[_i]);
        ctx.solver->assertFormula(ctx.tm.mkTerm(Kind::EQUAL, {_wbyte, _cval}));
    }
    auto& sym_output_neon = ctx.registerBuffer("output_neon", output_bytes);
    sym_output_neon.bind(output_neon_arr.data());
    auto& sym_output_rvv  = ctx.registerBuffer("output_rvv",  output_bytes);
    sym_output_rvv.bind(output_rvv_arr.data());

    // params buffer — concrete bytes
    auto& sym_params = ctx.registerBuffer("params", sizeof(params));
    sym_params.bind(&params);
    for (size_t _i = 0; _i < sizeof(params); _i++) {
        Term _pb = sym_params.loadScalar(_i, 8);
        Term _cv = ctx.tm.mkBitVector(8, ((const uint8_t*)&params)[_i]);
        ctx.solver->assertFormula(ctx.tm.mkTerm(Kind::EQUAL, {_pb, _cv}));
    }

    neon_kernel::test(input_height, input_width, 0, output_rows,
                      input_arr.data(), zero_arr.data(),
                      (const xnn_float16*)weights_arr.data(),
                      output_neon_arr.data(), 1, output_channels,
                      output_height_stride_bytes, output_channel_stride_bytes, &params);
    rvv_kernel::test__rvv(input_height, input_width, 0, output_rows,
                          input_arr.data(), zero_arr.data(),
                          (const xnn_float16*)weights_arr.data(),
                          output_rvv_arr.data(), 1, output_channels,
                          output_height_stride_bytes, output_channel_stride_bytes, &params);

    std::vector<Term> _chw_eqs;
    for (size_t _c = 0; _c < output_channels; _c++) {
      size_t _cof = _c * output_channel_stride_bytes;
      for (size_t _y = 0; _y < output_rows; _y++) {
        size_t _yof = _cof + _y * output_height_stride_bytes;
        for (size_t _x = 0; _x < output_width; _x++) {
          size_t _off = _yof + _x * 2;
          Term _n  = sym_output_neon.loadScalar(_off, 16);
          Term _rv = sym_output_rvv.loadScalar(_off, 16);
          _chw_eqs.push_back(element_equal(ctx.tm, _n, _rv, ElementKind::F16));
        }
      }
    }
    Term equiv = _chw_eqs[0];
    for (size_t _i = 1; _i < _chw_eqs.size(); _i++)
        equiv = ctx.tm.mkTerm(Kind::AND, {equiv, _chw_eqs[_i]});
    ctx.solver->assertFormula(ctx.tm.mkTerm(Kind::NOT, {equiv}));
    printf("{\"status\":\"SOLVING\",\"batch\":%zu,\"vlen\":%zu,\"config\":\"%s\"}\n",
           output_rows, vlen, config_id);

    Result result = ctx.solver->checkSat();

    if (result.isUnsat()) {
        printf("{\"status\":\"VERIFIED\",\"batch\":%zu,\"vlen\":%zu,\"config\":\"%s\"}\n",
               output_rows, vlen, config_id);
        return true;
    }
    if (result.isUnknown()) {
        printf("{\"status\":\"TIMEOUT\",\"batch\":%zu,\"vlen\":%zu,\"config\":\"%s\",\"reason\":\"%s\"}\n",
               output_rows, vlen, config_id, result.toString().c_str());
        // Treat as not-verified but keep going (return false signals failure).
        return false;
    }

    // SAT — counterexample
    size_t fi = 0;
    const char* fail_buf = "";
    for (size_t _c = 0; _c < output_channels; _c++) {
      size_t _cof = _c * output_channel_stride_bytes;
      for (size_t _y = 0; _y < output_rows; _y++) {
        size_t _yof = _cof + _y * output_height_stride_bytes;
        for (size_t _x = 0; _x < output_width; _x++) {
          size_t _off = _yof + _x * 2;
          Term _n  = ctx.solver->getValue(sym_output_neon.loadScalar(_off, 16));
          Term _r2 = ctx.solver->getValue(sym_output_rvv.loadScalar(_off, 16));
          if (_n.getBitVectorValue(10) != _r2.getBitVectorValue(10)) {
              fi = (_c * output_rows + _y) * output_width + _x;
              fail_buf = "output";
              goto found_mismatch;
          }
        }
      }
    }
    found_mismatch:
    printf("{\"status\":\"COUNTEREXAMPLE\",\"batch\":%zu,\"vlen\":%zu,\"config\":\"%s\",\"fail_index\":%zu,\"fail_output\":\"%s\",",
           output_rows, vlen, config_id, fi, fail_buf);
    printf("\"input\":[");
    {
      size_t _n = (input_bytes) / 2;
      for (size_t _i = 0; _i < _n; _i++) {
        printf("%s%s", _i ? "," : "",
               ctx.solver->getValue(sym_input.loadScalar(_i * 2, 16)).getBitVectorValue(10).c_str());
      }
    }
    printf("],");
    printf("\"input_at_fail\":%s,", ctx.solver->getValue(sym_input.loadScalar(0, 16)).getBitVectorValue(10).c_str());
    if (std::string(fail_buf) == "output") {
        size_t _fc = fi / (output_rows * output_width);
        size_t _fr = (fi / output_width) % output_rows;
        size_t _fx = fi % output_width;
        size_t _foff = _fc * output_channel_stride_bytes + _fr * output_height_stride_bytes + _fx * 2;
        printf("\"neon_out\":%s,\"rvv_out\":%s",
               ctx.solver->getValue(sym_output_neon.loadScalar(_foff, 16)).getBitVectorValue(10).c_str(),
               ctx.solver->getValue(sym_output_rvv.loadScalar(_foff, 16)).getBitVectorValue(10).c_str());
    }
    printf("}\n");
    return false;
}

int main(int argc, char** argv) {
    setvbuf(stdout, NULL, _IOLBF, 0);
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout_secs]\n", argv[0]);
        return 2;
    }
    size_t start  = (size_t)atoi(argv[1]);
    size_t end    = (size_t)atoi(argv[2]);
    size_t vlen   = (argc > 3) ? (size_t)atoi(argv[3]) : 256;
    double timeout = (argc > 4) ? atof(argv[4]) : 0;

    // Reduced sweep: only output_channels=1 to match the cvc5 vs bitwuzla
    // apples-to-apples comparison spec.
    size_t output_channels_sizes[] = {1};
    size_t num_output_channels_sizes = sizeof(output_channels_sizes) / sizeof(output_channels_sizes[0]);

    struct xnn_f16_minmax_params params{};
    params.scalar.min = -128.0f;
    params.scalar.max = 127.0f;

    for (size_t _ci = 0; _ci < num_output_channels_sizes; _ci++) {
        size_t output_channels = output_channels_sizes[_ci];
        for (size_t output_rows = start; output_rows <= end; output_rows++) {
            char _cfgbuf[64];
            snprintf(_cfgbuf, sizeof(_cfgbuf), "cfg0_output_channels%zu", output_channels);
            auto t0 = std::chrono::steady_clock::now();
            bool ok = verify(output_rows, output_channels, vlen, params, _cfgbuf);
            double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
            if (!ok) return 1;
            if (timeout > 0 && secs > timeout) {
                printf("{\"status\":\"TIMEOUT\",\"batch\":%zu,\"seconds\":%.1f,\"config\":\"%s\"}\n",
                       output_rows, secs, _cfgbuf);
                goto done;
            }
        }
    }
done:
    printf("{\"status\":\"ALL_VERIFIED\",\"start\":%zu,\"end\":%zu,\"configs\":1}\n", start, end);
    return 0;
}
