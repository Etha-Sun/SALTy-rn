typedef unsigned long long size_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
typedef struct uint16x8_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; } uint16x8_t;
typedef struct uint16x4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; } uint16x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vuint32m8_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; unsigned int s4; unsigned int s5; unsigned int s6; unsigned int s7; unsigned int s8; unsigned int s9; unsigned int s10; unsigned int s11; unsigned int s12; unsigned int s13; unsigned int s14; unsigned int s15; unsigned int s16; unsigned int s17; unsigned int s18; unsigned int s19; unsigned int s20; unsigned int s21; unsigned int s22; unsigned int s23; unsigned int s24; unsigned int s25; unsigned int s26; unsigned int s27; unsigned int s28; unsigned int s29; unsigned int s30; unsigned int s31; } vuint32m8_t;
typedef struct vuint16m4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; unsigned short s8; unsigned short s9; unsigned short s10; unsigned short s11; unsigned short s12; unsigned short s13; unsigned short s14; unsigned short s15; unsigned short s16; unsigned short s17; unsigned short s18; unsigned short s19; unsigned short s20; unsigned short s21; unsigned short s22; unsigned short s23; unsigned short s24; unsigned short s25; unsigned short s26; unsigned short s27; unsigned short s28; unsigned short s29; unsigned short s30; unsigned short s31; } vuint16m4_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/* Raw eight-byte view; u32 lane0 stores two ushort cells, no uint32 pointer dereference. */
typedef uint16x4_t uint32x2_t;
/*@ Import Coq Require Import F32F16.Types */
/*@ Extern Coq 
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPreduint32x4_t : Z -> Assertion)
 (UndefStructPreduint16x8_t : Z -> Assertion)
 (UndefStructPreduint16x4_t : Z -> Assertion)
 (UndefStructPredvfloat32m8_t : Z -> Assertion)
 (UndefStructPredvuint32m8_t : Z -> Assertion)
 (UndefStructPredvuint16m4_t : Z -> Assertion)
 (UndefStructPredvbool4_t : Z -> Assertion) */
/*@ Import Coq Require Import F32F16.Bits */
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
/*@ Import Coq Require Import F32F16.Model */
/*@ Extern Coq (f16_same_bits : fp32 -> fp32 -> Prop)
 (f16_abs : fp32 -> fp32)
 (f16_sign : fp32 -> fp32 -> fp32)
 (f16_select : Z -> fp32 -> fp32 -> fp32)
 (f16_quiet : fp32 -> fp32)
 (f16_abs_bits : Z -> Z)
 (f16_nan_bits : Z -> Z)
 (f16_snan_bits : Z -> Z)
 (f16_key : Z -> Z)
 (f16_gt_bits : Z -> Z -> Z)
 (f16_abs_lt_bits : Z -> Z -> Z)
 (f16_ne_bits : Z -> Z -> Z)
 (f16_gt : fp32 -> fp32 -> Z)
 (f16_abs_lt : fp32 -> fp32 -> Z)
 (f16_ne : fp32 -> fp32 -> Z)
 (f16_arm_nan : fp32 -> fp32 -> Z)
 (f16_arm_add : fp32 -> fp32 -> fp32)
 (f16_arm_sub : fp32 -> fp32 -> fp32)
 (f16_rvv_add : fp32 -> fp32 -> fp32)
 (f16_rvv_sub : fp32 -> fp32 -> fp32)
 (f16_arm_mul : fp32 -> fp32 -> fp32)
 (f16_rvv_mul : fp32 -> fp32 -> fp32) */
float qcp_f16_abs(float x)
/*@ Require emp Ensure f16_same_bits(__return,f16_abs(x)) && emp */;
float qcp_f16_sign(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_sign(a,b)) && emp */;
float qcp_f16_select(unsigned int m,float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_select(m,a,b)) && emp */;
float qcp_f16_quiet(float x)
/*@ Require emp Ensure f16_same_bits(__return,f16_quiet(x)) && emp */;
unsigned int qcp_f16_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_abs_bits(u) && emp */;
int qcp_f16_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_nan_bits(u) && emp */;
int qcp_f16_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_snan_bits(u) && emp */;
unsigned int qcp_f16_key(unsigned int u)
/*@ Require emp Ensure __return == f16_key(u) && emp */;
int qcp_f16_gt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_gt_bits(a,b) && emp */;
int qcp_f16_gt(float a,float b)
/*@ Require emp Ensure __return == f16_gt(a,b) && emp */;
unsigned int qcp_f16_abs_lt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_abs_lt_bits(a,b) && emp */;
unsigned int qcp_f16_abs_lt(float a,float b)
/*@ Require emp Ensure __return == f16_abs_lt(a,b) && emp */;
int qcp_f16_ne_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_ne_bits(a,b) && emp */;
int qcp_f16_ne(float a,float b)
/*@ Require emp Ensure __return == f16_ne(a,b) && emp */;
unsigned int qcp_f16_arm_nan(float a,float b)
/*@ Require emp Ensure __return == f16_arm_nan(a,b) && emp */;
float qcp_f16_arm_add(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_add(a,b)) && emp */;
float qcp_f16_arm_sub(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_sub(a,b)) && emp */;
float qcp_f16_rvv_add(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_add(a,b)) && emp */;
float qcp_f16_rvv_sub(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_sub(a,b)) && emp */;
float qcp_f16_arm_mul(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_mul(a,b)) && emp */;
float qcp_f16_rvv_mul(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_mul(a,b)) && emp */;
/*@ Import Coq Require Import F32F16.IntegerModel */
/*@ Extern Coq 
 (f16_narrow16 : Z -> Z)
 (f16_add32 : Z -> Z -> Z)
 (f16_and32 : Z -> Z -> Z)
 (f16_or32 : Z -> Z -> Z)
 (f16_max32 : Z -> Z -> Z)
 (f16_gt32 : Z -> Z -> Z)
 (f16_add16 : Z -> Z -> Z)
 (f16_and16 : Z -> Z -> Z)
 (f16_or16 : Z -> Z -> Z)
 (f16_select16 : Z -> Z -> Z -> Z)
 (f16_shrn13 : Z -> Z)
 (f16_shrn16 : Z -> Z) */
unsigned short qcp_f16_narrow16(unsigned int x)
/*@ Require emp Ensure __return == f16_narrow16(x) && emp */;
unsigned int qcp_f16_add32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_add32(a,b) && emp */;
unsigned int qcp_f16_and32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_and32(a,b) && emp */;
unsigned int qcp_f16_or32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_or32(a,b) && emp */;
unsigned int qcp_f16_max32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_max32(a,b) && emp */;
unsigned int qcp_f16_gt32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_gt32(a,b) && emp */;
unsigned short qcp_f16_add16(unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_add16(a,b) && emp */;
unsigned short qcp_f16_and16(unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_and16(a,b) && emp */;
unsigned short qcp_f16_or16(unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_or16(a,b) && emp */;
unsigned short qcp_f16_select16(unsigned short m,unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_select16(m,a,b) && emp */;
unsigned short qcp_f16_shrn13(unsigned int a)
/*@ Require emp Ensure __return == f16_shrn13(a) && emp */;
unsigned short qcp_f16_shrn16(unsigned int a)
/*@ Require emp Ensure __return == f16_shrn16(a) && emp */;
/*@ Import Coq Require Import F32F16.VectorModel */
/*@ Extern Coq 
 (f16_active___riscv_vfabs_v_f32m8 : Z -> Z -> fp32 -> fp32)
 (f16_active___riscv_vadd_vx_u32m8 : Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vand_vx_u32m8 : Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vmaxu_vx_u32m8 : Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vmsgtu_vx_u32m8_b4 : Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vfmul_vf_f32m8 : Z -> Z -> fp32 -> fp32 -> fp32)
 (f16_active___riscv_vfadd_vv_f32m8 : Z -> Z -> fp32 -> fp32 -> fp32)
 (f16_active_qcp_f16_rvv_shrn_0 : Z -> Z -> Z -> Z)
 (f16_active_qcp_f16_rvv_shrn_13 : Z -> Z -> Z -> Z)
 (f16_active_qcp_f16_rvv_shrn_16 : Z -> Z -> Z -> Z)
 (f16_active___riscv_vand_vx_u16m4 : Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vadd_vv_u16m4 : Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vmerge_vxm_u16m4 : Z -> Z -> Z -> Z -> Z -> Z)
 (f16_active___riscv_vor_vv_u16m4 : Z -> Z -> Z -> Z -> Z) */
float qcp_f16_active___riscv_vfabs_v_f32m8(float a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure f16_same_bits(__return,f16_active___riscv_vfabs_v_f32m8(i,vl,a)) && emp */;
unsigned int qcp_f16_active___riscv_vadd_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vadd_vx_u32m8(i,vl,a,b) && emp */;
unsigned int qcp_f16_active___riscv_vand_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vand_vx_u32m8(i,vl,a,b) && emp */;
unsigned int qcp_f16_active___riscv_vmaxu_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vmaxu_vx_u32m8(i,vl,a,b) && emp */;
int qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vmsgtu_vx_u32m8_b4(i,vl,a,b) && emp */;
float qcp_f16_active___riscv_vfmul_vf_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure f16_same_bits(__return,f16_active___riscv_vfmul_vf_f32m8(i,vl,a,b)) && emp */;
float qcp_f16_active___riscv_vfadd_vv_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure f16_same_bits(__return,f16_active___riscv_vfadd_vv_f32m8(i,vl,a,b)) && emp */;
unsigned short qcp_f16_active_qcp_f16_rvv_shrn_0(unsigned int a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active_qcp_f16_rvv_shrn_0(i,vl,a) && emp */;
unsigned short qcp_f16_active_qcp_f16_rvv_shrn_13(unsigned int a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active_qcp_f16_rvv_shrn_13(i,vl,a) && emp */;
unsigned short qcp_f16_active_qcp_f16_rvv_shrn_16(unsigned int a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active_qcp_f16_rvv_shrn_16(i,vl,a) && emp */;
unsigned short qcp_f16_active___riscv_vand_vx_u16m4(unsigned short a,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vand_vx_u16m4(i,vl,a,b) && emp */;
unsigned short qcp_f16_active___riscv_vadd_vv_u16m4(unsigned short a,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vadd_vv_u16m4(i,vl,a,b) && emp */;
unsigned short qcp_f16_active___riscv_vmerge_vxm_u16m4(unsigned short a,int mask,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vmerge_vxm_u16m4(i,vl,a,mask,b) && emp */;
unsigned short qcp_f16_active___riscv_vor_vv_u16m4(unsigned short a,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vor_vv_u16m4(i,vl,a,b) && emp */;
float qcp_f16_active___riscv_vfabs_v_f32m8(float a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure f16_same_bits(__return,f16_active___riscv_vfabs_v_f32m8(i,vl,a)) && emp */
{ if(i<vl) return qcp_f16_abs(a); return qcp_float_from_bits(0u); }
unsigned int qcp_f16_active___riscv_vadd_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vadd_vx_u32m8(i,vl,a,b) && emp */
{ if(i<vl) return qcp_f16_add32(a,b); return 0; }
unsigned int qcp_f16_active___riscv_vand_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vand_vx_u32m8(i,vl,a,b) && emp */
{ if(i<vl) return qcp_f16_and32(a,b); return 0; }
unsigned int qcp_f16_active___riscv_vmaxu_vx_u32m8(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vmaxu_vx_u32m8(i,vl,a,b) && emp */
{ if(i<vl) return qcp_f16_max32(a,b); return 0; }
int qcp_f16_active___riscv_vmsgtu_vx_u32m8_b4(unsigned int a,unsigned int b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vmsgtu_vx_u32m8_b4(i,vl,a,b) && emp */
{ if(i<vl) return (qcp_f16_gt32(a,b)!=0); return 0; }
float qcp_f16_active___riscv_vfmul_vf_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure f16_same_bits(__return,f16_active___riscv_vfmul_vf_f32m8(i,vl,a,b)) && emp */
{ if(i<vl) return qcp_f16_rvv_mul(a,b); return qcp_float_from_bits(0u); }
float qcp_f16_active___riscv_vfadd_vv_f32m8(float a,float b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure f16_same_bits(__return,f16_active___riscv_vfadd_vv_f32m8(i,vl,a,b)) && emp */
{ if(i<vl) return qcp_f16_rvv_add(a,b); return qcp_float_from_bits(0u); }
unsigned short qcp_f16_active_qcp_f16_rvv_shrn_0(unsigned int a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active_qcp_f16_rvv_shrn_0(i,vl,a) && emp */
{ if(i<vl) return qcp_f16_narrow16(a); return 0; }
unsigned short qcp_f16_active_qcp_f16_rvv_shrn_13(unsigned int a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active_qcp_f16_rvv_shrn_13(i,vl,a) && emp */
{ if(i<vl) return qcp_f16_shrn13(a); return 0; }
unsigned short qcp_f16_active_qcp_f16_rvv_shrn_16(unsigned int a,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active_qcp_f16_rvv_shrn_16(i,vl,a) && emp */
{ if(i<vl) return qcp_f16_shrn16(a); return 0; }
unsigned short qcp_f16_active___riscv_vand_vx_u16m4(unsigned short a,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vand_vx_u16m4(i,vl,a,b) && emp */
{ if(i<vl) return qcp_f16_and16(a,b); return 0; }
unsigned short qcp_f16_active___riscv_vadd_vv_u16m4(unsigned short a,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vadd_vv_u16m4(i,vl,a,b) && emp */
{ if(i<vl) return qcp_f16_add16(a,b); return 0; }
unsigned short qcp_f16_active___riscv_vmerge_vxm_u16m4(unsigned short a,int mask,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vmerge_vxm_u16m4(i,vl,a,mask,b) && emp */
{ if(i<vl) { if(mask) return b; return a; } return 0; }
unsigned short qcp_f16_active___riscv_vor_vv_u16m4(unsigned short a,unsigned short b,size_t i,size_t vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp Ensure __return == f16_active___riscv_vor_vv_u16m4(i,vl,a,b) && emp */
{ if(i<vl) return qcp_f16_or16(a,b); return 0; }
