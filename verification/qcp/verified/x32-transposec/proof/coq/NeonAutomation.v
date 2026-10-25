From Coq Require Import ZArith Lia.
From X32Transpose Require Export Types NeonProgramModel neon_unit_goal TreeFrame.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma xt_neon_local_field_address : forall(v t f:String.string),
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_const(eval_addr_expr(RE_addr_of(LE_var v)))(FET_alias t))f))=
 eval_addr_expr(RE_addr_of(LE_arrow_field(RE_addr_of(LE_var v))f)).
Proof. intros;apply eval_addr_expr_congr;apply RE_addr_of_congr;apply LE_arrow_field_congr;[apply eval_addr|reflexivity]. Qed.
Ltac xt_neon_basic :=
 intros;unfold UndefStructPreduint32x2_t;
 rewrite ?xt_neon_local_field_address;
 first [solve [xt_tree_cancel] | entailer!;try lia].
