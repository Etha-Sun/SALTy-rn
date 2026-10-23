From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma four_uchar_cells_to_uint : forall p a b c d,
 aligned_4 p ->
 store_uchar p a ** store_uchar (p+1) b ** store_uchar (p+2) c ** store_uchar (p+3) d |--
 store_uint p (a+256*b+65536*c+16777216*d).
Proof.
 intros p a b c d Ha.
 unfold store_uchar,store_uint,store_4byte.
 Intros. Exists a b c d.
 change Byte.max_unsigned with 255 in *.
 change Int.max_unsigned with 4294967295 in *.
 entailer!.
 all: match goal with |- ?G => idtac "REMAINING" G end.
 all: try (unfold isvalidptr_int,isvalidptr_char in *; repeat split; try assumption; lia).
 unfold merge_int,LittleEndian.merge_int.
   change (2^32) with 4294967296.
   change (2^8) with 256. change (2^16) with 65536. change (2^24) with 16777216.
   change Byte.max_unsigned with 255 in *.
   rewrite !Z.mod_small by lia. lia.
Qed.
Print Assumptions four_uchar_cells_to_uint.
