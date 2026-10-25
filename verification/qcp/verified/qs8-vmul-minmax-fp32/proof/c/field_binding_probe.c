#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vmul-minmax-fp32/shim/intrinsics_neon.h"
#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vmul-minmax-fp32/shim/store.h"
void qm_numeric_probe(const int8_t *pa,const int8_t *pb,int8_t *out)
/*@ With (M:RDMap)
 Require rd_window(M,pa,8) && rd_window(M,pb,8) && rd_mem(M) * undef_data_at(out+0,char) * undef_data_at(out+1,char) * undef_data_at(out+2,char) * undef_data_at(out+3,char) * undef_data_at(out+4,char) * undef_data_at(out+5,char) * undef_data_at(out+6,char) * undef_data_at(out+7,char)
 Ensure rd_mem(M) * store(out+0,char,qm_sat8(rd_get(M,pa+0)-rd_get(M,pb+0))) * store(out+1,char,qm_sat8(rd_get(M,pa+1)-rd_get(M,pb+1))) * store(out+2,char,qm_sat8(rd_get(M,pa+2)-rd_get(M,pb+2))) * store(out+3,char,qm_sat8(rd_get(M,pa+3)-rd_get(M,pb+3))) * store(out+4,char,qm_sat8(rd_get(M,pa+4)-rd_get(M,pb+4))) * store(out+5,char,qm_sat8(rd_get(M,pa+5)-rd_get(M,pb+5))) * store(out+6,char,qm_sat8(rd_get(M,pa+6)-rd_get(M,pb+6))) * store(out+7,char,qm_sat8(rd_get(M,pa+7)-rd_get(M,pb+7))) */
{
int8x8_t a=vld1_s8(pa) /*@ where M=M */;
int8x8_t b=vld1_s8(pb) /*@ where M=M */;
int16x8_t r=vsubl_s8(a,b) /*@ where a=&a,b=&b,a0=rd_get(M,pa+0),a1=rd_get(M,pa+1),a2=rd_get(M,pa+2),a3=rd_get(M,pa+3),a4=rd_get(M,pa+4),a5=rd_get(M,pa+5),a6=rd_get(M,pa+6),a7=rd_get(M,pa+7),b0=rd_get(M,pb+0),b1=rd_get(M,pb+1),b2=rd_get(M,pb+2),b3=rd_get(M,pb+3),b4=rd_get(M,pb+4),b5=rd_get(M,pb+5),b6=rd_get(M,pb+6),b7=rd_get(M,pb+7) */;
int8x8_t o=vqmovn_s16(r) /*@ where a=&r,a0=rd_get(M,pa+0)-rd_get(M,pb+0),a1=rd_get(M,pa+1)-rd_get(M,pb+1),a2=rd_get(M,pa+2)-rd_get(M,pb+2),a3=rd_get(M,pa+3)-rd_get(M,pb+3),a4=rd_get(M,pa+4)-rd_get(M,pb+4),a5=rd_get(M,pa+5)-rd_get(M,pb+5),a6=rd_get(M,pa+6)-rd_get(M,pb+6),a7=rd_get(M,pa+7)-rd_get(M,pb+7) */;
qm_store8(out,&o) /*@ where x0=o.s0,x1=o.s1,x2=o.s2,x3=o.s3,x4=o.s4,x5=o.s5,x6=o.s6,x7=o.s7 */;
}
