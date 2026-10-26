#include "store_half.h"
void hc_store_low_half(float *p,const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x4_t(pa,A)
 Ensure hc_output(W,hc_store_low2(O,p,A))*StructPredfloat32x4_t(pa,A) */
{
 float32x4_t a=*pa;
 float32x2_t low=vget_low_f32(a);
 vst1_f32(p,low) /*@ where O=O,W=W */;
}
void hc_store_high_half(float *p,const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x4_t(pa,A)
 Ensure hc_output(W,hc_store_high2(O,p,A))*StructPredfloat32x4_t(pa,A) */
{
 float32x4_t a=*pa;
 float32x2_t high=vget_high_f32(a);
 vst1_f32(p,high) /*@ where O=O,W=W */;
}
