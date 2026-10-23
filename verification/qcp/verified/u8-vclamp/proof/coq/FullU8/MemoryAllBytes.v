From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import MemoryFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma uchar_full_all_bounds_preserve : forall p n A,
 UCharArray.full p n A |-- “ forall i,0<=i<n ->0<=Znth i A 0<=255 ” && UCharArray.full p n A.
Proof.
 intros p n A;unfold andp,coq_prop,derivable1;intros m Hm;split;[|exact Hm].
 intros i Hi;pose proof(uchar_full_value_bound p n A i Hi)as Hb.
 unfold coq_prop,derivable1 in Hb;now apply(Hb m).
Qed.
Print Assumptions uchar_full_all_bounds_preserve.
