#include "fp_primitives.h"

uint32x4_t vld1q_u32(const uint32_t *p) { uint32x4_t r;memcpy(r.lane,p,16);return r; }

uint32x4_t vdupq_n_u32(uint32_t x) { uint32x4_t r={{x,x,x,x}};return r; }

void vst1q_u32(uint32_t *p,uint32x4_t a) { memcpy(p,a.lane,16); }

uint32x2_t vget_low_u32(uint32x4_t a) { uint32x2_t r={{a.lane[0],a.lane[1]}};return r; }

uint32x2_t vget_high_u32(uint32x4_t a) { uint32x2_t r={{a.lane[2],a.lane[3]}};return r; }

void vst1_u32(uint32_t *p,uint32x2_t a) { memcpy(p,a.lane,8); }

void vst1_lane_u32(uint32_t *p,uint32x2_t a,int n) { *p=a.lane[n]; }

/*@ requires \valid_read((const int8_t*)p+(0..7)); assigns \nothing;
 ensures \forall integer j;0<=j<8 ==> \result.lane[j]==\at(((const int8_t*)p)[j],Pre); */
int8x8_t vld1_s8(const void *p) { int8x8_t r;memcpy(&r,p,8);
 /*@ assert qc4_input_bytes_frame: \forall integer j;0<=j<8 ==> ((const unsigned char*)p)[j]==\at(((const unsigned char*)p)[j],Pre); */
 /*@ assert qc4_loaded_bytes: \forall integer j;0<=j<8 ==> ((unsigned char*)&r)[j]==((const unsigned char*)p)[j]; */
 /*@ assert qc4_source_signed_bytes: \forall integer j;0<=j<8 ==> ((const int8_t*)p)[j]==(int8_t)((const unsigned char*)p)[j]; */
 /*@ assert qc4_destination_signed_bytes: \forall integer j;0<=j<8 ==> r.lane[j]==(int8_t)((unsigned char*)&r)[j]; */
 /*@ assert qc4_loaded_signed_values: \forall integer j;0<=j<8 ==> r.lane[j]==\at(((const int8_t*)p)[j],Pre); */
 return r; }

/*@ requires \valid_read((const unsigned char*)p+(0..15)); assigns \nothing;
 ensures \forall integer j;0<=j<4 ==> \result.lane[j]==\at(((const int32_t*)p)[j],Pre); */
int32x4_t vld1q_s32(const void *p) { int32x4_t r;memcpy(&r,p,16); /*@ assert qc4_sload_source_pre: \forall integer j;0<=j<4 ==> ((const int32_t*)p)[j]==\at(((const int32_t*)p)[j],Pre); */ /*@ assert qc4_sload_bytes: \forall integer b;0<=b<16 ==> ((unsigned char*)&r)[b]==((const unsigned char*)p)[b]; */ /*@ assert qc4_sload_bytes_0: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+0))[b]==((const unsigned char*)(((const uint32_t*)p)+0))[b]; */ /*@ assert qc4_sload_word_0: ((uint32_t*)&r)[0]==((const uint32_t*)p)[0]; */ /*@ assert qc4_sload_bytes_1: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+1))[b]==((const unsigned char*)(((const uint32_t*)p)+1))[b]; */ /*@ assert qc4_sload_word_1: ((uint32_t*)&r)[1]==((const uint32_t*)p)[1]; */ /*@ assert qc4_sload_bytes_2: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+2))[b]==((const unsigned char*)(((const uint32_t*)p)+2))[b]; */ /*@ assert qc4_sload_word_2: ((uint32_t*)&r)[2]==((const uint32_t*)p)[2]; */ /*@ assert qc4_sload_bytes_3: \forall integer b;0<=b<4 ==> ((unsigned char*)(((uint32_t*)&r)+3))[b]==((const unsigned char*)(((const uint32_t*)p)+3))[b]; */ /*@ assert qc4_sload_word_3: ((uint32_t*)&r)[3]==((const uint32_t*)p)[3]; */ /*@ assert qc4_sload_words: \forall integer j;0<=j<4 ==> ((uint32_t*)&r)[j]==((const uint32_t*)p)[j]; */ /*@ assert qc4_sload_source_layout: \forall integer j;0<=j<4 ==> ((const int32_t*)p)[j]==(int32_t)((const uint32_t*)p)[j]; */ /*@ assert qc4_sload_destination_layout: \forall integer j;0<=j<4 ==> r.lane[j]==(int32_t)((uint32_t*)&r)[j]; */return r; }

/*@ requires \valid_read(p); assigns \nothing; ensures \forall integer j;0<=j<4 ==> \result.lane[j]==\at(*p,Pre); */
int32x4_t vld1q_dup_s32(const int32_t *p) { int32x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==\at(*p,Pre); loop assigns i,r; loop variant 4-i; */ for(int i=0;i<4;i++)r.lane[i]=*p;return r; }
