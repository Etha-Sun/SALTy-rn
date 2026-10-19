#include <math.h>
/*@ assigns \nothing; ensures \is_NaN(\result); */
float correct_nan(void) { return __builtin_nanf(""); }
/*@ assigns \nothing; ensures !\is_NaN(\result); */
float wrong_nan(void) { return __builtin_nanf(""); }
/*@ assigns \nothing; ensures \false; */
void wrong_false(void) {}

#include <stdint.h>
/*@ ensures exact_small_mod: \forall integer x; 0<=x ==> (uint16_t)x==x%65536;
    assigns \nothing; */
void correct_mod(void) {}
