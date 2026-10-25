#ifndef QS8MUL_CONTROL_H
#define QS8MUL_CONTROL_H
#include "types_def.h"
void qm_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
#define assert(c) qm_assert(c)
#endif
