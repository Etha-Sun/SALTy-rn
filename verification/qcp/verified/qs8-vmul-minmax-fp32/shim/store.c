#include "store.h"
void qm_store8(int8_t *out,const int8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require undef_data_at(out+0,char) * undef_data_at(out+1,char) * undef_data_at(out+2,char) * undef_data_at(out+3,char) * undef_data_at(out+4,char) * undef_data_at(out+5,char) * undef_data_at(out+6,char) * undef_data_at(out+7,char) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure store(out+0,char,x0) * store(out+1,char,x1) * store(out+2,char,x2) * store(out+3,char,x3) * store(out+4,char,x4) * store(out+5,char,x5) * store(out+6,char,x6) * store(out+7,char,x7) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) */
{
out[0]=a->s0;
out[1]=a->s1;
out[2]=a->s2;
out[3]=a->s3;
out[4]=a->s4;
out[5]=a->s5;
out[6]=a->s6;
out[7]=a->s7;
}
