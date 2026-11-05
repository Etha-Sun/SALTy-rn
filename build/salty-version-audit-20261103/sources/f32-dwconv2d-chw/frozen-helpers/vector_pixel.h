#ifndef DWCHW_VECTOR_PIXEL_H
#define DWCHW_VECTOR_PIXEL_H
#ifdef DWCHW_FORMAL
#include "rvv_extended_frontend.h"
#include "read_api.h"
/*@ Import Coq Require Import DwChw.VectorPixelModel */
/*@ Extern Coq (dw_vector_pixel:DwROMap->Z->(Z->fp32)->(Z->fp32)->(Z->fp32)->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->Z->fp32) (dw_vector_match8:Z->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->(Z->fp32)->Prop) */
#else
#include <stddef.h>
#ifndef DWCHW_NATIVE_ISA_ARRAYS_H
#include <riscv_vector.h>
#endif
vfloat32m2_t dw_r_fma(const vfloat32m2_t*,float,const vfloat32m2_t*,size_t);
vfloat32m2_t dw_r_up(const vfloat32m2_t*,float,size_t);
vfloat32m2_t dw_r_down(const vfloat32m2_t*,float,size_t);
vfloat32m2_t dw_chw_propagating_max(vfloat32m2_t,float,size_t);
vfloat32m2_t dw_chw_propagating_min(vfloat32m2_t,float,size_t);
float dw_read_scalar(const float*);
#endif
#ifndef DWCHW_VECTOR_PIXEL_BODY
vfloat32m2_t dw_vector_pixel_compute(const vfloat32m2_t*p0,const vfloat32m2_t*p1,const vfloat32m2_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi,size_t vl)
/*@ With (F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a04:fp32) (a05:fp32) (a06:fp32) (a07:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (a16:fp32) (a17:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) (a24:fp32) (a25:fp32) (a26:fp32) (a27:fp32) Require 0<=vl && vl<=8 && dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p0->s4),float,a04) * store(&(p0->s5),float,a05) * store(&(p0->s6),float,a06) * store(&(p0->s7),float,a07) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p1->s4),float,a14) * store(&(p1->s5),float,a15) * store(&(p1->s6),float,a16) * store(&(p1->s7),float,a17) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(p2->s4),float,a24) * store(&(p2->s5),float,a25) * store(&(p2->s6),float,a26) * store(&(p2->s7),float,a27) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_vector_match8(vl,r0,r1,r2,r3,r4,r5,r6,r7,dw_vector_pixel(F,weights,dw_fp8(a00,a01,a02,a03,a04,a05,a06,a07),dw_fp8(a10,a11,a12,a13,a14,a15,a16,a17),dw_fp8(a20,a21,a22,a23,a24,a25,a26,a27),prev0,prev1,prev2,next0,next1,next2,lo,hi,vl)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p0->s4),float,a04) * store(&(p0->s5),float,a05) * store(&(p0->s6),float,a06) * store(&(p0->s7),float,a07) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p1->s4),float,a14) * store(&(p1->s5),float,a15) * store(&(p1->s6),float,a16) * store(&(p1->s7),float,a17) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(p2->s4),float,a24) * store(&(p2->s5),float,a25) * store(&(p2->s6),float,a26) * store(&(p2->s7),float,a27) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
#endif
#endif
