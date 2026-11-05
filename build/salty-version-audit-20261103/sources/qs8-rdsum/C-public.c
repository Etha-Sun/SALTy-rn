#include <riscv_vector.h>
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

void test_rvv(
    size_t rows,
    size_t channels,
    const int8_t* input,
    size_t input_stride,
    const int8_t* zero,
    int32_t* output,
    const struct xnn_qs8_rsum_params* params)
{
  assert(rows != 0);
  assert(channels != 0);
  assert(input != NULL);
  assert(output != NULL);

  while (channels > 0) {
    // Maximize LMUL to hide pipeline latencies on Saturn.
    // We use LMUL=2 for 8-bit, LMUL=4 for 16-bit, and LMUL=8 for 32-bit
    // to keep the same number of elements per vector register group.
    const size_t vl = __riscv_vsetvl_e8m2(channels);
    
    // Main 32-bit accumulator for the current strip of channels.
    vint32m8_t vacc = __riscv_vmv_v_x_i32m8(0, vl);

    const int8_t* i_ptr = input;
    size_t r = rows;
    while (r > 0) {
      // 16-bit intermediate accumulator (LMUL=4) to prevent overflow during row sums.
      // Batch size 240 is chosen as a multiple of the unroll factor 16 and stays 
      // within signed 16-bit limits (max 32767).
      // 240 * 127 = 30480, which is < 32767.
      vint16m4_t vacc16 = __riscv_vmv_v_x_i16m4(0, vl);
      const size_t batch_size = (r < 240) ? r : 240;
      size_t current_batch = batch_size;

      // Unrolled loop: Process 16 rows using a single moving base pointer.
      // This mitigates scalar register pressure compared to maintaining 16 pointers.
      // Interleaving VLS (load) and VXS (widening add) helps maximize chaining.
      while (current_batch >= 16) {
        vint8m2_t vin;
        #define PROCESS_ROW \
          vin = __riscv_vle8_v_i8m2(i_ptr, vl); \
          vacc16 = __riscv_vwadd_wv_i16m4(vacc16, vin, vl); \
          i_ptr += input_stride;

        PROCESS_ROW PROCESS_ROW PROCESS_ROW PROCESS_ROW
        PROCESS_ROW PROCESS_ROW PROCESS_ROW PROCESS_ROW
        PROCESS_ROW PROCESS_ROW PROCESS_ROW PROCESS_ROW
        PROCESS_ROW PROCESS_ROW PROCESS_ROW PROCESS_ROW
        #undef PROCESS_ROW

        current_batch -= 16;
      }

      // Tail logic for the remaining rows in the current batch.
      while (current_batch > 0) {
        vint8m2_t vin = __riscv_vle8_v_i8m2(i_ptr, vl);
        vacc16 = __riscv_vwadd_wv_i16m4(vacc16, vin, vl);
        i_ptr += input_stride;
        current_batch--;
      }

      // Accumulate the 16-bit partial sum into the main 32-bit strip accumulator.
      // Widening addition: vint32m8 = vint32m8 + vint16m4.
      vacc = __riscv_vwadd_wv_i32m8(vacc, vacc16, vl);
      r -= batch_size;
    }

    // Accumulate the row sums into the output buffer (Load-Add-Store).
    // Vector instructions execute post-commit, so scalar address logic
    // overlaps with vector execution.
    vint32m8_t vo = __riscv_vle32_v_i32m8(output, vl);
    vo = __riscv_vadd_vv_i32m8(vo, vacc, vl);
    __riscv_vse32_v_i32m8(output, vo, vl);

    // Advance pointers for the next channel strip.
    channels -= vl;
    input += vl;
    output += vl;
  }
}
