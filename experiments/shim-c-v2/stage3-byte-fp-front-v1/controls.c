/* Proposed controls only: no run or qualification claimed. All contracts have bodies. */
#include <stdint.h>
#include <string.h>
#include <math.h>

/* Exact body of the shared dependency; only this proof contract is added. */
/*@ assigns \nothing; ensures \is_NaN(\result); */
float canonical_nan(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value;
  memcpy(&value,&bits,sizeof(value)); return value;
}

/*@ assigns \nothing; ensures \result==1; */
int positive_finite32(void) {
  uint32_t bits=UINT32_C(0x3f800000),out; float value;
  memcpy(&value,&bits,4); memcpy(&out,&value,4);
  return value==1.0f && out==bits;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_finite64(void) {
  uint64_t bits=UINT64_C(0x3ff0000000000000),out; double value;
  memcpy(&value,&bits,8); memcpy(&out,&value,8);
  return value==1.0 && out==bits;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_zero32(void) {
  float value=-0.0f; uint32_t out; memcpy(&out,&value,4);
  return out==UINT32_C(0x80000000);
}
/*@ assigns \nothing; ensures \result==1; */
int positive_zero64(void) {
  double value=-0.0; uint64_t out; memcpy(&out,&value,8);
  return out==UINT64_C(0x8000000000000000);
}
/*@ assigns \nothing; ensures \result==1; */
int positive_numeric_store32(float x) {
  float memory=x; uint32_t bits; float y;
  memcpy(&bits,&memory,4); memcpy(&y,&bits,4);
  return x==y || (x!=x && y!=y);
}
/*@ assigns \nothing; ensures \result==1; */
int positive_numeric_store64(double x) {
  double memory=x; uint64_t bits; double y;
  memcpy(&bits,&memory,8); memcpy(&y,&bits,8);
  return x==y || (x!=x && y!=y);
}
/* Copies bytes, never a float assignment between the two observations. */
/*@ assigns \nothing; ensures \result==1; */
int positive_same_storage32(float x) {
  uint32_t first,second; memcpy(&first,&x,4); memcpy(&second,&x,4);
  return first==second;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_nan_byte_copy32(void) {
  uint32_t bits=UINT32_C(0xff840123),out; float a,b;
  memcpy(&a,&bits,4); memcpy(&b,&a,4); memcpy(&out,&b,4);
  return a!=a && b!=b && out==bits;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_nan_byte_copy64(void) {
  uint64_t bits=UINT64_C(0xfff0000000000123),out; double a,b;
  memcpy(&a,&bits,8); memcpy(&b,&a,8); memcpy(&out,&b,8);
  return a!=a && b!=b && out==bits;
}
/* Fixed gcc_x86_64 little-endian control. BE needs a separately configured control. */
/*@ assigns \nothing; ensures \result==1; */
int positive_partial_byte_frame(void) {
  uint32_t words[2]={UINT32_C(0x3f800000),UINT32_C(0x12345678)};
  unsigned char byte=1; memcpy((unsigned char*)words+1,&byte,1);
  return words[0]==UINT32_C(0x3f800100) && words[1]==UINT32_C(0x12345678);
}

/* Actual false claims: must remain unproved, not vacuously valid. */
/*@ assigns \nothing; ensures \result==1; */
int negative_wrong_finite(void) {
  uint32_t bits=UINT32_C(0x3f800000); float value; memcpy(&value,&bits,4);
  return value==0.0f;
}
/*@ assigns \nothing; ensures \result==1; */
int negative_wrong_zero_bits(void) {
  float value=-0.0f; uint32_t bits; memcpy(&bits,&value,4); return bits==0;
}
/*@ assigns \nothing; ensures \result==1; */
int negative_nan_self_equal(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value; memcpy(&value,&bits,4);
  return value==value;
}
/*@ assigns \nothing; ensures \false; */
void negative_false(void) {}

/* Abstraction controls: not necessarily false on each physical compiler.
   A NaN store overapproximation must NOT prove fixed payload or coupled seeds. */
/*@ assigns \nothing; ensures \result==1; */
int abstract_negative_fixed_payload(void) {
  uint32_t bits=UINT32_C(0x7fc00000),out; float x,y;
  memcpy(&x,&bits,4); y=x; memcpy(&out,&y,4);
  return out==UINT32_C(0x7fc00000);
}
/*@ assigns \nothing; ensures \result==1; */
int abstract_negative_shared_seed(void) {
  uint32_t bits=UINT32_C(0x7fc00000),ia,ib; float x,a,b;
  memcpy(&x,&bits,4); a=x; b=x; memcpy(&ia,&a,4); memcpy(&ib,&b,4);
  return ia==ib;
}
