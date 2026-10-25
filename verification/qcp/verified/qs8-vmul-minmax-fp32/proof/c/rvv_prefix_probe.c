#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vmul-minmax-fp32/shim/intrinsics_rvv.h"
#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vmul-minmax-fp32/shim/active_model.h"
int qm_rvv_prefix_probe(const int8_t *p,size_t vl)
/*@ With (M:RDMap)
 Require 0<vl && vl<=32 && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_get(M,p) && rd_mem(M) */
{
 vint8m2_t a=__riscv_vle8_v_i8m2(p,vl) /*@ where M=M */;
 vint16m4_t b=__riscv_vsext_vf2_i16m4(a,vl) /*@ where a=&a,A=qm_read(M,p) */;
 return b.s0;
}
