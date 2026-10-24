From Coq Require Export ZArith Lia List String.
From Qu8Add Require Export KernelBounds NeonFrame ComposedBridge ByteBridge neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_kernel_frame :=
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t;
 rewrite ?local_field_address,?byte_typed_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac qu_rem_bounds :=
 repeat match goal with |-context[Z.rem ?x 256]=>
  let H:=fresh "Hrem"in pose proof(qu_neg_rem_bounds x)as H;
  let v:=fresh "remword"in let E:=fresh "Erem"in remember(Z.rem x 256)as v eqn:E end.
Ltac qu_target_ranges :=
 repeat first [
 match goal with |-context[qu_neon_mul ?a ?b]=>let H:=fresh "Hrange"in pose proof(qu_neon_mul_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_neon_mul a b)as v eqn:E end
 | match goal with |-context[qu_neon_mla ?a ?b ?c]=>let H:=fresh "Hrange"in pose proof(qu_neon_mla_range_all a b c)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_neon_mla a b c)as v eqn:E end
 | match goal with |-context[qu_neon_shift ?a ?b]=>let H:=fresh "Hrange"in pose proof(qu_neon_shift_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_neon_shift a b)as v eqn:E end
 | match goal with |-context[qu_neon_add16 ?a ?b]=>let H:=fresh "Hrange"in pose proof(qu_neon_add16_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_neon_add16 a b)as v eqn:E end
 | match goal with |-context[qu_s8 ?x]=>let H:=fresh "Hrange"in pose proof(qu_s8_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_s8 x)as v eqn:E end
 | match goal with |-context[qu_s16 ?x]=>let H:=fresh "Hrange"in pose proof(qu_s16_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_s16 x)as v eqn:E end
 | match goal with |-context[qu_s32 ?x]=>let H:=fresh "Hrange"in pose proof(qu_s32_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_s32 x)as v eqn:E end
 | match goal with |-context[qu_sat16 ?x]=>let H:=fresh "Hrange"in pose proof(qu_sat16_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_sat16 x)as v eqn:E end
 | match goal with |-context[qu_sat8 ?x]=>let H:=fresh "Hrange"in pose proof(qu_sat8_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_sat8 x)as v eqn:E end
 | match goal with |-context[qu_ctrl ?x]=>let H:=fresh "Hrange"in pose proof(qu_ctrl_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_ctrl x)as v eqn:E end
 | match goal with |-context[qu_usat8 ?x]=>let H:=fresh "Hrange"in pose proof(qu_usat8_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_usat8 x)as v eqn:E end
 | match goal with |-context[qu_u16 ?x]=>let H:=fresh "Hrange"in pose proof(qu_u16_range x)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_u16 x)as v eqn:E end
 | match goal with |-context[qu_udiff ?a ?b]=>let H:=fresh "Hrange"in pose proof(qu_udiff_range_all a b)as H;let v:=fresh "word"in let E:=fresh "Eword"in remember(qu_udiff a b)as v eqn:E end
 ].
Ltac qu_kernel_pure :=
 unfold derivable1,andp,coq_prop;intros;
 first[solve[repeat first[assumption|split|reflexivity];lia]
 |qu_rem_bounds;qu_target_ranges;unfold qu_umin,qu_umax;repeat first[assumption|split|reflexivity];lia].
