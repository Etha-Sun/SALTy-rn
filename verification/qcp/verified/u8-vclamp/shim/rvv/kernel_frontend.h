#include "packed.h"
#define NULL 0
void qcp_assert(int c) /*@ Require emp Ensure c!=0 */ { /*@ Inv c==c@pre */ while(c==0){} }
#define assert(x) qcp_assert(!!(x))
struct xnn_u8_minmax_params {struct {uint32_t min;uint32_t max;} scalar;};
