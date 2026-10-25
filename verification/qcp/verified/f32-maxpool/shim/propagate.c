#include "propagate.h"

/* The ordinary adapter preserves the original four NaN priority stages.
   The local UInt32 buffers are initialized by C; only active lanes are
   stored/loaded by RVV, whose inactive register lanes remain unobserved. */
uint32_t mp_restore_lane(uint32_t a,uint32_t b,uint32_t numeric)

{
 uint32_t r=numeric;
 if ((b & 0x7FFFFFFFu)>0x7F800000u) r=b | 0x00400000u;
 if ((a & 0x7FFFFFFFu)>0x7F800000u) r=a | 0x00400000u;
 if (((b & 0x7FFFFFFFu)>0x7F800000u) && ((b & 0x00400000u)==0)) r=b | 0x00400000u;
 if (((a & 0x7FFFFFFFu)>0x7F800000u) && ((a & 0x00400000u)==0)) r=a | 0x00400000u;
 return r;
}
uint32_t mp_array_read(const uint32_t*p,size_t i)

{
 
 uint32_t value=p[i];
 
 return value;
}
void mp_array_write(uint32_t*p,size_t i,uint32_t value)

{
 
 p[i]=value;
 
}
vfloat32m8_t mp_propagate_nan(vfloat32m8_t a,vfloat32m8_t b,vfloat32m8_t numeric,size_t vl)

{
 uint32_t a_bits[32]={0};uint32_t b_bits[32]={0};uint32_t r_bits[32]={0};
 {vuint32m8_t ua=__riscv_vreinterpret_v_f32m8_u32m8(a);__riscv_vse32_v_u32m8(a_bits,ua,vl) ;}
 {vuint32m8_t ub=__riscv_vreinterpret_v_f32m8_u32m8(b);__riscv_vse32_v_u32m8(b_bits,ub,vl) ;}
 {vuint32m8_t un=__riscv_vreinterpret_v_f32m8_u32m8(numeric);__riscv_vse32_v_u32m8(r_bits,un,vl) ;}
 size_t i=0;
 
 while(i<vl){uint32_t av=mp_array_read(a_bits,i) ;uint32_t bv=mp_array_read(b_bits,i) ;uint32_t nv=mp_array_read(r_bits,i) ;uint32_t rv=mp_restore_lane(av,bv,nv);mp_array_write(r_bits,i,rv) ;i+=1;}
 vuint32m8_t result=__riscv_vle32_v_u32m8(r_bits,vl) ;
 return __riscv_vreinterpret_v_u32m8_f32m8(result);
}

vfloat32m8_t mp_max_vv(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vfloat32m8_t numeric=__riscv_vfmax_vv_f32m8(a,b,vl);
  return mp_propagate_nan(a,b,numeric,vl);
}
vfloat32m8_t mp_min_vv(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vfloat32m8_t numeric=__riscv_vfmin_vv_f32m8(a,b,vl);
  return mp_propagate_nan(a,b,numeric,vl);
}
vfloat32m8_t mp_max_vf(vfloat32m8_t a,float b,size_t vl) {
  vfloat32m8_t vb=__riscv_vfmv_v_f_f32m8(b,vl);
  return mp_max_vv(a,vb,vl);
}
vfloat32m8_t mp_min_vf(vfloat32m8_t a,float b,size_t vl) {
  vfloat32m8_t vb=__riscv_vfmv_v_f_f32m8(b,vl);
  return mp_min_vv(a,vb,vl);
}
