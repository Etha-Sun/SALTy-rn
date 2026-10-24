#include "store_arrays.h"
void qcp_f16_store8_array(uint16_t* p,const uint16x8_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::undef_full(p,8)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::full(p,8,f16_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) */
{
 /*@ UShortArray::undef_full(p,8) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,4,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,5,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,6,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,7,unsigned short),unsigned short) */
 qcp_f16_store8(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) * store(pointer_offset(p,4,unsigned short),unsigned short,x4) * store(pointer_offset(p,5,unsigned short),unsigned short,x5) * store(pointer_offset(p,6,unsigned short),unsigned short,x6) * store(pointer_offset(p,7,unsigned short),unsigned short,x7) which implies UShortArray::full(p,8,f16_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) */
}
void qcp_f16_store4_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,4)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,4,f16_pack4(x0,x1,x2,x3)) */
{
 /*@ UShortArray::undef_full(p,4) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) */
 qcp_f16_store4(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) which implies UShortArray::full(p,4,f16_pack4(x0,x1,x2,x3)) */
}
void qcp_f16_store2_0_array(void* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,2)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,2,f16_pack2(x0,x1)) */
{
 /*@ UShortArray::undef_full(p,2) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) */
 qcp_f16_store2_0(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) which implies UShortArray::full(p,2,f16_pack2(x0,x1)) */
}
void qcp_f16_store1_0_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,1)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,1,f16_pack1(x0)) */
{
 /*@ UShortArray::undef_full(p,1) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) */
 qcp_f16_store1_0(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) which implies UShortArray::full(p,1,f16_pack1(x0)) */
}
