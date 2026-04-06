// Lean compiler output
// Module: SALT.Kernel.Neon
// Imports: public import Init public import SALT.Intrinsics.Neon
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
lean_object* l_List_reverse___redArg(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_Neon_neonElemFn(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Kernel_Neon_neonIteration_spec__0(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Kernel_Neon_neonIteration_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonIteration(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonIteration___boxed(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_Neon_neonLoop___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_Neon_neonLoop___closed__0;
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1;
lean_object* l_List_lengthTR___redArg(lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* l_List_replicateTR___redArg(lean_object*, lean_object*);
lean_object* l_List_appendTR___redArg(lean_object*, lean_object*);
lean_object* l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_drop___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonLoop(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonLoop___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Kernel_Neon_neonIteration_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_5; 
lean_dec_ref(x_1);
x_5 = l_List_reverse___redArg(x_4);
return x_5;
}
else
{
uint8_t x_6; 
x_6 = !lean_is_exclusive(x_3);
if (x_6 == 0)
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_7 = lean_ctor_get(x_3, 0);
x_8 = lean_ctor_get(x_3, 1);
lean_inc_ref(x_1);
x_9 = lp_SALT_SALT_Intrinsics_Neon_neonElemFn(x_1, x_2, x_7);
lean_ctor_set(x_3, 1, x_4);
lean_ctor_set(x_3, 0, x_9);
{
lean_object* _tmp_2 = x_8;
lean_object* _tmp_3 = x_3;
x_3 = _tmp_2;
x_4 = _tmp_3;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_11 = lean_ctor_get(x_3, 0);
x_12 = lean_ctor_get(x_3, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_3);
lean_inc_ref(x_1);
x_13 = lp_SALT_SALT_Intrinsics_Neon_neonElemFn(x_1, x_2, x_11);
x_14 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_14, 0, x_13);
lean_ctor_set(x_14, 1, x_4);
x_3 = x_12;
x_4 = x_14;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Kernel_Neon_neonIteration_spec__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_SALT_List_mapTR_loop___at___00SALT_Kernel_Neon_neonIteration_spec__0(x_1, x_2, x_3, x_4);
lean_dec(x_2);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonIteration(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_box(0);
x_5 = lp_SALT_List_mapTR_loop___at___00SALT_Kernel_Neon_neonIteration_spec__0(x_1, x_2, x_3, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonIteration___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_Kernel_Neon_neonIteration(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_Neon_neonLoop___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_unsigned_to_nat(8u);
x_3 = l_BitVec_ofNat(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonLoop(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_4 = lean_unsigned_to_nat(8u);
x_5 = l_List_lengthTR___redArg(x_3);
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
lean_dec_ref(x_1);
x_9 = lean_box(0);
return x_9;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_10 = lean_nat_sub(x_4, x_5);
x_11 = lean_obj_once(&lp_SALT_SALT_Kernel_Neon_neonLoop___closed__0, &lp_SALT_SALT_Kernel_Neon_neonLoop___closed__0_once, _init_lp_SALT_SALT_Kernel_Neon_neonLoop___closed__0);
x_12 = l_List_replicateTR___redArg(x_10, x_11);
x_13 = l_List_appendTR___redArg(x_3, x_12);
x_14 = lp_SALT_SALT_Kernel_Neon_neonIteration(x_1, x_2, x_13);
x_15 = lean_obj_once(&lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1, &lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1_once, _init_lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1);
lean_inc(x_14);
x_16 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_14, x_14, x_5, x_15);
lean_dec(x_14);
return x_16;
}
}
else
{
lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; 
lean_dec(x_5);
x_17 = lean_obj_once(&lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1, &lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1_once, _init_lp_SALT_SALT_Kernel_Neon_neonLoop___closed__1);
lean_inc(x_3);
x_18 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_3, x_3, x_4, x_17);
lean_inc_ref(x_1);
x_19 = lp_SALT_SALT_Kernel_Neon_neonIteration(x_1, x_2, x_18);
x_20 = l_List_drop___redArg(x_4, x_3);
lean_dec(x_3);
x_21 = lp_SALT_SALT_Kernel_Neon_neonLoop(x_1, x_2, x_20);
x_22 = l_List_appendTR___redArg(x_19, x_21);
return x_22;
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_Neon_neonLoop___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_Kernel_Neon_neonLoop(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SALT_SALT_Intrinsics_Neon(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Kernel_Neon(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Intrinsics_Neon(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
