#include <riscv_vector.h>
#include <assert.h>
#include <stdint.h>
#include <stddef.h>

void test_rvv(
    size_t rows,
    size_t channels,
    const uint8_t* input,
    size_t input_stride,
    const uint8_t* zero,
    uint32_t* output,
    const struct xnn_qs8_rsum_params* params)
{
  assert(rows != 0);
  assert(channels != 0);
  assert(input != NULL);
  assert(output != NULL);

  // Pre-calculate the scalar increment for a block of 8 rows
  const size_t input_increment = 8 * input_stride;

  while (channels > 0) {
    // Process channels in segments using max LMUL for the 32-bit accumulator.
    // LMUL=8 for SEW=32 (vuint32m8_t) ensures maximum chime length on Saturn
    // (VLEN*LMUL/DLEN cycles) to hide pipeline latencies and minimize scalar overhead.
    size_t vl = __riscv_vsetvl_e32m8(channels);

    // Main 32-bit accumulator (initialized once per channel segment)
    vuint32m8_t vacc32 = __riscv_vmv_v_x_u32m8(0, vl);

    size_t r = rows;
    const uint8_t* i0 = input;
    const uint8_t* i1 = i0 + input_stride;
    const uint8_t* i2 = i1 + input_stride;
    const uint8_t* i3 = i2 + input_stride;
    const uint8_t* i4 = i3 + input_stride;
    const uint8_t* i5 = i4 + input_stride;
    const uint8_t* i6 = i5 + input_stride;
    const uint8_t* i7 = i6 + input_stride;

    // Phase 1: Process full 8-row blocks
    while (r >= 8) {
      // 256 is the largest multiple of 8 such that 256 * 255 < 2^16 (65280 < 65535).
      // We process rows in these batches using 16-bit intermediate accumulation
      // (vuint16m4_t) to increase throughput and reduce VXS power consumption.
      size_t batch_rows = (r >= 256) ? 256 : (r / 8) * 8;
      r -= batch_rows;

      vuint16m4_t vacc16 = __riscv_vmv_v_x_u16m4(0, vl);

      for (; batch_rows > 0; batch_rows -= 8) {
        // Interleave Loads (VLS sequencer) and Arithmetic (VXS sequencer) to 
        // maximize sequencer overlap. We utilize a perfect binary tree reduction
        // structure for the 8 rows to break the sequential dependency chain on the 
        // accumulator and hide the VXS IntPipe latency.

        // Pair 1 & 2
        vuint8m2_t v0 = __riscv_vle8_v_u8m2(i0, vl);
        vuint8m2_t v1 = __riscv_vle8_v_u8m2(i1, vl);
        vuint16m4_t s01 = __riscv_vwaddu_vv_u16m4(v0, v1, vl);

        vuint8m2_t v2 = __riscv_vle8_v_u8m2(i2, vl);
        vuint8m2_t v3 = __riscv_vle8_v_u8m2(i3, vl);
        vuint16m4_t s23 = __riscv_vwaddu_vv_u16m4(v2, v3, vl);

        // First stage reduction
        vuint16m4_t s03 = __riscv_vadd_vv_u16m4(s01, s23, vl);

        // Pair 3 & 4
        vuint8m2_t v4 = __riscv_vle8_v_u8m2(i4, vl);
        vuint8m2_t v5 = __riscv_vle8_v_u8m2(i5, vl);
        vuint16m4_t s45 = __riscv_vwaddu_vv_u16m4(v4, v5, vl);

        vuint8m2_t v6 = __riscv_vle8_v_u8m2(i6, vl);
        vuint8m2_t v7 = __riscv_vle8_v_u8m2(i7, vl);
        vuint16m4_t s67 = __riscv_vwaddu_vv_u16m4(v6, v7, vl);

        // Second stage reduction
        vuint16m4_t s47 = __riscv_vadd_vv_u16m4(s45, s67, vl);

        // Final stages: 8 rows into 1 vector, then into the intermediate accumulator
        vuint16m4_t s07 = __riscv_vadd_vv_u16m4(s03, s47, vl);
        vacc16 = __riscv_vadd_vv_u16m4(vacc16, s07, vl);

        // Advance row pointers
        i0 += input_increment;
        i1 += input_increment;
        i2 += input_increment;
        i3 += input_increment;
        i4 += input_increment;
        i5 += input_increment;
        i6 += input_increment;
        i7 += input_increment;
      }
      // Promote the batch results to the 32-bit main accumulator
      vacc32 = __riscv_vwaddu_wv_u32m8(vacc32, vacc16, vl);
    }

    // Phase 2: Handle remaining 1-7 rows (peeled tail) using a unified scalar-driven loop.
    // This replaces the nested if-tree to improve I-cache locality and eliminate branch mispredictions.
    // i0 points to the start of the first remaining row after Phase 1.
    for (; r > 0; r--) {
      vuint8m2_t v = __riscv_vle8_v_u8m2(i0, vl);
      // Promoting 8-bit to 16-bit intermediate before widening addition to the 32-bit accumulator.
      vuint16m4_t v16 = __riscv_vzext_vf2_u16m4(v, vl);
      vacc32 = __riscv_vwaddu_wv_u32m8(vacc32, v16, vl);
      i0 += input_stride;
    }

    // Update the output memory using a Read-Modify-Write operation.
    // Unit-stride loads/stores (VLS/VSS) access memory at full DLEN bandwidth.
    vuint32m8_t vout = __riscv_vle32_v_u32m8(output, vl);
    vout = __riscv_vadd_vv_u32m8(vout, vacc32, vl);
    __riscv_vse32_v_u32m8(output, vout, vl);

    // Advance horizontal pointers for the next channel segment
    input += vl;
    output += vl;
    channels -= vl;
  }
}
