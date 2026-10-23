#ifndef QCP_RNDNE_ACTIVE_H
#define QCP_RNDNE_ACTIVE_H
#include "types_def.h"
#include "scalar.h"
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
#endif
