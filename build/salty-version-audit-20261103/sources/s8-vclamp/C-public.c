#include <riscv_vector.h>
#include <assert.h>
#include <stddef.h>
#include <stdint.h>

struct xnn_scalar_s8_minmax_params {
  int32_t min;
  int32_t max;
};

struct xnn_s8_minmax_params {
  struct xnn_scalar_s8_minmax_params scalar;
};

/**
 * Optimized clamp (min-max) implementation for Saturn RVV Microarchitecture.
 * 
 * Strategy:
 * 1. Maximize LMUL (m8): Since Saturn is a short-vector machine, using LMUL=8 increases 
 *    the chime length, hiding pipeline latencies and reducing scalar fetch pressure.
 * 2. Software Pipelining: Overlap Load (VLS), Compute (VXS), and Store (VSS) sequencers.
 * 3. Strategy 11 (Pointer-Comparison Loop Control): Replace the 'processed' counter 
 *    with direct pointer comparisons to reduce scalar arithmetic and frontend pressure.
 * 4. Pointer Aliasing (__restrict__): Assists the early-stage memory disambiguation unit.
 */
void test_rvv(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_s8_minmax_params* params) 
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);

  const int8_t min_val = (int8_t) params->scalar.min;
  const int8_t max_val = (int8_t) params->scalar.max;

  // Use restrict to assist memory disambiguation and early dispatch
  const int8_t* __restrict__ in_ptr = input;
  int8_t* __restrict__ out_ptr = output;
  const int8_t* const end_ptr = input + batch;

  // Initial prime: Load the first chunk of data
  // Using LMUL=8 ensures that the pipeline depth (e.g., 4-stage FMA/ALU) is covered
  // by the chime length, preventing stalls on dependent vector instructions.
  size_t vl = __riscv_vsetvl_e8m8((size_t)(end_ptr - in_ptr));
  vint8m8_t vacc = __riscv_vle8_v_i8m8(in_ptr, vl);

  // Software Pipelined Loop with Pointer-Comparison Loop Control
  // By checking if the start of the next chunk (in_ptr + vl) is within bounds,
  // we reduce the number of scalar instructions required for loop maintenance.
  while (in_ptr + vl < end_ptr) {
    const int8_t* next_in_ptr = in_ptr + vl;
    
    // 1. VLS Sequencer: Issue load for the next chunk immediately.
    // Saturn's decoupled design allows this to begin while the datapath is busy.
    const size_t next_vl = __riscv_vsetvl_e8m8((size_t)(end_ptr - next_in_ptr));
    const vint8m8_t vacc_next = __riscv_vle8_v_i8m8(next_in_ptr, next_vl);

    // 2. VXS Sequencer: Compute clamp on the current chunk.
    // Chaining occurs between the Load (previous iteration), these ALU ops, and the Store.
    vint8m8_t vres = __riscv_vmax_vx_i8m8(vacc, min_val, vl);
    vres = __riscv_vmin_vx_i8m8(vres, max_val, vl);

    // 3. VSS Sequencer: Store the results of the current chunk.
    __riscv_vse8_v_i8m8(out_ptr, vres, vl);

    // Update trackers for the next iteration.
    // We use standard C assignment (=) for whole vector register copies.
    in_ptr = next_in_ptr;
    out_ptr += vl;
    vl = next_vl;
    vacc = vacc_next;
  }

  // Final Drain: Process the last primed chunk
  // Reductions or scalar writebacks are avoided in the inner loop to prevent stalls.
  vint8m8_t vres = __riscv_vmax_vx_i8m8(vacc, min_val, vl);
  vres = __riscv_vmin_vx_i8m8(vres, max_val, vl);
  __riscv_vse8_v_i8m8(out_ptr, vres, vl);
}
