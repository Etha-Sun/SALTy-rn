// Lean compiler output
// Module: SALT.Intrinsics.RVV
// Imports: public import Init public import SALT.Basic public import SALT.Params
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
lean_object* l_BitVec_signExtend(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_sub(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vwsub__vx_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vwsub__vx(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vsext__vf2_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vsext__vf2(lean_object*);
lean_object* l_List_replicateTR___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmv__v__x(lean_object*, lean_object*);
lean_object* l_BitVec_mul(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_add(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___lam__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___lam__0___boxed(lean_object*, lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___closed__0;
lean_object* l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx(lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_ofNat(lean_object*, lean_object*);
static lean_once_cell_t lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___closed__0;
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* l_BitVec_sshiftRight(lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
uint8_t l_Nat_testBit(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vssra__vx__rnu_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vssra__vx__rnu_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu___boxed(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_signedClamp(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vnclip__wx__i16_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i16(lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vnclip__wx__i8_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i8(lean_object*);
lean_object* lp_SALT_SALT_signedSatAdd(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vsadd__vx_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vsadd__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_bvSignedMax(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vmax__vx_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmax__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_bvSignedMin(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vmin__vx_spec__0(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmin__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_clamp(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvElemFn(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvElemFn___boxed(lean_object*, lean_object*, lean_object*);
lean_object* l_List_lengthTR___redArg(lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvPipelineFromIntrinsics(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vwsub__vx_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; 
x_6 = lean_ctor_get(x_2, 0);
x_7 = lean_ctor_get(x_2, 1);
x_8 = lean_unsigned_to_nat(16u);
x_9 = lean_unsigned_to_nat(8u);
x_10 = l_BitVec_signExtend(x_9, x_8, x_6);
lean_inc(x_1);
x_11 = l_BitVec_signExtend(x_9, x_8, x_1);
x_12 = l_BitVec_sub(x_8, x_10, x_11);
lean_dec(x_11);
lean_dec(x_10);
lean_ctor_set(x_2, 1, x_3);
lean_ctor_set(x_2, 0, x_12);
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
lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; 
x_14 = lean_ctor_get(x_2, 0);
x_15 = lean_ctor_get(x_2, 1);
lean_inc(x_15);
lean_inc(x_14);
lean_dec(x_2);
x_16 = lean_unsigned_to_nat(16u);
x_17 = lean_unsigned_to_nat(8u);
x_18 = l_BitVec_signExtend(x_17, x_16, x_14);
lean_inc(x_1);
x_19 = l_BitVec_signExtend(x_17, x_16, x_1);
x_20 = l_BitVec_sub(x_16, x_18, x_19);
lean_dec(x_19);
lean_dec(x_18);
x_21 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_21, 0, x_20);
lean_ctor_set(x_21, 1, x_3);
x_2 = x_15;
x_3 = x_21;
goto _start;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vwsub__vx(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vwsub__vx_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vsext__vf2_spec__0(lean_object* x_1, lean_object* x_2) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vsext__vf2(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vsext__vf2_spec__0(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmv__v__x(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_List_replicateTR___redArg(x_2, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___lam__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___lam__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___lam__0(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_alloc_closure((void*)(lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___lam__0___boxed), 3, 1);
lean_closure_set(x_4, 0, x_2);
x_5 = lean_obj_once(&lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___closed__0, &lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___closed__0_once, _init_lp_SALT_SALT_Intrinsics_RVV_vmacc__vx___closed__0);
x_6 = l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(x_4, x_1, x_3, x_5);
return x_6;
}
}
static lean_object* _init_lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_unsigned_to_nat(32u);
x_3 = l_BitVec_ofNat(x_2, x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_unsigned_to_nat(0u);
x_4 = lean_nat_dec_eq(x_2, x_3);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; uint8_t x_9; 
x_5 = lean_unsigned_to_nat(32u);
lean_inc(x_1);
x_6 = l_BitVec_sshiftRight(x_5, x_1, x_2);
x_7 = lean_unsigned_to_nat(1u);
x_8 = lean_nat_sub(x_2, x_7);
x_9 = l_Nat_testBit(x_1, x_8);
lean_dec(x_8);
lean_dec(x_1);
if (x_9 == 0)
{
return x_6;
}
else
{
lean_object* x_10; lean_object* x_11; 
x_10 = lean_obj_once(&lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___closed__0, &lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___closed__0_once, _init_lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___closed__0);
x_11 = l_BitVec_add(x_5, x_6, x_10);
lean_dec(x_6);
return x_11;
}
}
else
{
return x_1;
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vssra__vx__rnu_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
x_8 = lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(x_6, x_1);
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
x_12 = lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(x_10, x_1);
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
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vssra__vx__rnu_spec__0___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vssra__vx__rnu_spec__0(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vssra__vx__rnu_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vnclip__wx__i16_spec__0(lean_object* x_1, lean_object* x_2) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i16(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vnclip__wx__i16_spec__0(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vnclip__wx__i8_spec__0(lean_object* x_1, lean_object* x_2) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i8(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vnclip__wx__i8_spec__0(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vsadd__vx_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vsadd__vx(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vsadd__vx_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vmax__vx_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmax__vx(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vmax__vx_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vmin__vx_spec__0(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_vmin__vx(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; lean_object* x_4; 
x_3 = lean_box(0);
x_4 = lp_SALT_List_mapTR_loop___at___00SALT_Intrinsics_RVV_vmin__vx_spec__0(x_2, x_1, x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvElemFn(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 3);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 5);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 6);
lean_inc(x_7);
x_8 = lean_ctor_get(x_1, 7);
lean_inc(x_8);
x_9 = lean_ctor_get(x_1, 8);
lean_inc(x_9);
lean_dec_ref(x_1);
x_10 = lean_unsigned_to_nat(16u);
x_11 = lean_unsigned_to_nat(8u);
x_12 = l_BitVec_signExtend(x_11, x_10, x_3);
x_13 = l_BitVec_signExtend(x_11, x_10, x_4);
x_14 = l_BitVec_sub(x_10, x_12, x_13);
lean_dec(x_13);
lean_dec(x_12);
x_15 = lean_unsigned_to_nat(32u);
x_16 = l_BitVec_signExtend(x_10, x_15, x_14);
x_17 = l_BitVec_mul(x_15, x_16, x_5);
lean_dec(x_5);
lean_dec(x_16);
x_18 = l_BitVec_add(x_15, x_2, x_17);
lean_dec(x_17);
x_19 = lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(x_18, x_6);
lean_dec(x_6);
x_20 = lp_SALT_SALT_signedClamp(x_15, x_19, x_10);
x_21 = lp_SALT_SALT_signedSatAdd(x_10, x_20, x_7);
x_22 = lp_SALT_SALT_signedClamp(x_10, x_21, x_11);
x_23 = lp_SALT_SALT_clamp(x_11, x_22, x_8, x_9);
return x_23;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvElemFn___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_Intrinsics_RVV_rvvElemFn(x_1, x_2, x_3);
lean_dec(x_2);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvPipelineFromIntrinsics(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; 
x_4 = lean_ctor_get(x_1, 0);
lean_inc(x_4);
x_5 = lean_ctor_get(x_1, 3);
lean_inc(x_5);
x_6 = lean_ctor_get(x_1, 5);
lean_inc(x_6);
x_7 = lean_ctor_get(x_1, 6);
lean_inc(x_7);
x_8 = lean_ctor_get(x_1, 7);
lean_inc(x_8);
x_9 = lean_ctor_get(x_1, 8);
lean_inc(x_9);
lean_dec_ref(x_1);
lean_inc(x_3);
x_10 = lp_SALT_SALT_Intrinsics_RVV_vwsub__vx(x_3, x_4);
x_11 = lp_SALT_SALT_Intrinsics_RVV_vsext__vf2(x_10);
x_12 = l_List_lengthTR___redArg(x_3);
lean_dec(x_3);
x_13 = l_List_replicateTR___redArg(x_12, x_2);
x_14 = lp_SALT_SALT_Intrinsics_RVV_vmacc__vx(x_13, x_5, x_11);
x_15 = lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu(x_14, x_6);
lean_dec(x_6);
x_16 = lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i16(x_15);
x_17 = lp_SALT_SALT_Intrinsics_RVV_vsadd__vx(x_16, x_7);
x_18 = lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i8(x_17);
x_19 = lp_SALT_SALT_Intrinsics_RVV_vmax__vx(x_18, x_8);
x_20 = lp_SALT_SALT_Intrinsics_RVV_vmin__vx(x_19, x_9);
return x_20;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SALT_SALT_Basic(uint8_t builtin);
lean_object* initialize_SALT_SALT_Params(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Intrinsics_RVV(uint8_t builtin) {
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
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
