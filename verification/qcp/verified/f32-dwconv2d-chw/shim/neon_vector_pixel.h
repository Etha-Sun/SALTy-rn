#ifndef DWCHW_NEON_VECTOR_PIXEL_H
#define DWCHW_NEON_VECTOR_PIXEL_H
#ifdef DWCHW_FORMAL
#include "neon_frontend.h"
#include "read_api.h"
/*@ Import Coq Require Import DwChw.NeonVectorPixelModel */
/*@ Extern Coq (dw_neon_vector_pixel:DwROMap->Z->(Z->fp32)->(Z->fp32)->(Z->fp32)->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->fp32) (dw_neon_vector_match4:fp32->fp32->fp32->fp32->(Z->fp32)->Prop) */
#else
#ifndef DWCHW_NATIVE_ISA_ARRAYS_H
#include <arm_neon.h>
#endif
float dw_read_scalar(const float*);
#endif
#ifndef DWCHW_NEON_VECTOR_PIXEL_BODY
float32x4_t dw_neon_pixel_compute(const float32x4_t*p0,const float32x4_t*p1,const float32x4_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi)
/*@ With(F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) Require dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32),dw_neon_vector_match4(r0,r1,r2,r3,dw_neon_vector_pixel(F,weights,dw_fp4(a00,a01,a02,a03),dw_fp4(a10,a11,a12,a13),dw_fp4(a20,a21,a22,a23),prev0,prev1,prev2,next0,next1,next2,lo,hi)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */;
#endif
#endif
