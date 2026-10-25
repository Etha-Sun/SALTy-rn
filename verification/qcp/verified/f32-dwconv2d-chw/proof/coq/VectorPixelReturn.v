From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From DwChw Require Import VectorPixelModel Store8Model pixel_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque dw_rvv_fma dw_repaired_min dw_repaired_max.

(* Follow only the current active lane's exact equalities. Other lanes remain
   arbitrary; no FP operation is unfolded, reassociated, or weakened to a
   numeric/NaN observation. *)
Ltac dw_pixel_exact_lane:=
 repeat first[
   progress cbn[dw_fp8 List.nth Z.to_nat]
 | match goal with
   | H:dw_fp_match ?j ?vl ?v ?rhs |- context[?v] =>
     let Ha:=fresh "Hactive"in assert(Ha:j<vl)by lia;
     unfold dw_fp_match in H;destruct H as[Hbad|Heq];[lia|rewrite Heq;clear Heq]
   | H:dw_same ?v ?rhs |- context[?v] => unfold dw_same in H;rewrite H;clear H
   end
 ];reflexivity.

Lemma proof_of_dw_vector_pixel_compute_return_wit_1:
 DwChw.pixel_unit_goal.dw_vector_pixel_compute_return_wit_1.
Proof.
 unfold DwChw.pixel_unit_goal.dw_vector_pixel_compute_return_wit_1;right;intros.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
 lazymatch goal with
 | |- _ |-- andp(coq_prop ?P)_=>assert(Hresult:P)
 end.
 - unfold dw_vector_match8;intros i Hi.
   assert(Hcases:i=0 \/ i=1 \/ i=2 \/ i=3 \/ i=4 \/ i=5 \/ i=6 \/ i=7)by lia.
   unfold dw_vector_pixel,dw_load,dw_chw_rvv_pixel,dw_chw_rvv_fold,dw_chw_terms.
   cbn[List.fold_left fst snd].
   repeat destruct Hcases as[Hcase|Hcases];try (subst i;dw_pixel_exact_lane);subst i;dw_pixel_exact_lane.
 - entailer!.
Qed.
Print Assumptions proof_of_dw_vector_pixel_compute_return_wit_1.
