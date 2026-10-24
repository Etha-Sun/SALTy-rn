From Coq Require Export ZArith Lia List String.
From Qs8Add Require Export KernelBounds NeonFrame ByteBridge RvvLaneFacts rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qa_rvv_kernel_frame :=
 unfold UndefStructPredint8x8_t,UndefStructPredint8x16_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t;
 rewrite ?local_field_address,?byte_typed_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac qa_rem_bounds :=
 repeat match goal with |-context[Z.rem ?x 256]=>
  let H:=fresh "Hrem"in pose proof(qa_neg_rem_bounds x)as H;
  let v:=fresh "remword"in let E:=fresh "Erem"in remember(Z.rem x 256)as v eqn:E end.
Ltac qa_target_ranges :=
 repeat first [
 match goal with |-context[qa_neon_mul ?a ?b]=>let H:=fresh "Hrange"in pose proof(qa_neon_mul_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_neon_mul a b)as v eqn:E end
 | match goal with |-context[qa_neon_mla ?a ?b ?c]=>let H:=fresh "Hrange"in pose proof(qa_neon_mla_range_all a b c)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_neon_mla a b c)as v eqn:E end
 | match goal with |-context[qa_neon_shift ?a ?b]=>let H:=fresh "Hrange"in pose proof(qa_neon_shift_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_neon_shift a b)as v eqn:E end
 | match goal with |-context[qa_neon_add16 ?a ?b]=>let H:=fresh "Hrange"in pose proof(qa_neon_add16_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_neon_add16 a b)as v eqn:E end
 | match goal with |-context[qa_s8 ?x]=>let H:=fresh "Hrange"in pose proof(qa_s8_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_s8 x)as v eqn:E end
 | match goal with |-context[qa_s16 ?x]=>let H:=fresh "Hrange"in pose proof(qa_s16_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_s16 x)as v eqn:E end
 | match goal with |-context[qa_s32 ?x]=>let H:=fresh "Hrange"in pose proof(qa_s32_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_s32 x)as v eqn:E end
 | match goal with |-context[qa_sat16 ?x]=>let H:=fresh "Hrange"in pose proof(qa_sat16_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_sat16 x)as v eqn:E end
 | match goal with |-context[qa_sat8 ?x]=>let H:=fresh "Hrange"in pose proof(qa_sat8_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_sat8 x)as v eqn:E end
 | match goal with |-context[qa_ctrl ?x]=>let H:=fresh "Hrange"in pose proof(qa_ctrl_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qa_ctrl x)as v eqn:E end
 ].
Ltac qa_rvv_kernel_pure :=
 unfold derivable1,andp,coq_prop;intros;
 first[solve[repeat first[assumption|split|reflexivity];lia]
 |qa_rem_bounds;qa_target_ranges;unfold qa_min,qa_max;repeat first[assumption|split|reflexivity];lia].
