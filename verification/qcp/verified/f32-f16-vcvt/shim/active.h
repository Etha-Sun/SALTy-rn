#ifndef QCP_F32F16_ACTIVE_H
#define QCP_F32F16_ACTIVE_H
#include "types_def.h"
#include "scalar.h"
#include "integer.h"
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
#endif
