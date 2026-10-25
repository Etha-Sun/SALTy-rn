#ifndef X32_TRANSPOSE_STRIDED_STORE_H
#define X32_TRANSPOSE_STRIDED_STORE_H
#ifndef QCP_NATIVE
#include "rvv_specs.h"
#ifndef X32_BODY_STRIDED_STORE
void xt_store_strided(uint32_t*p,size_t stride,const vuint32m8_t*v,size_t vl)
/*@ With (W:list Z) (O:XTOutput) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require xt_stride_valid(W,p,stride,vl) && xt_stride_distinct(p,stride,vl) && xt_output(W,O) * store(&(v->s0),unsigned int,a0) * store(&(v->s1),unsigned int,a1) * store(&(v->s2),unsigned int,a2) * store(&(v->s3),unsigned int,a3) * store(&(v->s4),unsigned int,a4) * store(&(v->s5),unsigned int,a5) * store(&(v->s6),unsigned int,a6) * store(&(v->s7),unsigned int,a7) * store(&(v->s8),unsigned int,a8) * store(&(v->s9),unsigned int,a9) * store(&(v->s10),unsigned int,a10) * store(&(v->s11),unsigned int,a11) * store(&(v->s12),unsigned int,a12) * store(&(v->s13),unsigned int,a13) * store(&(v->s14),unsigned int,a14) * store(&(v->s15),unsigned int,a15) * store(&(v->s16),unsigned int,a16) * store(&(v->s17),unsigned int,a17) * store(&(v->s18),unsigned int,a18) * store(&(v->s19),unsigned int,a19) * store(&(v->s20),unsigned int,a20) * store(&(v->s21),unsigned int,a21) * store(&(v->s22),unsigned int,a22) * store(&(v->s23),unsigned int,a23) * store(&(v->s24),unsigned int,a24) * store(&(v->s25),unsigned int,a25) * store(&(v->s26),unsigned int,a26) * store(&(v->s27),unsigned int,a27) * store(&(v->s28),unsigned int,a28) * store(&(v->s29),unsigned int,a29) * store(&(v->s30),unsigned int,a30) * store(&(v->s31),unsigned int,a31)
 Ensure xt_output(W,xt_strided_write(O,p,stride,vl,xt_vec32(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31))) * store(&(v->s0),unsigned int,a0) * store(&(v->s1),unsigned int,a1) * store(&(v->s2),unsigned int,a2) * store(&(v->s3),unsigned int,a3) * store(&(v->s4),unsigned int,a4) * store(&(v->s5),unsigned int,a5) * store(&(v->s6),unsigned int,a6) * store(&(v->s7),unsigned int,a7) * store(&(v->s8),unsigned int,a8) * store(&(v->s9),unsigned int,a9) * store(&(v->s10),unsigned int,a10) * store(&(v->s11),unsigned int,a11) * store(&(v->s12),unsigned int,a12) * store(&(v->s13),unsigned int,a13) * store(&(v->s14),unsigned int,a14) * store(&(v->s15),unsigned int,a15) * store(&(v->s16),unsigned int,a16) * store(&(v->s17),unsigned int,a17) * store(&(v->s18),unsigned int,a18) * store(&(v->s19),unsigned int,a19) * store(&(v->s20),unsigned int,a20) * store(&(v->s21),unsigned int,a21) * store(&(v->s22),unsigned int,a22) * store(&(v->s23),unsigned int,a23) * store(&(v->s24),unsigned int,a24) * store(&(v->s25),unsigned int,a25) * store(&(v->s26),unsigned int,a26) * store(&(v->s27),unsigned int,a27) * store(&(v->s28),unsigned int,a28) * store(&(v->s29),unsigned int,a29) * store(&(v->s30),unsigned int,a30) * store(&(v->s31),unsigned int,a31) */;
#endif

#else
#include <stddef.h>
#include <stdint.h>
void xt_store_strided(uint32_t*p,size_t stride,const vuint32m8_t*v,size_t vl);
#endif
#endif
