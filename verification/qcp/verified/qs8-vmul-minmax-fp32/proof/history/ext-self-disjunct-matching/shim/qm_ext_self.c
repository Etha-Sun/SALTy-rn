#include "adapters.h"
int8x8_t qm_ext_self(const int8x8_t *a,int k)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require (k==2 || k==4) && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,0)) * store(&(__return.s1),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,1)) * store(&(__return.s2),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,2)) * store(&(__return.s3),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,3)) * store(&(__return.s4),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,4)) * store(&(__return.s5),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,5)) * store(&(__return.s6),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,6)) * store(&(__return.s7),char,qm_ext8(x0,x1,x2,x3,x4,x5,x6,x7,k,7)) */
{
int8x8_t r;
if(k==4){
r.s0=a->s4;
r.s1=a->s5;
r.s2=a->s6;
r.s3=a->s7;
r.s4=a->s0;
r.s5=a->s1;
r.s6=a->s2;
r.s7=a->s3;
}else{
r.s0=a->s2;
r.s1=a->s3;
r.s2=a->s4;
r.s3=a->s5;
r.s4=a->s6;
r.s5=a->s7;
r.s6=a->s0;
r.s7=a->s1;
}
return r;
}
