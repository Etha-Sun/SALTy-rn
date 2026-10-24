From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma dwm_table_members:forall F P W D pixel,
 dw_valid F P W D->0<=pixel<dw_width D->forall tap,0<=tap<3->
 dw_ptr_present P(dw_table D pixel+8*tap) /\
 dw_ptr_get P(dw_table D pixel+8*tap)<>0.
Proof.
 intros F P W D pixel Hv Hp tap Ht;split.
 - pose proof(dw_valid_table F P W D pixel Hv Hp)as[Hbase[Hn Htable]];apply Htable;exact Ht.
 - exact(proj1(dw_valid_row F P W D pixel tap Hv Hp Ht)).
Qed.
Lemma dwm_input_window4:forall F P W D pixel k,
 dw_valid F P W D->0<=pixel<dw_width D->0<=k<dw_channels D->
 forall tap,0<=tap<3->dw_window F(dw_input_row P D pixel tap+4*k)4.
Proof.
 intros F P W D pixel k Hv Hp Hk tap Ht.
 eapply dw_window_shift;[exact(proj2(dw_valid_row F P W D pixel tap Hv Hp Ht))|lia|lia|lia].
Qed.
Lemma dwm_output_window:forall F P W D pixel k r,
 dw_valid F P W D->0<=pixel<dw_width D->0<=k->0<=r->k+r<=dw_channels D->
 dw_write_window W(dw_output_at D pixel+4*k)r.
Proof.
 intros F P W D pixel k r Hv Hp Hk Hr Hkr.
 eapply dw_write_window_shift;[exact(dw_valid_output F P W D pixel Hv Hp)|assumption|assumption|assumption].
Qed.
Print Assumptions dwm_table_members.
Print Assumptions dwm_input_window4.
Print Assumptions dwm_output_window.
