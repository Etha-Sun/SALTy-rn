#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vmul-minmax-fp32/shim/store.h"
void qm_store_probe(int8_t *out,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require undef_data_at(out+0,char) * undef_data_at(out+1,char) * undef_data_at(out+2,char) * undef_data_at(out+3,char) * undef_data_at(out+4,char) * undef_data_at(out+5,char) * undef_data_at(out+6,char) * undef_data_at(out+7,char) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure store(out+0,char,x0) * store(out+1,char,x1) * store(out+2,char,x2) * store(out+3,char,x3) * store(out+4,char,x4) * store(out+5,char,x5) * store(out+6,char,x6) * store(out+7,char,x7) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */
{ qm_store8(out,v) /*@ where x0=x0,x1=x1,x2=x2,x3=x3,x4=x4,x5=x5,x6=x6,x7=x7 */; }
