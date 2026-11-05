#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

void test_rvv(
    size_t batch,
    const int8_t* input,
    int32_t* output,
    const struct xnn_qs8_rsum_params* restrict params)
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);
  assert(params != NULL);

  // Initialize the main 32-bit accumulator at LMUL=8.
  // On Saturn, e8m2, e16m4, and e32m8 share the same VLMAX (VLEN/4 elements).
  const size_t vlmax = __riscv_vsetvlmax_e32m8();
  vint32m8_t vacc32 = __riscv_vmv_v_x_i32m8(0, vlmax);

  if (batch > 0) {
    // Strategy 12: VXS Drain Overlap (Software Pipelining)
    // Initialize the first 16-bit intermediate accumulator.
    vint16m4_t vacc16 = __riscv_vmv_v_x_i16m4(0, vlmax);
    
    // Process the first vector of the first chunk to prime the pipeline.
    size_t vl = __riscv_vsetvl_e8m2(batch);
    vint8m2_t vt = __riscv_vle8_v_i8m2(input, vl);
    input += vl;
    batch -= vl;
    
    // vwadd.wv (16-bit + sext(8-bit) -> 16-bit) is a single VXS instruction.
    vacc16 = __riscv_vwadd_wv_i16m4_tu(vacc16, vacc16, vt, vl);

    // Process the remainder of the first sub-batch (up to 255 more iterations).
    // The sum of 256 int8 values fits in a signed int16.
    for (size_t i = 1; i < 256 && batch > 0; i++) {
      vl = __riscv_vsetvl_e8m2(batch);
      vt = __riscv_vle8_v_i8m2(input, vl);
      vacc16 = __riscv_vwadd_wv_i16m4_tu(vacc16, vacc16, vt, vl);
      input += vl;
      batch -= vl;
    }

    // Outer loop software pipelining: overlap the VXS "drain" (16->32 bit)
    // of the previous chunk with the VLS "load" of the first vector of the next chunk.
    while (batch > 0) {
      // 1. Fetch the first vector of the NEXT chunk (VLS Sequencer).
      vl = __riscv_vsetvl_e8m2(batch);
      vt = __riscv_vle8_v_i8m2(input, vl);
      input += vl;
      batch -= vl;

      // 2. Concurrently drain the PREVIOUS chunk's 16-bit accumulator (VXS Sequencer).
      // On Saturn, the VXS sequencer takes ~8 chime cycles for this LMUL=8 widening add,
      // completely hiding the latency of the unit-stride load performed above.
      vacc32 = __riscv_vwadd_wv_i32m8(vacc32, vacc16, vlmax);
      
      // 3. Reset the intermediate accumulator for the new chunk (VXS Sequencer).
      vacc16 = __riscv_vmv_v_x_i16m4(0, vlmax);
      
      // 4. Accumulate the vector we loaded in step 1 (VXS Sequencer).
      vacc16 = __riscv_vwadd_wv_i16m4_tu(vacc16, vacc16, vt, vl);

      // 5. Process the remaining 255 iterations of the current chunk.
      for (size_t i = 1; i < 256 && batch > 0; i++) {
        vl = __riscv_vsetvl_e8m2(batch);
        vt = __riscv_vle8_v_i8m2(input, vl);
        vacc16 = __riscv_vwadd_wv_i16m4_tu(vacc16, vacc16, vt, vl);
        input += vl;
        batch -= vl;
      }
    }

    // Drain the final chunk into the 32-bit main accumulator.
    vacc32 = __riscv_vwadd_wv_i32m8(vacc32, vacc16, vlmax);
  }

  // Hierarchically fold the LMUL=8 vector to mitigate the VPS sequential reduction bottleneck.
  // 1. Fold LMUL=8 down to LMUL=4
  size_t vl4 = __riscv_vsetvlmax_e32m4();
  vint32m4_t v32_m4_lo = __riscv_vget_v_i32m8_i32m4(vacc32, 0);
  vint32m4_t v32_m4_hi = __riscv_vget_v_i32m8_i32m4(vacc32, 1);
  vint32m4_t v32_m4 = __riscv_vadd_vv_i32m4(v32_m4_lo, v32_m4_hi, vl4);

  // 2. Fold LMUL=4 down to LMUL=2
  size_t vl2 = __riscv_vsetvlmax_e32m2();
  vint32m2_t v32_m2_lo = __riscv_vget_v_i32m4_i32m2(v32_m4, 0);
  vint32m2_t v32_m2_hi = __riscv_vget_v_i32m4_i32m2(v32_m4, 1);
  vint32m2_t v32_m2 = __riscv_vadd_vv_i32m2(v32_m2_lo, v32_m2_hi, vl2);

  // 3. Fold LMUL=2 down to LMUL=1
  size_t vl1 = __riscv_vsetvlmax_e32m1();
  vint32m1_t v32_m1_lo = __riscv_vget_v_i32m2_i32m1(v32_m2, 0);
  vint32m1_t v32_m1_hi = __riscv_vget_v_i32m2_i32m1(v32_m2, 1);
  vint32m1_t v32_m1 = __riscv_vadd_vv_i32m1(v32_m1_lo, v32_m1_hi, vl1);

  // Perform final horizontal reduction on LMUL=1 vector.
  vint32m1_t vzero = __riscv_vmv_v_x_i32m1(0, vl1);
  vint32m1_t vres = __riscv_vredsum_vs_i32m1_i32m1(v32_m1, vzero, vl1);
  
  // Final scalar writeback (VMV.X.S). Stalls the scalar pipe, but only once.
  *output += __riscv_vmv_x_s_i32m1_i32(vres);
}
