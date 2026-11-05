#include <riscv_vector.h>
#include <assert.h>
#include <stdint.h>
#include <stddef.h>

// Assuming the existence of the params struct from the environment
struct xnn_u8_minmax_params {
  struct {
    uint8_t min;
    uint8_t max;
  } scalar;
};

/**
 * Optimized u8_minmax kernel for Saturn RVV Microarchitecture.
 * 
 * Strategy: Use the `__restrict__` qualifier on input and output pointers.
 * 
 * Reasoning for Saturn:
 * 1. Memory Disambiguation: Saturn features a Decoupled Access-Execute (DAE) design. 
 *    By using `__restrict__`, we inform the compiler and the hardware that the 
 *    input and output memory regions are non-overlapping. This allows the Vector 
 *    Load-Store Unit (VLSU) to perform more aggressive scheduling. Specifically, 
 *    the Load (VLS) sequencer can issue loads for the next iteration (prefetching) 
 *    without being stalled by potential alias checks against the Store (VSS) 
 *    sequencer's pending operations.
 * 2. Instruction Interleaving: The code maintains a structure that interleaves 
 *    Load (VLS), Execute (VXS), and Store (VSS) instructions. This maximizes 
 *    concurrency across Saturn's independent sequencers.
 * 3. LMUL=8: Using the maximum LMUL increases the "chime length," which hides 
 *    functional unit latencies (like the 4-stage FMA/Arithmetic pipeline) and 
 *    reduces the overhead of scalar loop bookkeeping.
 */
void test_rvv(
    size_t batch,
    const uint8_t* __restrict__ input,
    uint8_t* __restrict__ output,
    const struct xnn_u8_minmax_params* params)
{
  assert(batch != 0);
  assert(batch % sizeof(uint8_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const uint8_t voutput_min = (uint8_t) params->scalar.min;
  const uint8_t voutput_max = (uint8_t) params->scalar.max;

  const uint8_t* in_ptr = input;
  uint8_t* out_ptr = output;

  // Initialize first chunk
  // LMUL=8 is used to maximize chime length (cycles per instruction)
  size_t vl = __riscv_vsetvl_e8m8(batch);
  vuint8m8_t vdata = __riscv_vle8_v_u8m8(in_ptr, vl);
  
  // Advance scalar pointer for the next load
  in_ptr += vl;
  batch -= vl;

  while (batch > 0) {
    // Determine length for the next iteration's load
    size_t next_vl = __riscv_vsetvl_e8m8(batch);
    
    // Prefetch: Start loading next chunk into a different register group.
    // The __restrict__ qualifier ensures the VLS sequencer knows this load 
    // does not depend on current stores in the VSS sequencer.
    vuint8m8_t vnext = __riscv_vle8_v_u8m8(in_ptr, next_vl);

    // Compute current chunk (VXS sequencer)
    // Saturn chains: VLS (load) -> VXS (arithmetic)
    vuint8m8_t vacc = __riscv_vmaxu_vx_u8m8(vdata, voutput_min, vl);
    vacc = __riscv_vminu_vx_u8m8(vacc, voutput_max, vl);
    
    // Store current chunk (VSS sequencer)
    // Saturn chains: VXS (arithmetic) -> VSS (store)
    __riscv_vse8_v_u8m8(out_ptr, vacc, vl);

    // Prepare for next iteration
    // Use C assignment for whole-register transfer as per RVV guidelines
    vdata = vnext;
    out_ptr += vl;
    in_ptr += next_vl;
    vl = next_vl;
    batch -= next_vl;
  }

  // Final chunk "drain" processing
  // Since the loop prefetches, we process the last loaded chunk here.
  vuint8m8_t vacc_final = __riscv_vmaxu_vx_u8m8(vdata, voutput_min, vl);
  vacc_final = __riscv_vminu_vx_u8m8(vacc_final, voutput_max, vl);
  __riscv_vse8_v_u8m8(out_ptr, vacc_final, vl);
}
