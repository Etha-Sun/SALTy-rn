/* Compile the original NEON example using neon2rvv's RVV implementations. */
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include "neon2rvv.h"

#define XNN_OOB_READS

struct salt_s8_vmax_params {
  struct {
    int8_t threshold;
  } scalar;
};

#include "neon.c"
