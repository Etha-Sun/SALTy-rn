#include "rvv_update_into.h"
void ap_rvv_update_into32(vfloat32m8_t*pa,vuint32m8_t*pi,const vfloat32m8_t*pb,uint32_t index,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (I:Recordvuint32m8_t) (B:Recordvfloat32m8_t)
 Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(pa,A)*StructPredvuint32m8_t(pi,I)*StructPredvfloat32m8_t(pb,B)
 Ensure exists(R:Recordvfloat32m8_t)(J:Recordvuint32m8_t),ap_rvv_update32(R,J,A,I,B,index,vl) && StructPredvfloat32m8_t(pa,R)*StructPredvuint32m8_t(pi,J)*StructPredvfloat32m8_t(pb,B) */
{
 vfloat32m8_t a=*pa;
 vuint32m8_t i=*pi;
 vfloat32m8_t b=*pb;
 vbool4_t m=__riscv_vmfgt_vv_f32m8_b4(b,a,vl) /*@ where a=0,b=0 */;
 *pa=__riscv_vmerge_vvm_f32m8(a,b,m,vl) /*@ where a=0,b=0,m=0 */;
 *pi=__riscv_vmerge_vxm_u32m8(i,index,m,vl) /*@ where a=0,m=0 */;
}
