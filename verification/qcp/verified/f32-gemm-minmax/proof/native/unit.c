#include "fp_primitives.h"
#include <stdlib.h>
void qcp_assert(int condition) { if (!condition) abort(); }
float qcp_identity(float x) { return x; }
#include "../../impl/testNEON.c"
#include "../../impl/testRVV.c"
#define QCP_GEMM_NATIVE_TYPES 1
#include "../../spec.c"
