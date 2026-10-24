#ifndef QCV_NEON_EXT_H
#define QCV_NEON_EXT_H
#include "types_def.h"
uint8x8_t qcp_u8_ext2(const uint8x8_t *a,const uint8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
    Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(__return.s0),unsigned char,x2) * store(&(__return.s1),unsigned char,x3) * store(&(__return.s2),unsigned char,x4) * store(&(__return.s3),unsigned char,x5) * store(&(__return.s4),unsigned char,x6) * store(&(__return.s5),unsigned char,x7) * store(&(__return.s6),unsigned char,x0) * store(&(__return.s7),unsigned char,x1) */;
uint8x8_t qcp_u8_ext4(const uint8x8_t *a,const uint8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
    Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(__return.s0),unsigned char,x4) * store(&(__return.s1),unsigned char,x5) * store(&(__return.s2),unsigned char,x6) * store(&(__return.s3),unsigned char,x7) * store(&(__return.s4),unsigned char,x0) * store(&(__return.s5),unsigned char,x1) * store(&(__return.s6),unsigned char,x2) * store(&(__return.s7),unsigned char,x3) */;
#define vext_u8(a,b,n) qcp_u8_ext##n(&(a),&(b))
#endif
