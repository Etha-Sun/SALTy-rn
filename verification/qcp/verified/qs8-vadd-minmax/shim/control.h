#ifndef QCV_CONTROL_H
#define QCV_CONTROL_H
#include "types_def.h"
void qcp_qa_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
#define assert(x) qcp_qa_assert((x))
#endif
