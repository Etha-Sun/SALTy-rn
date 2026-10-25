From MaxPool Require Export NeonLoopAutomation CountFacts rvv_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mp_rvv_bounds := try match goal with H:mp_vl_allowed ?avl ?vl |- _ =>
 let Hvl:=fresh "Hvl"in let Havl:=fresh "Havl"in
 pose proof(mp_vl_positive_bounded avl vl ltac:(lia)H)as[[? Hvl]Havl] end.
Ltac mp_rvv_pure := mp_integer_constants;mp_rvv_bounds;mp_pure.
Ltac mp_rvv_call_frame :=
 mp_integer_constants;mp_rvv_bounds;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvuint32m8_t,UndefStructPredvbool4_t;
 mp_call_frame.
