#include "../contracts/model.h"
/*@ Import Coq Require Import Qd8API.ApiModel Qd8API.Layouts */
/*@ Extern Coq
 (qd8_zget:Z -> list Z -> Z) (qd8_fget:Z -> list fp32 -> fp32)
 (qd8_wrap_signed:Z -> Z) (qd8_mac_signed:Z -> Z -> Z -> Z)
 (qd8_ks:Z -> Z -> list panel_data -> Z)
 (qd8_float_field:Z -> Z -> Z -> list panel_data -> fp32)
 (qd8_char_field:Z -> Z -> Z -> Z -> list Z -> list panel_data -> Z)
 (qd8_i8_address_ok:Z -> Z -> Z -> Z -> Z -> Z -> Z -> list panel_data -> Prop)
 (qd8_matrix_wf:Z -> list panel_data -> Prop)
 (qd8_i16_lane:Z -> Z -> Z -> Z -> Z -> Z)
 (qd8_f32_lane:Z -> fp32 -> fp32 -> fp32)
 (qd8_active_z:Z -> Z -> Z -> Z -> Prop)
 (qd8_active_f:Z -> Z -> fp32 -> fp32 -> Prop)
 (qd8_nan_flag:fp32 -> Z) (qd8_merge_value:fp32 -> fp32 -> Z -> fp32)
 (qd8_acc_signed:Z -> Z -> Z -> Z -> Z -> list Z -> list panel_data -> Z)
 (qd8_unclamped:Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32)
 (qd8_final_lane:Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> fp32)
 (completed_values:Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> list fp32)
 (qd8_write_state:Z -> Z -> Z -> list fp32 -> Assertion)
 (qd8_fappend:list fp32 -> list fp32 -> list fp32)
 (qd8_output_prefix:Z -> Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> Assertion) */
/*@ Extern Coq (fp32_of_Z:Z -> fp32) (canonical_qnan:fp32)
 (weights:panel_data -> list Z) (panel_at:list panel_data -> Z -> panel_data) */
/*@ include strategies "copy.strategies" */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredfloat32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredfloat32x2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8mf2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m1_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvfloat32m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvbool16_t:Z -> Assertion) */
int32x4_t vld1q_dup_s32(const int *p)
/*@ With (x:Z)
 Require store(p,int,x)
 Ensure store(p,int,x) * store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */
{
 int32x4_t r;
 r.s0=*p;
 r.s1=*p;
 r.s2=*p;
 r.s3=*p;
 return r;
}
float32x4_t vld1q_dup_f32(const float *p)
/*@ With (x:fp32)
 Require store(p,float,x)
 Ensure store(p,float,x) * store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */
{
 float32x4_t r;
 r.s0=*p;
 r.s1=*p;
 r.s2=*p;
 r.s3=*p;
 return r;
}
float32x4_t vdupq_n_f32(float x)
/*@ Require emp
 Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */
{
 float32x4_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 return r;
}
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) */
{
 int16x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x4) * store(&(__return.s1),short,x5) * store(&(__return.s2),short,x6) * store(&(__return.s3),short,x7) */
{
 int16x4_t r;
 r.s0=a.s4;
 r.s1=a.s5;
 r.s2=a.s6;
 r.s3=a.s7;
 return r;
}
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */
{
 float32x2_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 return r;
}
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */
{
 float32x2_t r;
 r.s0=a.s2;
 r.s1=a.s3;
 return r;
}
int16x8_t vmovl_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) * store(&(__return.s4),short,x4) * store(&(__return.s5),short,x5) * store(&(__return.s6),short,x6) * store(&(__return.s7),short,x7) */
{
 int16x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 return r;
}
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),float,fp32_of_Z(x0)) * store(&(__return.s1),float,fp32_of_Z(x1)) * store(&(__return.s2),float,fp32_of_Z(x2)) * store(&(__return.s3),float,fp32_of_Z(x3)) */
{
 float32x4_t r;
 r.s0=(float)a.s0;
 r.s1=(float)a.s1;
 r.s2=(float)a.s2;
 r.s3=(float)a.s3;
 return r;
}
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_mul(x0,y0)) * store(&(__return.s1),float,fp32_mul(x1,y1)) * store(&(__return.s2),float,fp32_mul(x2,y2)) * store(&(__return.s3),float,fp32_mul(x3,y3)) */
{
 float32x4_t r;
 r.s0=a.s0*b.s0;
 r.s1=a.s1*b.s1;
 r.s2=a.s2*b.s2;
 r.s3=a.s3*b.s3;
 return r;
}
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */
{ return; }
void xnn_prefetch_to_l1(const void *p)
/*@ Require 0<=p && p<=18446744073709551615 && emp Ensure emp */
{ return; }
