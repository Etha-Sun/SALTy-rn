#include "shim.h"
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
/*
struct xnn_f32_default_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/

