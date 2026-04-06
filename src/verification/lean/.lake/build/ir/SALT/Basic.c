// Lean compiler output
// Module: SALT.Basic
// Imports: public import Init
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
lean_object* lean_nat_to_int(lean_object*);
static lean_once_cell_t lp_SALT_SALT_signedClamp___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_signedClamp___closed__0;
static lean_once_cell_t lp_SALT_SALT_signedClamp___closed__1_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_signedClamp___closed__1;
lean_object* l_BitVec_toInt(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* l_Int_pow(lean_object*, lean_object*);
lean_object* lean_int_neg(lean_object*);
uint8_t lean_int_dec_le(lean_object*, lean_object*);
lean_object* l_BitVec_ofInt(lean_object*, lean_object*);
lean_object* lean_int_sub(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_signedClamp(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_signedClamp___boxed(lean_object*, lean_object*, lean_object*);
lean_object* lean_int_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_signedSatAdd(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_signedSatAdd___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMax(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMax___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMin(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMin___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_clamp(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_clamp___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_BitVec_signExtend(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_sext(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_sext___boxed(lean_object*, lean_object*, lean_object*);
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "Lean"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0_value;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "Parser"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1_value;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "Tactic"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2_value;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "tacticSeq"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__3 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__3_value;
lean_object* l_Lean_Name_mkStr4(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value_aux_0),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value_aux_1),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value_aux_2),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__3_value),LEAN_SCALAR_PTR_LITERAL(212, 140, 85, 215, 241, 69, 7, 118)}};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4_value;
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 19, .m_capacity = 19, .m_length = 18, .m_data = "tacticSeq1Indented"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__6 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__6_value;
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value_aux_0),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value_aux_1),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value_aux_2),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__6_value),LEAN_SCALAR_PTR_LITERAL(223, 90, 160, 238, 133, 180, 23, 239)}};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7_value;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "null"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__8 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__8_value;
lean_object* l_Lean_Name_mkStr1(lean_object*);
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__8_value),LEAN_SCALAR_PTR_LITERAL(24, 58, 49, 223, 146, 207, 197, 136)}};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__9 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__9_value;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "simp"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__10 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__10_value;
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value_aux_0),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value_aux_1),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value_aux_2),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__10_value),LEAN_SCALAR_PTR_LITERAL(50, 13, 241, 145, 67, 153, 105, 177)}};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11_value;
lean_object* l_Lean_mkAtom(lean_object*);
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__12_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__12;
lean_object* lean_array_push(lean_object*, lean_object*);
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__13_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__13;
static const lean_string_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__14_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "optConfig"};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__14 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__14_value;
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value_aux_0),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value_aux_1),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value_aux_2),((lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__14_value),LEAN_SCALAR_PTR_LITERAL(137, 208, 10, 74, 108, 50, 106, 48)}};
static const lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15 = (const lean_object*)&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15_value;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__17_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__17;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__18_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__18;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__19_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__19;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__20_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__20;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__21_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__21;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__22_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__22;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__23_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__23;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__24_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__24;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__25_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__25;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__26_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__26;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__27_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__27;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__28_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__28;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__29_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__29;
static lean_once_cell_t lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30;
LEAN_EXPORT lean_object* lp_SALT_SALT_zipWith__replicate__left___auto__1;
LEAN_EXPORT lean_object* lp_SALT_SALT_zipWith__replicate__right___auto__1;
static lean_object* _init_lp_SALT_SALT_signedClamp___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_lp_SALT_SALT_signedClamp___closed__1(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_signedClamp(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_15; lean_object* x_16; uint8_t x_17; 
x_4 = l_BitVec_toInt(x_1, x_2);
x_5 = lean_obj_once(&lp_SALT_SALT_signedClamp___closed__0, &lp_SALT_SALT_signedClamp___closed__0_once, _init_lp_SALT_SALT_signedClamp___closed__0);
x_6 = lean_unsigned_to_nat(1u);
x_7 = lean_nat_sub(x_3, x_6);
x_8 = l_Int_pow(x_5, x_7);
lean_dec(x_7);
x_9 = lean_int_neg(x_8);
x_15 = lean_obj_once(&lp_SALT_SALT_signedClamp___closed__1, &lp_SALT_SALT_signedClamp___closed__1_once, _init_lp_SALT_SALT_signedClamp___closed__1);
x_16 = lean_int_sub(x_8, x_15);
lean_dec(x_8);
x_17 = lean_int_dec_le(x_4, x_16);
if (x_17 == 0)
{
lean_dec(x_4);
x_10 = x_16;
goto block_14;
}
else
{
lean_dec(x_16);
x_10 = x_4;
goto block_14;
}
block_14:
{
uint8_t x_11; 
x_11 = lean_int_dec_le(x_9, x_10);
if (x_11 == 0)
{
lean_object* x_12; 
lean_dec(x_10);
x_12 = l_BitVec_ofInt(x_3, x_9);
lean_dec(x_9);
return x_12;
}
else
{
lean_object* x_13; 
lean_dec(x_9);
x_13 = l_BitVec_ofInt(x_3, x_10);
lean_dec(x_10);
return x_13;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_signedClamp___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_signedClamp(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_signedSatAdd(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_17; lean_object* x_18; uint8_t x_19; 
x_4 = l_BitVec_toInt(x_1, x_2);
x_5 = l_BitVec_toInt(x_1, x_3);
x_6 = lean_int_add(x_4, x_5);
lean_dec(x_5);
lean_dec(x_4);
x_7 = lean_obj_once(&lp_SALT_SALT_signedClamp___closed__0, &lp_SALT_SALT_signedClamp___closed__0_once, _init_lp_SALT_SALT_signedClamp___closed__0);
x_8 = lean_unsigned_to_nat(1u);
x_9 = lean_nat_sub(x_1, x_8);
x_10 = l_Int_pow(x_7, x_9);
lean_dec(x_9);
x_11 = lean_int_neg(x_10);
x_17 = lean_obj_once(&lp_SALT_SALT_signedClamp___closed__1, &lp_SALT_SALT_signedClamp___closed__1_once, _init_lp_SALT_SALT_signedClamp___closed__1);
x_18 = lean_int_sub(x_10, x_17);
lean_dec(x_10);
x_19 = lean_int_dec_le(x_6, x_18);
if (x_19 == 0)
{
lean_dec(x_6);
x_12 = x_18;
goto block_16;
}
else
{
lean_dec(x_18);
x_12 = x_6;
goto block_16;
}
block_16:
{
uint8_t x_13; 
x_13 = lean_int_dec_le(x_11, x_12);
if (x_13 == 0)
{
lean_object* x_14; 
lean_dec(x_12);
x_14 = l_BitVec_ofInt(x_1, x_11);
lean_dec(x_11);
return x_14;
}
else
{
lean_object* x_15; 
lean_dec(x_11);
x_15 = l_BitVec_ofInt(x_1, x_12);
lean_dec(x_12);
return x_15;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_signedSatAdd___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_signedSatAdd(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMax(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; 
lean_inc(x_3);
x_4 = l_BitVec_toInt(x_1, x_3);
lean_inc(x_2);
x_5 = l_BitVec_toInt(x_1, x_2);
x_6 = lean_int_dec_le(x_4, x_5);
lean_dec(x_5);
lean_dec(x_4);
if (x_6 == 0)
{
lean_dec(x_2);
return x_3;
}
else
{
lean_dec(x_3);
return x_2;
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMax___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_bvSignedMax(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMin(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; 
lean_inc(x_2);
x_4 = l_BitVec_toInt(x_1, x_2);
lean_inc(x_3);
x_5 = l_BitVec_toInt(x_1, x_3);
x_6 = lean_int_dec_le(x_4, x_5);
lean_dec(x_5);
lean_dec(x_4);
if (x_6 == 0)
{
lean_dec(x_2);
return x_3;
}
else
{
lean_dec(x_3);
return x_2;
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_bvSignedMin___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_bvSignedMin(x_1, x_2, x_3);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_clamp(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; lean_object* x_6; 
x_5 = lp_SALT_SALT_bvSignedMax(x_1, x_2, x_3);
x_6 = lp_SALT_SALT_bvSignedMin(x_1, x_5, x_4);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_clamp___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lp_SALT_SALT_clamp(x_1, x_2, x_3, x_4);
lean_dec(x_1);
return x_5;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_sext(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l_BitVec_signExtend(x_1, x_3, x_2);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_sext___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = lp_SALT_SALT_sext(x_1, x_2, x_3);
lean_dec(x_3);
lean_dec(x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__12(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__10));
x_2 = l_Lean_mkAtom(x_1);
return x_2;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__13(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__12, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__12_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__12);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5);
x_2 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__9));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__17(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__18(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__17, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__17_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__17);
x_2 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__15));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__19(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__18, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__18_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__18);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__13, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__13_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__13);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__20(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__19, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__19_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__19);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__21(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__20, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__20_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__20);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__22(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__21, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__21_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__21);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__23(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__16);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__22, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__22_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__22);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__24(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__23, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__23_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__23);
x_2 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__11));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__25(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__24, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__24_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__24);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__26(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__25, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__25_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__25);
x_2 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__9));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__27(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__26, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__26_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__26);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__28(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__27, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__27_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__27);
x_2 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__7));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__29(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__28, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__28_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__28);
x_2 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__29, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__29_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__29);
x_2 = ((lean_object*)(lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__4));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__left___auto__1(void) {
_start:
{
lean_object* x_1; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30);
return x_1;
}
}
static lean_object* _init_lp_SALT_SALT_zipWith__replicate__right___auto__1(void) {
_start:
{
lean_object* x_1; 
x_1 = lean_obj_once(&lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30, &lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30_once, _init_lp_SALT_SALT_zipWith__replicate__left___auto__1___closed__30);
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Basic(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
lp_SALT_SALT_zipWith__replicate__left___auto__1 = _init_lp_SALT_SALT_zipWith__replicate__left___auto__1();
lean_mark_persistent(lp_SALT_SALT_zipWith__replicate__left___auto__1);
lp_SALT_SALT_zipWith__replicate__right___auto__1 = _init_lp_SALT_SALT_zipWith__replicate__right___auto__1();
lean_mark_persistent(lp_SALT_SALT_zipWith__replicate__right___auto__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
