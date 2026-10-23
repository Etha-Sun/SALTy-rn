#ifndef QCP_S8_CONTROL_H
#define QCP_S8_CONTROL_H
#include "types_def.h"
/* Assertions are checked call preconditions; every actual call must prove ok.
 * The actual no-op body is valid on that true-assertion domain. */
void qcp_s8_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
#define assert(x) qcp_s8_assert((x))
#endif
