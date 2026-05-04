// Lean compiler output
// Module: SALT.Kernel.QS8VAddC.Equivalence
// Imports: public import Init public import SALT.Kernel.QS8VAddC.Neon public import SALT.Kernel.QS8VAddC.RVV public import SALT.Proof.RoundingEquiv
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SALT_SALT_Kernel_QS8VAddC_Neon(uint8_t builtin);
lean_object* initialize_SALT_SALT_Kernel_QS8VAddC_RVV(uint8_t builtin);
lean_object* initialize_SALT_SALT_Proof_RoundingEquiv(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Kernel_QS8VAddC_Equivalence(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Kernel_QS8VAddC_Neon(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Kernel_QS8VAddC_RVV(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Proof_RoundingEquiv(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
