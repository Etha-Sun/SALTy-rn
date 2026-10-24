#include "active.h"
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
