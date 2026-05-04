// Lean compiler output
// Module: SALT.Kernel.QS8VAdd.RVV
// Imports: public import Init public import SALT.Intrinsics.RVV public import SALT.Kernel.QS8.Params
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
lean_object* lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_signedClamp(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_signedSatAdd(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_clamp(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvElemFn(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vwsub__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vsext__vf2(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vmul__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vmacc__vx(lean_object*, lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i16(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vsadd__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i8(lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vmax__vx(lean_object*, lean_object*);
lean_object* lp_SALT_SALT_Intrinsics_RVV_vmin__vx(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvPipelineFromIntrinsics(lean_object*, lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0;
lean_object* l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration(lean_object*, lean_object*, lean_object*);
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "Lean"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0_value;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "Parser"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1_value;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "Tactic"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2_value;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "tacticSeq"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__3 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__3_value;
lean_object* l_Lean_Name_mkStr4(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value_aux_0),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value_aux_1),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value_aux_2),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__3_value),LEAN_SCALAR_PTR_LITERAL(212, 140, 85, 215, 241, 69, 7, 118)}};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4_value;
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 19, .m_capacity = 19, .m_length = 18, .m_data = "tacticSeq1Indented"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__6 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__6_value;
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value_aux_0),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value_aux_1),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value_aux_2),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__6_value),LEAN_SCALAR_PTR_LITERAL(223, 90, 160, 238, 133, 180, 23, 239)}};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7_value;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "null"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__8 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__8_value;
lean_object* l_Lean_Name_mkStr1(lean_object*);
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__8_value),LEAN_SCALAR_PTR_LITERAL(24, 58, 49, 223, 146, 207, 197, 136)}};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__9 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__9_value;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "omega"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__10 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__10_value;
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value_aux_0),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value_aux_1),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value_aux_2),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__10_value),LEAN_SCALAR_PTR_LITERAL(138, 49, 229, 237, 137, 52, 176, 206)}};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11_value;
lean_object* l_Lean_mkAtom(lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__12_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__12;
lean_object* lean_array_push(lean_object*, lean_object*);
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__13_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__13;
static const lean_string_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__14_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "optConfig"};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__14 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__14_value;
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__0_value),LEAN_SCALAR_PTR_LITERAL(70, 193, 83, 126, 233, 67, 208, 165)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value_aux_1 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value_aux_0),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__1_value),LEAN_SCALAR_PTR_LITERAL(103, 136, 125, 166, 167, 98, 71, 111)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value_aux_2 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value_aux_1),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__2_value),LEAN_SCALAR_PTR_LITERAL(166, 58, 35, 182, 187, 130, 147, 254)}};
static const lean_ctor_object lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value_aux_2),((lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__14_value),LEAN_SCALAR_PTR_LITERAL(137, 208, 10, 74, 108, 50, 106, 48)}};
static const lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15 = (const lean_object*)&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15_value;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__16_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__16;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__17_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__17;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__18_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__18;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__19_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__19;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__20_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__20;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__21_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__21;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__22_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__22;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__23_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__23;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__24_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__24;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__25_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__25;
static lean_once_cell_t lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__26_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__26;
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1;
lean_object* l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_drop___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_appendTR___redArg(lean_object*, lean_object*);
lean_object* l_List_lengthTR___redArg(lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT___private_SALT_Kernel_QS8VAdd_RVV_0__SALT_Kernel_QS8VAdd_RVV_rvvLoop_match__1_splitter___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT___private_SALT_Kernel_QS8VAdd_RVV_0__SALT_Kernel_QS8VAdd_RVV_rvvLoop_match__1_splitter(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvElemFn(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
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
x_26 = lp_SALT_SALT_Intrinsics_RVV_rvvRoundingShiftRight(x_25, x_8);
lean_dec(x_8);
x_27 = lp_SALT_SALT_signedClamp(x_20, x_26, x_12);
x_28 = lp_SALT_SALT_signedSatAdd(x_12, x_27, x_9);
x_29 = lp_SALT_SALT_signedClamp(x_12, x_28, x_13);
x_30 = lp_SALT_SALT_clamp(x_13, x_29, x_10, x_11);
return x_30;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvPipelineFromIntrinsics(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; 
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
x_12 = lp_SALT_SALT_Intrinsics_RVV_vwsub__vx(x_2, x_4);
x_13 = lp_SALT_SALT_Intrinsics_RVV_vwsub__vx(x_3, x_5);
x_14 = lp_SALT_SALT_Intrinsics_RVV_vsext__vf2(x_12);
x_15 = lp_SALT_SALT_Intrinsics_RVV_vsext__vf2(x_13);
x_16 = lp_SALT_SALT_Intrinsics_RVV_vmul__vx(x_14, x_6);
lean_dec(x_6);
x_17 = lp_SALT_SALT_Intrinsics_RVV_vmacc__vx(x_16, x_7, x_15);
x_18 = lp_SALT_SALT_Intrinsics_RVV_vssra__vx__rnu(x_17, x_8);
lean_dec(x_8);
x_19 = lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i16(x_18);
x_20 = lp_SALT_SALT_Intrinsics_RVV_vsadd__vx(x_19, x_9);
x_21 = lp_SALT_SALT_Intrinsics_RVV_vnclip__wx__i8(x_20);
x_22 = lp_SALT_SALT_Intrinsics_RVV_vmax__vx(x_21, x_10);
x_23 = lp_SALT_SALT_Intrinsics_RVV_vmin__vx(x_22, x_11);
return x_23;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_alloc_closure((void*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvElemFn), 3, 1);
lean_closure_set(x_4, 0, x_1);
x_5 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0);
x_6 = l___private_Init_Data_List_Impl_0__List_zipWithTR_go___redArg(x_4, x_2, x_3, x_5);
return x_6;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(0u);
x_2 = lean_mk_empty_array_with_capacity(x_1);
return x_2;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__12(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__10));
x_2 = l_Lean_mkAtom(x_1);
return x_2;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__13(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__12, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__12_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__12);
x_2 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__16(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5);
x_2 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__9));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__17(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__16, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__16_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__16);
x_2 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__18(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__17, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__17_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__17);
x_2 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__15));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__19(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__18, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__18_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__18);
x_2 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__13, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__13_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__13);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__20(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__19, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__19_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__19);
x_2 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__11));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__21(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__20, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__20_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__20);
x_2 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__22(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__21, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__21_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__21);
x_2 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__9));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__23(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__22, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__22_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__22);
x_2 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__24(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__23, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__23_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__23);
x_2 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__7));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__25(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__24, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__24_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__24);
x_2 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__5);
x_3 = lean_array_push(x_2, x_1);
return x_3;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__26(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__25, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__25_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__25);
x_2 = ((lean_object*)(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__4));
x_3 = lean_box(2);
x_4 = lean_alloc_ctor(1, 3, 0);
lean_ctor_set(x_4, 0, x_3);
lean_ctor_set(x_4, 1, x_2);
lean_ctor_set(x_4, 2, x_1);
return x_4;
}
}
static lean_object* _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1(void) {
_start:
{
lean_object* x_1; 
x_1 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__26, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__26_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1___closed__26);
return x_1;
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___redArg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
if (lean_obj_tag(x_2) == 0)
{
lean_dec(x_4);
lean_dec(x_3);
lean_dec_ref(x_1);
return x_2;
}
else
{
if (lean_obj_tag(x_3) == 0)
{
lean_dec_ref(x_2);
lean_dec(x_4);
lean_dec_ref(x_1);
return x_3;
}
else
{
lean_object* x_15; uint8_t x_16; 
x_15 = l_List_lengthTR___redArg(x_2);
x_16 = lean_nat_dec_le(x_15, x_4);
if (x_16 == 0)
{
lean_dec(x_15);
lean_inc(x_4);
x_5 = x_4;
goto block_14;
}
else
{
x_5 = x_15;
goto block_14;
}
}
}
block_14:
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
x_6 = lean_obj_once(&lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0, &lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0_once, _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration___closed__0);
lean_inc(x_5);
lean_inc(x_2);
x_7 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_2, x_2, x_5, x_6);
lean_inc(x_5);
lean_inc(x_3);
x_8 = l___private_Init_Data_List_Impl_0__List_takeTR_go___redArg(x_3, x_3, x_5, x_6);
lean_inc_ref(x_1);
x_9 = lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvIteration(x_1, x_7, x_8);
lean_inc(x_5);
x_10 = l_List_drop___redArg(x_5, x_2);
lean_dec(x_2);
x_11 = l_List_drop___redArg(x_5, x_3);
lean_dec(x_3);
x_12 = lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___redArg(x_1, x_10, x_11, x_4);
x_13 = l_List_appendTR___redArg(x_9, x_12);
return x_13;
}
}
}
LEAN_EXPORT lean_object* lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
lean_object* x_6; 
x_6 = lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___redArg(x_1, x_2, x_3, x_4);
return x_6;
}
}
LEAN_EXPORT lean_object* lp_SALT___private_SALT_Kernel_QS8VAdd_RVV_0__SALT_Kernel_QS8VAdd_RVV_rvvLoop_match__1_splitter___redArg(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_6; 
lean_dec(x_5);
lean_dec(x_4);
x_6 = lean_apply_1(x_3, x_2);
return x_6;
}
else
{
lean_dec(x_3);
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_7; 
lean_dec(x_5);
x_7 = lean_apply_2(x_4, x_1, lean_box(0));
return x_7;
}
else
{
lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; 
lean_dec(x_4);
x_8 = lean_ctor_get(x_1, 0);
lean_inc(x_8);
x_9 = lean_ctor_get(x_1, 1);
lean_inc(x_9);
lean_dec_ref(x_1);
x_10 = lean_ctor_get(x_2, 0);
lean_inc(x_10);
x_11 = lean_ctor_get(x_2, 1);
lean_inc(x_11);
lean_dec_ref(x_2);
x_12 = lean_apply_4(x_5, x_8, x_9, x_10, x_11);
return x_12;
}
}
}
}
LEAN_EXPORT lean_object* lp_SALT___private_SALT_Kernel_QS8VAdd_RVV_0__SALT_Kernel_QS8VAdd_RVV_rvvLoop_match__1_splitter(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4, lean_object* x_5, lean_object* x_6) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_7; 
lean_dec(x_6);
lean_dec(x_5);
x_7 = lean_apply_1(x_4, x_3);
return x_7;
}
else
{
lean_dec(x_4);
if (lean_obj_tag(x_3) == 0)
{
lean_object* x_8; 
lean_dec(x_6);
x_8 = lean_apply_2(x_5, x_2, lean_box(0));
return x_8;
}
else
{
lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; 
lean_dec(x_5);
x_9 = lean_ctor_get(x_2, 0);
lean_inc(x_9);
x_10 = lean_ctor_get(x_2, 1);
lean_inc(x_10);
lean_dec_ref(x_2);
x_11 = lean_ctor_get(x_3, 0);
lean_inc(x_11);
x_12 = lean_ctor_get(x_3, 1);
lean_inc(x_12);
lean_dec_ref(x_3);
x_13 = lean_apply_4(x_6, x_9, x_10, x_11, x_12);
return x_13;
}
}
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_SALT_SALT_Intrinsics_RVV(uint8_t builtin);
lean_object* initialize_SALT_SALT_Kernel_QS8_Params(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_SALT_SALT_Kernel_QS8VAdd_RVV(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Intrinsics_RVV(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_SALT_SALT_Kernel_QS8_Params(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1 = _init_lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1();
lean_mark_persistent(lp_SALT_SALT_Kernel_QS8VAdd_RVV_rvvLoop___auto__1);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
