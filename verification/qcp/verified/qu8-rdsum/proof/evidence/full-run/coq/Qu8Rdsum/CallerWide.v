From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export CallerOrigin.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_tail_bit2_exact : forall n,0<=n<16 ->Z.land n 2<>0 ->rd_bit2 n=2.
Proof.
 intros n Hn Hb;assert(Hcases:n=0 \/ n=1 \/ n=2 \/ n=3 \/ n=4 \/ n=5 \/ n=6 \/ n=7 \/ n=8 \/ n=9 \/ n=10 \/ n=11 \/ n=12 \/ n=13 \/ n=14 \/ n=15)by lia.
 destruct Hcases as[ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | -> ] ] ] ] ] ] ] ] ] ] ] ] ] ] ];unfold rd_bit2 in *;vm_compute in *;lia.
Qed.
Ltac rd_wide_bits :=
 try match goal with Hb:Z.land ?n 2<>0 |- _=>let He:=fresh "EBit2"in pose proof(rd_tail_bit2_exact n ltac:(lia)Hb)as He end.
Ltac rd_wide_partial :=
 repeat match goal with
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+4+4) ?A]=>replace(k+4+4)with(k+8)by lia
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+8+4) ?A]=>replace(k+8+4)with(k+12)by lia
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+12+4) ?A]=>replace(k+12+4)with(k+16)by lia
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+16+4) ?A]=>replace(k+16+4)with(k+20)by lia
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+20+4) ?A]=>replace(k+20+4)with(k+24)by lia
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+24+4) ?A]=>replace(k+24+4)with(k+28)by lia
 end.
Ltac rd_more_wide_windows width :=
 try rd_pure_window_cap 1 16 width;
 try rd_pure_window_cap 2 16 width;
 try rd_pure_window_cap 3 16 width;
 try rd_pure_window_cap 4 16 width;
 try rd_pure_window_cap 5 16 width;
 try rd_pure_window_cap 6 16 width;
 try rd_pure_origin 16 width;
 try rd_pure_window_cap 1 24 width;
 try rd_pure_window_cap 2 24 width;
 try rd_pure_window_cap 3 24 width;
 try rd_pure_window_cap 4 24 width;
 try rd_pure_window_cap 5 24 width;
 try rd_pure_window_cap 6 24 width;
 try rd_pure_origin 24 width;
 idtac.
Ltac rd_wide_pure := rd_wide_partial;rd_wide_bits;rd_limits;try change UINT64_MAX with 18446744073709551615 in *;
 rd_pure_resources;try rd_min252_bounds;rd_bit_bounds;
 try multimatch goal with |- context[rd_window ?M ?p ?width]=>rd_pure_windows_cap width;try rd_pure_origin 0 width;try rd_pure_origin 8 width;rd_more_wide_windows width end;
 repeat match goal with H:_ /\ _ |- _=>destruct H end;
 repeat first[assumption|split|reflexivity];try congruence;try lia.
Ltac rd_wide_record := rd_wide_partial;rd_wide_bits;rd_limits;
 try(unfold UndefStructPreduint8x8_t,UndefStructPreduint8x16_t,UndefStructPreduint16x8_t,UndefStructPreduint32x2_t,UndefStructPreduint32x4_t,UndefStructPredvuint8m2_t,UndefStructPredvuint16m4_t,UndefStructPredvuint32m8_t);
 rewrite ?local_field_address;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[apply _derivable1_andp_intros;[rd_wide_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]].
Print Assumptions rd_tail_bit2_exact.
