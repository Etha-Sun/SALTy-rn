#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>
#include <stdint.h>

void test_rvv(
    size_t batch,
    const uint8_t* input,
    float* output,
    const struct xnn_qu8_f32_cvt_params* restrict params)
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);

  const uint8_t zero_point = (uint8_t)params->scalar.zero_point;
  const float scale = params->scalar.scale;

  // Saturn Optimization: Calculate VLMAX once.
  // We use LMUL=2 for the 8-bit source. 
  // Widening subtraction (vwsubu) results in 16-bit LMUL=4.
  // Widening conversion (vfwcvt) results in 32-bit LMUL=8.
  // This utilizes the maximum register grouping to hide pipeline latency.
  const size_t vlmax = __riscv_vsetvlmax_e8m2();

  __asm__ volatile(".balign 32");
  while (batch >= 2 * vlmax) {
    // VLS: Queue two unit-stride loads. 
    // Saturn's DAE allows these to run ahead of the execution units.
    vuint8m2_t vx1 = __riscv_vle8_v_u8m2(input, vlmax);
    vuint8m2_t vx2 = __riscv_vle8_v_u8m2(input + vlmax, vlmax);

    // Strategy 13: DAE Load-to-Use Distance Maximization.
    // Hoist scalar pointer updates and loop bookkeeping here.
    // By placing scalar instructions between the loads (VLS) and the first 
    // arithmetic use (VXS), we allow the scalar core to finish issue 
    // and bookkeeping while the hardware is still fetching data from memory.
    float* out_ptr1 = output;
    float* out_ptr2 = output + vlmax;
    
    input += 2 * vlmax;
    output += 2 * vlmax;
    batch -= 2 * vlmax;

    // VXS - IntPipe (Chunk 1): Widening subtraction (8-bit -> 16-bit).
    vuint16m4_t vhx1_u16 = __riscv_vwsubu_vx_u16m4(vx1, zero_point, vlmax);
    vint16m4_t vhx1 = __riscv_vreinterpret_v_u16m4_i16m4(vhx1_u16);

    // VXS - FPConvPipe (Chunk 1): Widening signed int to float (16-bit -> 32-bit).
    vfloat32m8_t vy1 = __riscv_vfwcvt_f_x_v_f32m8(vhx1, vlmax);

    // VXS - IntPipe (Chunk 2): Interleave second chunk to keep VXS pipelines saturated.
    vuint16m4_t vhx2_u16 = __riscv_vwsubu_vx_u16m4(vx2, zero_point, vlmax);
    vint16m4_t vhx2 = __riscv_vreinterpret_v_u16m4_i16m4(vhx2_u16);

    // VXS - FMAPipe (Chunk 1): FP Multiply by scale.
    // At LMUL=8, the chime length is significantly longer than the FMA latency (4 stages),
    // ensuring the pipeline remains full without stalls.
    vy1 = __riscv_vfmul_vf_f32m8(vy1, scale, vlmax);

    // VXS - FPConvPipe (Chunk 2): Continue interleaving.
    vfloat32m8_t vy2 = __riscv_vfwcvt_f_x_v_f32m8(vhx2, vlmax);

    // VSS: Queue store for Chunk 1. Chaining occurs from VXS (FMA) to VSS.
    __riscv_vse32_v_f32m8(out_ptr1, vy1, vlmax);

    // VXS - FMAPipe (Chunk 2): Final computation for the second chunk.
    vy2 = __riscv_vfmul_vf_f32m8(vy2, scale, vlmax);

    // VSS: Queue store for Chunk 2.
    __riscv_vse32_v_f32m8(out_ptr2, vy2, vlmax);
  }

  // Tail Loop: Handle remaining elements using standard strip-mining.
  __asm__ volatile(".balign 32");
  while (batch > 0) {
    size_t vl = __riscv_vsetvl_e8m2(batch);
    vuint8m2_t vx = __riscv_vle8_v_u8m2(input, vl);

    // Apply DAE Load-to-Use Maximization for the tail as well.
    float* out_ptr = output;
    input += vl;
    output += vl;
    batch -= vl;

    vuint16m4_t vhx_u16 = __riscv_vwsubu_vx_u16m4(vx, zero_point, vl);
    vint16m4_t vhx = __riscv_vreinterpret_v_u16m4_i16m4(vhx_u16);
    vfloat32m8_t vy = __riscv_vfwcvt_f_x_v_f32m8(vhx, vl);
    vy = __riscv_vfmul_vf_f32m8(vy, scale, vl);
    __riscv_vse32_v_f32m8(out_ptr, vy, vl);
  }
}
