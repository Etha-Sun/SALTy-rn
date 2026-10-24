#ifndef QCV_CONTROL_H
#define QCV_CONTROL_H
#include "types_def.h"
void qcp_qu_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
#define assert(x) qcp_qu_assert((x))
#endif
