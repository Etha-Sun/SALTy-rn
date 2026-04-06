// Lean compiler output
// Module: SALT
// Imports: public import Init public import SALT.Basic public import SALT.Params public import SALT.Intrinsics.Neon public import SALT.Intrinsics.RVV public import SALT.Kernel.Neon public import SALT.Kernel.RVV public import SALT.Proof.RoundingEquiv public import SALT.Proof.IterationEquiv public import SALT.Proof.ChunkEquiv public import SALT.Proof.Equivalence
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
lean_object* initialize_SALT_SALT_Basic(uint8_t builtin);
lean_object* initialize_SALT_SALT_Params(uint8_t builtin);
lean_object* initialize_SALT_SALT_Intrinsics_Neon(uint8_t builtin);
lean_object* initialize_SALT_SALT_Intrinsics_RVV(uint8_t builtin);
lean_object* initialize_SALT_SALT_Kernel_Neon(uint8_t builtin);
lean_object* initialize_SALT_SALT_Kernel_RVV(uint8_t builtin);
lean_object* initialize_SALT_SALT_Proof_RoundingEquiv(uint8_t builtin);
lean_object* initialize_SALT_SALT_Proof_IterationEquiv(uint8_t builtin);
lean_object* initialize_SALT_SALT_Proof_ChunkEquiv(uint8_t builtin);
lean_object* initialize_SALT_SALT_Proof_Equivalence(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Basic(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Params(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Intrinsics_Neon(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Intrinsics_RVV(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Kernel_Neon(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Kernel_RVV(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Proof_RoundingEquiv(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Proof_IterationEquiv(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Proof_ChunkEquiv(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Proof_Equivalence(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
