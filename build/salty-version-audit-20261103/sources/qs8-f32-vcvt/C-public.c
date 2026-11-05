#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>
#include <stdint.h>

void test_rvv(
    size_t batch,
    const int8_t* input,
    float* output,
    const struct xnn_qs8_f32_cvt_params* restrict params) XNN_OOB_READS
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);

  const int8_t zero_point = (int8_t)params->scalar.zero_point;
  const float scale = params->scalar.scale;

  while (batch > 0) {
    // 1. Establish vector lengths for the double-buffered chunks.
    const size_t vl1 = __riscv_vsetvl_e8m2(batch);
    const size_t vl2 = __riscv_vsetvl_e8m2(batch - vl1);

    // 2. Capture pointers for the vector backend to use.
    // This lookahead prevents the sequencers from waiting on scalar ALU increments.
    const int8_t* const i1 = input;
    const int8_t* const i2 = input + vl1;
    float* const o1 = output;
    float* const o2 = output + vl1;

    // 3. Strategy 21: Scalar ALU-Chain Decoupling.
    // Move induction variable updates immediately after capturing current pointers.
    // This allows the scalar core to reach the end of the loop and start dispatching
    // instructions for the NEXT batch into the command queue while the backend 
    // processes the following vector instructions.
    const size_t total_vl = vl1 + vl2;
    input += total_vl;
    output += total_vl;
    batch -= total_vl;

    // 4. Vector Execution.
    // Interleave instructions to maximize utilization across VLS, VXS, and VSS sequencers.
    // Within VXS, interleaving IntPipe, FPConvPipe, and FMAPipe instructions hides latencies.

    // Chunk 1: Unit-stride load (VLS Sequencer).
    vint8m2_t vx1 = __riscv_vle8_v_i8m2(i1, vl1);
    
    // Chunk 1: Widening integer subtract (VXS Sequencer - IntPipe).
    vint16m4_t vhx1 = __riscv_vwsub_vx_i16m4(vx1, zero_point, vl1);
    
    // Chunk 2: Unit-stride load (VLS Sequencer).
    vint8m2_t vx2 = __riscv_vle8_v_i8m2(i2, vl2);
    
    // Chunk 1: Widening convert to floating-point (VXS Sequencer - FPConvPipe).
    vfloat32m8_t vy1 = __riscv_vfwcvt_f_x_v_f32m8(vhx1, vl1);
    
    // Chunk 2: Widening integer subtract (VXS Sequencer - IntPipe).
    vint16m4_t vhx2 = __riscv_vwsub_vx_i16m4(vx2, zero_point, vl2);
    
    // Chunk 1: Floating-point multiply (VXS Sequencer - FMAPipe).
    vy1 = __riscv_vfmul_vf_f32m8(vy1, scale, vl1);
    
    // Chunk 2: Widening convert to floating-point (VXS Sequencer - FPConvPipe).
    vfloat32m8_t vy2 = __riscv_vfwcvt_f_x_v_f32m8(vhx2, vl2);
    
    // Chunk 1: Unit-stride store (VSS Sequencer).
    __riscv_vse32_v_f32m8(o1, vy1, vl1);
    
    // Chunk 2: Floating-point multiply (VXS Sequencer - FMAPipe).
    vy2 = __riscv_vfmul_vf_f32m8(vy2, scale, vl2);
    
    // Chunk 2: Unit-stride store (VSS Sequencer).
    __riscv_vse32_v_f32m8(o2, vy2, vl2);
  }
}
