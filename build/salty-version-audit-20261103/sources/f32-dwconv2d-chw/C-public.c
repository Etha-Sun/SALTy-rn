#include <riscv_vector.h>
#include <assert.h>
#include <stdint.h>
#include <stddef.h>

/*
 * Canonical layout in `src` (src_n = 10 floats): [bias, k00, k01, k02, k10, k11, k12, k20, k21, k22].
 * This kernel reads the weight buffer in its original order, so pack_weights is an identity.
 */
static void pack_weights(const void* src_v, size_t src_n,
                         void* dst_v, size_t dst_cap)
{
    const float* src = (const float*)src_v;
    float*       dst = (float*)dst_v;
    for (size_t i = 0; i < src_n; i++) {
        dst[i] = src[i];
    }
}

// Forward declaration of params struct
struct xnn_f32_minmax_params;

/**
 * 3x3 Depthwise Convolution for Saturn RVV Microarchitecture.
 * Implements Strategy 11: Vertical Row-Block Unrolling & Strategy 17: Implicit accum init.
 * 
 * Unrolling by 2 output rows reduces `vfslide` instructions by sharing the "middle" row,
 * improving compute density. Vector registers are actively freed to maintain pressure
 * limits perfectly within the available 32 registers at LMUL=4.
 */
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params)
{
  assert(input_height != 0);
  assert(input_width != 0);
  assert(padding_top == 1);

  // Unpack scalar clamping parameters
  const float vmin = ((const float*)params)[0]; 
  const float vmax = ((const float*)params)[1];

  // Unpack convolution weights and bias
  const float vbias = weights[0];
  const float vk00 = weights[1], vk01 = weights[2], vk02 = weights[3];
  const float vk10 = weights[4], vk11 = weights[5], vk12 = weights[6];
  const float vk20 = weights[7], vk21 = weights[8], vk22 = weights[9];

  const size_t width = input_width >> 2;
  const size_t stride = width;

  for (size_t w = 0; w < width; ) {
    size_t vl = __riscv_vsetvl_e32m4(width - w);

    vfloat32m4_t v_bias = __riscv_vfmv_v_f_f32m4(vbias, vl);

    // Initial sliding window state for h=0
    // Row h-1 (Padding row for top-padding = 1)
    vfloat32m4_t vr0 = __riscv_vfmv_v_f_f32m4(0.0f, vl);
    float ls0 = 0.0f, rs0 = 0.0f;

    // Row h (Initial row 0)
    vfloat32m4_t vr1 = __riscv_vle32_v_f32m4(input + w, vl);
    float ls1 = (w == 0) ? 0.0f : (input + w)[-1];
    float rs1 = (w + vl >= width) ? 0.0f : (input + w)[vl];

    // Row h+1 (Initial row 1)
    vfloat32m4_t vr2;
    float ls2, rs2;
    if (input_height > 1) {
      const float* p1 = input + stride + w;
      vr2 = __riscv_vle32_v_f32m4(p1, vl);
      ls2 = (w == 0) ? 0.0f : p1[-1];
      rs2 = (w + vl >= width) ? 0.0f : p1[vl];
    } else {
      vr2 = __riscv_vfmv_v_f_f32m4(0.0f, vl);
      ls2 = 0.0f; rs2 = 0.0f;
    }

    size_t h = 0;
    // Unrolled loop: Process two output rows per iteration
    for (; h + 1 < input_height; h += 2) {
      vfloat32m4_t vt;

      // --- Row 0 contribution for out0 ---
      vt = __riscv_vfslide1up_vf_f32m4(vr0, ls0, vl);
      vfloat32m4_t out0 = __riscv_vfmadd_vf_f32m4(vt, vk00, v_bias, vl);
      vt = __riscv_vfslide1down_vf_f32m4(vr0, rs0, vl);
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk02, vt, vl);
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk01, vr0, vl);

      // vr0 is dead. Prefetch vr3 to overlap memory load with FMA math
      vfloat32m4_t vr3; float ls3, rs3;
      size_t h3 = h + 2;
      if (h3 < input_height) {
        const float* p3 = input + h3 * stride + w;
        vr3 = __riscv_vle32_v_f32m4(p3, vl);
        ls3 = (w == 0) ? 0.0f : p3[-1];
        rs3 = (w + vl >= width) ? 0.0f : p3[vl];
      } else {
        vr3 = __riscv_vfmv_v_f_f32m4(0.0f, vl);
        ls3 = 0.0f; rs3 = 0.0f;
      }

      // --- Row 1 is SHARED between out0 (bottom) and out1 (top) ---
      vt = __riscv_vfslide1up_vf_f32m4(vr1, ls1, vl);
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk10, vt, vl);
      vfloat32m4_t out1 = __riscv_vfmadd_vf_f32m4(vt, vk00, v_bias, vl);

      vt = __riscv_vfslide1down_vf_f32m4(vr1, rs1, vl);
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk12, vt, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk02, vt, vl);
      
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk11, vr1, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk01, vr1, vl);

      // vr1 is dead. Prefetch vr4 for the next iteration's vr2
      vfloat32m4_t vr4; float ls4, rs4;
      size_t h4 = h + 3;
      if (h4 < input_height) {
        const float* p4 = input + h4 * stride + w;
        vr4 = __riscv_vle32_v_f32m4(p4, vl);
        ls4 = (w == 0) ? 0.0f : p4[-1];
        rs4 = (w + vl >= width) ? 0.0f : p4[vl];
      } else {
        vr4 = __riscv_vfmv_v_f_f32m4(0.0f, vl);
        ls4 = 0.0f; rs4 = 0.0f;
      }

      // --- Row 2 is SHARED between out0 (bottom) and out1 (middle) ---
      vt = __riscv_vfslide1up_vf_f32m4(vr2, ls2, vl);
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk20, vt, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk10, vt, vl);

      vt = __riscv_vfslide1down_vf_f32m4(vr2, rs2, vl);
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk22, vt, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk12, vt, vl);
      
      out0 = __riscv_vfmacc_vf_f32m4(out0, vk21, vr2, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk11, vr2, vl);

      // Finish and Store out0
      out0 = __riscv_vfmin_vf_f32m4(__riscv_vfmax_vf_f32m4(out0, vmin, vl), vmax, vl);
      __riscv_vse32_v_f32m4(output + h * stride + w, out0, vl);

      // --- Row 3 contribution for out1 ---
      vt = __riscv_vfslide1up_vf_f32m4(vr3, ls3, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk20, vt, vl);
      vt = __riscv_vfslide1down_vf_f32m4(vr3, rs3, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk22, vt, vl);
      out1 = __riscv_vfmacc_vf_f32m4(out1, vk21, vr3, vl);

      // Finish and Store out1
      out1 = __riscv_vfmin_vf_f32m4(__riscv_vfmax_vf_f32m4(out1, vmin, vl), vmax, vl);
      __riscv_vse32_v_f32m4(output + (h + 1) * stride + w, out1, vl);

      // Rotate sliding window state for the next block
      vr0 = vr2; ls0 = ls2; rs0 = rs2;
      vr1 = vr3; ls1 = ls3; rs1 = rs3;
      vr2 = vr4; ls2 = ls4; rs2 = rs4;
    }

    // Tail block for the final odd row if input_height is odd
    if (h < input_height) {
      vfloat32m4_t vt;
      
      vt = __riscv_vfslide1up_vf_f32m4(vr0, ls0, vl);
      vfloat32m4_t out = __riscv_vfmadd_vf_f32m4(vt, vk00, v_bias, vl);
      vt = __riscv_vfslide1down_vf_f32m4(vr0, rs0, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk02, vt, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk01, vr0, vl);

      vt = __riscv_vfslide1up_vf_f32m4(vr1, ls1, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk10, vt, vl);
      vt = __riscv_vfslide1down_vf_f32m4(vr1, rs1, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk12, vt, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk11, vr1, vl);

      vt = __riscv_vfslide1up_vf_f32m4(vr2, ls2, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk20, vt, vl);
      vt = __riscv_vfslide1down_vf_f32m4(vr2, rs2, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk22, vt, vl);
      out = __riscv_vfmacc_vf_f32m4(out, vk21, vr2, vl);

      out = __riscv_vfmin_vf_f32m4(__riscv_vfmax_vf_f32m4(out, vmin, vl), vmax, vl);
      __riscv_vse32_v_f32m4(output + h * stride + w, out, vl);
    }
    
    w += vl;
  }
}
