#ifndef SHIM_C_COMPILER_BUILTIN_NAN_H
#define SHIM_C_COMPILER_BUILTIN_NAN_H
#include <math.h>
/* GCC/Clang __builtin_nanf has the same NaN-constructor observation as nanf.
   Model TCB: only classification is promised; sign and payload stay unspecified. */
/*@ requires tagp_valid_string: valid_read_string(tagp);
    assigns \result \from indirect:tagp[0..];
    ensures result_is_nan: \is_NaN(\result);
*/
extern float __builtin_nanf(const char *tagp);
#endif
