#include "program_model.h"
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop) */
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_array_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_store_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_loop_def.h"
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
/*@ include strategies "f16_memory.strategies" */
void qcp_rvv_read_lane(const float *p,float *out,unsigned long long vl,unsigned long long i)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && 0 <= i && i < 32 &&
         FloatArray::full(p,vl,L) * undef_data_at(out,float)
 Ensure FloatArray::full(p,vl,L) * store(out,float,rvv_read_value(i,vl,L)) */
{
 if(i<vl) *out=p[i];
 else *out=0.0f;
}

void __riscv_vle32_v_f32m8(struct vfloat32m8_t *r,const float *p,unsigned long long vl)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && FloatArray::full(p,vl,L) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float) * undef_data_at(&(r->s4),float) * undef_data_at(&(r->s5),float) * undef_data_at(&(r->s6),float) * undef_data_at(&(r->s7),float) * undef_data_at(&(r->s8),float) * undef_data_at(&(r->s9),float) * undef_data_at(&(r->s10),float) * undef_data_at(&(r->s11),float) * undef_data_at(&(r->s12),float) * undef_data_at(&(r->s13),float) * undef_data_at(&(r->s14),float) * undef_data_at(&(r->s15),float) * undef_data_at(&(r->s16),float) * undef_data_at(&(r->s17),float) * undef_data_at(&(r->s18),float) * undef_data_at(&(r->s19),float) * undef_data_at(&(r->s20),float) * undef_data_at(&(r->s21),float) * undef_data_at(&(r->s22),float) * undef_data_at(&(r->s23),float) * undef_data_at(&(r->s24),float) * undef_data_at(&(r->s25),float) * undef_data_at(&(r->s26),float) * undef_data_at(&(r->s27),float) * undef_data_at(&(r->s28),float) * undef_data_at(&(r->s29),float) * undef_data_at(&(r->s30),float) * undef_data_at(&(r->s31),float)
 Ensure FloatArray::full(p,vl,L) * store(&(r->s0),float,rvv_read_value(0,vl,L)) * store(&(r->s1),float,rvv_read_value(1,vl,L)) * store(&(r->s2),float,rvv_read_value(2,vl,L)) * store(&(r->s3),float,rvv_read_value(3,vl,L)) * store(&(r->s4),float,rvv_read_value(4,vl,L)) * store(&(r->s5),float,rvv_read_value(5,vl,L)) * store(&(r->s6),float,rvv_read_value(6,vl,L)) * store(&(r->s7),float,rvv_read_value(7,vl,L)) * store(&(r->s8),float,rvv_read_value(8,vl,L)) * store(&(r->s9),float,rvv_read_value(9,vl,L)) * store(&(r->s10),float,rvv_read_value(10,vl,L)) * store(&(r->s11),float,rvv_read_value(11,vl,L)) * store(&(r->s12),float,rvv_read_value(12,vl,L)) * store(&(r->s13),float,rvv_read_value(13,vl,L)) * store(&(r->s14),float,rvv_read_value(14,vl,L)) * store(&(r->s15),float,rvv_read_value(15,vl,L)) * store(&(r->s16),float,rvv_read_value(16,vl,L)) * store(&(r->s17),float,rvv_read_value(17,vl,L)) * store(&(r->s18),float,rvv_read_value(18,vl,L)) * store(&(r->s19),float,rvv_read_value(19,vl,L)) * store(&(r->s20),float,rvv_read_value(20,vl,L)) * store(&(r->s21),float,rvv_read_value(21,vl,L)) * store(&(r->s22),float,rvv_read_value(22,vl,L)) * store(&(r->s23),float,rvv_read_value(23,vl,L)) * store(&(r->s24),float,rvv_read_value(24,vl,L)) * store(&(r->s25),float,rvv_read_value(25,vl,L)) * store(&(r->s26),float,rvv_read_value(26,vl,L)) * store(&(r->s27),float,rvv_read_value(27,vl,L)) * store(&(r->s28),float,rvv_read_value(28,vl,L)) * store(&(r->s29),float,rvv_read_value(29,vl,L)) * store(&(r->s30),float,rvv_read_value(30,vl,L)) * store(&(r->s31),float,rvv_read_value(31,vl,L)) */
{
 qcp_rvv_read_lane(p,&(r->s0),vl,0);
 qcp_rvv_read_lane(p,&(r->s1),vl,1);
 qcp_rvv_read_lane(p,&(r->s2),vl,2);
 qcp_rvv_read_lane(p,&(r->s3),vl,3);
 qcp_rvv_read_lane(p,&(r->s4),vl,4);
 qcp_rvv_read_lane(p,&(r->s5),vl,5);
 qcp_rvv_read_lane(p,&(r->s6),vl,6);
 qcp_rvv_read_lane(p,&(r->s7),vl,7);
 qcp_rvv_read_lane(p,&(r->s8),vl,8);
 qcp_rvv_read_lane(p,&(r->s9),vl,9);
 qcp_rvv_read_lane(p,&(r->s10),vl,10);
 qcp_rvv_read_lane(p,&(r->s11),vl,11);
 qcp_rvv_read_lane(p,&(r->s12),vl,12);
 qcp_rvv_read_lane(p,&(r->s13),vl,13);
 qcp_rvv_read_lane(p,&(r->s14),vl,14);
 qcp_rvv_read_lane(p,&(r->s15),vl,15);
 qcp_rvv_read_lane(p,&(r->s16),vl,16);
 qcp_rvv_read_lane(p,&(r->s17),vl,17);
 qcp_rvv_read_lane(p,&(r->s18),vl,18);
 qcp_rvv_read_lane(p,&(r->s19),vl,19);
 qcp_rvv_read_lane(p,&(r->s20),vl,20);
 qcp_rvv_read_lane(p,&(r->s21),vl,21);
 qcp_rvv_read_lane(p,&(r->s22),vl,22);
 qcp_rvv_read_lane(p,&(r->s23),vl,23);
 qcp_rvv_read_lane(p,&(r->s24),vl,24);
 qcp_rvv_read_lane(p,&(r->s25),vl,25);
 qcp_rvv_read_lane(p,&(r->s26),vl,26);
 qcp_rvv_read_lane(p,&(r->s27),vl,27);
 qcp_rvv_read_lane(p,&(r->s28),vl,28);
 qcp_rvv_read_lane(p,&(r->s29),vl,29);
 qcp_rvv_read_lane(p,&(r->s30),vl,30);
 qcp_rvv_read_lane(p,&(r->s31),vl,31);
}

vfloat32m8_t qcp_byvalue_load(const float *p,unsigned long long vl)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && FloatArray::full(p,vl,L)
 Ensure FloatArray::full(p,vl,L) * store(&(__return.s0),float,rvv_read_value(0,vl,L)) * store(&(__return.s1),float,rvv_read_value(1,vl,L)) * store(&(__return.s2),float,rvv_read_value(2,vl,L)) * store(&(__return.s3),float,rvv_read_value(3,vl,L)) * store(&(__return.s4),float,rvv_read_value(4,vl,L)) * store(&(__return.s5),float,rvv_read_value(5,vl,L)) * store(&(__return.s6),float,rvv_read_value(6,vl,L)) * store(&(__return.s7),float,rvv_read_value(7,vl,L)) * store(&(__return.s8),float,rvv_read_value(8,vl,L)) * store(&(__return.s9),float,rvv_read_value(9,vl,L)) * store(&(__return.s10),float,rvv_read_value(10,vl,L)) * store(&(__return.s11),float,rvv_read_value(11,vl,L)) * store(&(__return.s12),float,rvv_read_value(12,vl,L)) * store(&(__return.s13),float,rvv_read_value(13,vl,L)) * store(&(__return.s14),float,rvv_read_value(14,vl,L)) * store(&(__return.s15),float,rvv_read_value(15,vl,L)) * store(&(__return.s16),float,rvv_read_value(16,vl,L)) * store(&(__return.s17),float,rvv_read_value(17,vl,L)) * store(&(__return.s18),float,rvv_read_value(18,vl,L)) * store(&(__return.s19),float,rvv_read_value(19,vl,L)) * store(&(__return.s20),float,rvv_read_value(20,vl,L)) * store(&(__return.s21),float,rvv_read_value(21,vl,L)) * store(&(__return.s22),float,rvv_read_value(22,vl,L)) * store(&(__return.s23),float,rvv_read_value(23,vl,L)) * store(&(__return.s24),float,rvv_read_value(24,vl,L)) * store(&(__return.s25),float,rvv_read_value(25,vl,L)) * store(&(__return.s26),float,rvv_read_value(26,vl,L)) * store(&(__return.s27),float,rvv_read_value(27,vl,L)) * store(&(__return.s28),float,rvv_read_value(28,vl,L)) * store(&(__return.s29),float,rvv_read_value(29,vl,L)) * store(&(__return.s30),float,rvv_read_value(30,vl,L)) * store(&(__return.s31),float,rvv_read_value(31,vl,L)) */
{
 vfloat32m8_t r;
 __riscv_vle32_v_f32m8(&r,p,vl);
 return r;
}
