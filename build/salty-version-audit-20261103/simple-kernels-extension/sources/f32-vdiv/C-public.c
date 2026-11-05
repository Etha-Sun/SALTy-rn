#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>

void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  size_t n = batch / sizeof(float);
  
  // Query VLMAX once to eliminate dynamic vsetvl bubbles from the hot path.
  // Using LMUL=4 provides longer chimes (VLEN*4/DLEN), which helps hide 
  // the latency of the iterative vfdiv unit and reduces scalar instruction pressure.
  const size_t vlmax = __riscv_vsetvlmax_e32m4();

  // Main Loop: Process chunks of VLMAX using a software-pipelined approach.
  // By using the constant vlmax, we avoid the 2-cycle vsetvl bubble on 
  // scalar cores like Rocket in every iteration.
  if (n >= vlmax) {
    // Initial load to prime the software pipeline.
    vfloat32m4_t va = __riscv_vle32_v_f32m4(input_a, vlmax);
    vfloat32m4_t vb = __riscv_vle32_v_f32m4(input_b, vlmax);
    input_a += vlmax;
    input_b += vlmax;
    n -= vlmax;

    while (n >= vlmax) {
      // Pre-fetch the next chunk of data.
      // Saturn's Decoupled Access-Execute (DAE) allows the VLS sequencer (Load)
      // to fetch these registers into the VRF while the VXS sequencer (Execute) 
      // is busy with the current division.
      vfloat32m4_t va_next = __riscv_vle32_v_f32m4(input_a, vlmax);
      vfloat32m4_t vb_next = __riscv_vle32_v_f32m4(input_b, vlmax);

      // Compute the current chunk. 
      // vfdiv is iterative and slow (1 elem/cycle). Software pipelining is 
      // essential to keep the Load (VLS) and Store (VSS) units utilized.
      vfloat32m4_t vacc = __riscv_vfdiv_vv_f32m4(va, vb, vlmax);

      // Store the computed chunk. 
      // Chaining occurs between VXS (Arithmetic) and VSS (Store).
      __riscv_vse32_v_f32m4(output, vacc, vlmax);

      // Advance pointers and update pipeline state.
      // We use standard assignment for whole-register transfers.
      va = va_next;
      vb = vb_next;
      input_a += vlmax;
      input_b += vlmax;
      output += vlmax;
      n -= vlmax;
    }

    // Process the final VLMAX-sized chunk held in the pipeline registers.
    vfloat32m4_t vacc = __riscv_vfdiv_vv_f32m4(va, vb, vlmax);
    __riscv_vse32_v_f32m4(output, vacc, vlmax);
    output += vlmax;
  }

  // Tail Loop: Process any remaining elements (n < vlmax) where dynamic 
  // vector length is required.
  while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m4(n);
    vfloat32m4_t va = __riscv_vle32_v_f32m4(input_a, vl);
    vfloat32m4_t vb = __riscv_vle32_v_f32m4(input_b, vl);
    vfloat32m4_t vacc = __riscv_vfdiv_vv_f32m4(va, vb, vl);
    __riscv_vse32_v_f32m4(output, vacc, vl);
    
    input_a += vl;
    input_b += vl;
    output += vl;
    n -= vl;
  }
}
