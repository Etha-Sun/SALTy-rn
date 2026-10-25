#include "formal_model.h"
/* Arithmetic cut helper, independently body checked. The kernels retain
   their own inline guarded loop count, checked again in the whole units. */
size_t mp_count_after_group(size_t k)
/*@ Require emp Ensure __return==mp_remaining(k) && emp */
{
  if(k>9) return k-9;
  return 0;
}
