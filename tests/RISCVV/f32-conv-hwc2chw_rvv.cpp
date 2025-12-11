#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/symbolic_scalar_types.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {


// Extract element at index and store to destination pointer
// This tracks the symbolic value for verification
static inline void extract_and_store_f32(float* dst, vfloat32m1_t v, size_t idx, size_t vl) {
    vfloat32m1_t shifted = __riscv_vslidedown_vx_f32m1(v, idx, vl);
    symbolic_float32_t sym_val = __riscv_vfmv_f_s_f32m1_f32(shifted);
    // Store symbolic value to memory map
    uintptr_t addr = reinterpret_cast<uintptr_t>(dst);
    g_riscv_float_scalar_memory[addr] = sym_val.getTerm();
    *dst = static_cast<float>(sym_val);
}

// Extract element at index as symbolic_float32_t for symbolic computation
static inline symbolic_float32_t extract_f32_sym(vfloat32m1_t v, size_t idx, size_t vl) {
    vfloat32m1_t shifted = __riscv_vslidedown_vx_f32m1(v, idx, vl);
    return __riscv_vfmv_f_s_f32m1_f32(shifted);
}


void xnn_f32_conv_hwc2chw_ukernel_3x3s2p1c3x4__rvv_2x2(
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
    const struct xnn_f32_minmax_params* params) XNN_OOB_READS
{
    assert(input_width != 0);
    assert(output_y_end > output_y_start);
    assert(input_padding_top <= 1);
    assert(output_channels != 0);

    const size_t vl = __riscv_vsetvl_e32m1(4);

    const size_t input_height_stride = input_width * 3 * sizeof(float);
    const size_t input_width_increment = round_down_po2(input_width, 4) * 3 * sizeof(float);
    const size_t output_width = (input_width + 1) / 2;
    const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(float);

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

    const float vmin = params->scalar.min;
    const float vmax = params->scalar.max;

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

            vfloat32m1_t vi0x0 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
            vfloat32m1_t vi1x0 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
            vfloat32m1_t vi2x0 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
            vfloat32m1_t vi3x0 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
            vfloat32m1_t vi4x0 = __riscv_vfmv_v_f_f32m1(0.0f, vl);

            size_t iw = input_width;
            for (; iw >= 4; iw -= 4) {
                vfloat32m1_t vo0x0 = __riscv_vle32_v_f32m1(w, vl);
                vfloat32m1_t vo1x0 = vo0x0;
                vfloat32m1_t vo0x1 = vo0x0;
                vfloat32m1_t vo1x1 = vo0x0;

                vfloat32m1_t vk00c0 = __riscv_vle32_v_f32m1(w + 4, vl);

                vfloat32m1_t vi0x1 = __riscv_vle32_v_f32m1(i0, vl); i0 += 4;
                vfloat32m1_t vi1x1 = __riscv_vle32_v_f32m1(i1, vl); i1 += 4;
                vfloat32m1_t vi2x1 = __riscv_vle32_v_f32m1(i2, vl); i2 += 4;
                vfloat32m1_t vi3x1 = __riscv_vle32_v_f32m1(i3, vl); i3 += 4;
                vfloat32m1_t vi4x1 = __riscv_vle32_v_f32m1(i4, vl); i4 += 4;

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x0, 1, vl), vk00c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x0, 1, vl), vk00c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x1, 3, vl), vk00c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x1, 3, vl), vk00c0, vl);

                vfloat32m1_t vk10c0 = __riscv_vle32_v_f32m1(w + 8, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x0, 1, vl), vk10c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x0, 1, vl), vk10c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x1, 3, vl), vk10c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x1, 3, vl), vk10c0, vl);

                vfloat32m1_t vk20c0 = __riscv_vle32_v_f32m1(w + 12, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x0, 1, vl), vk20c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x0, 1, vl), vk20c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x1, 3, vl), vk20c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x1, 3, vl), vk20c0, vl);

                vfloat32m1_t vk00c1 = __riscv_vle32_v_f32m1(w + 16, vl);

                vfloat32m1_t vi0x2 = __riscv_vle32_v_f32m1(i0, vl); i0 += 4;
                vfloat32m1_t vi1x2 = __riscv_vle32_v_f32m1(i1, vl); i1 += 4;
                vfloat32m1_t vi2x2 = __riscv_vle32_v_f32m1(i2, vl); i2 += 4;
                vfloat32m1_t vi3x2 = __riscv_vle32_v_f32m1(i3, vl); i3 += 4;
                vfloat32m1_t vi4x2 = __riscv_vle32_v_f32m1(i4, vl); i4 += 4;

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x0, 2, vl), vk00c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x0, 2, vl), vk00c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 0, vl), vk00c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 0, vl), vk00c1, vl);

                vfloat32m1_t vk10c1 = __riscv_vle32_v_f32m1(w + 20, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x0, 2, vl), vk10c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x0, 2, vl), vk10c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 0, vl), vk10c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 0, vl), vk10c1, vl);

                vfloat32m1_t vk20c1 = __riscv_vle32_v_f32m1(w + 24, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x0, 2, vl), vk20c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x0, 2, vl), vk20c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 0, vl), vk20c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 0, vl), vk20c1, vl);

                vfloat32m1_t vk00c2 = __riscv_vle32_v_f32m1(w + 28, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x0, 3, vl), vk00c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x0, 3, vl), vk00c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 1, vl), vk00c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 1, vl), vk00c2, vl);

                vfloat32m1_t vk10c2 = __riscv_vle32_v_f32m1(w + 32, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x0, 3, vl), vk10c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x0, 3, vl), vk10c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 1, vl), vk10c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 1, vl), vk10c2, vl);

                vfloat32m1_t vk20c2 = __riscv_vle32_v_f32m1(w + 36, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x0, 3, vl), vk20c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x0, 3, vl), vk20c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 1, vl), vk20c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 1, vl), vk20c2, vl);

                vfloat32m1_t vk01c0 = __riscv_vle32_v_f32m1(w + 40, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 0, vl), vk01c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 0, vl), vk01c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 2, vl), vk01c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 2, vl), vk01c0, vl);

                vfloat32m1_t vk11c0 = __riscv_vle32_v_f32m1(w + 44, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 0, vl), vk11c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 0, vl), vk11c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 2, vl), vk11c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 2, vl), vk11c0, vl);

                vfloat32m1_t vk21c0 = __riscv_vle32_v_f32m1(w + 48, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 0, vl), vk21c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 0, vl), vk21c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 2, vl), vk21c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 2, vl), vk21c0, vl);

                vfloat32m1_t vk01c1 = __riscv_vle32_v_f32m1(w + 52, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 1, vl), vk01c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 1, vl), vk01c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 3, vl), vk01c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 3, vl), vk01c1, vl);

                vfloat32m1_t vk11c1 = __riscv_vle32_v_f32m1(w + 56, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 1, vl), vk11c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 1, vl), vk11c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 3, vl), vk11c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 3, vl), vk11c1, vl);

                vfloat32m1_t vk21c1 = __riscv_vle32_v_f32m1(w + 60, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 1, vl), vk21c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 1, vl), vk21c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 3, vl), vk21c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 3, vl), vk21c1, vl);

                vfloat32m1_t vk01c2 = __riscv_vle32_v_f32m1(w + 64, vl);

                vfloat32m1_t vi0x3 = __riscv_vle32_v_f32m1(i0, vl); i0 += 4;
                vfloat32m1_t vi1x3 = __riscv_vle32_v_f32m1(i1, vl); i1 += 4;
                vfloat32m1_t vi2x3 = __riscv_vle32_v_f32m1(i2, vl); i2 += 4;
                vfloat32m1_t vi3x3 = __riscv_vle32_v_f32m1(i3, vl); i3 += 4;
                vfloat32m1_t vi4x3 = __riscv_vle32_v_f32m1(i4, vl); i4 += 4;

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 2, vl), vk01c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 2, vl), vk01c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x3, 0, vl), vk01c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x3, 0, vl), vk01c2, vl);

                vfloat32m1_t vk11c2 = __riscv_vle32_v_f32m1(w + 68, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 2, vl), vk11c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 2, vl), vk11c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x3, 0, vl), vk11c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x3, 0, vl), vk11c2, vl);

                vfloat32m1_t vk21c2 = __riscv_vle32_v_f32m1(w + 72, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 2, vl), vk21c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 2, vl), vk21c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x3, 0, vl), vk21c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x3, 0, vl), vk21c2, vl);

                vfloat32m1_t vk02c0 = __riscv_vle32_v_f32m1(w + 76, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 3, vl), vk02c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 3, vl), vk02c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x3, 1, vl), vk02c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x3, 1, vl), vk02c0, vl);

                vfloat32m1_t vk12c0 = __riscv_vle32_v_f32m1(w + 80, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 3, vl), vk12c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 3, vl), vk12c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x3, 1, vl), vk12c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x3, 1, vl), vk12c0, vl);

                vfloat32m1_t vk22c0 = __riscv_vle32_v_f32m1(w + 84, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 3, vl), vk22c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 3, vl), vk22c0, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x3, 1, vl), vk22c0, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x3, 1, vl), vk22c0, vl);

                vfloat32m1_t vk02c1 = __riscv_vle32_v_f32m1(w + 88, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x2, 0, vl), vk02c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x2, 0, vl), vk02c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x3, 2, vl), vk02c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x3, 2, vl), vk02c1, vl);

                vfloat32m1_t vk12c1 = __riscv_vle32_v_f32m1(w + 92, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x2, 0, vl), vk12c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x2, 0, vl), vk12c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x3, 2, vl), vk12c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x3, 2, vl), vk12c1, vl);

                vfloat32m1_t vk22c1 = __riscv_vle32_v_f32m1(w + 96, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x2, 0, vl), vk22c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x2, 0, vl), vk22c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x3, 2, vl), vk22c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x3, 2, vl), vk22c1, vl);

                vfloat32m1_t vk02c2 = __riscv_vle32_v_f32m1(w + 100, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x2, 1, vl), vk02c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x2, 1, vl), vk02c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x3, 3, vl), vk02c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x3, 3, vl), vk02c2, vl);

                vfloat32m1_t vk12c2 = __riscv_vle32_v_f32m1(w + 104, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x2, 1, vl), vk12c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x2, 1, vl), vk12c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x3, 3, vl), vk12c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x3, 3, vl), vk12c2, vl);

                vfloat32m1_t vk22c2 = __riscv_vle32_v_f32m1(w + 108, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x2, 1, vl), vk22c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x2, 1, vl), vk22c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x3, 3, vl), vk22c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x3, 3, vl), vk22c2, vl);

                vi0x0 = vi0x3;
                vi1x0 = vi1x3;
                vi2x0 = vi2x3;
                vi3x0 = vi3x3;
                vi4x0 = vi4x3;

                vo0x0 = __riscv_vfmax_vf_f32m1(vo0x0, vmin, vl);
                vo1x0 = __riscv_vfmax_vf_f32m1(vo1x0, vmin, vl);
                vo0x1 = __riscv_vfmax_vf_f32m1(vo0x1, vmin, vl);
                vo1x1 = __riscv_vfmax_vf_f32m1(vo1x1, vmin, vl);

                vo0x0 = __riscv_vfmin_vf_f32m1(vo0x0, vmax, vl);
                vo1x0 = __riscv_vfmin_vf_f32m1(vo1x0, vmax, vl);
                vo0x1 = __riscv_vfmin_vf_f32m1(vo0x1, vmax, vl);
                vo1x1 = __riscv_vfmin_vf_f32m1(vo1x1, vmax, vl);

                extract_and_store_f32(o0c0++, vo0x0, 0, vl);
                extract_and_store_f32(o0c0++, vo0x1, 0, vl);
                extract_and_store_f32(o0c1++, vo0x0, 1, vl);
                extract_and_store_f32(o0c1++, vo0x1, 1, vl);
                extract_and_store_f32(o0c2++, vo0x0, 2, vl);
                extract_and_store_f32(o0c2++, vo0x1, 2, vl);
                extract_and_store_f32(o0c3++, vo0x0, 3, vl);
                extract_and_store_f32(o0c3++, vo0x1, 3, vl);

                extract_and_store_f32(o1c0++, vo1x0, 0, vl);
                extract_and_store_f32(o1c0++, vo1x1, 0, vl);
                extract_and_store_f32(o1c1++, vo1x0, 1, vl);
                extract_and_store_f32(o1c1++, vo1x1, 1, vl);
                extract_and_store_f32(o1c2++, vo1x0, 2, vl);
                extract_and_store_f32(o1c2++, vo1x1, 2, vl);
                extract_and_store_f32(o1c3++, vo1x0, 3, vl);
                extract_and_store_f32(o1c3++, vo1x1, 3, vl);
            }

            assert(iw < 4);
            if XNN_UNLIKELY(iw != 0) {
                vfloat32m1_t vo0x0 = __riscv_vle32_v_f32m1(w, vl);
                vfloat32m1_t vo1x0 = vo0x0;
                vfloat32m1_t vo0x1 = vo0x0;
                vfloat32m1_t vo1x1 = vo0x0;

                vfloat32m1_t vk00c0 = __riscv_vle32_v_f32m1(w + 4, vl);

                vfloat32m1_t vi0x1 = __riscv_vle32_v_f32m1(i0, vl);
                vfloat32m1_t vi1x1 = __riscv_vle32_v_f32m1(i1, vl);
                vfloat32m1_t vi2x1 = __riscv_vle32_v_f32m1(i2, vl);
                vfloat32m1_t vi3x1 = __riscv_vle32_v_f32m1(i3, vl);
                vfloat32m1_t vi4x1 = __riscv_vle32_v_f32m1(i4, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x0, 1, vl), vk00c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x0, 1, vl), vk00c0, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x1, 3, vl), vk00c0, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x1, 3, vl), vk00c0, vl);
                }

                vfloat32m1_t vk10c0 = __riscv_vle32_v_f32m1(w + 8, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x0, 1, vl), vk10c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x0, 1, vl), vk10c0, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x1, 3, vl), vk10c0, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x1, 3, vl), vk10c0, vl);
                }

                vfloat32m1_t vk20c0 = __riscv_vle32_v_f32m1(w + 12, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x0, 1, vl), vk20c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x0, 1, vl), vk20c0, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x1, 3, vl), vk20c0, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x1, 3, vl), vk20c0, vl);
                }

                vfloat32m1_t vk00c1 = __riscv_vle32_v_f32m1(w + 16, vl);

                vfloat32m1_t vi0x2 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi1x2 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi2x2 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi3x2 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi4x2 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                if (iw >= 2) {
                    vi0x2 = __riscv_vle32_v_f32m1(i0 + 4, vl);
                    vi1x2 = __riscv_vle32_v_f32m1(i1 + 4, vl);
                    vi2x2 = __riscv_vle32_v_f32m1(i2 + 4, vl);
                    vi3x2 = __riscv_vle32_v_f32m1(i3 + 4, vl);
                    vi4x2 = __riscv_vle32_v_f32m1(i4 + 4, vl);
                }

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x0, 2, vl), vk00c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x0, 2, vl), vk00c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 0, vl), vk00c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 0, vl), vk00c1, vl);

                vfloat32m1_t vk10c1 = __riscv_vle32_v_f32m1(w + 20, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x0, 2, vl), vk10c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x0, 2, vl), vk10c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 0, vl), vk10c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 0, vl), vk10c1, vl);

                vfloat32m1_t vk20c1 = __riscv_vle32_v_f32m1(w + 24, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x0, 2, vl), vk20c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x0, 2, vl), vk20c1, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 0, vl), vk20c1, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 0, vl), vk20c1, vl);

                vfloat32m1_t vk00c2 = __riscv_vle32_v_f32m1(w + 28, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x0, 3, vl), vk00c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x0, 3, vl), vk00c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 1, vl), vk00c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 1, vl), vk00c2, vl);

                vfloat32m1_t vk10c2 = __riscv_vle32_v_f32m1(w + 32, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x0, 3, vl), vk10c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x0, 3, vl), vk10c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 1, vl), vk10c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 1, vl), vk10c2, vl);

                vfloat32m1_t vk20c2 = __riscv_vle32_v_f32m1(w + 36, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x0, 3, vl), vk20c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x0, 3, vl), vk20c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 1, vl), vk20c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 1, vl), vk20c2, vl);

                vfloat32m1_t vk01c0 = __riscv_vle32_v_f32m1(w + 40, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 0, vl), vk01c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 0, vl), vk01c0, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 2, vl), vk01c0, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 2, vl), vk01c0, vl);
                }

                vfloat32m1_t vk11c0 = __riscv_vle32_v_f32m1(w + 44, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 0, vl), vk11c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 0, vl), vk11c0, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 2, vl), vk11c0, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 2, vl), vk11c0, vl);
                }

                vfloat32m1_t vk21c0 = __riscv_vle32_v_f32m1(w + 48, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 0, vl), vk21c0, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 0, vl), vk21c0, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 2, vl), vk21c0, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 2, vl), vk21c0, vl);
                }

                vfloat32m1_t vk01c1 = __riscv_vle32_v_f32m1(w + 52, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 1, vl), vk01c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 1, vl), vk01c1, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x2, 3, vl), vk01c1, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x2, 3, vl), vk01c1, vl);
                }

                vfloat32m1_t vk11c1 = __riscv_vle32_v_f32m1(w + 56, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 1, vl), vk11c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 1, vl), vk11c1, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x2, 3, vl), vk11c1, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x2, 3, vl), vk11c1, vl);
                }

                vfloat32m1_t vk21c1 = __riscv_vle32_v_f32m1(w + 60, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 1, vl), vk21c1, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 1, vl), vk21c1, vl);
                if (iw > 2) {
                    vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x2, 3, vl), vk21c1, vl);
                    vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x2, 3, vl), vk21c1, vl);
                }

                vfloat32m1_t vk01c2 = __riscv_vle32_v_f32m1(w + 64, vl);

                vfloat32m1_t vi0x3 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi1x3 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi2x3 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi3x3 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                vfloat32m1_t vi4x3 = __riscv_vfmv_v_f_f32m1(0.0f, vl);
                if (iw > 2) {
                    vi0x3 = __riscv_vfmv_v_f_f32m1(i0[8], vl);
                    vi1x3 = __riscv_vfmv_v_f_f32m1(i1[8], vl);
                    vi2x3 = __riscv_vfmv_v_f_f32m1(i2[8], vl);
                    vi3x3 = __riscv_vfmv_v_f_f32m1(i3[8], vl);
                    vi4x3 = __riscv_vfmv_v_f_f32m1(i4[8], vl);
                }

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 2, vl), vk01c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 2, vl), vk01c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi0x3, 0, vl), vk01c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi2x3, 0, vl), vk01c2, vl);

                vfloat32m1_t vk11c2 = __riscv_vle32_v_f32m1(w + 68, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 2, vl), vk11c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 2, vl), vk11c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi1x3, 0, vl), vk11c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi3x3, 0, vl), vk11c2, vl);

                vfloat32m1_t vk21c2 = __riscv_vle32_v_f32m1(w + 72, vl);

                vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 2, vl), vk21c2, vl);
                vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 2, vl), vk21c2, vl);
                vo0x1 = __riscv_vfmacc_vf_f32m1_sym(vo0x1, extract_f32_sym(vi2x3, 0, vl), vk21c2, vl);
                vo1x1 = __riscv_vfmacc_vf_f32m1_sym(vo1x1, extract_f32_sym(vi4x3, 0, vl), vk21c2, vl);

                if (iw >= 2) {
                    vfloat32m1_t vk02c0 = __riscv_vle32_v_f32m1(w + 76, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x1, 3, vl), vk02c0, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x1, 3, vl), vk02c0, vl);

                    vfloat32m1_t vk12c0 = __riscv_vle32_v_f32m1(w + 80, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x1, 3, vl), vk12c0, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x1, 3, vl), vk12c0, vl);

                    vfloat32m1_t vk22c0 = __riscv_vle32_v_f32m1(w + 84, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x1, 3, vl), vk22c0, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x1, 3, vl), vk22c0, vl);

                    vfloat32m1_t vk02c1 = __riscv_vle32_v_f32m1(w + 88, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x2, 0, vl), vk02c1, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x2, 0, vl), vk02c1, vl);

                    vfloat32m1_t vk12c1 = __riscv_vle32_v_f32m1(w + 92, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x2, 0, vl), vk12c1, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x2, 0, vl), vk12c1, vl);

                    vfloat32m1_t vk22c1 = __riscv_vle32_v_f32m1(w + 96, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x2, 0, vl), vk22c1, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x2, 0, vl), vk22c1, vl);

                    vfloat32m1_t vk02c2 = __riscv_vle32_v_f32m1(w + 100, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi0x2, 1, vl), vk02c2, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi2x2, 1, vl), vk02c2, vl);

                    vfloat32m1_t vk12c2 = __riscv_vle32_v_f32m1(w + 104, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi1x2, 1, vl), vk12c2, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi3x2, 1, vl), vk12c2, vl);

                    vfloat32m1_t vk22c2 = __riscv_vle32_v_f32m1(w + 108, vl);

                    vo0x0 = __riscv_vfmacc_vf_f32m1_sym(vo0x0, extract_f32_sym(vi2x2, 1, vl), vk22c2, vl);
                    vo1x0 = __riscv_vfmacc_vf_f32m1_sym(vo1x0, extract_f32_sym(vi4x2, 1, vl), vk22c2, vl);
                }

                vo0x0 = __riscv_vfmax_vf_f32m1(vo0x0, vmin, vl);
                vo1x0 = __riscv_vfmax_vf_f32m1(vo1x0, vmin, vl);
                vo0x1 = __riscv_vfmax_vf_f32m1(vo0x1, vmin, vl);
                vo1x1 = __riscv_vfmax_vf_f32m1(vo1x1, vmin, vl);

                vo0x0 = __riscv_vfmin_vf_f32m1(vo0x0, vmax, vl);
                vo1x0 = __riscv_vfmin_vf_f32m1(vo1x0, vmax, vl);
                vo0x1 = __riscv_vfmin_vf_f32m1(vo0x1, vmax, vl);
                vo1x1 = __riscv_vfmin_vf_f32m1(vo1x1, vmax, vl);

                if (iw == 3) {
                    extract_and_store_f32(o0c0++, vo0x0, 0, vl);
                    extract_and_store_f32(o0c0++, vo0x1, 0, vl);
                    extract_and_store_f32(o0c1++, vo0x0, 1, vl);
                    extract_and_store_f32(o0c1++, vo0x1, 1, vl);
                    extract_and_store_f32(o0c2++, vo0x0, 2, vl);
                    extract_and_store_f32(o0c2++, vo0x1, 2, vl);
                    extract_and_store_f32(o0c3++, vo0x0, 3, vl);
                    extract_and_store_f32(o0c3++, vo0x1, 3, vl);

                    extract_and_store_f32(o1c0++, vo1x0, 0, vl);
                    extract_and_store_f32(o1c0++, vo1x1, 0, vl);
                    extract_and_store_f32(o1c1++, vo1x0, 1, vl);
                    extract_and_store_f32(o1c1++, vo1x1, 1, vl);
                    extract_and_store_f32(o1c2++, vo1x0, 2, vl);
                    extract_and_store_f32(o1c2++, vo1x1, 2, vl);
                    extract_and_store_f32(o1c3++, vo1x0, 3, vl);
                    extract_and_store_f32(o1c3++, vo1x1, 3, vl);
                } else {
                    extract_and_store_f32(o0c0++, vo0x0, 0, vl);
                    extract_and_store_f32(o0c1++, vo0x0, 1, vl);
                    extract_and_store_f32(o0c2++, vo0x0, 2, vl);
                    extract_and_store_f32(o0c3++, vo0x0, 3, vl);

                    extract_and_store_f32(o1c0++, vo1x0, 0, vl);
                    extract_and_store_f32(o1c1++, vo1x0, 1, vl);
                    extract_and_store_f32(o1c2++, vo1x0, 2, vl);
                    extract_and_store_f32(o1c3++, vo1x0, 3, vl);
                }
            }

            o0c0 = (float*) ((uintptr_t) o0c0 + output_channel_increment);
            o0c1 = (float*) ((uintptr_t) o0c1 + output_channel_increment);
            o0c2 = (float*) ((uintptr_t) o0c2 + output_channel_increment);
            o0c3 = (float*) ((uintptr_t) o0c3 + output_channel_increment);
            o1c0 = (float*) ((uintptr_t) o1c0 + output_channel_increment);
            o1c1 = (float*) ((uintptr_t) o1c1 + output_channel_increment);
            o1c2 = (float*) ((uintptr_t) o1c2 + output_channel_increment);
            o1c3 = (float*) ((uintptr_t) o1c3 + output_channel_increment);

            i0 = (const float*) ((uintptr_t) i0 - input_width_increment);
            i1 = (const float*) ((uintptr_t) i1 - input_width_increment);
            i2 = (const float*) ((uintptr_t) i2 - input_width_increment);
            i3 = (const float*) ((uintptr_t) i3 - input_width_increment);
            i4 = (const float*) ((uintptr_t) i4 - input_width_increment);

            w += 112;
            c = doz(c, 4);
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
}
