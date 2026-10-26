#ifndef ARGMAXPOOL_KERNEL_CONTROL_H
#define ARGMAXPOOL_KERNEL_CONTROL_H
#include "formal_model.h"
void ap_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
#define assert(x) ap_assert((x))
#define XNN_OOB_READS
#define NULL ((void*)0)
#endif
