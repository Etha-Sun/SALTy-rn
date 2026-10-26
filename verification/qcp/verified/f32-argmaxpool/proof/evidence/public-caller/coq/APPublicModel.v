From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APKernelModel APProgramObservation.
Local Open Scope Z_scope.

Record APPublicLayout:Type:=ap_public_layout_record{
 apl_output_map:Z->Z;apl_index_map:Z->Z
}.
Definition app_public_layout(DN DR:APProgram)(L:APPublicLayout):Prop:=
 (forall p q,apl_output_map L p=apl_output_map L q->p=q) /\
 (forall p q,apl_index_map L p=apl_index_map L q->p=q) /\
 (forall pixel channel,0<=pixel<app_pixels DN->0<=channel<app_channels DN->
 app_output_at DR pixel+4*channel=apl_output_map L(app_output_at DN pixel+4*channel)) /\
 (forall pixel channel,0<=pixel<app_pixels DN->0<=channel<app_channels DN->
 app_index_at DR pixel+4*channel=apl_index_map L(app_index_at DN pixel+4*channel)).
Definition app_public_equal(F:APMap)(P:APPtrMap)(DN DR:APProgram)(L:APPublicLayout)
 (ON:APOutput)(IN:APIndex)(OR:APOutput)(IR:APIndex):Prop:=
 forall p q,
 In p(map fst(apo_program_trace app_output_at fst true F P DN))->
 In q(map fst(apo_program_trace app_index_at snd true F P DN))->
 exists value index,ON p=Some value /\ OR(apl_output_map L p)=Some value /\
 IN q=Some index /\ IR(apl_index_map L q)=Some index.
Lemma app_arguments_same_read:forall DN DR pixels rows channels input offset stride
 outN idxN outR idxR input_inc output_inc index_inc,
 app_arguments DN pixels rows channels input offset stride outN idxN input_inc output_inc index_inc->
 app_arguments DR pixels rows channels input offset stride outR idxR input_inc output_inc index_inc->
 apo_same_read DN DR.
Proof.
 unfold app_arguments,apo_same_read,app_table,app_offset_at.
 intros DN DR pixels rows channels input offset stride outN idxN outR idxR input_inc output_inc index_inc HN HR.
 destruct HN as[HNp[HNr[HNc[HNi[HNo[HNs[HNout[HNidx[HNii[HNoi HNxi]]]]]]]]]].
 destruct HR as[HRp[HRr[HRc[HRi[HRo[HRs[HRout[HRidx[HRii[HRoi HRxi]]]]]]]]]].
 repeat split;try congruence;intro pixel;f_equal;congruence.
Qed.
Theorem app_public_final_equal:forall F P DN DR L ON IN OR IR,
 apo_same_read DN DR->app_public_layout DN DR L->
 app_public_equal F P DN DR L
 (app_neon_output F P DN ON IN)(app_neon_index F P DN ON IN)
 (app_rvv_output F P DR OR IR)(app_rvv_index F P DR OR IR).
Proof.
 intros F P DN DR L ON IN OR IR Hread[HO[HI[Hout Hidx]]].
 unfold app_public_equal,app_neon_output,app_neon_index,app_rvv_output,app_rvv_index,
 app_final_output,app_final_index.
 apply apo_same_read_written_observation;assumption.
Qed.
Print Assumptions app_arguments_same_read.
Print Assumptions app_public_final_equal.
