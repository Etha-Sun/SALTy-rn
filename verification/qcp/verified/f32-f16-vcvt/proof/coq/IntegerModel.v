From Coq Require Import ZArith Znumtheory Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
Local Open Scope Z_scope.
Definition f16_narrow16 (x:Z) : Z := x mod 65536.
Definition f16_add32 (a b:Z) : Z := (a+b) mod 4294967296.
Definition f16_and32 (a b:Z) : Z := Z.land a b.
Definition f16_or32 (a b:Z) : Z := Z.lor a b.
Definition f16_max32 (a b:Z) : Z := if Z.ltb a b then b else a.
Definition f16_gt32 (a b:Z) : Z := if Z.ltb b a then 4294967295 else 0.
Definition f16_add16 (a b:Z) : Z := f16_narrow16 (a+b).
Definition f16_and16 (a b:Z) : Z := f16_narrow16 (Z.land a b).
Definition f16_or16 (a b:Z) : Z := f16_narrow16 (Z.lor a b).
Definition f16_select16 (m a b:Z) : Z := f16_narrow16 (Z.lor (Z.land m a) (Z.land (Z.lxor m 65535) b)).
Definition f16_shrn13 (a:Z) : Z := f16_narrow16 (Z.shiftr a 13).
Definition f16_shrn16 (a:Z) : Z := f16_narrow16 (Z.shiftr a 16).

Lemma f16_mod16_mod32 : forall a, (a mod 4294967296) mod 65536 = a mod 65536.
Proof. intro a; symmetry; apply Zmod_div_mod; try lia. exists 65536; reflexivity. Qed.
Print Assumptions f16_mod16_mod32.
