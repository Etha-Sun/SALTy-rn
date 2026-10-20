#include "fp_primitives.h"

/*@ requires \valid_read(p+(0..4-1)); assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (ext_same(\result.lane[j],p[j])); */
float32x4_t vld1q_f32(const float *p) {
  float32x4_t r; /*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],p[j]));  loop assigns i,r; loop variant 4-i; */
for(size_t i=0;i<4;i++)r.lane[i]=p[i]; return r;
}

/*@ requires \valid_read(p+(0..2-1)); assigns \nothing; ensures \forall integer j; 0<=j<2 ==> (ext_same(\result.lane[j],p[j])); */
float32x2_t vld1_f32(const float *p) {
  float32x2_t r; /*@ loop invariant 0<=i<=2; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],p[j]));  loop assigns i,r; loop variant 2-i; */
for(size_t i=0;i<2;i++)r.lane[i]=p[i]; return r;
}

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (ext_same(\result.lane[j],x)); */
float32x4_t vdupq_n_f32(float x) {
  float32x4_t r; /*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],x));  loop assigns i,r; loop variant 4-i; */
for(size_t i=0;i<4;i++)r.lane[i]=x; return r;
}

/*@ requires \valid_read(p); assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (ext_same(\result.lane[j],*p)); */
float32x4_t vld1q_dup_f32(const float *p) { return vdupq_n_f32(*p); }

/*@ requires 0<=lane<2; assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (ext_same(\result.lane[j],v.lane[lane])); */
float32x4_t vdupq_lane_f32(float32x2_t v,int lane) { return vdupq_n_f32(v.lane[lane]); }

/*@ requires \valid(p+(0..4-1)); assigns p[0..4-1]; ensures \forall integer j; 0<=j<4 ==> (ext_same(p[j],v.lane[j]));  ensures prefix_frame: \forall float *base; \forall integer n,j; n>=0 && p==base+n && 0<=j<n && \valid_read{Pre}(base+j) ==> \valid_read(base+j) && ext_same(base[j],\at(base[j],Pre)); */
void vst1q_f32(float *p,float32x4_t v) { /*@ loop invariant 0<=i<=4; loop invariant just_written: 0<i ==> ext_same(p[i-1],v.lane[i-1]); loop invariant \forall integer j; 0<=j<i ==> (ext_same(p[j],v.lane[j]));   loop invariant readonly_source: \forall integer j;0<=j<4 ==> ext_same(v.lane[j],\at(v.lane[j],Pre));  loop invariant prefix_words: \forall float *base; \forall integer n,j; n>=0 && p==base+n && 0<=j<n && \valid_read{Pre}(base+j) ==> *((uint32_t*)(base+j))==\at(*((uint32_t*)(base+j)),Pre);  loop invariant prefix_frame: \forall float *base; \forall integer n,j; n>=0 && p==base+n && 0<=j<n && \valid_read{Pre}(base+j) ==> \valid_read(base+j) && ext_same(base[j],\at(base[j],Pre)); loop assigns i,p[0..4-1]; loop variant 4-i; */
for(size_t i=0;i<4;i++) /*@ assert store_prefix_separated: \forall float *base; \forall integer n,j; 0<=n && p==base+n && 0<=j<n ==> \separated(base+j,p+i); */ /*@ assert store_written_separated: \forall integer j;0<=j<i ==> \separated(p+j,p+i); */ p[i]=v.lane[i]; }

/*@ requires \valid(p+(0..2-1)); assigns p[0..2-1]; ensures \forall integer j; 0<=j<2 ==> (ext_same(p[j],v.lane[j]));  ensures prefix_frame: \forall float *base; \forall integer n,j; n>=0 && p==base+n && 0<=j<n && \valid_read{Pre}(base+j) ==> \valid_read(base+j) && ext_same(base[j],\at(base[j],Pre)); */
void vst1_f32(float *p,float32x2_t v) { /*@ loop invariant 0<=i<=2; loop invariant just_written: 0<i ==> ext_same(p[i-1],v.lane[i-1]); loop invariant \forall integer j; 0<=j<i ==> (ext_same(p[j],v.lane[j]));   loop invariant readonly_source: \forall integer j;0<=j<2 ==> ext_same(v.lane[j],\at(v.lane[j],Pre));  loop invariant prefix_words: \forall float *base; \forall integer n,j; n>=0 && p==base+n && 0<=j<n && \valid_read{Pre}(base+j) ==> *((uint32_t*)(base+j))==\at(*((uint32_t*)(base+j)),Pre);  loop invariant prefix_frame: \forall float *base; \forall integer n,j; n>=0 && p==base+n && 0<=j<n && \valid_read{Pre}(base+j) ==> \valid_read(base+j) && ext_same(base[j],\at(base[j],Pre)); loop assigns i,p[0..2-1]; loop variant 2-i; */
for(size_t i=0;i<2;i++) /*@ assert store_prefix_separated: \forall float *base; \forall integer n,j; 0<=n && p==base+n && 0<=j<n ==> \separated(base+j,p+i); */ /*@ assert store_written_separated: \forall integer j;0<=j<i ==> \separated(p+j,p+i); */ p[i]=v.lane[i]; }

/*@ requires \valid(p); requires 0<=lane<2; assigns p[0..1-1]; ensures ext_same(*p,v.lane[lane]); */
void vst1_lane_f32(float *p,float32x2_t v,int lane) { *p=v.lane[lane]; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<2 ==> (ext_same(\result.lane[j],v.lane[j])); */
float32x2_t vget_low_f32(float32x4_t v) { float32x2_t r={{v.lane[0],v.lane[1]}};return r; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<2 ==> (ext_same(\result.lane[j],v.lane[j+2])); */
float32x2_t vget_high_f32(float32x4_t v) { float32x2_t r={{v.lane[2],v.lane[3]}};return r; }

/*@  assigns \nothing; ensures \result==(n<16?n:16); */
size_t __riscv_vsetvl_e32m4(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (ext_same(\result.lane[j],x)); */
float32x4_t vmovq_n_f32(float x) { return vdupq_n_f32(x); }

/*@ requires \valid_read(p); assigns \nothing; ensures \forall integer j; 0<=j<2 ==> (ext_same(\result.lane[j],*p)); */
float32x2_t vld1_dup_f32(const float *p) { float32x2_t r={{*p,*p}};return r; }

float32x4x2_t vld2q_dup_f32(const float *p) { float32x4x2_t r={{vdupq_n_f32(p[0]),vdupq_n_f32(p[1])}};return r; }

float32x2x2_t vld2_dup_f32(const float *p) { float32x2x2_t r={{vld1_dup_f32(p),vld1_dup_f32(p+1)}};return r; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> ((j<2 ? ext_same(\result.lane[j],a.lane[j]) : ext_same(\result.lane[j],b.lane[j-2]))); */
float32x4_t vcombine_f32(float32x2_t a,float32x2_t b) { float32x4_t r={{a.lane[0],a.lane[1],b.lane[0],b.lane[1]}};return r; }

/*@ requires 0<=n<=4; assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (j+n<4 ? ext_same(\result.lane[j],a.lane[j+n]) : ext_same(\result.lane[j],b.lane[j+n-4])); */
float32x4_t vextq_f32(float32x4_t a,float32x4_t b,int n) { float32x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> (j+n<4 ? ext_same(r.lane[j],a.lane[j+n]) : ext_same(r.lane[j],b.lane[j+n-4]));  loop assigns i,r; loop variant 4-i; */
for(int i=0;i<4;i++)r.lane[i]=i+n<4?a.lane[i+n]:b.lane[i+n-4];return r; }

/*@ requires 0<=n<2; assigns \nothing; ensures ext_same(\result,a.lane[n]); */
float vget_lane_f32(float32x2_t a,int n) { return a.lane[n]; }

/*@ requires \valid_read(p); requires 0<=n<4; assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (j==n ? ext_same(\result.lane[j],*p) : ext_same(\result.lane[j],a.lane[j])); */
float32x4_t vld1q_lane_f32(const float *p,float32x4_t a,int n) { a.lane[n]=*p;return a; }

/*@ requires \valid(p); requires 0<=n<4; assigns p[0..1-1]; ensures ext_same(*p,a.lane[n]); */
void vst1q_lane_f32(float *p,float32x4_t a,int n) { *p=a.lane[n]; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (j%2==0 ? ext_same(\result.lane[j],a.lane[j/2]) : ext_same(\result.lane[j],b.lane[j/2])); */
float32x4_t vzip1q_f32(float32x4_t a,float32x4_t b) { float32x4_t r={{a.lane[0],b.lane[0],a.lane[1],b.lane[1]}};return r; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (j%2==0 ? ext_same(\result.lane[j],a.lane[j/2+2]) : ext_same(\result.lane[j],b.lane[j/2+2])); */
float32x4_t vzip2q_f32(float32x4_t a,float32x4_t b) { float32x4_t r={{a.lane[2],b.lane[2],a.lane[3],b.lane[3]}};return r; }

/*@  assigns \nothing; ensures \result==16; */
size_t __riscv_vsetvlmax_e32m4(void) { return 16; }

/*@  assigns \nothing; ensures \result==(n<4?n:4); */
size_t __riscv_vsetvl_e32m1(size_t n) { return n<4?n:4; }

/*@  assigns \nothing; ensures \result==4; */
size_t __riscv_vsetvlmax_e32m1(void) { return 4; }

/*@  assigns \nothing; ensures \result==(n<8?n:8); */
size_t __riscv_vsetvl_e32m2(size_t n) { return n<8?n:8; }

/*@  assigns \nothing; ensures \result==8; */
size_t __riscv_vsetvlmax_e32m2(void) { return 8; }

/*@  assigns \nothing; ensures \result==(n<32?n:32); */
size_t __riscv_vsetvl_e32m8(size_t n) { return n<32?n:32; }

/*@  assigns \nothing; ensures \result==32; */
size_t __riscv_vsetvlmax_e32m8(void) { return 32; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (\result.lane[j]==a.lane[j]); */
int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> (r.lane[j]==a.lane[j]);  loop assigns i,r; loop variant 4-i; */
for(int i=0;i<4;i++)r.lane[i]=a.lane[i];return r; }

/*@  assigns \nothing; ensures \forall integer j; 0<=j<4 ==> (\result.lane[j]==a.lane[j+4]); */
int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r;/*@ loop invariant 0<=i<=4; loop invariant \forall integer j; 0<=j<i ==> (r.lane[j]==a.lane[j+4]);  loop assigns i,r; loop variant 4-i; */
for(int i=0;i<4;i++)r.lane[i]=a.lane[i+4];return r; }
