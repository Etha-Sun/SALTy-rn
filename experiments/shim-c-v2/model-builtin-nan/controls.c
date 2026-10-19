#include <math.h>
/*@ assigns \nothing; ensures \is_NaN(\result); */
float builtin_nan_positive(void) { return __builtin_nanf(""); }
/*@ assigns \nothing; ensures \is_finite(\result); */
float builtin_nan_wrong(void) { return __builtin_nanf(""); }
/*@ assigns \nothing; ensures \false; */
void builtin_false_control(void) {}
/*@ assigns \nothing; ensures \true; */
void builtin_true_control(void) {}
