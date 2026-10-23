typedef unsigned long long size_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
struct qcp_s8_scalar_params { int32_t min; int32_t max; };
struct xnn_s8_minmax_params { struct qcp_s8_scalar_params scalar; };
typedef struct int8x8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
} int8x8_t;
typedef struct int8x16_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
} int8x16_t;
typedef struct vint8m8_t {
  int8_t s0;
  int8_t s1;
  int8_t s2;
  int8_t s3;
  int8_t s4;
  int8_t s5;
  int8_t s6;
  int8_t s7;
  int8_t s8;
  int8_t s9;
  int8_t s10;
  int8_t s11;
  int8_t s12;
  int8_t s13;
  int8_t s14;
  int8_t s15;
  int8_t s16;
  int8_t s17;
  int8_t s18;
  int8_t s19;
  int8_t s20;
  int8_t s21;
  int8_t s22;
  int8_t s23;
  int8_t s24;
  int8_t s25;
  int8_t s26;
  int8_t s27;
  int8_t s28;
  int8_t s29;
  int8_t s30;
  int8_t s31;
  int8_t s32;
  int8_t s33;
  int8_t s34;
  int8_t s35;
  int8_t s36;
  int8_t s37;
  int8_t s38;
  int8_t s39;
  int8_t s40;
  int8_t s41;
  int8_t s42;
  int8_t s43;
  int8_t s44;
  int8_t s45;
  int8_t s46;
  int8_t s47;
  int8_t s48;
  int8_t s49;
  int8_t s50;
  int8_t s51;
  int8_t s52;
  int8_t s53;
  int8_t s54;
  int8_t s55;
  int8_t s56;
  int8_t s57;
  int8_t s58;
  int8_t s59;
  int8_t s60;
  int8_t s61;
  int8_t s62;
  int8_t s63;
  int8_t s64;
  int8_t s65;
  int8_t s66;
  int8_t s67;
  int8_t s68;
  int8_t s69;
  int8_t s70;
  int8_t s71;
  int8_t s72;
  int8_t s73;
  int8_t s74;
  int8_t s75;
  int8_t s76;
  int8_t s77;
  int8_t s78;
  int8_t s79;
  int8_t s80;
  int8_t s81;
  int8_t s82;
  int8_t s83;
  int8_t s84;
  int8_t s85;
  int8_t s86;
  int8_t s87;
  int8_t s88;
  int8_t s89;
  int8_t s90;
  int8_t s91;
  int8_t s92;
  int8_t s93;
  int8_t s94;
  int8_t s95;
  int8_t s96;
  int8_t s97;
  int8_t s98;
  int8_t s99;
  int8_t s100;
  int8_t s101;
  int8_t s102;
  int8_t s103;
  int8_t s104;
  int8_t s105;
  int8_t s106;
  int8_t s107;
  int8_t s108;
  int8_t s109;
  int8_t s110;
  int8_t s111;
  int8_t s112;
  int8_t s113;
  int8_t s114;
  int8_t s115;
  int8_t s116;
  int8_t s117;
  int8_t s118;
  int8_t s119;
  int8_t s120;
  int8_t s121;
  int8_t s122;
  int8_t s123;
  int8_t s124;
  int8_t s125;
  int8_t s126;
  int8_t s127;
} vint8m8_t;
typedef struct uint8x8_t {
  uint8_t s0;
  uint8_t s1;
  uint8_t s2;
  uint8_t s3;
  uint8_t s4;
  uint8_t s5;
  uint8_t s6;
  uint8_t s7;
} uint8x8_t;
/* Byte-backed views preserve all eight bytes, without aligned word loads. */
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import S8Clamp.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/* Assertions are checked call preconditions; every actual call must prove ok.
 * The actual no-op body is valid on that true-assertion domain. */
void qcp_s8_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
void qcp_s8_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */
{ }
/* Public signed-byte clamp call/comparison entry.
 * Inputs: n>0 bytes and seven readable padding bytes; n writable output bytes.
 * Parameters retain all int32_t bit patterns: narrowed min may exceed max.
 * Partial correctness under LP64/little-endian C-shim contracts.
 */
/*@ Import Coq Require Import S8Clamp.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (s8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "s8_arrays.strategies" */
/*@ Import Coq Require Import S8Clamp.ProgramModel */
/*@ Extern Coq (s8_values:Z -> Z -> Z -> list Z -> list Z)
 (s8_narrow:Z -> Z) (s8_outputs_related:list Z -> list Z -> Prop) */
void test_neon(size_t batch,const int8_t *input,int8_t *output,const struct xnn_s8_minmax_params *restrict params)
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure CharArray::full(input,batch+7,A) *
 CharArray::full(output,batch,s8_values(batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */;
void test_rvv(size_t batch,const int8_t *input,int8_t *output,const struct xnn_s8_minmax_params *restrict params)
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure CharArray::full(input,batch+7,A) *
 CharArray::full(output,batch,s8_values(batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */;
int compare_outputs(size_t n,const int8_t *left,const int8_t *right)
/*@ With (L:list Z) (R:list Z)
 Require 0<n && n<=18446744073709551608 && s8_outputs_related(L,R) &&
 CharArray::full(left,n,L) * CharArray::full(right,n,R)
 Ensure __return==1 && CharArray::full(left,n,L) * CharArray::full(right,n,R) */
{
  size_t i=0;
  /*@ Inv n==n@pre && left==left@pre && right==right@pre &&
 0<n && n<=18446744073709551608 && 0<=i && i<=n &&
 L==R && s8_outputs_related(L,R) && CharArray::full(left,n,L) * CharArray::full(right,n,R) */
  while(i<n) {
    if(left[i]!=right[i])return 0;
    i++;
  }
  return 1;
}
int equivalent(size_t n,const int8_t *input,int8_t *left,int8_t *right,const struct xnn_s8_minmax_params *params)
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<n && n<=18446744073709551608 && input!=0 && left!=0 && right!=0 && params!=0 &&
 CharArray::full(input,n+7,A) * CharArray::undef_full(left,n) * CharArray::undef_full(right,n) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure exists (L:list Z) (R:list Z), __return==1 && s8_outputs_related(L,R) &&
 CharArray::full(input,n+7,A) * CharArray::full(left,n,L) * CharArray::full(right,n,R) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */
{
  test_neon(n,input,left,params);
  test_rvv(n,input,right,params);
  return compare_outputs(n,left,right);
}
