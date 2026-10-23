#include "types_def.h"

int8x8_t qcp_s8_ext2(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x2) * store(&(__return.s1),char,x3) * store(&(__return.s2),char,x4) * store(&(__return.s3),char,x5) * store(&(__return.s4),char,x6) * store(&(__return.s5),char,x7) * store(&(__return.s6),char,x0) * store(&(__return.s7),char,x1) */
{
  int8x8_t r;
  r.s0=a->s2;
  r.s1=a->s3;
  r.s2=a->s4;
  r.s3=a->s5;
  r.s4=a->s6;
  r.s5=a->s7;
  r.s6=b->s0;
  r.s7=b->s1;
  return r;
}

int8x8_t qcp_s8_ext4(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x4) * store(&(__return.s1),char,x5) * store(&(__return.s2),char,x6) * store(&(__return.s3),char,x7) * store(&(__return.s4),char,x0) * store(&(__return.s5),char,x1) * store(&(__return.s6),char,x2) * store(&(__return.s7),char,x3) */
{
  int8x8_t r;
  r.s0=a->s4;
  r.s1=a->s5;
  r.s2=a->s6;
  r.s3=a->s7;
  r.s4=b->s0;
  r.s5=b->s1;
  r.s6=b->s2;
  r.s7=b->s3;
  return r;
}
