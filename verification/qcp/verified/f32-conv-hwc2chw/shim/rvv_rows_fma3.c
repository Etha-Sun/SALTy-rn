#include "rvv_rows_fma3.h"
vfloat32m1_t hc_rvv_rows_fma3(const vfloat32m1_t *pa,const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int dx,unsigned int ci,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) (A:Recordvfloat32m1_t) Require 0<width && 0<=x && x<(width+1)/2 && 0<=dx && dx<3 && 0<=ci && ci<3 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_rows_group(R,A,F,p0,p1,p2,w,width,x,dx,ci,lane,vl) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(&__return,R)) */
{
 vfloat32m1_t a=*pa;
 vfloat32m1_t z=__riscv_vfmv_v_f_f32m1(0.0f,vl);
 vuint32m1_t id=__riscv_vid_v_u32m1(vl);
 unsigned int start=(dx==0 && x==0)?1u:0u;
 unsigned int end=(unsigned int)vl;
 if(dx==2 && (width&1u)!=0 && (width+1)/2-x==vl)end-=1u;
 vbool32_t ge=__riscv_vmsgeu_vx_u32m1_b32(id,start,vl);
 vbool32_t lt=__riscv_vmsltu_vx_u32m1_b32(id,end,vl);
 vbool32_t m=__riscv_vmand_mm_b32(ge,lt,vl);
 uintptr_t off=x*24u+(dx*3u+ci)*4u;
 {
  vfloat32m1_t ld=__riscv_vlse32_v_f32m1_m(m,(const float*)((uintptr_t)p0-12u+off),24,vl) /*@ where F=F */;
  vfloat32m1_t v=__riscv_vmerge_vvm_f32m1(z,ld,m,vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+0u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=__riscv_vfmacc_vf_f32m1_mu(m,a,wk,v,vl);
  else a=__riscv_vfmacc_vf_f32m1(a,wk,v,vl);
 }
 {
  vfloat32m1_t ld=__riscv_vlse32_v_f32m1_m(m,(const float*)((uintptr_t)p1-12u+off),24,vl) /*@ where F=F */;
  vfloat32m1_t v=__riscv_vmerge_vvm_f32m1(z,ld,m,vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+1u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=__riscv_vfmacc_vf_f32m1_mu(m,a,wk,v,vl);
  else a=__riscv_vfmacc_vf_f32m1(a,wk,v,vl);
 }
 {
  vfloat32m1_t ld=__riscv_vlse32_v_f32m1_m(m,(const float*)((uintptr_t)p2-12u+off),24,vl) /*@ where F=F */;
  vfloat32m1_t v=__riscv_vmerge_vvm_f32m1(z,ld,m,vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+2u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=__riscv_vfmacc_vf_f32m1_mu(m,a,wk,v,vl);
  else a=__riscv_vfmacc_vf_f32m1(a,wk,v,vl);
 }
 return a;
}
