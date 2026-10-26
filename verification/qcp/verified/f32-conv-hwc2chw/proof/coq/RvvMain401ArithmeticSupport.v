From HwcConv Require Export rvv_unit_goal RvvKernelModel HwcRvvPixel9Model.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_rvv_pixel9_prefix.
Lemma hr401_pure_intro:forall(P:Assertion)(Q:Prop),Q->P|--coq_prop Q.
Proof. intros P Q HQ;unfold derivable1,coq_prop;intros;exact HQ. Qed.
Lemma hr401_legal_vl_bounds:forall avl vl,hc_rvv_vl avl vl->0<=vl<=4 /\ vl<=avl.
Proof.
 intros avl vl[HB HC];split;[exact HB|].
 destruct HB as[HL HU].
 destruct HC as[HS|[HM|HG]].
 - destruct HS as[HA HE];lia.
 - destruct HM as[[HA HB]HC];lia.
 - destruct HG as[HA HE];lia.
Qed.
Ltac hr401_constants:=
 try change(INT_MAX)with 2147483647 in *;
 try change(INT_MIN)with(-2147483648)in *;
 try change(UINT64_MAX)with 18446744073709551615 in *;
 try change(sizeof(FLOAT))with 4 in *.
Ltac hr401_vl:=repeat multimatch goal with H:hc_rvv_vl ?avl ?vl|-_=>
 let HB:=fresh "Hlegal"in pose proof(hr401_legal_vl_bounds avl vl H)as HB;
 clear H;destruct HB as[[? ?]?]end.
Ltac hr401_atom:=first[assumption|reflexivity|lia|hr401_vl;lia].
Ltac hr401_dispatch:=first[solve[apply hr401_pure_intro;hr401_atom]|
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hr401_dispatch|hr401_dispatch]end].
Ltac hr401_numbers:=intros;hr401_constants;hr401_dispatch.
Ltac hr401_solve:=first[solve[hr401_numbers]|solve[left;hr401_numbers]|solve[right;hr401_numbers]].
Print Assumptions hr401_pure_intro.
Print Assumptions hr401_legal_vl_bounds.
