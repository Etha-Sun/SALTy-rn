// Lean compiler output
// Module: SALT.Kernel.QS8VAdd.Neon
// Imports: public import Init public import SALT.Intrinsics.Neon public import SALT.Kernel.QS8.Params
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
lean_object* l_BitVec_signExtend(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_sub(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_mul(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_add(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_signedClamp(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_signedSatAdd(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_clamp(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonElemFn(lean_object*, lean_object*, lean_object*);
lean_object* l_List_lengthTR___redArg(lean_object*);
lean_object* l_List_replicateTR___redArg(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vmovl__s16(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vmulq__s32(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vqmovn__s32(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vqaddq__s16(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vqmovn__s16(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vmax__s8(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_vmin__s8(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonPipelineFromIntrinsics(lean_object*, lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0;
lean_object* l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop___closed__0;
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* l_List_appendTR___redArg(lean_object*, lean_object*);
lean_object* l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_drop___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonElemFn(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 3);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 4);
lean_inc(x_7);
x_8 = lean_ctor_get(x_1, 5);
lean_inc(x_8);
x_9 = lean_ctor_get(x_1, 6);
lean_inc(x_9);
x_10 = lean_ctor_get(x_1, 7);
lean_inc(x_10);
x_11 = lean_ctor_get(x_1, 8);
lean_inc(x_11);
lean_dec_ref(x_1);
x_12 = lean_unsigned_to_nat(16u);
x_13 = lean_unsigned_to_nat(8u);
x_14 = l_BitVec_signExtend(x_13, x_12, x_2);
x_15 = l_BitVec_signExtend(x_13, x_12, x_4);
x_16 = l_BitVec_sub(x_12, x_14, x_15);
lean_dec(x_15);
lean_dec(x_14);
x_17 = l_BitVec_signExtend(x_13, x_12, x_3);
x_18 = l_BitVec_signExtend(x_13, x_12, x_5);
x_19 = l_BitVec_sub(x_12, x_17, x_18);
lean_dec(x_18);
lean_dec(x_17);
x_20 = lean_unsigned_to_nat(32u);
x_21 = l_BitVec_signExtend(x_12, x_20, x_16);
x_22 = l_BitVec_signExtend(x_12, x_20, x_19);
x_23 = l_BitVec_mul(x_20, x_21, x_6);
lean_dec(x_6);
lean_dec(x_21);
x_24 = l_BitVec_mul(x_20, x_22, x_7);
lean_dec(x_7);
lean_dec(x_22);
x_25 = l_BitVec_add(x_20, x_23, x_24);
lean_dec(x_24);
lean_dec(x_23);
x_26 = lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(x_25, x_8);
lean_dec(x_8);
x_27 = lp_SALT_SALT_signedClamp(x_20, x_26, x_12);
x_28 = lp_SALT_SALT_signedSatAdd(x_12, x_27, x_9);
x_29 = lp_SALT_SALT_signedClamp(x_12, x_28, x_13);
x_30 = lp_SALT_SALT_clamp(x_13, x_29, x_10, x_11);
return x_30;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonPipelineFromIntrinsics(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 1);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 3);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 4);
lean_inc(x_7);
x_8 = lean_ctor_get(x_1, 5);
lean_inc(x_8);
x_9 = lean_ctor_get(x_1, 6);
lean_inc(x_9);
x_10 = lean_ctor_get(x_1, 7);
lean_inc(x_10);
x_11 = lean_ctor_get(x_1, 8);
lean_inc(x_11);
lean_dec_ref(x_1);
x_12 = l_List_lengthTR___redArg(x_2);
x_13 = l_List_replicateTR___redArg(x_12, x_4);
x_14 = l_List_lengthTR___redArg(x_3);
x_15 = l_List_replicateTR___redArg(x_14, x_5);
x_16 = lp_SALT_SALT_Intrinsics_Neon_vsubl__s8(x_2, x_13);
x_17 = lp_SALT_SALT_Intrinsics_Neon_vsubl__s8(x_3, x_15);
x_18 = lp_SALT_SALT_Intrinsics_Neon_vmovl__s16(x_16);
x_19 = lp_SALT_SALT_Intrinsics_Neon_vmovl__s16(x_17);
x_20 = lp_SALT_SALT_Intrinsics_Neon_vmulq__s32(x_18, x_6);
lean_dec(x_6);
x_21 = lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32(x_20, x_19, x_7);
x_22 = lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32(x_21, x_8);
lean_dec(x_8);
x_23 = lp_SALT_SALT_Intrinsics_Neon_vqmovn__s32(x_22);
x_24 = lp_SALT_SALT_Intrinsics_Neon_vqaddq__s16(x_23, x_9);
x_25 = lp_SALT_SALT_Intrinsics_Neon_vqmovn__s16(x_24);
x_26 = lp_SALT_SALT_Intrinsics_Neon_vmax__s8(x_25, x_10);
x_27 = lp_SALT_SALT_Intrinsics_Neon_vmin__s8(x_26, x_11);
return x_27;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_alloc_closure((void*)(lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonElemFn), 3, 1);
lean_closure_set(x_4, 0, x_1);
x_5 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0, &lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0);
x_6 = l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(x_4, x_2, x_3, x_5);
return x_6;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_unsigned_to_nat(8u);
x_3 = l_BitVec_ofNat(x_2, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_4 = lean_unsigned_to_nat(8u);
x_5 = l_List_lengthTR___redArg(x_2);
x_6 = lean_nat_dec_le(x_4, x_5);
if (x_6 == 0)
{
lean_object* x_7; uint8_t x_8; 
x_7 = lean_unsigned_to_nat(0u);
x_8 = lean_nat_dec_lt(x_7, x_5);
if (x_8 == 0)
{
lean_object* x_9; 
lean_dec(x_5);
lean_dec(x_3);
lean_dec(x_2);
lean_dec_ref(x_1);
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; 
x_10 = lean_nat_sub(x_4, x_5);
x_11 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop___closed__0, &lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop___closed__0_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop___closed__0);
x_12 = l_List_replicateTR___redArg(x_10, x_11);
x_13 = l_List_appendTR___redArg(x_2, x_12);
x_14 = l_List_lengthTR___redArg(x_3);
x_15 = lean_nat_sub(x_4, x_14);
lean_dec(x_14);
x_16 = l_List_replicateTR___redArg(x_15, x_11);
x_17 = l_List_appendTR___redArg(x_3, x_16);
x_18 = lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration(x_1, x_13, x_17);
x_19 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0, &lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0);
lean_inc(x_18);
x_20 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_18, x_18, x_5, x_19);
lean_dec(x_18);
return x_20;
}
}
else
{
lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; lean_object* x_27; lean_object* x_28; 
lean_dec(x_5);
x_21 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0, &lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration___closed__0);
lean_inc(x_2);
x_22 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_2, x_2, x_4, x_21);
lean_inc(x_3);
x_23 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_3, x_3, x_4, x_21);
lean_inc_ref(x_1);
x_24 = lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonIteration(x_1, x_22, x_23);
x_25 = l_List_drop___redArg(x_4, x_2);
lean_dec(x_2);
x_26 = l_List_drop___redArg(x_4, x_3);
lean_dec(x_3);
x_27 = lp_SALT_SALT_Kernel_QS8VAdd_Neon_neonLoop(x_1, x_25, x_26);
x_28 = l_List_appendTR___redArg(x_24, x_27);
return x_28;
}
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SALT_SALT_Intrinsics_Neon(uint8_t builtin);
lean_object* initialize_SALT_SALT_Kernel_QS8_Params(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Kernel_QS8VAdd_Neon(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Intrinsics_Neon(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Kernel_QS8_Params(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
