// Lean compiler output
// Module: SALT.Intrinsics.Neon
// Imports: public import Init public import SALT.Basic
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___lam__0(lean_object*, lean_object*);
static const lean_closure_object lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_closure_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 245}, .m_fun = (void*)lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___lam__0, .m_arity = 2, .m_num_fixed = 0, .m_objs = {} };
static const lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__0 = (const lean_object*)&lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__0_value;
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1;
lean_object* l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8(lean_object*, lean_object*);
lean_object* l_List_reverse___redArg(lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmovl__s16_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmovl__s16(lean_object*);
lean_object* l_BitVec_mul(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmulq__s32_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmulq__s32_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmulq__s32(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmulq__s32___boxed(lean_object*, lean_object*);
lean_object* l_BitVec_add(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32___lam__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32___lam__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32(lean_object*, lean_object*, lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_nat_shiftl(lean_object*, lean_object*);
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
lean_object* l_BitVec_sshiftRight(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_setWidth(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vrshlq__s32_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vrshlq__s32_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32___boxed(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_signedClamp(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqmovn__s32_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vqmovn__s32(lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqmovn__s16_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vqmovn__s16(lean_object*);
lean_object* lp_SALT_SALT_signedSatAdd(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqaddq__s16_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vqaddq__s16(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_bvSignedMax(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmax__s8_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmax__s8(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_bvSignedMin(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmin__s8_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmin__s8(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___lam__0(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; 
x_3 = lean_unsigned_to_nat(16u);
x_4 = lean_unsigned_to_nat(8u);
x_5 = l_BitVec_signExtend(x_4, x_3, x_1);
x_6 = l_BitVec_signExtend(x_4, x_3, x_2);
x_7 = l_BitVec_sub(x_3, x_5, x_6);
lean_dec(x_6);
lean_dec(x_5);
return x_7;
}
}
static lean_object* _init_lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vsubl__s8(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; lean_object* x_5; 
x_3 = ((lean_object*)(lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__0));
x_4 = lean_obj_once(&lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1, &lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1_once, _init_lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1);
x_5 = l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(x_3, x_1, x_2, x_4);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmovl__s16_spec__0(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
x_3 = l_List_reverse___redArg(x_2);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_1);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_ctor_get(x_1, 1);
x_7 = lean_unsigned_to_nat(16u);
x_8 = lean_unsigned_to_nat(32u);
x_9 = l_BitVec_signExtend(x_7, x_8, x_5);
lean_ctor_set(x_1, 1, x_2);
lean_ctor_set(x_1, 0, x_9);
{
lean_object* _tmp_0 = x_6;
lean_object* _tmp_1 = x_1;
x_1 = _tmp_0;
x_2 = _tmp_1;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_11 = lean_ctor_get(x_1, 0);
x_12 = lean_ctor_get(x_1, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_1);
x_13 = lean_unsigned_to_nat(16u);
x_14 = lean_unsigned_to_nat(32u);
x_15 = l_BitVec_signExtend(x_13, x_14, x_11);
x_16 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_16, 0, x_15);
lean_ctor_set(x_16, 1, x_2);
x_1 = x_12;
x_2 = x_16;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmovl__s16(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmovl__s16_spec__0(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmulq__s32_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
x_4 = l_List_reverse___redArg(x_3);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_unsigned_to_nat(32u);
x_9 = l_BitVec_mul(x_8, x_6, x_1);
lean_dec(x_6);
lean_ctor_set(x_2, 1, x_3);
lean_ctor_set(x_2, 0, x_9);
{
lean_object* _tmp_1 = x_7;
lean_object* _tmp_2 = x_2;
x_2 = _tmp_1;
x_3 = _tmp_2;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_11 = lean_ctor_get(x_2, 0);
x_12 = lean_ctor_get(x_2, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_2);
x_13 = lean_unsigned_to_nat(32u);
x_14 = l_BitVec_mul(x_13, x_11, x_1);
lean_dec(x_11);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_3);
x_2 = x_12;
x_3 = x_15;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmulq__s32_spec__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmulq__s32_spec__0(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmulq__s32(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmulq__s32_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmulq__s32___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_SALT_SALT_Intrinsics_Neon_vmulq__s32(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32___lam__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_unsigned_to_nat(32u);
x_5 = l_BitVec_mul(x_4, x_3, x_1);
x_6 = l_BitVec_add(x_4, x_2, x_5);
lean_dec(x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32___lam__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32___lam__0(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_alloc_closure((void*)(lp_SALT_SALT_Intrinsics_Neon_vmlaq__s32___lam__0___boxed), 3, 1);
lean_closure_set(x_4, 0, x_3);
x_5 = lean_obj_once(&lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1, &lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1_once, _init_lp_SALT_SALT_Intrinsics_Neon_vsubl__s8___closed__1);
x_6 = l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(x_4, x_1, x_2, x_5);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_unsigned_to_nat(0u);
x_4 = lean_nat_dec_eq(x_2, x_3);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_5 = lean_unsigned_to_nat(32u);
x_6 = lean_unsigned_to_nat(64u);
x_7 = l_BitVec_signExtend(x_5, x_6, x_1);
x_8 = lean_unsigned_to_nat(1u);
x_9 = lean_nat_sub(x_2, x_8);
x_10 = lean_nat_shiftl(x_8, x_9);
lean_dec(x_9);
x_11 = l_BitVec_ofNat(x_6, x_10);
lean_dec(x_10);
x_12 = l_BitVec_add(x_6, x_7, x_11);
lean_dec(x_11);
lean_dec(x_7);
x_13 = l_BitVec_sshiftRight(x_6, x_12, x_2);
x_14 = l_BitVec_setWidth(x_6, x_5, x_13);
lean_dec(x_13);
return x_14;
}
else
{
return x_1;
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vrshlq__s32_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
x_4 = l_List_reverse___redArg(x_3);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(x_6, x_1);
lean_ctor_set(x_2, 1, x_3);
lean_ctor_set(x_2, 0, x_8);
{
lean_object* _tmp_1 = x_7;
lean_object* _tmp_2 = x_2;
x_2 = _tmp_1;
x_3 = _tmp_2;
}
goto _start;
}
else
{
lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
x_10 = lean_ctor_get(x_2, 0);
x_11 = lean_ctor_get(x_2, 1);
lean_inc(x_11);
lean_inc(x_10);
lean_dec(x_2);
x_12 = lp_SALT_SALT_Intrinsics_Neon_neonRoundingShiftRight(x_10, x_1);
x_13 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_13, 0, x_12);
lean_ctor_set(x_13, 1, x_3);
x_2 = x_11;
x_3 = x_13;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vrshlq__s32_spec__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vrshlq__s32_spec__0(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vrshlq__s32_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_SALT_SALT_Intrinsics_Neon_vrshlq__s32(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqmovn__s32_spec__0(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
x_3 = l_List_reverse___redArg(x_2);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_1);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_ctor_get(x_1, 1);
x_7 = lean_unsigned_to_nat(32u);
x_8 = lean_unsigned_to_nat(16u);
x_9 = lp_SALT_SALT_signedClamp(x_7, x_5, x_8);
lean_ctor_set(x_1, 1, x_2);
lean_ctor_set(x_1, 0, x_9);
{
lean_object* _tmp_0 = x_6;
lean_object* _tmp_1 = x_1;
x_1 = _tmp_0;
x_2 = _tmp_1;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_11 = lean_ctor_get(x_1, 0);
x_12 = lean_ctor_get(x_1, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_1);
x_13 = lean_unsigned_to_nat(32u);
x_14 = lean_unsigned_to_nat(16u);
x_15 = lp_SALT_SALT_signedClamp(x_13, x_11, x_14);
x_16 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_16, 0, x_15);
lean_ctor_set(x_16, 1, x_2);
x_1 = x_12;
x_2 = x_16;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vqmovn__s32(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqmovn__s32_spec__0(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqmovn__s16_spec__0(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
x_3 = l_List_reverse___redArg(x_2);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_1);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_ctor_get(x_1, 1);
x_7 = lean_unsigned_to_nat(16u);
x_8 = lean_unsigned_to_nat(8u);
x_9 = lp_SALT_SALT_signedClamp(x_7, x_5, x_8);
lean_ctor_set(x_1, 1, x_2);
lean_ctor_set(x_1, 0, x_9);
{
lean_object* _tmp_0 = x_6;
lean_object* _tmp_1 = x_1;
x_1 = _tmp_0;
x_2 = _tmp_1;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; 
x_11 = lean_ctor_get(x_1, 0);
x_12 = lean_ctor_get(x_1, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_1);
x_13 = lean_unsigned_to_nat(16u);
x_14 = lean_unsigned_to_nat(8u);
x_15 = lp_SALT_SALT_signedClamp(x_13, x_11, x_14);
x_16 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_16, 0, x_15);
lean_ctor_set(x_16, 1, x_2);
x_1 = x_12;
x_2 = x_16;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vqmovn__s16(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqmovn__s16_spec__0(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqaddq__s16_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
lean_dec(x_1);
x_4 = l_List_reverse___redArg(x_3);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_unsigned_to_nat(16u);
lean_inc(x_1);
x_9 = lp_SALT_SALT_signedSatAdd(x_8, x_6, x_1);
lean_ctor_set(x_2, 1, x_3);
lean_ctor_set(x_2, 0, x_9);
{
lean_object* _tmp_1 = x_7;
lean_object* _tmp_2 = x_2;
x_2 = _tmp_1;
x_3 = _tmp_2;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_11 = lean_ctor_get(x_2, 0);
x_12 = lean_ctor_get(x_2, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_2);
x_13 = lean_unsigned_to_nat(16u);
lean_inc(x_1);
x_14 = lp_SALT_SALT_signedSatAdd(x_13, x_11, x_1);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_3);
x_2 = x_12;
x_3 = x_15;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vqaddq__s16(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vqaddq__s16_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmax__s8_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
lean_dec(x_1);
x_4 = l_List_reverse___redArg(x_3);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_unsigned_to_nat(8u);
lean_inc(x_1);
x_9 = lp_SALT_SALT_bvSignedMax(x_8, x_6, x_1);
lean_ctor_set(x_2, 1, x_3);
lean_ctor_set(x_2, 0, x_9);
{
lean_object* _tmp_1 = x_7;
lean_object* _tmp_2 = x_2;
x_2 = _tmp_1;
x_3 = _tmp_2;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_11 = lean_ctor_get(x_2, 0);
x_12 = lean_ctor_get(x_2, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_2);
x_13 = lean_unsigned_to_nat(8u);
lean_inc(x_1);
x_14 = lp_SALT_SALT_bvSignedMax(x_13, x_11, x_1);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_3);
x_2 = x_12;
x_3 = x_15;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmax__s8(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmax__s8_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmin__s8_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_4; 
lean_dec(x_1);
x_4 = l_List_reverse___redArg(x_3);
return x_4;
}
else
{
uint8_t x_5; 
x_5 = !lean_is_exclusive(x_2);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_unsigned_to_nat(8u);
lean_inc(x_1);
x_9 = lp_SALT_SALT_bvSignedMin(x_8, x_6, x_1);
lean_ctor_set(x_2, 1, x_3);
lean_ctor_set(x_2, 0, x_9);
{
lean_object* _tmp_1 = x_7;
lean_object* _tmp_2 = x_2;
x_2 = _tmp_1;
x_3 = _tmp_2;
}
goto _start;
}
else
{
lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; 
x_11 = lean_ctor_get(x_2, 0);
x_12 = lean_ctor_get(x_2, 1);
lean_inc(x_12);
lean_inc(x_11);
lean_dec(x_2);
x_13 = lean_unsigned_to_nat(8u);
lean_inc(x_1);
x_14 = lp_SALT_SALT_bvSignedMin(x_13, x_11, x_1);
x_15 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_15, 0, x_14);
lean_ctor_set(x_15, 1, x_3);
x_2 = x_12;
x_3 = x_15;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_Neon_vmin__s8(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_Neon_vmin__s8_spec__0(x_2, x_1, x_3);
return x_4;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SALT_SALT_Basic(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Intrinsics_Neon(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Basic(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
