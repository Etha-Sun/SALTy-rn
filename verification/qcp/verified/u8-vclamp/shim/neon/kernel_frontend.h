#include "full_neon_shim.c"
typedef unsigned long long size_t;
typedef unsigned int uint32_t;
#define NULL 0
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
void qcp_assert(int c) /*@ Require emp Ensure c!=0 */ { /*@ Inv c==c@pre */ while(c==0) { } }
#define assert(x) qcp_assert(!!(x))
struct xnn_u8_minmax_params {struct {uint32_t min;uint32_t max;} scalar;};
/*
struct xnn_u8_minmax_params {
  struct {
    uint32_t min;
    uint32_t max;
  } scalar;
};
*/

