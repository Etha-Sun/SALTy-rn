typedef unsigned long long size_t;
typedef unsigned int uint32_t;
struct xnn_f32_default_params { char _; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vuint32m8_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; unsigned int s4; unsigned int s5; unsigned int s6; unsigned int s7; unsigned int s8; unsigned int s9; unsigned int s10; unsigned int s11; unsigned int s12; unsigned int s13; unsigned int s14; unsigned int s15; unsigned int s16; unsigned int s17; unsigned int s18; unsigned int s19; unsigned int s20; unsigned int s21; unsigned int s22; unsigned int s23; unsigned int s24; unsigned int s25; unsigned int s26; unsigned int s27; unsigned int s28; unsigned int s29; unsigned int s30; unsigned int s31; } vuint32m8_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/*@ Import Coq Require Import Rndne.Types */
/*@ Extern Coq (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPreduint32x4_t : Z -> Assertion)
 (UndefStructPredvfloat32m8_t : Z -> Assertion)
 (UndefStructPredvuint32m8_t : Z -> Assertion)
 (UndefStructPredvbool4_t : Z -> Assertion) */
/*@ Import Coq Require Import Rndne.Bits */
/*@ Extern Coq (same_bits : fp32 -> fp32 -> Prop)
 (bits_of_fp32 : fp32 -> Z)
 (fp32_of_bits : Z -> fp32)
 (word32 : Z -> Z -> Z -> Z -> Z -> Prop)
 (aligned_4 : Z -> Prop) */
unsigned int qcp_float_bits(float x)
/*@ Require emp
 Ensure __return == bits_of_fp32(x) && emp */;
float qcp_float_from_bits(unsigned int bits)
/*@ Require emp
 Ensure same_bits(__return,fp32_of_bits(bits)) && emp */;
/*@ Import Coq Require Import Rndne.Model */
/*@ Extern Coq (rndne_same_bits : fp32 -> fp32 -> Prop)
 (rndne_abs : fp32 -> fp32)
 (rndne_sign : fp32 -> fp32 -> fp32)
 (rndne_select : Z -> fp32 -> fp32 -> fp32)
 (rndne_quiet : fp32 -> fp32)
 (rndne_abs_bits : Z -> Z)
 (rndne_nan_bits : Z -> Z)
 (rndne_snan_bits : Z -> Z)
 (rndne_key : Z -> Z)
 (rndne_gt_bits : Z -> Z -> Z)
 (rndne_abs_lt_bits : Z -> Z -> Z)
 (rndne_ne_bits : Z -> Z -> Z)
 (rndne_gt : fp32 -> fp32 -> Z)
 (rndne_abs_lt : fp32 -> fp32 -> Z)
 (rndne_ne : fp32 -> fp32 -> Z)
 (rndne_arm_nan : fp32 -> fp32 -> Z)
 (rndne_arm_add : fp32 -> fp32 -> fp32)
 (rndne_arm_sub : fp32 -> fp32 -> fp32)
 (rndne_rvv_add : fp32 -> fp32 -> fp32)
 (rndne_rvv_sub : fp32 -> fp32 -> fp32) */
float qcp_rnd_abs(float x)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_abs(x)) && emp */;
float qcp_rnd_sign(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_sign(a,b)) && emp */;
float qcp_rnd_select(unsigned int m,float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_select(m,a,b)) && emp */;
float qcp_rnd_quiet(float x)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_quiet(x)) && emp */;
unsigned int qcp_rnd_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_abs_bits(u) && emp */;
int qcp_rnd_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_nan_bits(u) && emp */;
int qcp_rnd_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_snan_bits(u) && emp */;
unsigned int qcp_rnd_key(unsigned int u)
/*@ Require emp Ensure __return == rndne_key(u) && emp */;
int qcp_rnd_gt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_gt_bits(a,b) && emp */;
int qcp_rnd_gt(float a,float b)
/*@ Require emp Ensure __return == rndne_gt(a,b) && emp */;
unsigned int qcp_rnd_abs_lt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_abs_lt_bits(a,b) && emp */;
unsigned int qcp_rnd_abs_lt(float a,float b)
/*@ Require emp Ensure __return == rndne_abs_lt(a,b) && emp */;
int qcp_rnd_ne_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_ne_bits(a,b) && emp */;
int qcp_rnd_ne(float a,float b)
/*@ Require emp Ensure __return == rndne_ne(a,b) && emp */;
unsigned int qcp_rnd_arm_nan(float a,float b)
/*@ Require emp Ensure __return == rndne_arm_nan(a,b) && emp */;
float qcp_rnd_arm_add(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_arm_add(a,b)) && emp */;
float qcp_rnd_arm_sub(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_arm_sub(a,b)) && emp */;
float qcp_rnd_rvv_add(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_rvv_add(a,b)) && emp */;
float qcp_rnd_rvv_sub(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_rvv_sub(a,b)) && emp */;
/*@ Import Coq Require Import Rndne.VectorModel */
/*@ Extern Coq 
 (rndne_active___riscv_vfabs_v_f32m8 : Z -> Z -> fp32 -> fp32)
 (rndne_active___riscv_vfadd_vf_f32m8 : Z -> Z -> fp32 -> fp32 -> fp32)
 (rndne_active___riscv_vfsub_vf_f32m8 : Z -> Z -> fp32 -> fp32 -> fp32)
 (rndne_active___riscv_vfsgnj_vv_f32m8 : Z -> Z -> fp32 -> fp32 -> fp32)
 (rndne_active___riscv_vmfgt_vf_f32m8_b4 : Z -> Z -> fp32 -> fp32 -> Z)
 (rndne_active___riscv_vor_vx_u32m8 : Z -> Z -> Z -> Z -> Z)
 (rndne_active___riscv_vmerge_vvm_f32m8 : Z -> Z -> fp32 -> fp32 -> Z -> fp32)
 (rndne_active_ne : Z -> Z -> fp32 -> fp32 -> Z) */
float qcp_rnd_active___riscv_vfabs_v_f32m8(float a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfabs_v_f32m8(i,vl,a)) && emp */;
float qcp_rnd_active___riscv_vfadd_vf_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfadd_vf_f32m8(i,vl,a,b)) && emp */;
float qcp_rnd_active___riscv_vfsub_vf_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfsub_vf_f32m8(i,vl,a,b)) && emp */;
float qcp_rnd_active___riscv_vfsgnj_vv_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfsgnj_vv_f32m8(i,vl,a,b)) && emp */;
int qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == rndne_active___riscv_vmfgt_vf_f32m8_b4(i,vl,a,b) && emp */;
unsigned int qcp_rnd_active___riscv_vor_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == rndne_active___riscv_vor_vx_u32m8(i,vl,a,b) && emp */;
float qcp_rnd_active___riscv_vmerge_vvm_f32m8(float a,float b,int mask,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vmerge_vvm_f32m8(i,vl,a,b,mask)) && emp */;
int qcp_rnd_active_ne(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == rndne_active_ne(i,vl,a,b) && emp */;
float qcp_rnd_active___riscv_vfabs_v_f32m8(float a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfabs_v_f32m8(i,vl,a)) && emp */
{ if(i<vl) return qcp_rnd_abs(a); return qcp_float_from_bits(0u); }
float qcp_rnd_active___riscv_vfadd_vf_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfadd_vf_f32m8(i,vl,a,b)) && emp */
{ if(i<vl) return qcp_rnd_rvv_add(a,b); return qcp_float_from_bits(0u); }
float qcp_rnd_active___riscv_vfsub_vf_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfsub_vf_f32m8(i,vl,a,b)) && emp */
{ if(i<vl) return qcp_rnd_rvv_sub(a,b); return qcp_float_from_bits(0u); }
float qcp_rnd_active___riscv_vfsgnj_vv_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vfsgnj_vv_f32m8(i,vl,a,b)) && emp */
{ if(i<vl) return qcp_rnd_sign(a,b); return qcp_float_from_bits(0u); }
int qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == rndne_active___riscv_vmfgt_vf_f32m8_b4(i,vl,a,b) && emp */
{ if(i<vl) return qcp_rnd_gt(a,b); return 0; }
unsigned int qcp_rnd_active___riscv_vor_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == rndne_active___riscv_vor_vx_u32m8(i,vl,a,b) && emp */
{ if(i<vl) return a | b; return 0; }
float qcp_rnd_active___riscv_vmerge_vvm_f32m8(float a,float b,int mask,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure rndne_same_bits(__return,rndne_active___riscv_vmerge_vvm_f32m8(i,vl,a,b,mask)) && emp */
{ if(i<vl) return (mask ? b : a); return qcp_float_from_bits(0u); }
int qcp_rnd_active_ne(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == rndne_active_ne(i,vl,a,b) && emp */
{ if(i<vl) return qcp_rnd_ne(a,b); return 0; }
