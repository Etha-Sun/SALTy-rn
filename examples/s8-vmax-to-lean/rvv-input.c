/* Compile the original dynamic-vl RVV example with the real intrinsic API. */
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>

#define XNN_OOB_READS

struct salt_s8_vmax_params {
  struct {
    int8_t threshold;
  } scalar;
};

#include "rvv.c"
