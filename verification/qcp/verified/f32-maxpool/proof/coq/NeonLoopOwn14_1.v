From MaxPool Require Import NeonLoopAutomation.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_max mp_min mp_arm mp_rvv mp_after_groups mp_group_lane mp_out mp_data mp_ptr_data mp_pass_partial mp_pass_complete.
Lemma checked : MaxPool.neon_unit_goal.test_neon_entail_wit_14_1.
Proof. unfold MaxPool.neon_unit_goal.test_neon_entail_wit_14_1;left;mp_intro;Exists(0:Z);
assert(Hc:c=3)by(assert(Hcases:c=0\/c=1\/c=2\/c=3)by lia;destruct Hcases as[H0|[H1|[H2|H3]]];subst c;cbn in PreH40,PreH41;lia).
subst c;subst;
rewrite ?mp_loop_output_shift2;
try rewrite mp_loop_store_two by(first[lia|apply mp_loop_first_lane0|apply mp_loop_first_lane_correct]);
try rewrite mp_loop_store_one by(first[lia|apply mp_loop_first_lane0|apply mp_loop_first_lane_correct]);
try match goal with |-context[mp_pass_partial ?F ?PT ?old ?t ?off ?out ?K ?count ?group ?done ?lo ?hi]=>
let E:=fresh "donefull"in assert(E:done=count)by lia;rewrite E end;
rewrite ?mp_pass_partial_full by lia;mp_loop_frame.
all:match goal with|-?G=>idtac "REMAINING" G end.
Qed.
Print Assumptions checked.
