From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerFast PartialRangeFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_output_ranges :=
 repeat multimatch goal with
 | |- context[Znth ?i (rd_partial ?Map ?base ?rows ?Ch ?stride ?k ?A) 0]=>
  lazymatch goal with H:rd_init_range(rd_partial Map base rows Ch stride k A) |- _=>fail 0
  | _=>let HR:=fresh "HPartialRange"in let HL:=fresh "HPartialLength"in
    pose proof(rd_partial_init_range Map base rows Ch stride k A ltac:(lia)ltac:(lia)ltac:(assumption))as HR;
    pose proof(rd_partial_length Map base rows Ch stride A k ltac:(lia)ltac:(lia))as HL
  end
 end.
Ltac rd_output_pure := rd_wide_partial;rd_wide_bits;rd_limits;
 first[solve[unfold derivable1,andp,coq_prop;intros;rd_output_ranges;rd_collect_bounds;repeat first[assumption|split|reflexivity];lia]
 |rd_fast_pure].
Ltac rd_output_record := rd_wide_partial;rd_wide_bits;rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[apply _derivable1_andp_intros;[rd_output_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[rd_fast_record]].
