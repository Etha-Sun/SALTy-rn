#include "active.h"
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
