#include "shim/types.h"
_Static_assert(sizeof(float)==4,"binary32 byte size");
_Static_assert(_Alignof(float)==4,"binary32 alignment");
_Static_assert(sizeof(struct scalar_bounds)==8,"bounds size");
_Static_assert(sizeof(struct xnn_f32_minmax_params)==8,"params size");
_Static_assert(__builtin_offsetof(struct xnn_f32_minmax_params,scalar.min)==0,"min offset");
_Static_assert(__builtin_offsetof(struct xnn_f32_minmax_params,scalar.max)==4,"max offset");
