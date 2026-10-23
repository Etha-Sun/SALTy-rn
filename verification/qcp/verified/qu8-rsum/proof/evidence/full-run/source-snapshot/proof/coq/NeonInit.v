From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From Qu8Rsum Require Import NeonSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rs_onemask_literal : rs_onemask=cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (cons (1:Z) (repeat_Z (0:Z) 16)))))))))))))))).
Proof. reflexivity. Qed.
Ltac rs_init_normalize :=
 rewrite ?sizeof_uchar;repeat rewrite Z.sub_diag;
 try change Int.max_unsigned with 4294967295 in *;
 repeat progress rewrite <-logic_equiv_andp_assoc.
Ltac rs_init_atom :=
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]].
Ltac rs_init_finish :=
 lazymatch goal with
 | |-?P|--(?Q&&?R)=>apply _derivable1_andp_intros;[rs_init_finish|rs_init_finish]
 | _=>rs_init_atom end.
Lemma proof_of_test_neon_entail_wit_1 : Qu8Rsum.neon_unit_goal.test_neon_entail_wit_1.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_entail_wit_1;left;intros;subst.
 do 4(rexists 0).
 rewrite <-rs_onemask_literal.
 rs_init_normalize.
 unfold rs_sum4,rs_prefix;cbn[firstn rs_sum fold_right Z.to_nat];rs_init_finish.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
Lemma proof_of_test_neon_entail_wit_2 : Qu8Rsum.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_entail_wit_2;left;intros;subst.
 do 8(rexists 0);rexists c3_2;rexists c2_2;rexists c1_2;rexists c0_2.
 rs_init_normalize.
 change(rs_sum8 0 0 0 0 0 0 0 0)with 0.
 change(rs_count16 0)with 0;change(rs_mod16 2048)with 0.
 repeat rewrite Z.add_0_r;rs_init_finish.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
Lemma proof_of_test_neon_entail_wit_5 : Qu8Rsum.neon_unit_goal.test_neon_entail_wit_5.
Proof.
 unfold Qu8Rsum.neon_unit_goal.test_neon_entail_wit_5;left;intros;subst.
 assert(Hsmall:rs_rem2048 batch=batch)by(apply rs_rem2048_small;lia).
 assert(Hbatch:batch=rs_rem2048 batch_pre)by congruence.
 do 8(rexists 0);rexists c3_2;rexists c2_2;rexists c1_2;rexists c0_2.
 rewrite Hbatch in *;rs_init_normalize.
 change(rs_sum8 0 0 0 0 0 0 0 0)with 0.
 change(rs_count16 0)with 0;change(rs_mod16 0)with 0.
 repeat rewrite Z.add_0_r;rs_init_finish.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_5.
