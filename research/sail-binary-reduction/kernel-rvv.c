/* Wrapper only: use the same compilation flags as the previous experiment. */
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>
#define XNN_OOB_READS
struct xnn_qs8_rsum_params;
#include "../../kernels/target/qu8-rsum.c"
