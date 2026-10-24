From Coq Require Export ZArith Lia.
From Qu8Add Require Export VectorModel NeonFrame neon_arithmetic_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qu_vector :=
 unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,
 UndefStructPreduint16x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,
 UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,
 UndefStructPreduint8x8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try(entailer!);try congruence;try lia;
 try(opaque_leaves;sepcon_assoc_change;fast_cancel).
