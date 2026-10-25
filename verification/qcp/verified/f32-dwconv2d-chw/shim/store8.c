#include "store8.h"
float dw_get8(const vfloat32m2_t *v,size_t k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=k && k<8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7)
 Ensure dw_same(__return,dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7,k)) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) */
{
 if(k==0)return v->s0;
 if(k==1)return v->s1;
 if(k==2)return v->s2;
 if(k==3)return v->s3;
 if(k==4)return v->s4;
 if(k==5)return v->s5;
 if(k==6)return v->s6;
 return v->s7;
}
void dw_store8(float *out,const vfloat32m2_t *v,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::undef_full(out,vl)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::full(out,vl,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl)) */
{
 size_t i=0;
 /*@ Inv Assert out==out@pre && v==v@pre && vl==vl@pre && 0<=i && i<=vl && vl<=8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::full(out@pre,i,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,i)) * FloatArray::undef_seg(out@pre,i,vl) */
 for(;i<vl;i++){
  out[i]=dw_get8(v,i) /*@ where a0=a0,a1=a1,a2=a2,a3=a3,a4=a4,a5=a5,a6=a6,a7=a7 */;
 }
}
