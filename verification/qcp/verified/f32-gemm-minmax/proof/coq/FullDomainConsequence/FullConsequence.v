From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState MachineDomain.
From FullDomainCaller Require Import CallContractBridge.
From FullDomainBinding Require Import ContractFinish.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** Each Z argument is the QCP integer/address representation of a formal C
    argument. The annotation / and % are Z.quot and Z.rem, respectively.
    A/W/lo/hi are shared ghosts; frame is unchanged, arbitrary separated memory.
    Source hashes and exact declaration excerpts are in provenance.json. *)
Definition ParamsCells (params:Z) (lo hi:fp32) : Assertion :=
 ((&((params) # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float |-> lo) **
 ((&((params) # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float |-> hi).

Definition CallerPure (mr nc kc a ast w c cm cn params:Z) : Prop :=
 1<=mr /\ mr<=4 /\ 0<nc /\ 0<kc /\ Z.rem kc 4=0 /\
 ast=kc /\ cm=4*nc /\ cn=32 /\
 machine_capacity a w c params kc nc /\
 a<>0 /\ w<>0 /\ c<>0 /\ params<>0.

Definition NeonBodyPure (mr nc kc a ast w c cm cn params:Z) : Prop :=
 1<=mr /\ mr<=4 /\ 1<=nc /\ 4<=kc /\ Z.rem kc 4=0 /\
 ast=kc /\ cm=4*nc /\ cn=32 /\ a<>0 /\ w<>0 /\ c<>0 /\ params<>0 /\
 4*kc<=18446744073709551615 /\ a+4*kc<=18446744073709551615 /\
 16*nc<=18446744073709551615 /\ c+16*nc<=18446744073709551615 /\
 32*(Z.quot kc 4+1)*panel_count nc<=18446744073709551615 /\
 w+32*(Z.quot kc 4+1)*panel_count nc<=18446744073709551615.

Definition CallerPre mr nc kc a ast w c cm cn params A W lo hi (frame:Assertion) :=
 “ (CallerPure mr nc kc a ast w c cm cn params) ” &&
 (FloatArray.full a (4*Z.quot kc 4) A **
  FloatArray.full w (panel_count nc*8*(Z.quot kc 4+1)) W **
  FloatArray.undef_full c (4*nc) ** ParamsCells params lo hi ** frame).

Definition NeonBodyPre mr nc kc a ast w c cm cn params A W lo hi (frame:Assertion) :=
 “ (NeonBodyPure mr nc kc a ast w c cm cn params) ” &&
 (FloatArray.full a kc A **
  FloatArray.full w (8*(Z.quot kc 4+1)*panel_count nc) W **
  FloatArray.undef_full c (4*nc) ** ParamsCells params lo hi ** frame).

(** Entry-normalized post: arguments designate the same call-entry values in
    both contracts. params is the current params value appearing in both posts.
    No pure precondition is inserted into either actual post. *)
Definition CallerPost mr nc kc a w c params A W lo hi (frame:Assertion) :=
 FloatArray.full a (4*Z.quot kc 4) A **
 FloatArray.full w (panel_count nc*8*(Z.quot kc 4+1)) W **
 output_state c mr nc (Z.quot kc 4) nc A W lo hi ** ParamsCells params lo hi ** frame.

Definition NeonBodyPost mr nc kc a w c params A W lo hi (frame:Assertion) :=
 FloatArray.full a kc A **
 FloatArray.full w (8*(Z.quot kc 4+1)*panel_count nc) W **
 output_state c mr nc (Z.quot kc 4) nc A W lo hi ** ParamsCells params lo hi ** frame.

(** RVV15 uses exactly the public contract, modulo grouping parentheses. *)
Definition RvvBodyPre mr nc kc a ast w c cm cn params A W lo hi (frame:Assertion) :=
 “ (CallerPure mr nc kc a ast w c cm cn params) ” &&
 (FloatArray.full a (4*Z.quot kc 4) A **
  FloatArray.full w (panel_count nc*8*(Z.quot kc 4+1)) W **
  FloatArray.undef_full c (4*nc) ** ParamsCells params lo hi ** frame).
Definition RvvBodyPost mr nc kc a w c params A W lo hi (frame:Assertion) :=
 FloatArray.full a (4*Z.quot kc 4) A **
 FloatArray.full w (panel_count nc*8*(Z.quot kc 4+1)) W **
 output_state c mr nc (Z.quot kc 4) nc A W lo hi ** ParamsCells params lo hi ** frame.

Lemma caller_pure_consequence : forall mr nc kc a ast w c cm cn params,
 CallerPure mr nc kc a ast w c cm cn params ->
 NeonBodyPure mr nc kc a ast w c cm cn params.
Proof.
 intros mr nc kc a ast w c cm cn params H.
 unfold CallerPure in H.
 destruct H as (Hm1&Hm4&Hnc&Hkc&Hrem&Hast&Hcm&Hcn&Hcap&Ha&Hw&Hc&Hp).
 pose proof (rem_mod_agree_for_legal_kc kc Hkc Hrem) as Hmod.
 pose proof (positive_aligned_kc kc Hkc Hmod) as Hfour.
 pose proof (caller_capacity_satisfies_neon_bounds a w c params kc nc Hcap) as Hb.
 unfold neon_allocation_bounds in Hb.
 unfold NeonBodyPure; rewrite Z.quot_div_nonneg by lia.
 destruct Hb as (B1&B2&B3&B4&B5&B6).
 repeat split; assumption || lia.
Qed.

Lemma caller_pre_to_neon_body_pre :
 forall mr nc kc a ast w c cm cn params A W lo hi frame,
 CallerPre mr nc kc a ast w c cm cn params A W lo hi frame |--
 NeonBodyPre mr nc kc a ast w c cm cn params A W lo hi frame.
Proof.
 intros. unfold CallerPre, NeonBodyPre.
 apply coq_prop_andp_left; intros H.
 apply coq_prop_andp_right.
 - pose proof H as Hentry. unfold CallerPure in Hentry.
   destruct Hentry as (_&_&_&Hkc&Hrem&_).
   pose proof (rem_mod_agree_for_legal_kc kc Hkc Hrem) as Hmod.
   rewrite Z.quot_div_nonneg by lia.
   rewrite (aligned_kc_cells kc Hmod), packed_cell_count_normalization.
   apply derivable1_refl.
 - apply caller_pure_consequence; assumption.
Qed.

(** Alignment is a remembered fact from the actual pre, not a strengthened
    body post. This is ordinary consequence under a legal call entry. *)
Lemma neon_body_post_to_caller_post :
 forall mr nc kc a ast w c cm cn params A W lo hi frame,
 CallerPure mr nc kc a ast w c cm cn params ->
 NeonBodyPost mr nc kc a w c params A W lo hi frame |--
 CallerPost mr nc kc a w c params A W lo hi frame.
Proof.
 intros mr nc kc a ast w c cm cn params A W lo hi frame H.
 unfold CallerPure in H; destruct H as (_&_&_&Hkc&Hrem&_).
 pose proof (rem_mod_agree_for_legal_kc kc Hkc Hrem) as Hmod.
 unfold NeonBodyPost, CallerPost.
 rewrite Z.quot_div_nonneg by lia.
 rewrite (aligned_kc_cells kc Hmod), packed_cell_count_normalization.
 apply derivable1_refl.
Qed.

Lemma caller_pre_to_rvv_body_pre :
 forall mr nc kc a ast w c cm cn params A W lo hi frame,
 CallerPre mr nc kc a ast w c cm cn params A W lo hi frame |--
 RvvBodyPre mr nc kc a ast w c cm cn params A W lo hi frame.
Proof. intros; apply derivable1_refl. Qed.

Lemma rvv_body_post_to_caller_post :
 forall mr nc kc a w c params A W lo hi frame,
 RvvBodyPost mr nc kc a w c params A W lo hi frame |--
 CallerPost mr nc kc a w c params A W lo hi frame.
Proof. intros; apply derivable1_refl. Qed.

(** Exact raw post parameter roles. Caller declaration uses current mr/kc;
    NEON declaration uses entry mr/kc. Both use current params. a/w/c/nc are
    entry addresses/counts in all posts. This final lemma exposes, rather than
    proves away, the required scalar identity interpretation. *)
Definition RawCallerPost (mr_current kc_current nc_entry a_entry w_entry c_entry params_current:Z)
 A W lo hi (frame:Assertion) :=
 CallerPost mr_current nc_entry kc_current a_entry w_entry c_entry params_current A W lo hi frame.
Definition RawNeonBodyPost (mr_entry kc_entry nc_entry a_entry w_entry c_entry params_current:Z)
 A W lo hi (frame:Assertion) :=
 NeonBodyPost mr_entry nc_entry kc_entry a_entry w_entry c_entry params_current A W lo hi frame.

Lemma raw_neon_post_consequence_with_scalar_identity :
 forall mr0 mr1 nc kc0 kc1 a ast w c cm cn params A W lo hi frame,
 CallerPure mr0 nc kc0 a ast w c cm cn params ->
 mr1=mr0 -> kc1=kc0 ->
 RawNeonBodyPost mr0 kc0 nc a w c params A W lo hi frame |--
 RawCallerPost mr1 kc1 nc a w c params A W lo hi frame.
Proof.
 intros; subst mr1 kc1. unfold RawNeonBodyPost, RawCallerPost.
 apply (neon_body_post_to_caller_post mr0 nc kc0 a ast w c cm cn params); assumption.
Qed.

Print Assumptions caller_pure_consequence.
Print Assumptions caller_pre_to_neon_body_pre.
Print Assumptions neon_body_post_to_caller_post.
Print Assumptions caller_pre_to_rvv_body_pre.
Print Assumptions rvv_body_post_to_caller_post.
Print Assumptions raw_neon_post_consequence_with_scalar_identity.
