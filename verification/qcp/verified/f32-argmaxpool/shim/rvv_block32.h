#ifndef ARGMAXPOOL_RVV_BLOCK32_H
#define ARGMAXPOOL_RVV_BLOCK32_H
#include "kernel_frontend.h"
#include "rvv_update_into.h"
/*@ Import Coq Require Import ArgmaxPool.APBlock32Model */
/*@ Extern Coq (ap_optional_output_readable:APOutput->Z->Z->Prop)(ap_optional_index_readable:APIndex->Z->Z->Prop)(ap_optional_write_window:list Z->Z->Z->Prop) */
/*@ Extern Coq (ap_block32_previous:Z->Z->Prop)
 (ap_block32_written:APMap->APOutput->APIndex->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->APOutput->APIndex->Prop)
 (ap_block32_frames:APOutput->APIndex->APOutput->APIndex->Z->Z->Z->Prop) */
void ap_rvv_block32(const float*p0,const float*p1,const float*p2,const float*p3,const float*p4,const float*p5,const float*p6,const float*p7,const float*p8,const float*ab,const uint32_t*ib,float*output,uint32_t*index,uint32_t idx,size_t vl)
/*@ With(F:APMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
 Require 0<vl && vl<=32 && ap_window(F,p0,vl) && ap_window(F,p1,vl) && ap_window(F,p2,vl) && ap_window(F,p3,vl) && ap_window(F,p4,vl) && ap_window(F,p5,vl) && ap_window(F,p6,vl) && ap_window(F,p7,vl) && ap_window(F,p8,vl) &&
 ap_write_window(W,output,vl) && ap_write_window(WI,index,vl) && ap_block32_previous(ab,ib) &&
 ap_optional_output_readable(O,ab,vl) && ap_optional_index_readable(I,ib,vl) &&
 ap_optional_write_window(W,ab,vl) && ap_optional_write_window(WI,ib,vl) &&
 ap_data(F)*ap_output(W,O)*ap_index(WI,I)
 Ensure exists(O2:APOutput)(I2:APIndex),ap_block32_written(F,O,I,ab,ib,p0,p1,p2,p3,p4,p5,p6,p7,p8,idx,vl,output,index,O2,I2) && ap_block32_frames(O,I,O2,I2,vl,output,index) &&
 ap_data(F)*ap_output(W,O2)*ap_index(WI,I2) */;
#endif
