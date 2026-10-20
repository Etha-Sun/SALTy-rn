#include "spec.h"
#include "fp_minmax.c"
#include "fp_memory.c"
#include "fp_arithmetic.c"
#include "utils.c"
#include "integer_memory.c"
#include "quantized.c"
#include "fp_memory_m8.c"
#include "fp_minmax_m8.c"
#include "fp_arithmetic_m8.c"
#include "fp_masks_m8.c"
#include "neon.c"
#include "rvv.c"
#include "harness.c"



/*@ \wp::strategy Qc4KernelSolve: \prover("cvc5",1),\prover("z3",1);
 \wp::strategy Qc4KernelFilter: \tactic("Wp.filter",\children(Qc4KernelSolve)),Qc4KernelSolve;
 \wp::strategy Qc4ByteUnfold: Qc4KernelFilter;
 \wp::proof Qc4ByteUnfold:qc4_byte_unsigned_view;
 \wp::strategy Qc4WrapAdd:
 \tactic("Wp.lemma",\ingoal(V.F30_lane[J]),
 \when(V.F30_lane[J]==to_sint32(to_uint32(X)+to_uint32(Y))),
 \param("lemma","qc4_modulo_cast_add"),\param("P1",X),\param("P2",Y),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::strategy Qc4VectorPoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),
 \when(Fact:(\forall integer B; H ==> V.F30_lane[B]==E)),
 \select(Fact),\param("P1",J),\children(Qc4MacSourcePoint)),
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),
 \when(Fact:(\forall integer B; H ==> E==V.F30_lane[B])),
 \select(Fact),\param("P1",J),\children(Qc4MacSourcePoint)),Qc4WrapAdd;
 \wp::strategy Qc4ByteViewApply:
 \tactic("Wp.lemma",\ingoal(V.F28_lane[J]),\when(V.F28_lane[J]==read_sint8(M,P)),\when(linked(AM)),
 \param("lemma","qc4_byte_unsigned_view"),\param("P1",M),\param("P2",AM),\param("P3",P),\children(Qc4ByteUnfold)),Qc4ByteUnfold;
 \wp::strategy Qc4BytePoint:
 \tactic("Wp.instance",\ingoal(V.F28_lane[J]),
 \when(Fact:(\forall integer B; H ==> V.F28_lane[B]==E)),
 \select(Fact),\param("P1",J),\children(Qc4ByteViewApply)),Qc4ByteViewApply;
 \wp::proof Qc4KernelFilter:qc4_vl_bound,qc4_done_value,qc4_a0_point,qc4_a1_point,qc4_low_sources,qc4_high_sources,qc4_remaining_count;
 \wp::proof Qc4VectorPoint:qc4_k_final;
 
 \wp::strategy Qc4KernelPair:
 \tactic("Wp.lemma",\ingoal(L_core_qc4_acc(M,A,P,J,Z,I,S)),
 \param("lemma","core_qc4_pair_step"),\param("P1",M),\param("P2",A),
 \param("P3",P),\param("P4",J),\param("P5",Z),\param("P6",I),
 \param("P7",S-2),\children(Qc4FoldEvenRewrite)),Qc4VectorPoint;
 
*/

/*@ \wp::strategy Qc4RoundEven:
 \tactic("Wp.modmask",\ingoal(X%2),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::proof Qc4RoundEven:qc4_round_even;
 \wp::strategy Qc4InitUnfold:
 \tactic("Wp.unfold",\ingoal(L_core_qc4_acc(M,A,P,J,Z,I,0)),\children(Qc4VectorPoint)),Qc4VectorPoint;
 \wp::proof Qc4InitUnfold:core_accumulator;
*/

/*@ \wp::strategy Qc4MacNoFold:
 \tactic("Wp.clear",\when(Fact:(\forall integer B; H ==> V.F30_lane[B]==L_core_qc4_acc(M,A,P,B,Z,I,T))),\select(Fact),\children(Qc4MacNoFold)),
 \tactic("Wp.clear",\when(Fact:(\forall integer B; H ==> L_core_qc4_acc(M,A,P,B,Z,I,T)==V.F30_lane[B])),\select(Fact),\children(Qc4MacNoFold)),Qc4VectorPoint;
 
*/

/*@ \wp::strategy Qc4FloatPoint:
 \tactic("Wp.instance",\ingoal(V.F17_lane[J]),
 \when(Fact:(\forall integer B; 0<=B && B<N ==> P_ext_same(V.F17_lane[B],E))),
 \select(Fact),\param("P1",J),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::proof Qc4VectorPoint:qc4_shifted_source;
 \wp::proof Qc4FloatPoint:qc4_converted_source,qc4_scaled_source;
 \wp::strategy Qc4PostUnfold:
 \tactic("Wp.unfold",\ingoal(L_core_qc4_post(A,B,C,D,E,F)),\children(Qc4FloatPoint)),Qc4FloatPoint;
 \wp::proof Qc4PostUnfold:core_postprocess;
*/

/*@ \wp::strategy Qc4FloatTrans:
 \tactic("Wp.lemma",\ingoal(P_ext_same(V.F17_lane[J],TARGET)),\when(P_ext_same(V.F17_lane[J],MID)),\param("lemma","ext_same_trans"),\param("P1",V.F17_lane[J]),\param("P2",MID),\param("P3",TARGET),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::strategy Qc4FmaCongr:
 \tactic("Wp.lemma",\ingoal(P_ext_same(V.F17_lane[J],shim_fma32(T,Y[J],Z[J]))),\when(P_ext_same(V.F17_lane[J],shim_fma32(A[J],Y[J],Z[J]))),\param("lemma","qc4_fma_first_congruence"),\param("P1",A[J]),\param("P2",T),\param("P3",Y[J]),\param("P4",Z[J]),\children(Qc4FloatTrans)),Qc4FloatTrans;
 \wp::strategy Qc4FmaSourcePoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],shim_fma32(T,Y[J],Z[J]))),\when(Call:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],shim_fma32(A[B],Y[B],Z[B])))),\when(Fact:(\forall integer B;0<=B && B<U ==> P_ext_same(A[B],E))),\select(Fact),\param("P1",J),\children(Qc4FmaCongr)),Qc4FmaCongr;
 \wp::strategy Qc4FmaCallPoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],shim_fma32(T,Y[J],Z[J]))),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],shim_fma32(A[B],Y[B],Z[B])))),\select(Fact),\param("P1",J),\children(Qc4FmaSourcePoint)),Qc4FmaSourcePoint;
 \wp::proof Qc4FmaCallPoint:qc4_fma_source;
*/

/*@ \wp::strategy Qc4MaxCongr:
 \tactic("Wp.lemma",\ingoal(P_ext_same(V.F17_lane[J],L_ext_neon_max32(T,L))),\when(P_ext_same(V.F17_lane[J],L_ext_neon_max32(A[J],L))),\param("lemma","ext_neon_max_all_congruence"),\param("P1",A[J]),\param("P2",T),\param("P3",L),\param("P4",L),\children(Qc4FloatTrans)),Qc4FloatTrans;
 \wp::strategy Qc4MaxSourcePoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],L_ext_neon_max32(T,L))),\when(Call:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],L_ext_neon_max32(A[B],L)))),\when(Fact:(\forall integer B;0<=B && B<U ==> P_ext_same(A[B],E))),\select(Fact),\param("P1",J),\children(Qc4MaxCongr)),Qc4MaxCongr;
 \wp::strategy Qc4MaxCallPoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],L_ext_neon_max32(T,L))),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],L_ext_neon_max32(A[B],L)))),\select(Fact),\param("P1",J),\children(Qc4MaxSourcePoint)),Qc4MaxSourcePoint;
 \wp::proof Qc4MaxCallPoint:qc4_max_source;
*/

/*@ \wp::strategy Qc4MinCongr:
 \tactic("Wp.lemma",\ingoal(P_ext_same(V.F17_lane[J],L_ext_neon_min32(T,L))),\when(P_ext_same(V.F17_lane[J],L_ext_neon_min32(A[J],L))),\param("lemma","ext_neon_min_all_congruence"),\param("P1",A[J]),\param("P2",T),\param("P3",L),\param("P4",L),\children(Qc4FloatTrans)),Qc4FloatTrans;
 \wp::strategy Qc4MinSourcePoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],L_ext_neon_min32(T,L))),\when(Call:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],L_ext_neon_min32(A[B],L)))),\when(Fact:(\forall integer B;0<=B && B<U ==> P_ext_same(A[B],E))),\select(Fact),\param("P1",J),\children(Qc4MinCongr)),Qc4MinCongr;
 \wp::strategy Qc4MinCallPoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],L_ext_neon_min32(T,L))),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],L_ext_neon_min32(A[B],L)))),\select(Fact),\param("P1",J),\children(Qc4MinSourcePoint)),Qc4MinSourcePoint;
 \wp::proof Qc4MinCallPoint:qc4_min_source;
*/

/*@ \wp::strategy Qc4ByteBothSolve: \prover("cvc5",1),\prover("z3",1);
 \wp::strategy Qc4ByteBothFilter: \tactic("Wp.filter",\children(Qc4ByteBothSolve)),Qc4ByteBothSolve;
 \wp::strategy Qc4ByteBoth: Qc4ByteBothFilter;
 \wp::strategy Qc4ByteBothPoint:
 \tactic("Wp.instance",\ingoal(V.F28_lane[J]),\when(Fact:(\forall integer B;0<=B && B<N ==> V.F28_lane[B]==E)),\select(Fact),\param("P1",J),\children(Qc4ByteBoth)),Qc4ByteBoth;
 \wp::proof Qc4ByteBothPoint:qc4_packed_bytes;
*/

/*@ \wp::strategy Qc4MacSourcePoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==to_sint32(to_uint32(B[J])+to_uint32(X*W[J]))),\when(Fact:(\forall integer K;H ==> W[K]==16*L_core_nibble(U,F))),\select(Fact),\param("P1",J),\children(Qc4WrapAdd)),
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==to_sint32(to_uint32(B[J])+to_uint32(X*W[J]))),\when(Fact:(\forall integer K;H ==> 16*L_core_nibble(U,F)==W[K])),\select(Fact),\param("P1",J),\children(Qc4WrapAdd)),Qc4WrapAdd;
 \wp::strategy Qc4MacTarget:
 \tactic("Wp.lemma",\ingoal(L_core_wrap32(X+Y)),\param("lemma","qc4_modulo_cast_add"),\param("P1",X),\param("P2",Y),\children(Qc4MacNoFold)),Qc4MacNoFold;
 
 \wp::strategy Qc4FoldBeforePoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(B.F30_lane[J]+X)+Y)),\when(Fact:(\forall integer K;H ==> B.F30_lane[K]==L_core_qc4_acc(M,A,P,K,Z,INIT[K],T))),\select(Fact),\param("P1",J),\children(Qc4FoldBeforeRewrite)),
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(L_core_wrap32(L_core_wrap32(B.F30_lane[J]+X)+Y)==V.F30_lane[J]),\when(Fact:(\forall integer K;H ==> B.F30_lane[K]==L_core_qc4_acc(M,A,P,K,Z,INIT[K],T))),\select(Fact),\param("P1",J),\children(Qc4FoldBeforeRewrite)),Qc4KernelPair;
 \wp::strategy Qc4FoldPairPoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(Fact:(\forall integer K;H ==> V.F30_lane[K]==L_core_wrap32(E))),\select(Fact),\param("P1",J),\children(Qc4FoldBeforePoint)),
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(Fact:(\forall integer K;H ==> L_core_wrap32(E)==V.F30_lane[K])),\select(Fact),\param("P1",J),\children(Qc4FoldBeforePoint)),Qc4FoldBeforePoint;
 \wp::proof Qc4FoldPairPoint:qc4_fold_pair;
*/

/*@ \wp::strategy Qc4MacCastRewrite:
 \tactic("Wp.TacRewrite.Left",\when(Eq:to_sint32(to_uint32(X)+to_uint32(Y))==L_core_wrap32(X+Y)),\select(Eq),\children(Qc4KernelFilter)),
 \tactic("Wp.TacRewrite.Right",\when(Eq:L_core_wrap32(X+Y)==to_sint32(to_uint32(X)+to_uint32(Y))),\select(Eq),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::strategy Qc4MacResultRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(Eq:V.F30_lane[J]==to_sint32(to_uint32(X)+to_uint32(Y))),\select(Eq),\children(Qc4MacCastRewrite)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(Eq:to_sint32(to_uint32(X)+to_uint32(Y))==V.F30_lane[J]),\select(Eq),\children(Qc4MacCastRewrite)),Qc4MacCastRewrite;
 \wp::strategy Qc4MacGivenAdd:
 \tactic("Wp.lemma",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==to_sint32(to_uint32(X)+to_uint32(Y))),\param("lemma","qc4_modulo_cast_add"),\param("P1",X),\param("P2",Y),\children(Qc4MacResultRewrite)),Qc4MacResultRewrite;
 \wp::strategy Qc4MacNibbleRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(Eq:W[J]==16*L_core_nibble(U,F)),\select(Eq),\children(Qc4MacGivenAdd)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(Eq:16*L_core_nibble(U,F)==W[J]),\select(Eq),\children(Qc4MacGivenAdd)),Qc4MacGivenAdd;
 \wp::strategy Qc4MacNibblePoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==to_sint32(to_uint32(B[J])+to_uint32(X*W[J]))),\when(Fact:(\forall integer K;H ==> W[K]==16*L_core_nibble(U,F))),\select(Fact),\param("P1",J),\children(Qc4MacNibbleRewrite)),Qc4MacNibbleRewrite;
 \wp::strategy Qc4MacCallPoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(Fact:(\forall integer K;H ==> V.F30_lane[K]==to_sint32(E))),\select(Fact),\param("P1",J),\children(Qc4MacNibblePoint)),Qc4MacNibblePoint;
 \wp::strategy Qc4MacClear:
 \tactic("Wp.clear",\when(Fact:(\forall integer K; H ==> V.F30_lane[K]==L_core_qc4_acc(M,A,P,K,Z,I,T))),\select(Fact),\children(Qc4MacClear)),Qc4MacCallPoint;
 \wp::proof Qc4MacClear:qc4_mac_low,qc4_mac_pair;
*/

/*@ \wp::strategy Qc4FoldPairRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(L_core_qc4_acc(M,A,P,J,Z,I,S)),\when(Eq:L_core_qc4_acc(M,A,P,J,Z,I,S)==E),\select(Eq),\children(Qc4KernelFilter)),
 \tactic("Wp.TacRewrite.Right",\ingoal(L_core_qc4_acc(M,A,P,J,Z,I,S)),\when(Eq:E==L_core_qc4_acc(M,A,P,J,Z,I,S)),\select(Eq),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::strategy Qc4FoldResultRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(Eq:V.F30_lane[J]==L_core_wrap32(E)),\select(Eq),\children(Qc4FoldPairRewrite)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(Eq:L_core_wrap32(E)==V.F30_lane[J]),\select(Eq),\children(Qc4FoldPairRewrite)),Qc4FoldPairRewrite;
*/

/*@ \wp::strategy Qc4FoldOddRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(L_core_qc4_acc(M,A,P,J,Z,I,T)+X)+Y)),\when(Eq:(T+1)%2==1),\select(Eq),\children(Qc4FoldResultRewrite)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(L_core_qc4_acc(M,A,P,J,Z,I,T)+X)+Y)),\when(Eq:1==(T+1)%2),\select(Eq),\children(Qc4FoldResultRewrite)),
 Qc4FoldResultRewrite; */

/*@ \wp::strategy Qc4FoldHalfRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(L_core_qc4_acc(M,A,P,J,Z,I,T)+X)+Y)),\when(Eq:(T+1)/2==T/2),\select(Eq),\children(Qc4FoldOddRewrite)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(L_core_qc4_acc(M,A,P,J,Z,I,T)+X)+Y)),\when(Eq:T/2==(T+1)/2),\select(Eq),\children(Qc4FoldOddRewrite)),
 Qc4FoldOddRewrite; */

/*@ \wp::strategy Qc4FoldEvenRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(L_core_qc4_acc(M,A,P,J,Z,I,T)+X)+Y)),\when(Eq:T%2==0),\select(Eq),\children(Qc4FoldHalfRewrite)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(L_core_qc4_acc(M,A,P,J,Z,I,T)+X)+Y)),\when(Eq:0==T%2),\select(Eq),\children(Qc4FoldHalfRewrite)),
 Qc4FoldHalfRewrite; */

/*@ \wp::strategy Qc4FoldBeforeRewrite:
 \tactic("Wp.TacRewrite.Left",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(B.F30_lane[J]+X)+Y)),\when(Eq:B.F30_lane[J]==L_core_qc4_acc(M,A,P,J,Z,I,T)),\select(Eq),\children(Qc4KernelPair)),
 \tactic("Wp.TacRewrite.Right",\ingoal(V.F30_lane[J]),\when(V.F30_lane[J]==L_core_wrap32(L_core_wrap32(B.F30_lane[J]+X)+Y)),\when(Eq:L_core_qc4_acc(M,A,P,J,Z,I,T)==B.F30_lane[J]),\select(Eq),\children(Qc4KernelPair)),Qc4KernelPair;
 \wp::proof Qc4KernelFilter:qc4_done_even,qc4_done_next_half,qc4_done_next_odd;
*/

/*@ \wp::strategy Qc4StoreMemSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy Qc4StoreMemUnfold:
 \tactic("Wp.unfold",\pattern(shift_float32(P,I)),\children(Qc4StoreMemUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(Qc4StoreMemUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(Qc4StoreMemUnfold)),Qc4StoreMemSolve;
 \wp::strategy Qc4StoreCodecPoint:
 \tactic("Wp.lemma",\ingoal(repr_encode32(X)),\ingoal(to_uint32(B)),\param("lemma","qc4_store_float_value"),\param("P1",X),\param("P2",to_uint32(B)),\children(Qc4StoreMemUnfold)),Qc4StoreMemUnfold;
 \wp::strategy Qc4StorePrefixCase:
 \tactic("Wp.cut",\ingoal(P_ext_same(R,A[J])),\ingoal(repr_encode32(A[I])),\param("case","CASES"),\param("clause",J==I),\children(Qc4StoreCodecPoint)),Qc4StoreCodecPoint;
 \wp::strategy Qc4StoreExitCount:
 \tactic("Wp.cut",\ingoal(memcpy(M,P,U,P,4*I)),\incontext(I<=V),\incontext(V<=I),\param("clause",I==V),\children(Qc4StoreMemUnfold)),Qc4StorePrefixCase;
 \wp::proof Qc4StoreMemUnfold:__riscv_vle32_v_f32m8;
 \wp::proof Qc4StoreExitCount:__riscv_vse32_v_f32m8;
*/

/*@ \wp::strategy Qc4LayoutUnfold:
 \tactic("Wp.unfold",\ingoal(shift_sint32(P,I)),\children(Qc4LayoutUnfold)),
 \tactic("Wp.unfold",\incontext(shift_sint32(P,I)),\children(Qc4LayoutUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(Qc4LayoutUnfold)),
 \tactic("Wp.unfold",\incontext(shift_uint8(P,I)),\children(Qc4LayoutUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_float32(P,I)),\children(Qc4LayoutUnfold)),
 \tactic("Wp.unfold",\incontext(shift_float32(P,I)),\children(Qc4LayoutUnfold)),Qc4KernelFilter;
 \wp::strategy Qc4InitialLayoutPoint:
 \tactic("Wp.instance",\ingoal(V.F30_lane[J]),\when(Fact:(\forall integer B;0<=B && B<N ==> V.F30_lane[B]==E)),\select(Fact),\param("P1",J),\children(Qc4LayoutClear)),Qc4LayoutClear;
 \wp::strategy Qc4FloatLayoutPoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],T)),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],E))),\select(Fact),\param("P1",J),\children(Qc4LayoutClear)),Qc4LayoutClear;
 \wp::strategy Qc4BlockOutputUnfold:
 \tactic("Wp.unfold",\ingoal(L_core_qc4_output(M,A,W,K,C,Z,S,LO,HI)),\children(Qc4FloatLayoutPoint)),Qc4FloatLayoutPoint;
 \wp::proof Qc4KernelFilter:qc4_channel_index;
 \wp::proof Qc4InitialLayoutPoint:qc4_initial_source;
 \wp::proof Qc4LayoutUnfold:qc4_packed_layout;
 
 \wp::proof Qc4BlockOutputUnfold:qc4_block_output_reference;
*/

/*@ \wp::strategy Qc4LayoutClear:
 \tactic("Wp.clear",\when(Fact:(\forall integer J;H ==> V.F30_lane[J]==L_core_qc4_acc(M,A,P,J,Z,I,T))),\select(Fact),\children(Qc4LayoutClear)),
 \tactic("Wp.clear",\when(Fact:(\forall integer J;H ==> L_core_qc4_acc(M,A,P,J,Z,I,T)==V.F30_lane[J])),\select(Fact),\children(Qc4LayoutClear)),
 \tactic("Wp.clear",\when(Fact:(\forall integer J;H ==> P_ext_same(R,L_core_qc4_output(M,A,W,K,J,Z,S,LO,HI)))),\select(Fact),\children(Qc4LayoutClear)),Qc4LayoutUnfold;
 \wp::proof Qc4KernelFilter:qc4_packed_byte_count;
 \wp::proof Qc4LayoutClear:qc4_packed_end_layout;
*/

/*@ \wp::strategy Qc4LayoutZero:
 \tactic("Wp.unfold",\incontext(shift_uint8(P,0)),\children(Qc4LayoutZero)),
 \tactic("Wp.unfold",\incontext(shift_float32(P,0)),\children(Qc4LayoutZero)),
 \tactic("Wp.unfold",\incontext(shift_sint32(P,0)),\children(Qc4LayoutZero)),Qc4KernelFilter;
 \wp::strategy Qc4LayoutGoalOnly:
 \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(Qc4LayoutGoalOnly)),
 \tactic("Wp.unfold",\ingoal(shift_float32(P,I)),\children(Qc4LayoutGoalOnly)),
 \tactic("Wp.unfold",\ingoal(shift_sint32(P,I)),\children(Qc4LayoutGoalOnly)),Qc4LayoutZero;
 \wp::strategy Qc4ExactLoadPoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],T)),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],repr_decode32(read_uint32(M,shift_float32(P,B)))))),\select(Fact),\param("P1",J),\children(Qc4LayoutZero)),Qc4LayoutZero;
 \wp::proof Qc4LayoutGoalOnly:qc4_filter_pointer,qc4_bias_pointer;
 \wp::proof Qc4ExactLoadPoint:qc4_filter_source;
*/

/*@ \wp::strategy Qc4BiasFloatUnfold:
 \tactic("Wp.unfold",\ingoal(Offset:shift_float32(P,I)),\select(Offset),\children(Qc4BiasFloatUnfold)),
 \tactic("Wp.unfold",\ingoal(P_ext_same(V.F17_lane[J],T)),\when(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift_float32(P,I))))),\incontext(Offset:shift_float32(P,I)),\select(Offset),\children(Qc4BiasFloatUnfold)),
 \tactic("Wp.unfold",\ingoal(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift(Q,O))))),\when(H ==> Q==shift_float32(P,I)),\incontext(Offset:shift_float32(P,I)),\select(Offset),\children(Qc4BiasFloatUnfold)),
 \tactic("Wp.unfold",\ingoal(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift(Q,O))))),\when(H ==> shift_float32(P,I)==Q),\incontext(Offset:shift_float32(P,I)),\select(Offset),\children(Qc4BiasFloatUnfold)),Qc4LayoutZero;
 \wp::strategy Qc4BiasReadPoint:
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],T)),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],repr_decode32(read_uint32(M,shift_float32(P,O+B)))))),\select(Fact),\param("P1",J),\children(Qc4BiasBaseCut)),
 \tactic("Wp.instance",\ingoal(P_ext_same(V.F17_lane[J],T)),\when(Fact:(\forall integer B;0<=B && B<N ==> P_ext_same(V.F17_lane[B],repr_decode32(read_uint32(M,shift_float32(P,B)))))),\select(Fact),\param("P1",J),\children(Qc4BiasBaseCut)),Qc4BiasFloatUnfold;
 \wp::proof Qc4BiasReadPoint:qc4_bias_source;
*/

/*@ \wp::strategy Qc4BiasClearQuantified:
 \tactic("Wp.clear",\when(Fact:(\forall integer B;H ==> P_ext_same(X,Y))),\select(Fact),\children(Qc4BiasClearQuantified)),
 \tactic("Wp.clear",\when(Fact:(\forall integer B;H ==> X==Y)),\select(Fact),\children(Qc4BiasClearQuantified)),Qc4BiasFloatUnfold;
*/

/*@ \wp::strategy Qc4BiasBaseCut:
 \tactic("Wp.cut",\ingoal(Lane:V.F17_lane[J]),\ingoal(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift_float32(Q,J))))),\when(H ==> Q==shift_float32(P,I)),\select(Lane),\param("case","MODUS"),\param("clause",Q==shift_float32(P,I)),\children(Qc4BiasCutSolve)),
 \tactic("Wp.cut",\ingoal(Lane:V.F17_lane[J]),\ingoal(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift_float32(Q,J))))),\when(H ==> shift_float32(P,I)==Q),\select(Lane),\param("case","MODUS"),\param("clause",Q==shift_float32(P,I)),\children(Qc4BiasCutSolve)),Qc4BiasClearQuantified;
*/

/*@ lemma qc4_fma_all_congruence: \forall float a,b,c,x,y,z;
 ext_same(a,x) && ext_same(b,y) && ext_same(c,z) ==> ext_same(shim_fma32(a,b,c),shim_fma32(x,y,z));
 lemma qc4_post_coeff_congruence: \forall integer acc; \forall float scale,fa,ba,fb,bb,lo,hi;
 ext_same(fa,fb) && ext_same(ba,bb) ==> ext_same(core_qc4_post(acc,scale,fa,ba,lo,hi),core_qc4_post(acc,scale,fb,bb,lo,hi));
 \wp::strategy Qc4CoeffFma:
 \tactic("Wp.lemma",\ingoal(P_ext_same(shim_fma32(A,B,C),shim_fma32(X,Y,Z))),\param("lemma","qc4_fma_all_congruence"),\param("P1",A),\param("P2",B),\param("P3",C),\param("P4",X),\param("P5",Y),\param("P6",Z),\children(Qc4KernelFilter)),Qc4KernelFilter;
 \wp::strategy Qc4CoeffMax:
 \tactic("Wp.lemma",\ingoal(P_ext_same(L_ext_neon_max32(A,B),L_ext_neon_max32(C,D))),\param("lemma","ext_neon_max_all_congruence"),\param("P1",A),\param("P2",C),\param("P3",B),\param("P4",D),\children(Qc4CoeffFma)),Qc4CoeffFma;
 \wp::strategy Qc4CoeffMin:
 \tactic("Wp.lemma",\ingoal(P_ext_same(L_ext_neon_min32(A,B),L_ext_neon_min32(C,D))),\param("lemma","ext_neon_min_all_congruence"),\param("P1",A),\param("P2",C),\param("P3",B),\param("P4",D),\children(Qc4CoeffMax)),Qc4CoeffMax;
 \wp::strategy Qc4CoeffUnfold:
 \tactic("Wp.unfold",\ingoal(L_core_qc4_post(A,B,C,D,E,F)),\children(Qc4CoeffUnfold)),Qc4CoeffMin;
 \wp::proof Qc4CoeffUnfold:qc4_post_coeff_congruence;
*/

/*@ \wp::strategy Qc4BiasCutSolve:
 \tactic("Wp.TacRewrite.Left",\ingoal(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift_float32(Q,J))))),\when(Eq:Q==shift_float32(P,I)),\select(Eq),\children(Qc4BiasFloatUnfold)),
 \tactic("Wp.TacRewrite.Right",\ingoal(P_ext_same(V.F17_lane[J],repr_decode32(read_uint32(M,shift_float32(Q,J))))),\when(Eq:shift_float32(P,I)==Q),\select(Eq),\children(Qc4BiasFloatUnfold)),Qc4KernelFilter;
*/
