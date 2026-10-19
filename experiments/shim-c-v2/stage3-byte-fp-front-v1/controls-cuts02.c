/* Proposed controls only: no run or qualification claimed. All contracts have bodies. */
#include <stdint.h>
#include <string.h>
#include <math.h>

/* Exact body of the shared dependency; only this proof contract is added. */
/*@ assigns \nothing; ensures \is_NaN(\result); */
float canonical_nan(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value;
  memcpy(&value,&bits,sizeof(value));
  /*@ assert copy_1_byte_0: ((signed char*)(&value))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_1_byte_1: ((signed char*)(&value))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_1_byte_2: ((signed char*)(&value))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_1_byte_3: ((signed char*)(&value))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_1_word: *(uint32_t*)(&value) == *(uint32_t*)(&bits); */
   return value;
}

/*@ assigns \nothing; ensures \result==1; */
int positive_finite32(void) {
  uint32_t bits=UINT32_C(0x3f800000),out; float value;
  memcpy(&value,&bits,4);
  /*@ assert copy_2_byte_0: ((signed char*)(&value))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_2_byte_1: ((signed char*)(&value))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_2_byte_2: ((signed char*)(&value))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_2_byte_3: ((signed char*)(&value))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_2_word: *(uint32_t*)(&value) == *(uint32_t*)(&bits); */
   memcpy(&out,&value,4);
  /*@ assert copy_3_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&value))[0]; */
  /*@ assert copy_3_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&value))[1]; */
  /*@ assert copy_3_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&value))[2]; */
  /*@ assert copy_3_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&value))[3]; */
  /*@ assert copy_3_word: *(uint32_t*)(&out) == *(uint32_t*)(&value); */
  
  return value==1.0f && out==bits;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_finite64(void) {
  uint64_t bits=UINT64_C(0x3ff0000000000000),out; double value;
  memcpy(&value,&bits,8);
  /*@ assert copy_4_byte_0: ((signed char*)(&value))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_4_byte_1: ((signed char*)(&value))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_4_byte_2: ((signed char*)(&value))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_4_byte_3: ((signed char*)(&value))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_4_byte_4: ((signed char*)(&value))[4] == ((signed char*)(&bits))[4]; */
  /*@ assert copy_4_byte_5: ((signed char*)(&value))[5] == ((signed char*)(&bits))[5]; */
  /*@ assert copy_4_byte_6: ((signed char*)(&value))[6] == ((signed char*)(&bits))[6]; */
  /*@ assert copy_4_byte_7: ((signed char*)(&value))[7] == ((signed char*)(&bits))[7]; */
  /*@ assert copy_4_word: *(uint64_t*)(&value) == *(uint64_t*)(&bits); */
   memcpy(&out,&value,8);
  /*@ assert copy_5_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&value))[0]; */
  /*@ assert copy_5_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&value))[1]; */
  /*@ assert copy_5_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&value))[2]; */
  /*@ assert copy_5_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&value))[3]; */
  /*@ assert copy_5_byte_4: ((signed char*)(&out))[4] == ((signed char*)(&value))[4]; */
  /*@ assert copy_5_byte_5: ((signed char*)(&out))[5] == ((signed char*)(&value))[5]; */
  /*@ assert copy_5_byte_6: ((signed char*)(&out))[6] == ((signed char*)(&value))[6]; */
  /*@ assert copy_5_byte_7: ((signed char*)(&out))[7] == ((signed char*)(&value))[7]; */
  /*@ assert copy_5_word: *(uint64_t*)(&out) == *(uint64_t*)(&value); */
  
  return value==1.0 && out==bits;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_zero32(void) {
  float value=-0.0f; uint32_t out; memcpy(&out,&value,4);
  /*@ assert copy_6_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&value))[0]; */
  /*@ assert copy_6_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&value))[1]; */
  /*@ assert copy_6_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&value))[2]; */
  /*@ assert copy_6_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&value))[3]; */
  /*@ assert copy_6_word: *(uint32_t*)(&out) == *(uint32_t*)(&value); */
  
  return out==UINT32_C(0x80000000);
}
/*@ assigns \nothing; ensures \result==1; */
int positive_zero64(void) {
  double value=-0.0; uint64_t out; memcpy(&out,&value,8);
  /*@ assert copy_7_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&value))[0]; */
  /*@ assert copy_7_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&value))[1]; */
  /*@ assert copy_7_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&value))[2]; */
  /*@ assert copy_7_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&value))[3]; */
  /*@ assert copy_7_byte_4: ((signed char*)(&out))[4] == ((signed char*)(&value))[4]; */
  /*@ assert copy_7_byte_5: ((signed char*)(&out))[5] == ((signed char*)(&value))[5]; */
  /*@ assert copy_7_byte_6: ((signed char*)(&out))[6] == ((signed char*)(&value))[6]; */
  /*@ assert copy_7_byte_7: ((signed char*)(&out))[7] == ((signed char*)(&value))[7]; */
  /*@ assert copy_7_word: *(uint64_t*)(&out) == *(uint64_t*)(&value); */
  
  return out==UINT64_C(0x8000000000000000);
}
/*@ assigns \nothing; ensures \result==1; */
int positive_numeric_store32(float x) {
  float memory=x; uint32_t bits; float y;
  memcpy(&bits,&memory,4);
  /*@ assert copy_8_byte_0: ((signed char*)(&bits))[0] == ((signed char*)(&memory))[0]; */
  /*@ assert copy_8_byte_1: ((signed char*)(&bits))[1] == ((signed char*)(&memory))[1]; */
  /*@ assert copy_8_byte_2: ((signed char*)(&bits))[2] == ((signed char*)(&memory))[2]; */
  /*@ assert copy_8_byte_3: ((signed char*)(&bits))[3] == ((signed char*)(&memory))[3]; */
  /*@ assert copy_8_word: *(uint32_t*)(&bits) == *(uint32_t*)(&memory); */
   memcpy(&y,&bits,4);
  /*@ assert copy_9_byte_0: ((signed char*)(&y))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_9_byte_1: ((signed char*)(&y))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_9_byte_2: ((signed char*)(&y))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_9_byte_3: ((signed char*)(&y))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_9_word: *(uint32_t*)(&y) == *(uint32_t*)(&bits); */
  
  return x==y || (x!=x && y!=y);
}
/*@ assigns \nothing; ensures \result==1; */
int positive_numeric_store64(double x) {
  double memory=x; uint64_t bits; double y;
  memcpy(&bits,&memory,8);
  /*@ assert copy_10_byte_0: ((signed char*)(&bits))[0] == ((signed char*)(&memory))[0]; */
  /*@ assert copy_10_byte_1: ((signed char*)(&bits))[1] == ((signed char*)(&memory))[1]; */
  /*@ assert copy_10_byte_2: ((signed char*)(&bits))[2] == ((signed char*)(&memory))[2]; */
  /*@ assert copy_10_byte_3: ((signed char*)(&bits))[3] == ((signed char*)(&memory))[3]; */
  /*@ assert copy_10_byte_4: ((signed char*)(&bits))[4] == ((signed char*)(&memory))[4]; */
  /*@ assert copy_10_byte_5: ((signed char*)(&bits))[5] == ((signed char*)(&memory))[5]; */
  /*@ assert copy_10_byte_6: ((signed char*)(&bits))[6] == ((signed char*)(&memory))[6]; */
  /*@ assert copy_10_byte_7: ((signed char*)(&bits))[7] == ((signed char*)(&memory))[7]; */
  /*@ assert copy_10_word: *(uint64_t*)(&bits) == *(uint64_t*)(&memory); */
   memcpy(&y,&bits,8);
  /*@ assert copy_11_byte_0: ((signed char*)(&y))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_11_byte_1: ((signed char*)(&y))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_11_byte_2: ((signed char*)(&y))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_11_byte_3: ((signed char*)(&y))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_11_byte_4: ((signed char*)(&y))[4] == ((signed char*)(&bits))[4]; */
  /*@ assert copy_11_byte_5: ((signed char*)(&y))[5] == ((signed char*)(&bits))[5]; */
  /*@ assert copy_11_byte_6: ((signed char*)(&y))[6] == ((signed char*)(&bits))[6]; */
  /*@ assert copy_11_byte_7: ((signed char*)(&y))[7] == ((signed char*)(&bits))[7]; */
  /*@ assert copy_11_word: *(uint64_t*)(&y) == *(uint64_t*)(&bits); */
  
  return x==y || (x!=x && y!=y);
}
/* Copies bytes, never a float assignment between the two observations. */
/*@ assigns \nothing; ensures \result==1; */
int positive_same_storage32(float x) {
  uint32_t first,second; memcpy(&first,&x,4);
  /*@ assert copy_12_byte_0: ((signed char*)(&first))[0] == ((signed char*)(&x))[0]; */
  /*@ assert copy_12_byte_1: ((signed char*)(&first))[1] == ((signed char*)(&x))[1]; */
  /*@ assert copy_12_byte_2: ((signed char*)(&first))[2] == ((signed char*)(&x))[2]; */
  /*@ assert copy_12_byte_3: ((signed char*)(&first))[3] == ((signed char*)(&x))[3]; */
  /*@ assert copy_12_word: *(uint32_t*)(&first) == *(uint32_t*)(&x); */
   memcpy(&second,&x,4);
  /*@ assert copy_13_byte_0: ((signed char*)(&second))[0] == ((signed char*)(&x))[0]; */
  /*@ assert copy_13_byte_1: ((signed char*)(&second))[1] == ((signed char*)(&x))[1]; */
  /*@ assert copy_13_byte_2: ((signed char*)(&second))[2] == ((signed char*)(&x))[2]; */
  /*@ assert copy_13_byte_3: ((signed char*)(&second))[3] == ((signed char*)(&x))[3]; */
  /*@ assert copy_13_word: *(uint32_t*)(&second) == *(uint32_t*)(&x); */
  
  return first==second;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_nan_byte_copy32(void) {
  uint32_t bits=UINT32_C(0xff840123),out; float a,b;
  memcpy(&a,&bits,4);
  /*@ assert copy_14_byte_0: ((signed char*)(&a))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_14_byte_1: ((signed char*)(&a))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_14_byte_2: ((signed char*)(&a))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_14_byte_3: ((signed char*)(&a))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_14_word: *(uint32_t*)(&a) == *(uint32_t*)(&bits); */
   memcpy(&b,&a,4);
  /*@ assert copy_15_byte_0: ((signed char*)(&b))[0] == ((signed char*)(&a))[0]; */
  /*@ assert copy_15_byte_1: ((signed char*)(&b))[1] == ((signed char*)(&a))[1]; */
  /*@ assert copy_15_byte_2: ((signed char*)(&b))[2] == ((signed char*)(&a))[2]; */
  /*@ assert copy_15_byte_3: ((signed char*)(&b))[3] == ((signed char*)(&a))[3]; */
  /*@ assert copy_15_word: *(uint32_t*)(&b) == *(uint32_t*)(&a); */
   memcpy(&out,&b,4);
  /*@ assert copy_16_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&b))[0]; */
  /*@ assert copy_16_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&b))[1]; */
  /*@ assert copy_16_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&b))[2]; */
  /*@ assert copy_16_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&b))[3]; */
  /*@ assert copy_16_word: *(uint32_t*)(&out) == *(uint32_t*)(&b); */
  
  return a!=a && b!=b && out==bits;
}
/*@ assigns \nothing; ensures \result==1; */
int positive_nan_byte_copy64(void) {
  uint64_t bits=UINT64_C(0xfff0000000000123),out; double a,b;
  memcpy(&a,&bits,8);
  /*@ assert copy_17_byte_0: ((signed char*)(&a))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_17_byte_1: ((signed char*)(&a))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_17_byte_2: ((signed char*)(&a))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_17_byte_3: ((signed char*)(&a))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_17_byte_4: ((signed char*)(&a))[4] == ((signed char*)(&bits))[4]; */
  /*@ assert copy_17_byte_5: ((signed char*)(&a))[5] == ((signed char*)(&bits))[5]; */
  /*@ assert copy_17_byte_6: ((signed char*)(&a))[6] == ((signed char*)(&bits))[6]; */
  /*@ assert copy_17_byte_7: ((signed char*)(&a))[7] == ((signed char*)(&bits))[7]; */
  /*@ assert copy_17_word: *(uint64_t*)(&a) == *(uint64_t*)(&bits); */
   memcpy(&b,&a,8);
  /*@ assert copy_18_byte_0: ((signed char*)(&b))[0] == ((signed char*)(&a))[0]; */
  /*@ assert copy_18_byte_1: ((signed char*)(&b))[1] == ((signed char*)(&a))[1]; */
  /*@ assert copy_18_byte_2: ((signed char*)(&b))[2] == ((signed char*)(&a))[2]; */
  /*@ assert copy_18_byte_3: ((signed char*)(&b))[3] == ((signed char*)(&a))[3]; */
  /*@ assert copy_18_byte_4: ((signed char*)(&b))[4] == ((signed char*)(&a))[4]; */
  /*@ assert copy_18_byte_5: ((signed char*)(&b))[5] == ((signed char*)(&a))[5]; */
  /*@ assert copy_18_byte_6: ((signed char*)(&b))[6] == ((signed char*)(&a))[6]; */
  /*@ assert copy_18_byte_7: ((signed char*)(&b))[7] == ((signed char*)(&a))[7]; */
  /*@ assert copy_18_word: *(uint64_t*)(&b) == *(uint64_t*)(&a); */
   memcpy(&out,&b,8);
  /*@ assert copy_19_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&b))[0]; */
  /*@ assert copy_19_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&b))[1]; */
  /*@ assert copy_19_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&b))[2]; */
  /*@ assert copy_19_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&b))[3]; */
  /*@ assert copy_19_byte_4: ((signed char*)(&out))[4] == ((signed char*)(&b))[4]; */
  /*@ assert copy_19_byte_5: ((signed char*)(&out))[5] == ((signed char*)(&b))[5]; */
  /*@ assert copy_19_byte_6: ((signed char*)(&out))[6] == ((signed char*)(&b))[6]; */
  /*@ assert copy_19_byte_7: ((signed char*)(&out))[7] == ((signed char*)(&b))[7]; */
  /*@ assert copy_19_word: *(uint64_t*)(&out) == *(uint64_t*)(&b); */
  
  return a!=a && b!=b && out==bits;
}
/* Fixed gcc_x86_64 little-endian control. BE needs a separately configured control. */
/*@ assigns \nothing; ensures \result==1; */
int positive_partial_byte_frame(void) {
  uint32_t words[2]={UINT32_C(0x3f800000),UINT32_C(0x12345678)};
  unsigned char byte=1; memcpy((unsigned char*)words+1,&byte,1);
  /*@ assert copy_20_byte_0: ((signed char*)((unsigned char*)words+1))[0] == ((signed char*)(&byte))[0]; */
  
  return words[0]==UINT32_C(0x3f800100) && words[1]==UINT32_C(0x12345678);
}

/* Actual false claims: must remain unproved, not vacuously valid. */
/*@ assigns \nothing; ensures \result==1; */
int negative_wrong_finite(void) {
  uint32_t bits=UINT32_C(0x3f800000); float value; memcpy(&value,&bits,4);
  /*@ assert copy_21_byte_0: ((signed char*)(&value))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_21_byte_1: ((signed char*)(&value))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_21_byte_2: ((signed char*)(&value))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_21_byte_3: ((signed char*)(&value))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_21_word: *(uint32_t*)(&value) == *(uint32_t*)(&bits); */
  
  return value==0.0f;
}
/*@ assigns \nothing; ensures \result==1; */
int negative_wrong_zero_bits(void) {
  float value=-0.0f; uint32_t bits; memcpy(&bits,&value,4);
  /*@ assert copy_22_byte_0: ((signed char*)(&bits))[0] == ((signed char*)(&value))[0]; */
  /*@ assert copy_22_byte_1: ((signed char*)(&bits))[1] == ((signed char*)(&value))[1]; */
  /*@ assert copy_22_byte_2: ((signed char*)(&bits))[2] == ((signed char*)(&value))[2]; */
  /*@ assert copy_22_byte_3: ((signed char*)(&bits))[3] == ((signed char*)(&value))[3]; */
  /*@ assert copy_22_word: *(uint32_t*)(&bits) == *(uint32_t*)(&value); */
   return bits==0;
}
/*@ assigns \nothing; ensures \result==1; */
int negative_nan_self_equal(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value; memcpy(&value,&bits,4);
  /*@ assert copy_23_byte_0: ((signed char*)(&value))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_23_byte_1: ((signed char*)(&value))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_23_byte_2: ((signed char*)(&value))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_23_byte_3: ((signed char*)(&value))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_23_word: *(uint32_t*)(&value) == *(uint32_t*)(&bits); */
  
  return value==value;
}
/*@ assigns \nothing; ensures \false; */
void negative_false(void) {}

/* Abstraction controls: not necessarily false on each physical compiler.
   A NaN store overapproximation must NOT prove fixed payload or coupled seeds. */
/*@ assigns \nothing; ensures \result==1; */
int abstract_negative_fixed_payload(void) {
  uint32_t bits=UINT32_C(0x7fc00000),out; float x,y;
  memcpy(&x,&bits,4);
  /*@ assert copy_24_byte_0: ((signed char*)(&x))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_24_byte_1: ((signed char*)(&x))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_24_byte_2: ((signed char*)(&x))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_24_byte_3: ((signed char*)(&x))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_24_word: *(uint32_t*)(&x) == *(uint32_t*)(&bits); */
   y=x; memcpy(&out,&y,4);
  /*@ assert copy_25_byte_0: ((signed char*)(&out))[0] == ((signed char*)(&y))[0]; */
  /*@ assert copy_25_byte_1: ((signed char*)(&out))[1] == ((signed char*)(&y))[1]; */
  /*@ assert copy_25_byte_2: ((signed char*)(&out))[2] == ((signed char*)(&y))[2]; */
  /*@ assert copy_25_byte_3: ((signed char*)(&out))[3] == ((signed char*)(&y))[3]; */
  /*@ assert copy_25_word: *(uint32_t*)(&out) == *(uint32_t*)(&y); */
  
  return out==UINT32_C(0x7fc00000);
}
/*@ assigns \nothing; ensures \result==1; */
int abstract_negative_shared_seed(void) {
  uint32_t bits=UINT32_C(0x7fc00000),ia,ib; float x,a,b;
  memcpy(&x,&bits,4);
  /*@ assert copy_26_byte_0: ((signed char*)(&x))[0] == ((signed char*)(&bits))[0]; */
  /*@ assert copy_26_byte_1: ((signed char*)(&x))[1] == ((signed char*)(&bits))[1]; */
  /*@ assert copy_26_byte_2: ((signed char*)(&x))[2] == ((signed char*)(&bits))[2]; */
  /*@ assert copy_26_byte_3: ((signed char*)(&x))[3] == ((signed char*)(&bits))[3]; */
  /*@ assert copy_26_word: *(uint32_t*)(&x) == *(uint32_t*)(&bits); */
   a=x; b=x; memcpy(&ia,&a,4);
  /*@ assert copy_27_byte_0: ((signed char*)(&ia))[0] == ((signed char*)(&a))[0]; */
  /*@ assert copy_27_byte_1: ((signed char*)(&ia))[1] == ((signed char*)(&a))[1]; */
  /*@ assert copy_27_byte_2: ((signed char*)(&ia))[2] == ((signed char*)(&a))[2]; */
  /*@ assert copy_27_byte_3: ((signed char*)(&ia))[3] == ((signed char*)(&a))[3]; */
  /*@ assert copy_27_word: *(uint32_t*)(&ia) == *(uint32_t*)(&a); */
   memcpy(&ib,&b,4);
  /*@ assert copy_28_byte_0: ((signed char*)(&ib))[0] == ((signed char*)(&b))[0]; */
  /*@ assert copy_28_byte_1: ((signed char*)(&ib))[1] == ((signed char*)(&b))[1]; */
  /*@ assert copy_28_byte_2: ((signed char*)(&ib))[2] == ((signed char*)(&b))[2]; */
  /*@ assert copy_28_byte_3: ((signed char*)(&ib))[3] == ((signed char*)(&b))[3]; */
  /*@ assert copy_28_word: *(uint32_t*)(&ib) == *(uint32_t*)(&b); */
  
  return ia==ib;
}
