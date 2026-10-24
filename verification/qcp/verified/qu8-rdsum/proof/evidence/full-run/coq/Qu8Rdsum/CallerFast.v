From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerWide.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_direct_range :=
 unfold derivable1,andp,coq_prop;intros;
 rd_collect_bounds;
 repeat first[assumption|split|reflexivity];lia.
Ltac rd_fast_pure := rd_wide_partial;rd_wide_bits;rd_limits;
 first[solve[rd_direct_range]|rd_wide_pure].
Ltac rd_fast_record := rd_wide_partial;rd_wide_bits;rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[apply _derivable1_andp_intros;[rd_fast_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[rd_wide_record]].
