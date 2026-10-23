From Coq Require Import ZArith Lia String.
From Qs8I8Cvt Require Export KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac qcv_semantic_one H :=
 let T:=type of H in
 lazymatch T with
 | ((?p # Char |-> ?v) ?h) =>
   let Hb:=fresh "char_range" in
   pose proof(valid_store_char p v h H)as Hb;
   change(-128<=v<=127 /\ isvalidptr_char p)in Hb;clear H
 | ((?p # Short |-> ?v) ?h) =>
   let Hb:=fresh "short_range" in pose proof(valid_store_short p v h H)as Hb;
   change(-32768<=v<=32767 /\ isvalidptr_short p)in Hb;clear H
 | ((?p # Int |-> ?v) ?h) =>
   let Hb:=fresh "int_range" in pose proof(valid_store_int p v h H)as Hb;
   change(-2147483648<=v<=2147483647 /\ isvalidptr_int p)in Hb;clear H
 | ((?P ** ?Q) ?h) =>
   unfold sepcon at 1 in H;
   let h1:=fresh "heap_left" in let h2:=fresh "heap_right" in
   let Hj:=fresh "heap_join" in let HP:=fresh "heap_part" in let HQ:=fresh "heap_part" in
   destruct H as[h1[h2[Hj[HP HQ]]]]
 | _ => fail 0
 end.
Ltac qcv_semantic_ranges :=
 repeat match goal with H:_ |- _ => qcv_semantic_one H end.
Ltac qcv_semantic_bounds :=
 unfold derivable1;intros;
 qcv_semantic_ranges;
 unfold andp,coq_prop;
 repeat first[assumption|split|reflexivity];lia.
Ltac qcv_semantic_frame :=
 unfold UndefStructPredint8x8_t,UndefStructPredint8x16_t,UndefStructPredint16x8_t,
 UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t;
 rewrite ?local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [first[solve[qcv_pure]|solve[qcv_semantic_bounds]]|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac qcv_semantic_close := rewrite ?sizeof_char,?sizeof_uchar,?Z.quot_1_r in *;
 first[solve[qcv_pure]|solve[qcv_semantic_frame]|solve[qcv_semantic_bounds]].
