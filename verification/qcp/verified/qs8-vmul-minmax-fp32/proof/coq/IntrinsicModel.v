From Coq Require Import ZArith List.
From Qs8Mul Require Export VectorModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qm_min(a b:Z):Z:=Z.min a b.
Definition qm_max(a b:Z):Z:=Z.max a b.
Definition qm_i8_bits(x:Z):Z:=Z.land x 255.
Definition qm_pack16(a b:Z):Z:=qm_i8_bits a+256*qm_i8_bits b.
Definition qm_pack32(a b c d:Z):Z:=qm_i8_bits a+256*qm_i8_bits b+65536*qm_i8_bits c+16777216*qm_i8_bits d.
Definition qm_ext8(a b c d e f g h k j:Z):Z:=
 nth (Z.to_nat((j+k) mod 8)) [a;b;c;d;e;f;g;h] 0.
(* Source-used specialization: contract requires shift=0 and VXRM RDN.
   No bits are discarded; the source instruction has no rounding increment.
   No claim is made here for other shift arguments. *)
Definition qm_clip16_shift0(x:Z):Z:=qm_sat16 x.
Definition qm_clip8_shift0(x:Z):Z:=qm_sat8 x.

Definition qm_ext_pair(a b c d e f g h a1 b1 c1 d1 e1 f1 g1 h1 k j:Z):Z:=
 nth (Z.to_nat(j+k)) [a;b;c;d;e;f;g;h;a1;b1;c1;d1;e1;f1;g1;h1] 0.
