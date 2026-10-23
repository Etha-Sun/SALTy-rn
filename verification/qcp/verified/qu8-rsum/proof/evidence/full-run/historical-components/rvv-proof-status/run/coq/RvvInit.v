From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import Types MemoryModel RvvFacts FastFrame rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rs_zero_bool : forall b:bool,(if b then (0:Z)else 0)=0.
Proof. destruct b;reflexivity. Qed.
Ltac rs_init_frame :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_init_frame|rs_init_frame]
 | _=>first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|solve[entailer!;lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]]
 end.
Lemma proof_of_test_rvv_entail_wit_1 : Qu8Rsum.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold Qu8Rsum.rvv_unit_goal.test_rvv_entail_wit_1;left;intros;subst.
 unfold rs_splat_u32;repeat rewrite rs_zero_bool.
 do 32(rexists 0).
 rewrite ?sizeof_uchar;rewrite Z.sub_diag.
 unfold rs_acc_total,rs_prefix;cbn[firstn rs_sum fold_right Z.to_nat].
 repeat progress rewrite <-logic_equiv_andp_assoc;rs_init_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.
