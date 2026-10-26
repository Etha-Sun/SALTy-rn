#ifndef HWC_READ_API_H
#define HWC_READ_API_H
#ifdef HWC_FORMAL
#include "maps_model.h"
/*@ include strategies "hc_maps.strategies" */
#endif
float hc_read_scalar(const float *p)
/*@ With (F:HwcROMap) Require hc_present(F,p) && hc_data(F)
 Ensure hc_same_bits(__return,hc_get(F,p)) && hc_data(F) */;
#endif
