typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef uint8_t vbool16_t;
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct float32x2_t {
 float s0;
 float s1;
} float32x2_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x4_t {
 uint32_t s0;
 uint32_t s1;
 uint32_t s2;
 uint32_t s3;
} uint32x4_t;
typedef struct vfloat32m2_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
} vfloat32m2_t;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.VectorModel */
/*@ Extern Coq (dw_fp_match:Z -> Z -> fp32 -> fp32 -> Prop) (dw_fp8:fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Z -> fp32) (dw_mask_bit:Z -> Z -> Z) (dw_ne_value:fp32 -> fp32 -> Z) (dw_mask_matches:Z -> Z -> (Z -> fp32) -> (Z -> fp32) -> Prop) (fp32_max_number:fp32 -> fp32 -> fp32) (fp32_min_number:fp32 -> fp32 -> fp32) (dw_rvv_merge:fp32 -> fp32 -> Z -> fp32) (dw_repaired_max:fp32 -> fp32 -> fp32) (dw_repaired_min:fp32 -> fp32 -> fp32) (dw_vl_allowed:Z -> Z -> Prop) */
/*@ Import Coq Require Import DwChw.Store8Model */
/*@ Extern Coq (dw_same:fp32->fp32->Prop)
 (dw_values8:fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->list fp32)
 (FloatArray::full:Z->Z->list fp32->Assertion)
 (FloatArray::undef_full:Z->Z->Assertion)
 (FloatArray::undef_seg:Z->Z->Z->Assertion) */
/*@ include strategies "../proof/c/float_store.strategies" */
float dw_get8(const vfloat32m2_t *v,size_t k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=k && k<8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7)
 Ensure dw_same(__return,dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7,k)) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) */;
void dw_store8(float *out,const vfloat32m2_t *v,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::undef_full(out,vl)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::full(out,vl,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl)) */;
float dw_get8(const vfloat32m2_t *v,size_t k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=k && k<8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7)
 Ensure dw_same(__return,dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7,k)) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) */
{
 if(k==0)return v->s0;
 if(k==1)return v->s1;
 if(k==2)return v->s2;
 if(k==3)return v->s3;
 if(k==4)return v->s4;
 if(k==5)return v->s5;
 if(k==6)return v->s6;
 return v->s7;
}
void dw_store8(float *out,const vfloat32m2_t *v,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::undef_full(out,vl)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::full(out,vl,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl)) */
{
 size_t i=0;
 /*@ Inv Assert out==out@pre && v==v@pre && vl==vl@pre && 0<=i && i<=vl && vl<=8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::full(out@pre,i,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,i)) * FloatArray::undef_seg(out@pre,i,vl) */
 for(;i<vl;i++){
  out[i]=dw_get8(v,i) /*@ where a0=a0,a1=a1,a2=a2,a3=a3,a4=a4,a5=a5,a6=a6,a7=a7 */;
 }
}
