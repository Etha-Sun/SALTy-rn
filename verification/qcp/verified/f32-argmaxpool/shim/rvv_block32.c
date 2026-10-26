#include "rvv_block32.h"
void ap_rvv_block32(const float*p0,const float*p1,const float*p2,const float*p3,const float*p4,const float*p5,const float*p6,const float*p7,const float*p8,const float*ab,const uint32_t*ib,float*output,uint32_t*index,uint32_t idx,size_t vl)
/*@ With(F:APMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
 Require 0<vl && vl<=32 && ap_window(F,p0,vl) && ap_window(F,p1,vl) && ap_window(F,p2,vl) && ap_window(F,p3,vl) && ap_window(F,p4,vl) && ap_window(F,p5,vl) && ap_window(F,p6,vl) && ap_window(F,p7,vl) && ap_window(F,p8,vl) &&
 ap_write_window(W,output,vl) && ap_write_window(WI,index,vl) && ap_block32_previous(ab,ib) &&
 ap_optional_output_readable(O,ab,vl) && ap_optional_index_readable(I,ib,vl) &&
 ap_optional_write_window(W,ab,vl) && ap_optional_write_window(WI,ib,vl) &&
 ap_data(F)*ap_output(W,O)*ap_index(WI,I)
 Ensure exists(O2:APOutput)(I2:APIndex),ap_block32_written(F,O,I,ab,ib,p0,p1,p2,p3,p4,p5,p6,p7,p8,idx,vl,output,index,O2,I2) && ap_block32_frames(O,I,O2,I2,vl,output,index) &&
 ap_data(F)*ap_output(W,O2)*ap_index(WI,I2) */
{
vfloat32m8_t a;vuint32m8_t i;
 if(ab){
  a=__riscv_vle32_v_f32m8(ab,vl) /*@ where (output_map) W=W,O=O */;
  i=__riscv_vle32_v_u32m8(ib,vl) /*@ where (output_map) W=WI,O=I */;
  vfloat32m8_t b=__riscv_vle32_v_f32m8(p0,vl) /*@ where (readonly_map) F=F */;
  ap_rvv_update_into32(&a,&i,&b,idx,vl);
 }else{
  a=__riscv_vle32_v_f32m8(p0,vl) /*@ where (readonly_map) F=F */;
  i=__riscv_vmv_v_x_u32m8(idx,vl);
 }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p1,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+1,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p2,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+2,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p3,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+3,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p4,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+4,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p5,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+5,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p6,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+6,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p7,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+7,vl); }
 { vfloat32m8_t b=__riscv_vle32_v_f32m8(p8,vl) /*@ where (readonly_map) F=F */;
 ap_rvv_update_into32(&a,&i,&b,idx+8,vl); }
 __riscv_vse32_v_f32m8(output,a,vl) /*@ where W=W,O=O */;
 __riscv_vse32_v_u32m8(index,i,vl) /*@ where W=WI,O=I */;
}
