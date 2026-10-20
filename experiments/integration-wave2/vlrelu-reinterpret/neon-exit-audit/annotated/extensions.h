#ifndef FLOAT_EXTENSIONS_H
#define FLOAT_EXTENSIONS_H
#include <string.h>
struct xnn_f32_lrelu_params { struct { float slope; } scalar; };
typedef struct { int32_t lane[4]; } int32x4_t;
typedef struct { int32_t lane[RVV_CAP]; } vint32m8_t;
typedef struct { _Bool lane[RVV_CAP]; } vbool4_t;
float32x4_t vsubq_f32(float32x4_t a, float32x4_t b);
vfloat32m8_t __riscv_vfsub_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
/*@
  logic float fp_sub32(float a,float b);
  lemma fp_sub_congruence: \forall float a,b,c,d;
    same_float(a,c) && same_float(b,d) ==>
    same_value(fp_sub32(a,b),fp_sub32(c,d));
*/
/*@ ghost
/@ requires same_value(a,fp_sub32(x,y));
    requires same_value(b,fp_sub32(x,y));
    terminates \true; assigns \nothing; ensures same_value(a,b); @/
void proof_sub_join(float a,float b,float x,float y) {}
*/
/*@ assigns \nothing; */
float f32_sub(float a, float b);
/*@
  logic float fp_mul32(float a,float b);
  lemma fp_mul_congruence: \forall float a,b,c,d;
    same_float(a,c) && same_float(b,d) ==>
    same_value(fp_mul32(a,b),fp_mul32(c,d));
*/
/*@ ghost
/@ requires same_value(a,fp_mul32(x,y));
    requires same_value(b,fp_mul32(x,y));
    terminates \true; assigns \nothing; ensures same_value(a,b); @/
void proof_mul_join(float a,float b,float x,float y) {}
*/
/*@ assigns \nothing; ensures \forall integer i; 0<=i<4 ==> same_value(\result.lane[i],fp_mul32(a.lane[i],b.lane[i])); */
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b);
/*@ requires vl<=32; assigns \nothing; ensures \forall integer i; 0<=i<vl ==> same_value(\result.lane[i],fp_mul32(a.lane[i],b.lane[i])); */
vfloat32m8_t __riscv_vfmul_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
/*@ assigns \nothing; ensures same_value(\result,fp_mul32(a,b)); */
float f32_mul(float a, float b);
float32x4_t vdivq_f32(float32x4_t a, float32x4_t b);
vfloat32m8_t __riscv_vfdiv_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
float f32_div(float a, float b);
/*@ requires \valid_read(p); assigns \nothing; ensures \forall integer i; 0<=i<4 ==> same_float(\result.lane[i],*p); */
float32x4_t vld1q_dup_f32(const float *p);
/*@ requires vl<=32; assigns \nothing; ensures \forall integer i; 0<=i<vl ==> same_value(\result.lane[i],fp_mul32(a.lane[i],b)); */
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a, float b, size_t vl);
float32x4_t vsqrtq_f32(float32x4_t a);
vfloat32m8_t __riscv_vfsqrt_v_f32m8(vfloat32m8_t a, size_t vl);
float32x4_t vminq_f32(float32x4_t a,float32x4_t b);
vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b);
vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t mask,size_t vl);

/*@ logic integer repr32(float x); logic float from_repr32(integer u); */
/*@ lemma root_same_float_trans: \forall float a,b,c;
      same_float(a,b) && same_float(b,c) ==> same_float(a,c); */
/*@ ghost
/@ requires 0<=u<4294967296;
    requires same_float(from_repr32(u),x);
    terminates \true; assigns \nothing;
    ensures !\is_NaN(x) ==> repr32(x)==u; @/
void proof_repr_reencode(uint32_t u,float x) {}
/@ terminates \true; assigns \nothing;
    ensures 0<=repr32(x)<4294967296; @/
void proof_repr_range(float x) {}
/@ terminates \true; assigns \nothing;
    ensures !\is_NaN(x) ==> same_float(from_repr32(repr32(x)),x); @/
void proof_repr_value(float x) {}
/@ terminates \true; assigns \nothing;
    ensures \forall integer mask,u,v; 0<=u<4294967296 && 0<=v<4294967296 &&
      (mask==0 || mask==4294967295) ==>
      ((mask&u)|((uint32_t)(~mask)&v))==(mask==0?v:u); @/
void proof_mask_choice(uint32_t m) {
  /@ assert root_mask_word: \forall integer u; 0<=u<4294967296 ==> (u&4294967295)==u; @/
  if (m==0) { } else if (m==UINT32_MAX) { }
}

*/
/*@ \wp::strategy RootMaskSMT: \prover("cvc5",30), \prover("z3",30);
    \wp::strategy RootMask:
      \tactic("Wp.modmask",\ingoal(A & 4294967295),\children(RootMaskSMT)),
      RootMaskSMT;
    \wp::proof RootMask: root_mask_word;
    \wp::strategy RootBitPoint:
      \tactic("Wp.split",\ingoal(M==0),\children(RootMaskSMT)), RootMaskSMT;
    \wp::strategy RootBitArray:
      \tactic("Wp.array",\ingoal(A[I[V]][J]),\children(RootBitPoint)),
      RootBitPoint;
    \wp::proof RootBitArray: vbslq_f32; */
/*@ lemma root_u32_word_mask: \forall integer u;
      0<=u<4294967296 ==> (u&4294967295)==u; */
/*@ \wp::proof RootMask: root_u32_word_mask; */
/*@ lemma root_fullmask_same_float:
      \forall float a,b,r; \forall integer mask,u,v;
      0<=u<4294967296 && 0<=v<4294967296 &&
      (mask==0 || mask==4294967295) &&
      same_float(from_repr32(u),a) && same_float(from_repr32(v),b) &&
      same_float(r,from_repr32((mask&u)|((uint32_t)(~mask)&v))) ==>
      same_float(r,mask==0?b:a); */
/*@ \wp::strategy RootFullMaskSplit:
      \tactic("Wp.split",\when(M==0 || M==4294967295),\children(RootMaskSMT)),
      RootMaskSMT;
    \wp::proof RootFullMaskSplit: root_fullmask_same_float; */
/*@ assigns \nothing; ensures same_float(from_repr32(\result),x);
    ensures !\is_NaN(x) ==> \result==repr32(x); */
uint32_t float_bits(float x);
/*@ assigns \nothing; ensures same_float(\result,from_repr32(u)); */
float bits_float(uint32_t u);
float32x4_t vdupq_n_f32(float x);
int32x4_t vmovq_n_s32(int32_t x);
uint32x4_t vmovq_n_u32(uint32_t x);
int32x4_t vreinterpretq_s32_f32(float32x4_t a);
float32x4_t vreinterpretq_f32_u32(uint32x4_t a);
uint32x4_t vcltq_s32(int32x4_t a,int32x4_t b);
uint32x4_t vorrq_u32(uint32x4_t a,uint32x4_t b);
float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b);
float32x4_t vabsq_f32(float32x4_t a);
uint32x4_t vcaltq_f32(float32x4_t a,float32x4_t b);
vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a);
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a);
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a);
vbool4_t __riscv_vmslt_vx_i32m8_b4(vint32m8_t a,int32_t b,size_t vl);
vbool4_t __riscv_vmfgt_vf_f32m8_b4(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfabs_v_f32m8(vfloat32m8_t a,size_t vl);
vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfsub_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfsgnj_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vuint32m8_t __riscv_vor_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl);
float f32_sqrt(float x);
/*@ logic float unary_value(float x,float s) = \sign(x)==\sign((float)-1.0) ? fp_mul32(x,s) : x; */
/*@ lemma values_unary_congruence:
      \forall float x,y,s,t;
      same_float(x,y) && same_float(s,t) ==>
      same_value(unary_value(x,s),unary_value(y,t)); */
/*@ lemma values_unary_select:
      \forall float x,y,s,t,m,r;
      same_float(x,y) && same_float(s,t) &&
      same_value(m,fp_mul32(x,s)) &&
      same_float(r,\sign(y)==\sign((float)-1.0)?m:x) ==>
      same_value(r,unary_value(y,t)); */
/*@ lemma values_unary_join:
      \forall float x,y,s,t,a,b;
      same_float(x,y) && same_float(s,t) &&
      same_value(a,unary_value(x,s)) &&
      same_value(b,unary_value(y,t)) ==> same_value(a,b); */
/*@ lemma values_unary_mask:
      \forall float x,y,s,t,m,r; \forall integer mask;
      same_float(x,y) && same_float(s,t) &&
      same_value(m,fp_mul32(x,s)) &&
      (!\is_NaN(y) ==>
        ((mask!=0) <==> (\sign(y)==\sign((float)-1.0)))) &&
      same_float(r,mask!=0?m:x) ==>
      same_value(r,unary_value(y,t)); */
/*@ \wp::strategy ValuesSMT: \prover("cvc5",30),\prover("z3",30);
 */
/*@ lemma values_float_sign_transfer:
      \forall float x,y;
      same_float(x,y) && !\is_NaN(y) ==> \sign(x)==\sign(y); */
/*@ lemma values_mask_sign_transfer:
      \forall float x,y; \forall integer mask;
      same_float(x,y) &&
      (!\is_NaN(x) ==>
        ((mask!=0) <==> (\sign(x)==\sign((float)-1.0)))) ==>
      (!\is_NaN(y) ==>
        ((mask!=0) <==> (\sign(y)==\sign((float)-1.0)))); */
/*@ lemma values_unary_mask_source:
      \forall float x,y,s,t,m,r; \forall integer mask;
      same_float(x,y) && same_float(s,t) &&
      same_value(m,fp_mul32(x,s)) &&
      (!\is_NaN(x) ==>
        ((mask!=0) <==> (\sign(x)==\sign((float)-1.0)))) &&
      same_float(r,mask!=0?m:x) ==>
      same_value(r,unary_value(y,t)); */
/*@ ghost
/@ requires values_point_input: same_float(x,y);
    requires values_point_slope: same_float(s,t);
    requires values_point_product: same_value(m,fp_mul32(x,s));
    requires values_point_sign: !\is_NaN(x) ==>
      ((mask!=0) <==> (\sign(x)==\sign((float)-1.0)));
    requires values_point_select: same_float(r,mask!=0?m:x);
    terminates \true;
    assigns \nothing;
    ensures values_point_value: same_value(r,unary_value(y,t)); @/
void proof_values_unary_point(float x,float y,float s,float t,float m,float r,uint32_t mask) {}
*/
#endif

/*@ lemma values_tail_extent: \forall integer T,B;
      0<=T<=SIZE_MAX && (B==8 || B==12) && B/4<=T ==>
      (size_t)((size_t)(T-B/4)+2)==T-(B%8)/4; */
/*@ ghost
/@ requires values_transfer_source: same_float(r,v);
   requires values_transfer_value: same_value(v,unary_value(y,t));
   terminates \true; assigns \nothing;
   ensures values_transfer_result: same_value(r,unary_value(y,t)); @/
void proof_values_unary_transfer(float r,float v,float y,float t) {}
*/
