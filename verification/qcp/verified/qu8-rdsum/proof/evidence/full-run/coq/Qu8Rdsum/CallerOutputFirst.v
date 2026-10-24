From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerOutputFast.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_output_record_pure_first := rd_wide_partial;rd_wide_bits;rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[apply _derivable1_andp_intros;[rd_output_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[rd_output_record]].
