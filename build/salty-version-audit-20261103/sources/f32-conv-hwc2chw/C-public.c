#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>
#include <stdint.h>

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
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(input_width != 0);
  assert(output_y_end > output_y_start);
  assert(input_padding_top <= 1);
  assert(output_channels != 0);

  const size_t input_height_stride = input_width * 3 * sizeof(float);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(float);

  const float* i0 = (const float*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const float* i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
  const float* i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  float* output0 = (float*) ((uintptr_t) output + output_height_stride * output_y_start);
  float* output1 = (float*) ((uintptr_t) output0 + output_height_stride);

  if (output_y_start < input_padding_top) {
    i0 = zero;
  }

  const float min_f = params->scalar.min;
  const float max_f = params->scalar.max;

  size_t max_vl = __riscv_vsetvlmax_e32m1();
  vint32m1_t v_idx_base_init = __riscv_vadd_vx_i32m1(
      __riscv_vreinterpret_v_u32m1_i32m1(__riscv_vmul_vx_u32m1(__riscv_vid_v_u32m1(max_vl), 2, max_vl)),
      -1, max_vl);

  for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if (input_y2 >= input_height) { i2 = zero; }
    if (input_y4 > input_height) { i3 = zero; }
    if (input_y4 >= input_height) { i4 = zero; }
    if (output_y + 2 > output_y_end) { output1 = output0; }

    const float* i0_base = (const float*)((uintptr_t)i0 - 3 * sizeof(float));
    const float* i1_base = (const float*)((uintptr_t)i1 - 3 * sizeof(float));
    const float* i2_base = (const float*)((uintptr_t)i2 - 3 * sizeof(float));
    const float* i3_base = (const float*)((uintptr_t)i3 - 3 * sizeof(float));
    const float* i4_base = (const float*)((uintptr_t)i4 - 3 * sizeof(float));

    const float* w_base = weights;
    size_t c = output_channels;
    float* current_o0 = output0;
    float* current_o1 = output1;

    do {
      float* o0c0 = current_o0;
      float* o1c0 = current_o1;
      float* o0c1 = (float*) ((uintptr_t) o0c0 + output_channel_stride);
      float* o1c1 = (float*) ((uintptr_t) o1c0 + output_channel_stride);
      float* o0c2 = (float*) ((uintptr_t) o0c1 + output_channel_stride);
      float* o1c2 = (float*) ((uintptr_t) o1c1 + output_channel_stride);
      float* o0c3 = (float*) ((uintptr_t) o0c2 + output_channel_stride);
      float* o1c3 = (float*) ((uintptr_t) o1c2 + output_channel_stride);

      if (c < 2) { o0c1 = o0c0; o1c1 = o1c0; }
      if (c <= 2) { o0c2 = o0c1; o1c2 = o1c1; }
      if (c < 4) { o0c3 = o0c2; o1c3 = o1c2; }

      size_t ow = output_width;
      const float* i0_ptr = i0_base;
      const float* i1_ptr = i1_base;
      const float* i2_ptr = i2_base;
      const float* i3_ptr = i3_base;
      const float* i4_ptr = i4_base;
      vint32m1_t v_idx_base = v_idx_base_init;

      while (ow > 0) {
        size_t vl = __riscv_vsetvl_e32m1(ow);
        const float* w = w_base;
        vfloat32m1_t v_zero = __riscv_vfmv_v_f_f32m1(0.0f, vl);

        vfloat32m1_t v_o0c0 = __riscv_vfmv_v_f_f32m1(w[0], vl);
        vfloat32m1_t v_o0c1 = __riscv_vfmv_v_f_f32m1(w[1], vl);
        vfloat32m1_t v_o0c2 = __riscv_vfmv_v_f_f32m1(w[2], vl);
        vfloat32m1_t v_o0c3 = __riscv_vfmv_v_f_f32m1(w[3], vl);
        vfloat32m1_t v_o1c0 = __riscv_vfmv_v_f_f32m1(w[0], vl);
        vfloat32m1_t v_o1c1 = __riscv_vfmv_v_f_f32m1(w[1], vl);
        vfloat32m1_t v_o1c2 = __riscv_vfmv_v_f_f32m1(w[2], vl);
        vfloat32m1_t v_o1c3 = __riscv_vfmv_v_f_f32m1(w[3], vl);

        vbool32_t mask0 = __riscv_vmand_mm_b32(__riscv_vmsge_vx_i32m1_b32(v_idx_base, 0, vl), __riscv_vmslt_vx_i32m1_b32(v_idx_base, (int32_t)input_width, vl), vl);
        vint32m1_t v_idx1 = __riscv_vadd_vx_i32m1(v_idx_base, 1, vl);
        vbool32_t mask1 = __riscv_vmand_mm_b32(__riscv_vmsge_vx_i32m1_b32(v_idx1, 0, vl), __riscv_vmslt_vx_i32m1_b32(v_idx1, (int32_t)input_width, vl), vl);
        vint32m1_t v_idx2 = __riscv_vadd_vx_i32m1(v_idx_base, 2, vl);
        vbool32_t mask2 = __riscv_vmand_mm_b32(__riscv_vmsge_vx_i32m1_b32(v_idx2, 0, vl), __riscv_vmslt_vx_i32m1_b32(v_idx2, (int32_t)input_width, vl), vl);

        vfloat32m1_t v_in00_0, v_in01_0, v_in02_0, v_in10_0, v_in11_0, v_in12_0, v_in20_0, v_in21_0, v_in22_0;
        vfloat32m1_t v_in00_1, v_in01_1, v_in02_1, v_in10_1, v_in11_1, v_in12_1, v_in20_1, v_in21_1, v_in22_1;
        vfloat32m1_t v_in00_2, v_in01_2, v_in02_2, v_in10_2, v_in11_2, v_in12_2, v_in20_2, v_in21_2, v_in22_2;
        vfloat32m1_t v_in00_3, v_in01_3, v_in02_3, v_in10_3, v_in11_3, v_in12_3, v_in20_3, v_in21_3, v_in22_3;
        vfloat32m1_t v_in00_4, v_in01_4, v_in02_4, v_in10_4, v_in11_4, v_in12_4, v_in20_4, v_in21_4, v_in22_4;
        vfloat32m1x6_t v_px;
        vfloat32m1_t v_p0c0, v_p0c1, v_p0c2, v_p1c0, v_p1c1, v_p1c2;

#define PROCESS_MAC(row, dx, c_in, v_in) \
        { \
            if (row == 2) { \
                int w_idx_o0 = (dx * 9 + c_in * 3 + 2) * 4; \
                int w_idx_o1 = (dx * 9 + c_in * 3 + 0) * 4; \
                v_o0c0 = __riscv_vfmacc_vf_f32m1(v_o0c0, w[4 + w_idx_o0 + 0], v_in, vl); \
                v_o1c0 = __riscv_vfmacc_vf_f32m1(v_o1c0, w[4 + w_idx_o1 + 0], v_in, vl); \
                v_o0c1 = __riscv_vfmacc_vf_f32m1(v_o0c1, w[4 + w_idx_o0 + 1], v_in, vl); \
                v_o1c1 = __riscv_vfmacc_vf_f32m1(v_o1c1, w[4 + w_idx_o1 + 1], v_in, vl); \
                v_o0c2 = __riscv_vfmacc_vf_f32m1(v_o0c2, w[4 + w_idx_o0 + 2], v_in, vl); \
                v_o1c2 = __riscv_vfmacc_vf_f32m1(v_o1c2, w[4 + w_idx_o1 + 2], v_in, vl); \
                v_o0c3 = __riscv_vfmacc_vf_f32m1(v_o0c3, w[4 + w_idx_o0 + 3], v_in, vl); \
                v_o1c3 = __riscv_vfmacc_vf_f32m1(v_o1c3, w[4 + w_idx_o1 + 3], v_in, vl); \
            } else if (row < 2) { \
                int w_idx_o0 = (dx * 9 + c_in * 3 + row) * 4; \
                v_o0c0 = __riscv_vfmacc_vf_f32m1(v_o0c0, w[4 + w_idx_o0 + 0], v_in, vl); \
                v_o0c1 = __riscv_vfmacc_vf_f32m1(v_o0c1, w[4 + w_idx_o0 + 1], v_in, vl); \
                v_o0c2 = __riscv_vfmacc_vf_f32m1(v_o0c2, w[4 + w_idx_o0 + 2], v_in, vl); \
                v_o0c3 = __riscv_vfmacc_vf_f32m1(v_o0c3, w[4 + w_idx_o0 + 3], v_in, vl); \
            } else { \
                int w_idx_o1 = (dx * 9 + c_in * 3 + row - 2) * 4; \
                v_o1c0 = __riscv_vfmacc_vf_f32m1(v_o1c0, w[4 + w_idx_o1 + 0], v_in, vl); \
                v_o1c1 = __riscv_vfmacc_vf_f32m1(v_o1c1, w[4 + w_idx_o1 + 1], v_in, vl); \
                v_o1c2 = __riscv_vfmacc_vf_f32m1(v_o1c2, w[4 + w_idx_o1 + 2], v_in, vl); \
                v_o1c3 = __riscv_vfmacc_vf_f32m1(v_o1c3, w[4 + w_idx_o1 + 3], v_in, vl); \
            } \
        }

#define LOAD_PART1(i_ptr) \
        v_px = __riscv_vlseg6e32_v_f32m1x6(i_ptr, vl); \
        v_p0c0 = __riscv_vget_v_f32m1x6_f32m1(v_px, 0); \
        v_p0c1 = __riscv_vget_v_f32m1x6_f32m1(v_px, 1); \
        v_p0c2 = __riscv_vget_v_f32m1x6_f32m1(v_px, 2); \
        v_p1c0 = __riscv_vget_v_f32m1x6_f32m1(v_px, 3); \
        v_p1c1 = __riscv_vget_v_f32m1x6_f32m1(v_px, 4); \
        v_p1c2 = __riscv_vget_v_f32m1x6_f32m1(v_px, 5);

#define LOAD_PART2(v0, v1, v2) \
        v0 = __riscv_vmerge_vvm_f32m1(v_zero, v_p0c0, mask0, vl); \
        v1 = __riscv_vmerge_vvm_f32m1(v_zero, v_p0c1, mask0, vl); \
        v2 = __riscv_vmerge_vvm_f32m1(v_zero, v_p0c2, mask0, vl);

#define LOAD_PART3(v0, v1, v2) \
        v0 = __riscv_vmerge_vvm_f32m1(v_zero, v_p1c0, mask1, vl); \
        v1 = __riscv_vmerge_vvm_f32m1(v_zero, v_p1c1, mask1, vl); \
        v2 = __riscv_vmerge_vvm_f32m1(v_zero, v_p1c2, mask1, vl);

#define LOAD_PART4(v0, v1, v2, i_ptr) \
        v0 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vfslide1down_vf_f32m1(v_p0c0, i_ptr[vl * 6 + 0], vl), mask2, vl); \
        v1 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vfslide1down_vf_f32m1(v_p0c1, i_ptr[vl * 6 + 1], vl), mask2, vl); \
        v2 = __riscv_vmerge_vvm_f32m1(v_zero, __riscv_vfslide1down_vf_f32m1(v_p0c2, i_ptr[vl * 6 + 2], vl), mask2, vl);

        LOAD_PART1(i0_ptr)
        LOAD_PART2(v_in00_0, v_in01_0, v_in02_0)
        LOAD_PART3(v_in10_0, v_in11_0, v_in12_0)
        LOAD_PART4(v_in20_0, v_in21_0, v_in22_0, i0_ptr)

        LOAD_PART1(i1_ptr)
        PROCESS_MAC(0, 0, 0, v_in00_0)
        PROCESS_MAC(0, 0, 1, v_in01_0)
        PROCESS_MAC(0, 0, 2, v_in02_0)
        LOAD_PART2(v_in00_1, v_in01_1, v_in02_1)
        PROCESS_MAC(0, 1, 0, v_in10_0)
        PROCESS_MAC(0, 1, 1, v_in11_0)
        PROCESS_MAC(0, 1, 2, v_in12_0)
        LOAD_PART3(v_in10_1, v_in11_1, v_in12_1)
        PROCESS_MAC(0, 2, 0, v_in20_0)
        PROCESS_MAC(0, 2, 1, v_in21_0)
        LOAD_PART4(v_in20_1, v_in21_1, v_in22_1, i1_ptr)
        PROCESS_MAC(0, 2, 2, v_in22_0)

        LOAD_PART1(i2_ptr)
        PROCESS_MAC(1, 0, 0, v_in00_1)
        PROCESS_MAC(1, 0, 1, v_in01_1)
        PROCESS_MAC(1, 0, 2, v_in02_1)
        LOAD_PART2(v_in00_2, v_in01_2, v_in02_2)
        PROCESS_MAC(1, 1, 0, v_in10_1)
        PROCESS_MAC(1, 1, 1, v_in11_1)
        PROCESS_MAC(1, 1, 2, v_in12_1)
        LOAD_PART3(v_in10_2, v_in11_2, v_in12_2)
        PROCESS_MAC(1, 2, 0, v_in20_1)
        PROCESS_MAC(1, 2, 1, v_in21_1)
        LOAD_PART4(v_in20_2, v_in21_2, v_in22_2, i2_ptr)
        PROCESS_MAC(1, 2, 2, v_in22_1)

        LOAD_PART1(i3_ptr)
        PROCESS_MAC(2, 0, 0, v_in00_2)
        PROCESS_MAC(2, 0, 1, v_in01_2)
        PROCESS_MAC(2, 0, 2, v_in02_2)
        LOAD_PART2(v_in00_3, v_in01_3, v_in02_3)
        PROCESS_MAC(2, 1, 0, v_in10_2)
        PROCESS_MAC(2, 1, 1, v_in11_2)
        PROCESS_MAC(2, 1, 2, v_in12_2)
        LOAD_PART3(v_in10_3, v_in11_3, v_in12_3)
        PROCESS_MAC(2, 2, 0, v_in20_2)
        PROCESS_MAC(2, 2, 1, v_in21_2)
        LOAD_PART4(v_in20_3, v_in21_3, v_in22_3, i3_ptr)
        PROCESS_MAC(2, 2, 2, v_in22_2)

        LOAD_PART1(i4_ptr)
        PROCESS_MAC(3, 0, 0, v_in00_3)
        PROCESS_MAC(3, 0, 1, v_in01_3)
        PROCESS_MAC(3, 0, 2, v_in02_3)
        LOAD_PART2(v_in00_4, v_in01_4, v_in02_4)
        PROCESS_MAC(3, 1, 0, v_in10_3)
        PROCESS_MAC(3, 1, 1, v_in11_3)
        PROCESS_MAC(3, 1, 2, v_in12_3)
        LOAD_PART3(v_in10_4, v_in11_4, v_in12_4)
        PROCESS_MAC(3, 2, 0, v_in20_3)
        PROCESS_MAC(3, 2, 1, v_in21_3)
        LOAD_PART4(v_in20_4, v_in21_4, v_in22_4, i4_ptr)
        PROCESS_MAC(3, 2, 2, v_in22_3)

        PROCESS_MAC(4, 0, 0, v_in00_4)
        PROCESS_MAC(4, 0, 1, v_in01_4)
        PROCESS_MAC(4, 0, 2, v_in02_4)
        PROCESS_MAC(4, 1, 0, v_in10_4)
        PROCESS_MAC(4, 1, 1, v_in11_4)
        PROCESS_MAC(4, 1, 2, v_in12_4)
        PROCESS_MAC(4, 2, 0, v_in20_4)
        PROCESS_MAC(4, 2, 1, v_in21_4)
        PROCESS_MAC(4, 2, 2, v_in22_4)

#undef LOAD_PART1
#undef LOAD_PART2
#undef LOAD_PART3
#undef LOAD_PART4
#undef PROCESS_MAC

        v_o0c0 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o0c0, min_f, vl), max_f, vl);
        v_o0c1 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o0c1, min_f, vl), max_f, vl);
        v_o0c2 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o0c2, min_f, vl), max_f, vl);
        v_o0c3 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o0c3, min_f, vl), max_f, vl);
        v_o1c0 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o1c0, min_f, vl), max_f, vl);
        v_o1c1 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o1c1, min_f, vl), max_f, vl);
        v_o1c2 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o1c2, min_f, vl), max_f, vl);
        v_o1c3 = __riscv_vfmin_vf_f32m1(__riscv_vfmax_vf_f32m1(v_o1c3, min_f, vl), max_f, vl);

        __riscv_vse32_v_f32m1(o1c0, v_o1c0, vl); o1c0 += vl;
        __riscv_vse32_v_f32m1(o1c1, v_o1c1, vl); o1c1 += vl;
        __riscv_vse32_v_f32m1(o1c2, v_o1c2, vl); o1c2 += vl;
        __riscv_vse32_v_f32m1(o1c3, v_o1c3, vl); o1c3 += vl;
        __riscv_vse32_v_f32m1(o0c0, v_o0c0, vl); o0c0 += vl;
        __riscv_vse32_v_f32m1(o0c1, v_o0c1, vl); o0c1 += vl;
        __riscv_vse32_v_f32m1(o0c2, v_o0c2, vl); o0c2 += vl;
        __riscv_vse32_v_f32m1(o0c3, v_o0c3, vl); o0c3 += vl;

        i0_ptr += vl * 6; i1_ptr += vl * 6; i2_ptr += vl * 6; i3_ptr += vl * 6; i4_ptr += vl * 6;
        v_idx_base = __riscv_vadd_vx_i32m1(v_idx_base, (int32_t)vl * 2, vl);
        ow -= vl;
      }

      current_o0 = (float*) ((uintptr_t) o0c0 + output_channel_increment);
      current_o1 = (float*) ((uintptr_t) o1c0 + output_channel_increment);
      w_base += 112;
      c = (c > 4) ? c - 4 : 0;
    } while (c != 0);

    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);
  }
}

