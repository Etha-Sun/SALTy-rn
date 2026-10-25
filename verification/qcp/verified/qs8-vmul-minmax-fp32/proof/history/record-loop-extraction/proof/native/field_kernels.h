/* Actual ordinary adapter C bodies, compiled before frontend call macros.
   Intrinsic numeric implementations are the finite, distinct ISA emulator.
   Coq annotations remain byte-identical source comments. */
#define QS8MUL_ACTIVE_MODEL_H
#define QS8MUL_ADAPTERS_H
#define QS8MUL_ARRAY_MODEL_H
#define QS8MUL_CONTROL_H
#define QS8MUL_FLOAT_BORROW_H
#define QS8MUL_INTRINSIC_MODEL_H
#define QS8MUL_LOAD_INTO_H
#define QS8MUL_NEON_INTRINSICS_H
#define QS8MUL_PROGRAM_MODEL_H
#define QS8MUL_PUBLIC_TYPES_H
#define QS8MUL_RVV_CONCRETE_INTRINSICS_H
#define QS8MUL_RVV_INTRINSICS_H
#define QS8MUL_RVV_STORE_H
#define QS8MUL_SCALAR_NAN_H
#define QS8MUL_TYPES_H
#define QS8MUL_TYPE_WIDTH_PROBE_H
#define QS8MUL_VECTOR_VALUES_H
#define QS8MUL_VL_CONTROL_H
#include "../../shim/qm_mull_low.c"
#include "../../shim/qm_mull_high.c"
#include "../../shim/qm_add_reinterpret.c"
#include "../../shim/qm_narrow_pair.c"
#include "../../shim/qm_sext_sub.c"
#include "../../shim/qm_store4.c"
#include "../../shim/qm_store2.c"
#include "../../shim/qm_store1.c"
#include "../../shim/qm_ext_self.c"
#include "../../shim/qm_get32.c"
#include "../../shim/qm_store32.c"
#include "../../shim/vl_control.c"
#include "../../shim/store.c"
#include "../../shim/control.c"
#include "../../shim/float_borrow.c"
#undef assert
#define assert(c) qm_assert((c))
#include "../../shim/neon_frontend.h"
#define test_neon field_neon
#include "../../impl/testNEON.c"
#undef test_neon
#include "../../shim/rvv_frontend_prefix.h"
#define test_rvv field_rvv
#include "../../impl/testRVV.c"
#undef test_rvv
#undef assert
#include <assert.h>
