From Coq Require Import ZArith Lia.
From Qs8Rdsum Require Export CallerOrigin.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rd_tail_bit2_exact : forall n,0<=n<16 ->Z.land n 2<>0 ->rd_bit2 n=2.
Proof.
 intros n Hn Hb;assert(Hcases:n=0 \/ n=1 \/ n=2 \/ n=3 \/ n=4 \/ n=5 \/ n=6 \/ n=7 \/ n=8 \/ n=9 \/ n=10 \/ n=11 \/ n=12 \/ n=13 \/ n=14 \/ n=15)by lia.
 destruct Hcases as[ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | [ -> | -> ] ] ] ] ] ] ] ] ] ] ] ] ] ] ];unfold rd_bit2 in *;vm_compute in *;lia.
Qed.
Ltac rd_focused_bits :=
 try match goal with Hb:Z.land ?n 2<>0 |- _=>let He:=fresh "EBit2"in pose proof(rd_tail_bit2_exact n ltac:(lia)Hb)as He end.
Ltac rd_normalize_partial :=
 repeat match goal with
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+4+4) ?A]=>replace(k+4+4)with(k+8)by lia
 | |- context[rd_partial ?M ?b ?rows ?Ch ?stride (?k+8+4) ?A]=>replace(k+8+4)with(k+12)by lia
 end.
Ltac rd_focused_pure := rd_normalize_partial;rd_focused_bits;rd_pure_caller_origin.
Ltac rd_focused_record := rd_normalize_partial;rd_focused_bits;rd_record_caller_origin.
Print Assumptions rd_tail_bit2_exact.
