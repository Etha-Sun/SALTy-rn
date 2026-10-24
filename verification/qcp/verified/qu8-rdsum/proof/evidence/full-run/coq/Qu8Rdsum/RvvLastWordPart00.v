From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Import rvv_unit_goal RvvBounds.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* These bounds use only explicit current-VC premises. No heap range search,
   map unfolding or initialized-output assumption is needed. *)
Ltac rd_last_word_pure Ch C V HLen HR :=
 let Hk:=fresh "HCursorNonnegative" in
 let Hend:=fresh "HCursorEnd" in
 assert(Hk:0<=Ch-C)by lia;
 assert(Hend:Ch-C+V<=Ch)by lia;
 change Int.max_unsigned with 4294967295;
 unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;
 first[assumption
 |match goal with
  |- 0<=rd_acc32 ?M ?b ?s ?c ?n ?i ?v=>exact(proj1(rd_acc32_range M b s c n i v))
  | |- rd_acc32 ?M ?b ?s ?c ?n ?i ?v<=4294967295=>exact(proj2(rd_acc32_range M b s c n i v))
  | |- 0<=rd_out_lane(rd_partial ?M ?b ?n ?c ?s ?k ?A)?k ?i ?v=>
    exact(proj1(rd_partial_out_lane_range M b n c s A k i v
     HR HLen Hk ltac:(lia) Hend))
  | |- rd_out_lane(rd_partial ?M ?b ?n ?c ?s ?k ?A)?k ?i ?v<=4294967295=>
    exact(proj2(rd_partial_out_lane_range M b n c s A k i v
     HR HLen Hk ltac:(lia) Hend))
  end
 |lia].

Lemma proof_of_test_rvv_partial_solve_wit_43_pure:
 Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_43_pure.
Proof.
 unfold Qu8Rdsum.rvv_unit_goal.test_rvv_partial_solve_wit_43_pure;intros.
 rd_last_word_pure channels_pre channels vl PreH6 PreH7.
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_43_pure.
