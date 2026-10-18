/* qs8-rsum: one self-contained C/ACSL proof input.
 * Source provenance and model boundary: provenance.json and README.zh-CN.txt.
 * Section markers are checked by audit.py; local proof headers are flattened.
 */

/* BEGIN COMPONENT shim.h */
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>

/* Minimal experiment: LP64, little endian, VLEN=128. */
_Static_assert(sizeof(size_t) == 8 && sizeof(int) == 4, "LP64 required");
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_ALIGN(n) _Alignas(n)
#define XNN_ARCH_ARM64 1
#define RVV_CAP 32
#define RVV_M1_CAP 4
struct xnn_qs8_rsum_params { char unused; };
typedef struct { int8_t lane[16]; } int8x16_t;
typedef struct { uint16_t lane[8]; } int16x8_t;
typedef struct { uint32_t lane[4]; } int32x4_t;
typedef struct { int8_t lane[RVV_CAP]; } vint8m2_t;
typedef struct { uint32_t lane[RVV_CAP]; } vint32m8_t;
typedef struct { uint32_t lane[RVV_M1_CAP]; } vint32m1_t;

/* Definitions, not axioms. Stored vector halfwords/words are raw bits. */
/*@
  logic integer u32(integer x) = ((x % 4294967296) + 4294967296) % 4294967296;
  logic integer s32(integer x) = u32(x) < 2147483648 ? u32(x) : u32(x)-4294967296;
  logic integer s16(integer x) = x < 32768 ? x : x-65536;
  logic integer s8(integer x) = (uint8_t)x < 128 ? (uint8_t)x : (integer)(uint8_t)x-256;
  logic integer sum8{L}(int8_t *p, integer n) =
    n <= 0 ? 0 : sum8(p,n-1) + p[n-1];
  logic integer words4(int32x4_t v) =
    v.lane[0]+v.lane[1]+v.lane[2]+v.lane[3];
  logic integer halves8(int16x8_t v) =
    s16(v.lane[0])+s16(v.lane[1])+s16(v.lane[2])+s16(v.lane[3])+
    s16(v.lane[4])+s16(v.lane[5])+s16(v.lane[6])+s16(v.lane[7]);
  logic integer words32(vint32m8_t v, integer n) =
    n <= 0 ? 0 : words32(v,n-1)+v.lane[n-1];
*/

/*@ assigns \nothing; ensures \result == s32(x); */
int32_t signed32(uint32_t x);
/*@ assigns \nothing; ensures \result == s16(x); */
int32_t signed16(uint16_t x);

/*@ assigns \nothing;
    ensures \forall integer i; 0 <= i < 4 ==> \result.lane[i] == (uint32_t)x; */
int32x4_t vmovq_n_s32(int32_t x);
/*@ assigns \nothing;
    ensures \forall integer i; 0 <= i < 8 ==> \result.lane[i] == (uint16_t)x; */
int16x8_t vmovq_n_s16(int16_t x);
/*@ requires \valid_read(p+(0..15)); assigns \nothing;
    ensures \forall integer i; 0 <= i < 16 ==> \result.lane[i] == p[i]; */
int8x16_t vld1q_s8(const int8_t *p);
/*@ assigns \nothing;
    ensures \forall integer i; 0 <= i < 8 ==>
      \result.lane[i] == (uint16_t)(a.lane[i]+b.lane[2*i]+b.lane[2*i+1]); */
int16x8_t vpadalq_s8(int16x8_t a, int8x16_t b);
/*@ assigns \nothing;
    ensures \forall integer i; 0 <= i < 4 ==>
      \result.lane[i] == u32(a.lane[i]+s16(b.lane[2*i])+s16(b.lane[2*i+1])); */
int32x4_t vpadalq_s16(int32x4_t a, int16x8_t b);
/*@ assigns \nothing;
    ensures \forall integer i; 0 <= i < 16 ==>
      \result.lane[i] == s8(a.lane[i]*b.lane[i]); */
int8x16_t vmulq_s8(int8x16_t a, int8x16_t b);
/*@ assigns \nothing; ensures \result == s32(words4(a)); */
int32_t vaddvq_s32(int32x4_t a);

/*@ assigns \nothing; ensures \result == RVV_CAP; */
size_t __riscv_vsetvlmax_e32m8(void);
/*@ assigns \nothing; ensures \result == RVV_M1_CAP; */
size_t __riscv_vsetvlmax_e32m1(void);
/*@ assigns \nothing; ensures \result == (n < RVV_CAP ? n : RVV_CAP); */
size_t __riscv_vsetvl_e8m2(size_t n);
/*@ requires vl <= RVV_CAP; assigns \nothing;
    ensures \forall integer i; 0 <= i < vl ==> \result.lane[i] == (uint32_t)x; */
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x, size_t vl);
/*@ requires vl <= RVV_M1_CAP; assigns \nothing;
    ensures \forall integer i; 0 <= i < vl ==> \result.lane[i] == (uint32_t)x; */
vint32m1_t __riscv_vmv_v_x_i32m1(int32_t x, size_t vl);
/*@ requires vl <= RVV_CAP; requires \valid_read(p+(0..vl-1)); assigns \nothing;
    ensures \forall integer i; 0 <= i < vl ==> \result.lane[i] == p[i]; */
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p, size_t vl);
/*@ requires vl <= RVV_CAP; assigns \nothing;
    ensures \forall integer i; 0 <= i < vl ==> \result.lane[i] == u32(a.lane[i]); */
vint32m8_t __riscv_vsext_vf4_i32m8(vint8m2_t a, size_t vl);
/*@ requires vl <= RVV_CAP; assigns \nothing;
    ensures \forall integer i; 0 <= i < vl ==>
      \result.lane[i] == u32(a.lane[i]+b.lane[i]);
    ensures \forall integer i; vl <= i < RVV_CAP ==> \result.lane[i] == old.lane[i]; */
vint32m8_t __riscv_vadd_vv_i32m8_tu(vint32m8_t old, vint32m8_t a, vint32m8_t b, size_t vl);
/*@ requires 0 < vl <= RVV_CAP; assigns \nothing;
    ensures \result.lane[0] == u32(seed.lane[0]+words32(a,vl)); */
vint32m1_t __riscv_vredsum_vs_i32m8_i32m1(vint32m8_t a, vint32m1_t seed, size_t vl);
/*@ assigns \nothing; ensures \result == s32(a.lane[0]); */
int32_t __riscv_vmv_x_s_i32m1_i32(vint32m1_t a);
/* END COMPONENT shim.h */

/* BEGIN COMPONENT shim.c */
int32_t signed32(uint32_t x) {
  return x <= INT32_MAX ? (int32_t)x : (int32_t)((int64_t)x-4294967296LL);
}
int32_t signed16(uint16_t x) {
  return x < 32768 ? (int32_t)x : (int32_t)x-65536;
}
int32x4_t vmovq_n_s32(int32_t x) {
  int32x4_t r;
  /*@ loop invariant 0 <= i <= 4;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == (uint32_t)x;
      loop assigns i,r; loop variant 4-i; */
  for (size_t i=0;i<4;i++) r.lane[i]=(uint32_t)x;
  return r;
}
int16x8_t vmovq_n_s16(int16_t x) {
  int16x8_t r;
  /*@ loop invariant 0 <= i <= 8;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == (uint16_t)x;
      loop assigns i,r; loop variant 8-i; */
  for (size_t i=0;i<8;i++) r.lane[i]=(uint16_t)x;
  return r;
}
int8x16_t vld1q_s8(const int8_t *p) {
  int8x16_t r;
  /*@ loop invariant 0 <= i <= 16;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == p[j];
      loop assigns i,r; loop variant 16-i; */
  for (size_t i=0;i<16;i++) r.lane[i]=p[i];
  return r;
}
int16x8_t vpadalq_s8(int16x8_t a,int8x16_t b) {
  int16x8_t r;
  /*@ loop invariant 0 <= i <= 8;
      loop invariant \forall integer j; 0 <= j < i ==>
        r.lane[j] == (uint16_t)(a.lane[j]+b.lane[2*j]+b.lane[2*j+1]);
      loop assigns i,r; loop variant 8-i; */
  for (size_t i=0;i<8;i++) r.lane[i]=(uint16_t)(a.lane[i]+b.lane[2*i]+b.lane[2*i+1]);
  return r;
}
int32x4_t vpadalq_s16(int32x4_t a,int16x8_t b) {
  int32x4_t r;
  /*@ loop invariant 0 <= i <= 4;
      loop invariant \forall integer j; 0 <= j < i ==>
        r.lane[j] == u32(a.lane[j]+s16(b.lane[2*j])+s16(b.lane[2*j+1]));
      loop assigns i,r; loop variant 4-i; */
  for (size_t i=0;i<4;i++)
    r.lane[i]=a.lane[i]+(uint32_t)signed16(b.lane[2*i])+(uint32_t)signed16(b.lane[2*i+1]);
  return r;
}
int8x16_t vmulq_s8(int8x16_t a,int8x16_t b) {
  int8x16_t r;
  /*@ loop invariant 0 <= i <= 16;
      loop invariant \forall integer j; 0 <= j < i ==>
        r.lane[j] == s8(a.lane[j]*b.lane[j]);
      loop assigns i,r; loop variant 16-i; */
  for (size_t i=0;i<16;i++) {
    uint8_t bits=(uint8_t)(a.lane[i]*b.lane[i]);
    int value=bits;
    if (value>=128) value-=256;
    //@ assert -128 <= value <= 127;
    //@ assert value == s8((integer)a.lane[i]*b.lane[i]);
    r.lane[i]=(int8_t)value;
  }
  return r;
}
int32_t vaddvq_s32(int32x4_t a) {
  return signed32(a.lane[0]+a.lane[1]+a.lane[2]+a.lane[3]);
}
size_t __riscv_vsetvlmax_e32m8(void) { return RVV_CAP; }
size_t __riscv_vsetvlmax_e32m1(void) { return RVV_M1_CAP; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl) {
  vint32m8_t r={{0}};
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == (uint32_t)x;
      loop assigns i,r; loop variant vl-i; */
  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)x;
  return r;
}
vint32m1_t __riscv_vmv_v_x_i32m1(int32_t x,size_t vl) {
  vint32m1_t r={{0}};
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == (uint32_t)x;
      loop assigns i,r; loop variant vl-i; */
  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)x;
  return r;
}
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) {
  vint8m2_t r={{0}};
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == p[j];
      loop assigns i,r; loop variant vl-i; */
  for (size_t i=0;i<vl;i++) r.lane[i]=p[i];
  return r;
}
vint32m8_t __riscv_vsext_vf4_i32m8(vint8m2_t a,size_t vl) {
  vint32m8_t r={{0}};
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0 <= j < i ==> r.lane[j] == u32(a.lane[j]);
      loop assigns i,r; loop variant vl-i; */
  for (size_t i=0;i<vl;i++) r.lane[i]=(uint32_t)(int32_t)a.lane[i];
  return r;
}
vint32m8_t __riscv_vadd_vv_i32m8_tu(vint32m8_t old,vint32m8_t a,vint32m8_t b,size_t vl) {
  /*@ loop invariant 0 <= i <= vl;
      loop invariant \forall integer j; 0 <= j < i ==> old.lane[j] == u32(a.lane[j]+b.lane[j]);
      loop invariant \forall integer j; i <= j < RVV_CAP ==> old.lane[j] == \at(old.lane[j],Pre);
      loop assigns i,old; loop variant vl-i; */
  for (size_t i=0;i<vl;i++) old.lane[i]=a.lane[i]+b.lane[i];
  return old;
}
vint32m1_t __riscv_vredsum_vs_i32m8_i32m1(vint32m8_t a,vint32m1_t seed,size_t vl) {
  uint32_t sum=seed.lane[0];
  /*@ loop invariant 0 <= i <= vl;
      loop invariant sum == u32(seed.lane[0]+words32(a,i));
      loop assigns i,sum; loop variant vl-i; */
  for (size_t i=0;i<vl;i++) sum+=a.lane[i];
  seed.lane[0]=sum;
  return seed;
}
int32_t __riscv_vmv_x_s_i32m1_i32(vint32m1_t a) { return signed32(a.lane[0]); }
/* END COMPONENT shim.c */

/* BEGIN COMPONENT proof_s16.h */
/* This is ghost proof code, not a change to the C shim or its contracts. */
/*@ ghost
/@ requires -256 <= y <= 254;
    requires -32768 <= s16(x)+y <= 32767;
    terminates \true;
    assigns \nothing;
    ensures s16((uint16_t)((integer)x+y)) == s16(x)+y;
@/
void proof_s16_add(uint16_t x, int y) { } */
/*@ logic integer bytes16(int8x16_t v) =
  v.lane[0]+v.lane[1]+v.lane[2]+v.lane[3]+
  v.lane[4]+v.lane[5]+v.lane[6]+v.lane[7]+
  v.lane[8]+v.lane[9]+v.lane[10]+v.lane[11]+
  v.lane[12]+v.lane[13]+v.lane[14]+v.lane[15]; */

/*@ ghost
/@ requires a <= SIZE_MAX-b;
   requires \valid_read(p+(0..(integer)a+b-1));
   terminates \true;
   assigns \nothing;
   ensures sum8(p,(integer)a+b) == sum8(p,a)+sum8(p+a,b);
@/
void lemma_sum8_split(const int8_t *p,size_t a,size_t b) {
  /@ loop invariant 0 <= i <= b;
     loop invariant sum8(p,(integer)a+i) == sum8(p,a)+sum8(p+a,i);
     loop assigns i;
     loop variant b-i;
  @/
  for(size_t i=0;i<b;i++) { }
}
*/

/*@ ghost
/@ requires \forall integer j; 0 <= j < 4 ==>
     r.lane[j] == u32(a.lane[j]+s16(b.lane[2*j])+s16(b.lane[2*j+1]));
   terminates \true;
   assigns \nothing;
   ensures u32(words4(r)) == u32(words4(a)+halves8(b));
@/
void proof_widen(int32x4_t a, int16x8_t b, int32x4_t r) { }
*/
/*@ logic integer bytes_prefix(int8x16_t v, integer n) =
  n <= 0 ? 0 : bytes_prefix(v,n-1)+v.lane[n-1]; */
/*@ ghost
/@ requires n <= 16;
   requires \valid_read(p+(0..15));
   requires \forall integer j; 0 <= j < 16 ==> v.lane[j] == (j < n ? p[j] : 0);
   terminates \true;
   assigns \nothing;
   ensures bytes16(v) == sum8(p,n);
@/
void proof_load_sum(const int8_t *p, size_t n, int8x16_t v) {
  /@ loop invariant 0 <= i <= 16;
     loop invariant bytes_prefix(v,i) == sum8(p,i<n ? i : n);
     loop assigns i;
     loop variant 16-i;
  @/
  for (int i=0; i<16; i++) { }
}
*/
/*@ ghost
/@ terminates \true;
   assigns \nothing;
   ensures \forall integer x,y,z; u32(x)==u32(y) ==> u32(x+z)==u32(y+z);
@/
void proof_u32_congruence(void) { }
*/
/*@ ghost
/@ requires n <= SIZE_MAX-k;
   requires \valid_read(p+(0..(integer)n+k-1));
   requires u32(words4(a)) == u32(sum8(p,n));
   requires halves8(b) == sum8(p+n,k);
   requires \forall integer j; 0 <= j < 4 ==>
     r.lane[j] == u32(a.lane[j]+s16(b.lane[2*j])+s16(b.lane[2*j+1]));
   terminates \true;
   assigns \nothing;
   ensures u32(words4(r)) == u32(sum8(p,(integer)n+k));
@/
void proof_prefix_widen(int32x4_t a, int16x8_t b, int32x4_t r,
                        const int8_t *p, size_t n, size_t k) {
  proof_u32_congruence();
  lemma_sum8_split(p,n,k);
  proof_widen(a,b,r);
  /@ assert u32(words4(a)+halves8(b)) == u32(sum8(p,n)+halves8(b)); @/
  /@ assert sum8(p,(integer)n+k) == sum8(p,n)+halves8(b); @/
}
*/
/* END COMPONENT proof_s16.h */

/* BEGIN COMPONENT proof_math.h */
/*@ ghost
/@ terminates \true;
   assigns \nothing;
   ensures \forall integer x,y,z; u32(x)==u32(y) ==> u32(x+z)==u32(y+z);
@/
void rvv_proof_u32_congruence(void) { }
/@ terminates \true;
   assigns \nothing;
   ensures \forall integer x,y; u32(x+y)==u32(u32(x)+u32(y));
   ensures \forall integer x,y; u32(x+u32(y))==u32(x+y);
   ensures \forall integer x,y; u32(x-y)==u32(u32(x)-u32(y));
@/
void rvv_proof_u32_normalize(void) { }
/@ terminates \true;
   assigns \nothing;
   ensures \forall integer a,b,c,d;
      u32(a)==u32(b) && u32(c+b)==u32(a+d) ==> u32(c)==u32(d);
@/
void rvv_proof_u32_cross_cancel(void) { }
/@ terminates \true;
   assigns \nothing;
   ensures \forall integer x; s32(u32(x)) == s32(x);
@/
void rvv_proof_s32_u32(void) { }
*/
/* END COMPONENT proof_math.h */

/* BEGIN COMPONENT proof_helpers.h */
/*@ ghost
/@    requires 0 <= k < RVV_CAP;
   requires n <= SIZE_MAX-k-1;
   requires \valid_read(p+(0..n+k));
   requires current.lane[k] == u32(previous.lane[k]+u32(p[n+k]));
   requires u32(words32(current,k)+sum8(p,n)) ==
            u32(words32(previous,k)+sum8(p,n+k));
   terminates \true;
   assigns \nothing;
   ensures u32(words32(current,k+1)+sum8(p,n)) ==
           u32(words32(previous,k+1)+sum8(p,n+k+1));
@/
void lemma_rvv_active(vint32m8_t previous,vint32m8_t current,const int8_t *p,size_t n,size_t k) {
  rvv_proof_u32_normalize();
  rvv_proof_u32_congruence();
  /@ assert words32(current,k+1) == words32(current,k)+current.lane[k]; @/
  /@ assert words32(previous,k+1) == words32(previous,k)+previous.lane[k]; @/
  /@ assert sum8(p,n+k+1) == sum8(p,n+k)+p[n+k]; @/
  /@ assert u32(current.lane[k]) == u32(previous.lane[k]+p[n+k]); @/
  /@ assert u32(words32(current,k)+sum8(p,n)+current.lane[k]) ==
       u32(u32(words32(current,k)+sum8(p,n))+u32(current.lane[k])); @/
  /@ assert u32(words32(previous,k)+sum8(p,n+k)+previous.lane[k]+p[n+k]) ==
       u32(u32(words32(previous,k)+sum8(p,n+k))+u32(previous.lane[k]+p[n+k])); @/
}
/@    requires 0 <= k < RVV_CAP;
   requires current.lane[k] == previous.lane[k];
   requires u32(words32(current,k)+sum8(p,n)) ==
            u32(words32(previous,k)+sum8(p,m));
   terminates \true;
   assigns \nothing;
   ensures u32(words32(current,k+1)+sum8(p,n)) ==
           u32(words32(previous,k+1)+sum8(p,m));
@/
void lemma_rvv_tail(vint32m8_t previous,vint32m8_t current,const int8_t *p,size_t n,size_t m,size_t k) {
  rvv_proof_u32_normalize();
  rvv_proof_u32_congruence();
  /@ assert words32(current,k+1) == words32(current,k)+current.lane[k]; @/
  /@ assert words32(previous,k+1) == words32(previous,k)+previous.lane[k]; @/
  /@ assert u32(words32(current,k)+sum8(p,n)+current.lane[k]) ==
       u32(u32(words32(current,k)+sum8(p,n))+u32(current.lane[k])); @/
  /@ assert u32(words32(previous,k)+sum8(p,m)+previous.lane[k]) ==
       u32(u32(words32(previous,k)+sum8(p,m))+u32(previous.lane[k])); @/
}
/@    requires u32(words32(previous,RVV_CAP)) == u32(sum8(p,n));
   requires u32(words32(current,RVV_CAP)+sum8(p,n)) ==
            u32(words32(previous,RVV_CAP)+sum8(p,m));
   terminates \true;
   assigns \nothing;
   ensures u32(words32(current,RVV_CAP)) == u32(sum8(p,m));
@/
void lemma_rvv_cancel(vint32m8_t previous,vint32m8_t current,const int8_t *p,size_t n,size_t m) {
  rvv_proof_u32_cross_cancel();

}
*/
/* END COMPONENT proof_helpers.h */

/* BEGIN COMPONENT kernel_neon.c */
/*
struct xnn_qs8_rsum_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/

/*@
 requires 0 < batch <= SIZE_MAX-15;
 requires \valid_read(input+(0..batch+14));
 requires \valid(output);
 requires params != \null;
 requires \separated(output,input+(0..batch+14));
 requires -2147483648 <= (integer)*output+s32(sum8(input,batch)) <= 2147483647;
 terminates \true;
 assigns *output;
*/
void test_neon(
    size_t batch,
    const int8_t* input,
    int32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS
{
  //@ ghost const int8_t *base = input;
  //@ ghost size_t total = batch;
  //@ ghost int32_t initial_output = *output;
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);
  assert(params != NULL);

  XNN_ALIGN(16) static const int8_t onemask_table[32] = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  };

  int32x4_t vacc0 = vmovq_n_s32(0);

  // 256 int8s may be summed into an int16 before overflowing.
  // Each register has 8 lanes and there are 1 accumulators so batch size is 2048

  /*@ loop invariant 0 <= batch <= total;
      loop invariant input == base+(total-batch);
      loop invariant u32(words4(vacc0)) == u32(sum8(base,total-batch));
      loop assigns batch,input,vacc0;
      loop variant batch;
  */
  for (; batch >= 2048; batch -= 2048) {
    int16x8_t vacc16_0 = vmovq_n_s16(0);
    //@ ghost size_t steps = 0;
    /*@ loop invariant 0 <= steps <= 128;
        loop invariant current_batch == 2048-16*steps;
        loop invariant input == \at(input,LoopEntry)+(2048-current_batch);
        loop invariant input == base+(total-batch)+(2048-current_batch);
        loop invariant halves8(vacc16_0) == sum8(base+(total-batch),16*steps);
        loop invariant \forall integer j; 0 <= j < 8 ==>
          -256*steps <= s16(vacc16_0.lane[j]) <= 254*steps;
        loop assigns current_batch,input,vacc16_0,steps;
        loop variant current_batch;
    */
    for (size_t current_batch = 2048; current_batch > 0; current_batch -= 16) {
      //@ assert steps < 128;
      //@ assert current_batch >= 16;
      const int8x16_t vt0 = vld1q_s8(input); input += 16;
      //@ ghost int16x8_t before = vacc16_0;
      /*@ ghost
        /@ loop invariant 0 <= lane <= 8;
           loop invariant \forall integer j; 0 <= j < lane ==>
             s16((uint16_t)((integer)before.lane[j]+vt0.lane[2*j]+vt0.lane[2*j+1])) ==
               s16(before.lane[j])+vt0.lane[2*j]+vt0.lane[2*j+1];
           loop assigns lane;
           loop variant 8-lane;
        @/
        for (int lane=0; lane<8; lane++) {
          proof_s16_add(before.lane[lane], vt0.lane[2*lane]+vt0.lane[2*lane+1]);
        }
      */
      vacc16_0 = vpadalq_s8(vacc16_0, vt0);
      /*@ assert \forall integer j; 0 <= j < 8 ==>
        s16(vacc16_0.lane[j]) == s16(before.lane[j])+vt0.lane[2*j]+vt0.lane[2*j+1]; */
      //@ assert halves8(vacc16_0) == halves8(before)+bytes16(vt0);
      //@ ghost proof_load_sum(input-16,16,vt0);
      //@ assert (size_t)(total-batch) == total-batch;
      //@ assert (size_t)(2048-current_batch) == 16*steps;
      //@ ghost lemma_sum8_split(base+(total-batch),2048-current_batch,16);
      //@ assert halves8(vacc16_0) == sum8(base+(total-batch),16*steps+16);
      //@ ghost steps++;
    }
    //@ ghost lemma_sum8_split(base,total-batch,2048);
    //@ ghost int32x4_t wide_before = vacc0;
    vacc0 = vpadalq_s16(vacc0, vacc16_0);
    //@ ghost proof_prefix_widen(wide_before,vacc16_0,vacc0,base,total-batch,2048);
  }

  if (XNN_UNLIKELY(batch != 0)) {
    assert(batch >= 1 && batch < 2048);
    int16x8_t vacc16 = vmovq_n_s16(0);
    //@ ghost size_t tail_start = batch;
    //@ ghost size_t tail_steps = 0;
    //@ ghost const int8_t *tail_base = input;
    //@ ghost int32x4_t tail_wide_before = vacc0;
    //@ assert u32(words4(vacc0)) == u32(sum8(base,total-tail_start));
    /*@ loop invariant 0 <= tail_steps <= 127;
        loop invariant batch == tail_start-16*tail_steps;
        loop invariant 0 <= batch < 2048;
        loop invariant input == base+(total-batch);
        loop invariant input == tail_base+16*tail_steps;
        loop invariant tail_start < 2048;
        loop invariant halves8(vacc16) == sum8(tail_base,16*tail_steps);
        loop invariant \forall integer j; 0 <= j < 8 ==>
          -256*tail_steps <= s16(vacc16.lane[j]) <= 254*tail_steps;
        loop assigns batch,input,vacc16,tail_steps;
        loop variant batch;
    */
    for (; batch >= 16; batch -= 16) {
      //@ assert tail_steps < 127;
      const int8x16_t vt = vld1q_s8(input); input += 16;
      //@ ghost int16x8_t before_tail = vacc16;
      /*@ ghost
        /@ loop invariant 0 <= lane <= 8;
           loop invariant \forall integer j; 0 <= j < lane ==>
             s16((uint16_t)((integer)before_tail.lane[j]+vt.lane[2*j]+vt.lane[2*j+1])) ==
               s16(before_tail.lane[j])+vt.lane[2*j]+vt.lane[2*j+1];
           loop assigns lane;
           loop variant 8-lane;
        @/
        for (int lane=0; lane<8; lane++) {
          proof_s16_add(before_tail.lane[lane], vt.lane[2*lane]+vt.lane[2*lane+1]);
        }
      */
      vacc16 = vpadalq_s8(vacc16, vt);
      /*@ assert \forall integer j; 0 <= j < 8 ==>
        s16(vacc16.lane[j]) == s16(before_tail.lane[j])+vt.lane[2*j]+vt.lane[2*j+1]; */
      //@ assert halves8(vacc16) == halves8(before_tail)+bytes16(vt);
      //@ ghost proof_load_sum(input-16,16,vt);
      //@ assert (size_t)(16*tail_steps) == 16*tail_steps;
      //@ ghost lemma_sum8_split(tail_base,16*tail_steps,16);
      //@ assert halves8(vacc16) == sum8(tail_base,16*tail_steps+16);
      //@ ghost tail_steps++;
    }
    if (XNN_UNLIKELY(batch != 0)) {
      const int8x16_t vt = vld1q_s8(input);
      const int8x16_t vonemask = vld1q_s8(&onemask_table[16 - batch]);
      /*@ assert \forall integer j; 0 <= j < 16 ==>
        vonemask.lane[j] == (j < batch ? 1 : 0); */
      const int8x16_t vtm = vmulq_s8(vt, vonemask);
      /*@ assert \forall integer j; 0 <= j < 16 ==>
        vtm.lane[j] == (j < batch ? input[j] : 0); */
      //@ ghost proof_load_sum(input,batch,vtm);
      //@ ghost int16x8_t before_mask = vacc16;
      /*@ ghost
        /@ loop invariant 0 <= lane <= 8;
           loop invariant \forall integer j; 0 <= j < lane ==>
             s16((uint16_t)((integer)before_mask.lane[j]+vtm.lane[2*j]+vtm.lane[2*j+1])) ==
               s16(before_mask.lane[j])+vtm.lane[2*j]+vtm.lane[2*j+1];
           loop assigns lane;
           loop variant 8-lane;
        @/
        for (int lane=0; lane<8; lane++) {
          proof_s16_add(before_mask.lane[lane], vtm.lane[2*lane]+vtm.lane[2*lane+1]);
        }
      */
      vacc16 = vpadalq_s8(vacc16, vtm);
      /*@ assert \forall integer j; 0 <= j < 8 ==>
        s16(vacc16.lane[j]) == s16(before_mask.lane[j])+vtm.lane[2*j]+vtm.lane[2*j+1]; */
      //@ assert halves8(vacc16) == halves8(before_mask)+bytes16(vtm);
      //@ assert (size_t)(16*tail_steps) == 16*tail_steps;
      //@ ghost lemma_sum8_split(tail_base,16*tail_steps,batch);
      //@ assert halves8(vacc16) == sum8(tail_base,tail_start);
    }
    //@ assert halves8(vacc16) == sum8(tail_base,tail_start);
    vacc0 = vpadalq_s16(vacc0, vacc16);
    //@ ghost proof_prefix_widen(tail_wide_before,vacc16,vacc0,base,total-tail_start,tail_start);
    //@ assert u32(words4(vacc0)) == u32(sum8(base,total));
  }
  #if XNN_ARCH_ARM64
    const int32_t vacc = vaddvq_s32(vacc0);
  #else
    int32x2_t vacc_lo = vadd_s32(vget_low_s32(vacc0), vget_high_s32(vacc0));
    vacc_lo = vpadd_s32(vacc_lo, vacc_lo);
    const int32_t vacc = vget_lane_s32(vacc_lo, 0);
  #endif

  *output += vacc;
  //@ assert model_bridge: *output == initial_output+s32(sum8(base,total));
}
/* END COMPONENT kernel_neon.c */

/* BEGIN COMPONENT kernel_rvv.c */
/*@
 requires 0 < batch <= SIZE_MAX-15;
 requires \valid_read(input+(0..batch+14));
 requires \valid(output);
 requires params != \null;
 requires \separated(output,input+(0..batch+14));
 requires -2147483648 <= (integer)*output+s32(sum8(input,batch)) <= 2147483647;
 terminates \true;
 assigns *output;
*/
void test_rvv(
    size_t batch,
    const int8_t* input,
    int32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS
{
  //@ ghost const int8_t *base = input;
  //@ ghost size_t total = batch;
  //@ ghost int32_t initial_output = *output;
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);
  assert(params != NULL);

  // e8m2 and e32m8 have the same VLMAX.
  size_t vlmax = __riscv_vsetvlmax_e32m8();
  vint32m8_t vacc = __riscv_vmv_v_x_i32m8(0, vlmax);

  /*@ ghost
  /@ loop invariant 0 <= k <= RVV_CAP;
     loop invariant words32(vacc,k) == 0;
     loop assigns k; loop variant RVV_CAP-k; @/
  for (int k = 0; k < RVV_CAP; k++) {
    /@ assert words32(vacc,k+1) == words32(vacc,k)+vacc.lane[k]; @/
  }
  */

  /*@ loop invariant 0 <= batch <= total;
      loop invariant vlmax == RVV_CAP;
      loop invariant input == base+(total-batch);
      loop invariant u32(words32(vacc,RVV_CAP)) == u32(sum8(base,total-batch));
      loop assigns batch,input,vacc;
      loop variant batch;
  */
  for (; batch > 0; ) {
    size_t vl = __riscv_vsetvl_e8m2(batch);
    vint8m2_t vt = __riscv_vle8_v_i8m2(input, vl);
    
    // Widen int8 directly to int32
    vint32m8_t vt32 = __riscv_vsext_vf4_i32m8(vt, vl);
    
    // Accumulate using tail-undisturbed policy.
    // This ensures that if vl < vlmax (in the final iteration), the parallel 
    // sums in the upper lanes of vacc from previous full iterations are preserved.
    //@ ghost vint32m8_t previous = vacc;
    vacc = __riscv_vadd_vv_i32m8_tu(vacc, vacc, vt32, vl);
    /*@ ghost
    /@ loop invariant 0 <= k <= vl;
       loop invariant u32(words32(vacc,k)+sum8(base,total-batch)) ==
         u32(words32(previous,k)+sum8(base,total-batch+k));
       loop assigns k; loop variant vl-k; @/
    for (size_t k=0;k<vl;k++) {
      /@ assert words32(vacc,k+1) == words32(vacc,k)+vacc.lane[k]; @/
      /@ assert words32(previous,k+1) == words32(previous,k)+previous.lane[k]; @/
      /@ assert sum8(base,total-batch+k+1) == sum8(base,total-batch+k)+input[k]; @/
      /@ assert vt.lane[k] == input[k]; @/
      /@ assert vt32.lane[k] == u32(input[k]); @/
      /@ assert vacc.lane[k] == u32(previous.lane[k]+vt32.lane[k]); @/
      /@ assert vacc.lane[k] == u32(previous.lane[k]+u32(input[k])); @/
      lemma_rvv_active(previous,vacc,base,total-batch,k);
    }
    /@ loop invariant vl <= k <= RVV_CAP;
       loop invariant u32(words32(vacc,k)+sum8(base,total-batch)) ==
         u32(words32(previous,k)+sum8(base,total-batch+vl));
       loop assigns k; loop variant RVV_CAP-k; @/
    for (size_t k=vl;k<RVV_CAP;k++) {
      /@ assert words32(vacc,k+1) == words32(vacc,k)+vacc.lane[k]; @/
      /@ assert words32(previous,k+1) == words32(previous,k)+previous.lane[k]; @/
      /@ assert vacc.lane[k] == previous.lane[k]; @/
      lemma_rvv_tail(previous,vacc,base,total-batch,total-batch+vl,k);
    }
    lemma_rvv_cancel(previous,vacc,base,total-batch,total-batch+vl);
    */
    
    input += vl;
    batch -= vl;
  }

  // Reduce all parallel accumulators across the entire vlmax width
  vint32m1_t vres = __riscv_vmv_v_x_i32m1(0, __riscv_vsetvlmax_e32m1());
  vres = __riscv_vredsum_vs_i32m8_i32m1(vacc, vres, vlmax);
  
  //@ assert reduced_bits: vres.lane[0] == u32(sum8(base,total));
  //@ ghost rvv_proof_s32_u32();
  //@ assert reduced_signed: s32(vres.lane[0]) == s32(sum8(base,total));
  *output += __riscv_vmv_x_s_i32m1_i32(vres);
  //@ assert model_bridge: *output == initial_output+s32(sum8(base,total));
}
/* END COMPONENT kernel_rvv.c */

/* BEGIN COMPONENT equivalence.c */
/* Public relational specification: compare two executions of the same input. */
/*@
 requires 0 < n <= SIZE_MAX-15;
 requires \valid_read(input+(0..n+14));
 requires -2147483648 <= (integer)initial+s32(sum8(input,n)) <= 2147483647;
 terminates \true;
 assigns \nothing;
 ensures equal: \result == 1;
*/
int equivalent(size_t n,const int8_t *input,int32_t initial) {
  struct xnn_qs8_rsum_params params={0};
  int32_t neon=initial,rvv=initial;
  test_neon(n,input,&neon,&params);
  test_rvv(n,input,&rvv,&params);
  return neon==rvv;
}
/* END COMPONENT equivalence.c */
