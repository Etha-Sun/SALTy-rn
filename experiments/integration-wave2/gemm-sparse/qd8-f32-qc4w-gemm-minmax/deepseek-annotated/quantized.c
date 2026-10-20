#include "fp_primitives.h"

uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]+=b.lane[i];return a; }

vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }

void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }

/*@ assigns \nothing; ensures \result==(int32_t)u; */
int32_t bits_i32(uint32_t u) { int32_t r;memcpy(&r,&u,4);
 /*@ assert qc4_bits_source_unchanged: u==\at(u,Pre); */
 /*@ assert qc4_bits_bytes: \forall integer b;0<=b<4 ==> ((unsigned char*)&r)[b]==((unsigned char*)&u)[b]; */
 /*@ assert qc4_bits_word: *(uint32_t*)&r==u; */
 /*@ assert qc4_bits_signed_layout: r==(int32_t)(*(uint32_t*)&r); */
 return r; }

/*@ assigns \nothing; ensures \result==(int8_t)u; */
int8_t bits_i8(uint8_t u) { int8_t r;memcpy(&r,&u,1);
 /*@ assert qc4_byte_source_unchanged: u==\at(u,Pre); */
 /*@ assert qc4_copied_byte: *(uint8_t*)&r==u; */
 /*@ assert qc4_signed_byte_layout: r==(int8_t)(*(uint8_t*)&r); */
 return r; }

/*@ requires n<32; assigns \nothing; ensures \result==core_ashr32(x,n); ensures n==4 ==> \result==(x>>4); */
int32_t arithmetic_shift32(int32_t x,unsigned n) { int64_t d=INT64_C(1)<<n;int64_t v=x; /*@ assert qc4_shift_d_range:1<=d<=2147483648; */ /*@ assert qc4_shift_result_range:-2147483648<=(v>=0?v/d:-((-v+d-1)/d))<=2147483647; */ /*@ assert qc4_shift_int64_neg:(int64_t)(-v)==-v; */ /*@ assert qc4_shift_int64_add:(int64_t)((int64_t)(-v)+d)==-v+d; */ /*@ assert qc4_shift_int64_numerator:(int64_t)((int64_t)((int64_t)(-v)+d)-1)==-v+d-1; */ /*@ assert qc4_shift_casted_formula:(int32_t)(v>=0?v/d:-((-v+d-1)/d))==core_ashr32(x,n); */ return (int32_t)(v>=0?v/d:-((-v+d-1)/d)); }

/*@ assigns \nothing; ensures \forall integer j;0<=j<8 ==> \result.lane[j]==x; */
int8x8_t vmov_n_s8(int8_t x) { int8x8_t r;/*@ loop invariant 0<=i<=8; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==x; loop assigns i,r; loop variant 8-i; */ for(int i=0;i<8;i++)r.lane[i]=x;return r; }

/*@ requires n<8; assigns \nothing; ensures \forall integer j;0<=j<8 ==> \result.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j]<<n);  ensures core_low_value_vshl_n_s8: \forall integer j;0<=j<8 && n==4 ==> \result.lane[j]==16*core_nibble((uint8_t)\at(a,Pre).lane[j],0); */
int8x8_t vshl_n_s8(int8x8_t a,unsigned n) { /*@ loop invariant 0<=i<=8; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j]<<n); loop invariant \forall integer j;i<=j<8 ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant 8-i; */ for(int i=0;i<8;i++)/*@ assert qc4_byte_shift_range: 0<=((uint8_t)a.lane[i]<<n)<=32640; */ a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }

/*@ assigns \nothing; ensures \forall integer j;0<=j<8 ==> \result.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j] & (uint8_t)b.lane[j]);  ensures core_high_value_vand_s8: \forall integer j;0<=j<8 && (uint8_t)b.lane[j]==240 ==> \result.lane[j]==16*core_nibble((uint8_t)\at(a,Pre).lane[j],1); */
int8x8_t vand_s8(int8x8_t a,int8x8_t b) { /*@ loop invariant 0<=i<=8; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j] & (uint8_t)b.lane[j]); loop invariant \forall integer j;i<=j<8 ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant 8-i; */ for(int i=0;i<8;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)b.lane[i]);return a; }

/*@ assigns \nothing; ensures \forall integer j;0<=j<8 ==> \result.lane[j]==a.lane[j]; */
int16x8_t vmovl_s8(int8x8_t a) { int16x8_t r;/*@ loop invariant 0<=i<=8; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==a.lane[j]; loop assigns i,r; loop variant 8-i; */ for(int i=0;i<8;i++)r.lane[i]=a.lane[i];return r; }

/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> \result.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]*(uint32_t)b.lane[j]); */
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b) { /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]*(uint32_t)b.lane[j]); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant 4-i; */ for(int i=0;i<4;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]*(uint32_t)b.lane[i]);return a; }

/*@ requires 0<=lane<4; assigns \nothing; ensures \forall integer j;0<=j<4 ==> \result.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]+(uint32_t)((int32_t)b.lane[j]*c.lane[lane])); */
int32x4_t vmlal_lane_s16(int32x4_t a,int16x4_t b,int16x4_t c,int lane) { /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]+(uint32_t)((int32_t)b.lane[j]*c.lane[lane])); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant 4-i; */ for(int i=0;i<4;i++)/*@ assert qc4_mac_current_pre: a.lane[i]==\at(a,Pre).lane[i]; */
 /*@ assert qc4_mac_operand_ranges: -32768<=b.lane[i]<=32767 && -32768<=c.lane[lane]<=32767; */
 /*@ assert qc4_mac_product_range: -1073741824<=(integer)b.lane[i]*c.lane[lane]<=1073741824; */
 a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)b.lane[i]*c.lane[lane]));return a; }

/*@ requires n<32; assigns \nothing; ensures \forall integer j;0<=j<4 ==> \result.lane[j]==core_ashr32(\at(a.lane[j],Pre),n); ensures \forall integer j; n==4 && 0<=j<4 ==> \result.lane[j]==(\at(a.lane[j],Pre)>>4); */
int32x4_t vshrq_n_s32(int32x4_t a,unsigned n) { /*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==core_ashr32(\at(a.lane[j],Pre),n); loop invariant \forall integer j;i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant 4-i; */ for(int i=0;i<4;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }

/*@ assigns \nothing; ensures \forall integer j;0<=j<4 ==> ext_same(\result.lane[j],(float)a.lane[j]); */
float32x4_t vcvtq_f32_s32(int32x4_t a) { float32x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> ext_same(r.lane[j],(float)a.lane[j]); loop assigns i,r; loop variant 4-i; */ for(int i=0;i<4;i++)r.lane[i]=(float)a.lane[i];return r; }

/*@ requires vl<=32; requires \valid_read(p+(0..vl-1)); assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> \result.lane[j]==\at(p[j],Pre); */
vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl) { vint32m8_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==\at(p[j],Pre); loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]*(uint32_t)x); */
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]*(uint32_t)x); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]*(uint32_t)x);return a; }

/*@ requires vl<=32; requires \valid_read(p+(0..vl-1)); assigns \nothing;
 ensures \forall integer j;0<=j<vl ==> \result.lane[j]==\at(p[j],Pre); */
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==\at(p[j],Pre); loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

/*@ requires vl<=32; requires n<8; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j]<<n);  ensures core_low_value___riscv_vsll_vx_i8m2: \forall integer j;0<=j<vl && n==4 ==> \result.lane[j]==16*core_nibble((uint8_t)\at(a,Pre).lane[j],0); */
vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j]<<n); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)/*@ assert qc4_byte_shift_range: 0<=((uint8_t)a.lane[i]<<n)<=32640; */ a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j] & (uint8_t)x);  ensures core_high_value___riscv_vand_vx_i8m2: \forall integer j;0<=j<vl && x==-16 ==> \result.lane[j]==16*core_nibble((uint8_t)\at(a,Pre).lane[j],1); */
vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int8_t)(uint8_t)((uint8_t)\at(a,Pre).lane[j] & (uint8_t)x); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)x);return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==a.lane[j]; */
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==a.lane[j]; loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i];return r; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]+(uint32_t)((int32_t)x*b.lane[j])); */
vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,int16_t x,vint16m4_t b,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int32_t)((uint32_t)\at(a,Pre).lane[j]+(uint32_t)((int32_t)x*b.lane[j])); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a,Pre).lane[j]; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)/*@ assert qc4_mac_current_pre: a.lane[i]==\at(a,Pre).lane[i]; */
 /*@ assert qc4_mac_operand_ranges: -32768<=x<=32767 && -32768<=b.lane[i]<=32767; */
 /*@ assert qc4_mac_product_range: -1073741824<=(integer)x*b.lane[i]<=1073741824; */
 a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)x*b.lane[i]));return a; }

/*@ requires n<32; requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==core_ashr32(\at(a.lane[j],Pre),n); ensures \forall integer j; n==4 && 0<=j<vl ==> \result.lane[j]==(\at(a.lane[j],Pre)>>4); */
vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,unsigned n,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==core_ashr32(\at(a.lane[j],Pre),n); loop invariant \forall integer j;i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> ext_same(\result.lane[j],(float)a.lane[j]); */
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> ext_same(r.lane[j],(float)a.lane[j]); loop assigns i,r; loop variant vl-i; */ for(size_t i=0;i<vl;i++)r.lane[i]=(float)a.lane[i];return r; }
