#ifndef DWCHW_READ_API_H
#define DWCHW_READ_API_H
#ifdef DWCHW_FORMAL
#include "memory_rules.h"
#else
#include <stddef.h>
#endif
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
#endif
