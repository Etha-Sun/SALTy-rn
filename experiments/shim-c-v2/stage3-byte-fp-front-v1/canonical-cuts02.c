/* Proposed controls only: no run or qualification claimed. All contracts have bodies. */
#include <stdint.h>
#include <string.h>
#include <math.h>

/* Exact body of the shared dependency; only this proof contract is added. */
/*@ assigns \nothing; ensures \is_NaN(\result); */
float canonical_nan(void) {
  uint32_t bits=UINT32_C(0x7fc00000); float value;
  memcpy(&value,&bits,sizeof(value));
  /*@ assert copy_b0: ((signed char*)&value)[0] == ((signed char*)&bits)[0]; */
  /*@ assert copy_b1: ((signed char*)&value)[1] == ((signed char*)&bits)[1]; */
  /*@ assert copy_b2: ((signed char*)&value)[2] == ((signed char*)&bits)[2]; */
  /*@ assert copy_b3: ((signed char*)&value)[3] == ((signed char*)&bits)[3]; */
  /*@ assert copy_word: *(uint32_t*)&value == bits; */
  /*@ assert canonical_word: *(uint32_t*)&value == 0x7fc00000; */
  return value;
}

