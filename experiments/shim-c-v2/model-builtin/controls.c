#include <math.h>
/*@ assigns \nothing; ensures \is_NaN(\result); */
float correct_nan(void) { return __builtin_nanf(""); }
/*@ assigns \nothing; ensures !\is_NaN(\result); */
float wrong_nan(void) { return __builtin_nanf(""); }
/*@ assigns \nothing; ensures \false; */
void wrong_false(void) {}
