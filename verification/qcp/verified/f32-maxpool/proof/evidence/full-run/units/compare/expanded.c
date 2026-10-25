/* The formal frontend maps unsigned long to32bits even with --arch64.
   Use explicit unsigned long long for every source size_t/uintptr_t64 value.
   Native source uses its system typedefs, with actual width checks. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
/*@ Import Coq Require Import MaxPool.Model */
/*@ Extern Coq (mp_remaining:Z->Z) */
/*@ Import Coq Require Import MaxPool.Types */
typedef struct float32x4_t{float s0;float s1;float s2;float s3;}float32x4_t;
typedef struct float32x2_t{float s0;float s1;}float32x2_t;
typedef struct vfloat32m8_t{float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;float s8;float s9;float s10;float s11;float s12;float s13;float s14;float s15;float s16;float s17;float s18;float s19;float s20;float s21;float s22;float s23;float s24;float s25;float s26;float s27;float s28;float s29;float s30;float s31;}vfloat32m8_t;
typedef struct vuint32m8_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;uint32_t s16;uint32_t s17;uint32_t s18;uint32_t s19;uint32_t s20;uint32_t s21;uint32_t s22;uint32_t s23;uint32_t s24;uint32_t s25;uint32_t s26;uint32_t s27;uint32_t s28;uint32_t s29;uint32_t s30;uint32_t s31;}vuint32m8_t;
typedef struct vbool4_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;uint32_t s16;uint32_t s17;uint32_t s18;uint32_t s19;uint32_t s20;uint32_t s21;uint32_t s22;uint32_t s23;uint32_t s24;uint32_t s25;uint32_t s26;uint32_t s27;uint32_t s28;uint32_t s29;uint32_t s30;uint32_t s31;}vbool4_t;
/*@ Import Coq Require Import MaxPool.CompareTypes */
typedef struct uint32x4_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;}uint32x4_t;
/*@ Import Coq Require Import MaxPool.MemoryModel MaxPool.MemoryViews MaxPool.PackModel */
/*@ Extern Coq (MPFloatMap :: *) (MPOutput :: *) */
/*@ Extern Coq (mp_load_lane:MPFloatMap->Z->Z->fp32) (mp_loaded_lane:MPOutput->Z->Z->fp32->Prop) (mp_data:MPFloatMap->Assertion) (mp_get:MPFloatMap->Z->fp32) (mp_window:MPFloatMap->Z->Z->Prop) (mp_out:list Z->MPOutput->Assertion) (mp_write_window:list Z->Z->Z->Prop) (mp_loaded:MPOutput->Z->fp32->Prop) (mp_write:MPOutput->Z->Z->(Z->fp32)->MPOutput) (mp_pack2:fp32->fp32->Z->fp32) (mp_pack4:fp32->fp32->fp32->fp32->Z->fp32) (mp_max:fp32->fp32->fp32) (mp_min:fp32->fp32->fp32) */
float32x4_t vld1q_f32(const float*p)
/*@ readonly_map With (F:MPFloatMap) Require mp_window(F,p,4) && mp_data(F)
 Ensure mp_data(F) * store(&(__return.s0),float,mp_load_lane(F,p,0)) * store(&(__return.s1),float,mp_load_lane(F,p,1)) * store(&(__return.s2),float,mp_load_lane(F,p,2)) * store(&(__return.s3),float,mp_load_lane(F,p,3)) */;
float32x4_t vld1q_f32(const float*p)
/*@ output_map With (W:list Z) (O:MPOutput) Require mp_write_window(W,p,4) && mp_out(W,O)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32), mp_loaded_lane(O,p,0,r0) && mp_loaded_lane(O,p,1,r1) && mp_loaded_lane(O,p,2,r2) && mp_loaded_lane(O,p,3,r3) && mp_out(W,O) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,mp_max(a0,b0)) * store(&(__return.s1),float,mp_max(a1,b1)) * store(&(__return.s2),float,mp_max(a2,b2)) * store(&(__return.s3),float,mp_max(a3,b3)) */;
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,mp_min(a0,b0)) * store(&(__return.s1),float,mp_min(a1,b1)) * store(&(__return.s2),float,mp_min(a2,b2)) * store(&(__return.s3),float,mp_min(a3,b3)) */;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */;
void mp_neon_store4_view(float*p,const float32x4_t*a)
/*@ With (W:list Z) (O:MPOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require mp_write_window(W,p,4) && mp_out(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) * store(&(a->s2),float,a2) * store(&(a->s3),float,a3)
 Ensure mp_out(W,mp_write(O,p,4,mp_pack4(a0,a1,a2,a3))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) * store(&(a->s2),float,a2) * store(&(a->s3),float,a3) */;
void mp_neon_store2_view(float*p,const float32x2_t*a)
/*@ With (W:list Z) (O:MPOutput) (a0:fp32) (a1:fp32)
 Require mp_write_window(W,p,2) && mp_out(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1)
 Ensure mp_out(W,mp_write(O,p,2,mp_pack2(a0,a1))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) */;
void mp_neon_store1_view(float*p,const float32x2_t*a,int lane)
/*@ With (W:list Z) (O:MPOutput) (a0:fp32) (a1:fp32)
 Require lane==0 && mp_write_window(W,p,1) && mp_out(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1)
 Ensure mp_out(W,mp_write(O,p,1,mp_pack2(a0,a1))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) */;
/* Original ISA store operations, borrowed logical input-object view only.
   Each macro evaluates the output expression once and captures one named input
   object address. This is a specification representation, not an ISA/ABI proof
   or an unproved ordinary C helper implementation. */
/*@ Import Coq Require Import MaxPool.CompareModel */
/*@ Extern Coq (mp_out_known:MPOutput->Z->fp32->Prop) (mp_word_equal:Z->Z->Z) (bits_of_fp32:fp32->Z) */
uint32x4_t vreinterpretq_u32_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),unsigned int,bits_of_fp32(a0)) * store(&(__return.s1),unsigned int,bits_of_fp32(a1)) * store(&(__return.s2),unsigned int,bits_of_fp32(a2)) * store(&(__return.s3),unsigned int,bits_of_fp32(a3)) */;
uint32_t vgetq_lane_u32(uint32x4_t a,int lane)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require lane==0 && store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3)
 Ensure __return==a0 && emp */;
/*@ Import Coq Require Import MaxPool.CompareModel */
/*@ Extern Coq (MPOutput :: *) */
/*@ Extern Coq (mp_out: list Z->MPOutput->Assertion) (mp_out_known:MPOutput->Z->fp32->Prop) (mp_write_window:list Z->Z->Z->Prop) (mp_word_equal:Z->Z->Z) (bits_of_fp32:fp32->Z) */
unsigned int mp_output_bits_at(const float*p)
/*@ With (W:list Z) (O:MPOutput) (v:fp32)
 Require p!=0 && mp_write_window(W,p,4) && mp_out_known(O,p,v) && mp_out(W,O)
 Ensure __return==bits_of_fp32(v) && mp_out(W,O) */;
int mp_same_output_at(const float*a,const float*b)
/*@ With (W1:list Z) (W2:list Z) (O1:MPOutput) (O2:MPOutput) (v1:fp32) (v2:fp32)
 Require a!=0 && b!=0 && mp_write_window(W1,a,4) && mp_write_window(W2,b,4) && mp_out_known(O1,a,v1) && mp_out_known(O2,b,v2) && mp_out(W1,O1) * mp_out(W2,O2)
 Ensure __return==mp_word_equal(bits_of_fp32(v1),bits_of_fp32(v2)) && mp_out(W1,O1) * mp_out(W2,O2) */;
/* Ordinary actual C: only the three original NEON primitives are specification
   exceptions. Unobserved padding may be unknown; lane0 is known initialized. */
unsigned int mp_output_bits_at(const float*p)
/*@ With (W:list Z) (O:MPOutput) (v:fp32)
 Require p!=0 && mp_write_window(W,p,4) && mp_out_known(O,p,v) && mp_out(W,O)
 Ensure __return==bits_of_fp32(v) && mp_out(W,O) */
{
  float32x4_t a=vld1q_f32(p) /*@ where (output_map) W=W,O=O */;
  uint32x4_t b=vreinterpretq_u32_f32(a) /*@ where a=&a */;
  return vgetq_lane_u32(b,0) /*@ where a=&b */;
}
int mp_same_output_at(const float*a,const float*b)
/*@ With (W1:list Z) (W2:list Z) (O1:MPOutput) (O2:MPOutput) (v1:fp32) (v2:fp32)
 Require a!=0 && b!=0 && mp_write_window(W1,a,4) && mp_write_window(W2,b,4) && mp_out_known(O1,a,v1) && mp_out_known(O2,b,v2) && mp_out(W1,O1) * mp_out(W2,O2)
 Ensure __return==mp_word_equal(bits_of_fp32(v1),bits_of_fp32(v2)) && mp_out(W1,O1) * mp_out(W2,O2) */
{
  unsigned int x=mp_output_bits_at(a) /*@ where W=W1,O=O1,v=v1 */;
  unsigned int y=mp_output_bits_at(b) /*@ where W=W2,O=O2,v=v2 */;
  return x==y;
}
