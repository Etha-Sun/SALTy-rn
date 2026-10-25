From Coq Require Import ZArith Lia List Bool.
From X32Packw Require Import PackwModel IndexModel.
From AUXLib Require Import ListLib.
Open Scope Z_scope.
Fixpoint pw_nc_nat (n:nat)(present:bool)(nc kc gap pairs gi otot:Z)(W BIAS OLD:list Z) : list Z :=
 match n with
 | O=>OLD
 | S k=>pw_index_pair present kc gap ((gi*nc+2*Z.of_nat k)*kc) (gi*nc+2*Z.of_nat k)
 ((gi*(nc-pairs)+Z.of_nat k)*(2+(2*kc+gap))) otot W BIAS
 (pw_nc_nat k present nc kc gap pairs gi otot W BIAS OLD)
 end.
Definition pw_nc_prefix (n:Z) := pw_nc_nat (Z.to_nat n).
Definition pw_group (present:bool)(nc kc gap pairs gi otot:Z)(W BIAS OLD:list Z) :=
 let PAIRS:=pw_nc_prefix pairs present nc kc gap pairs gi otot W BIAS OLD in
 if Z.ltb (2*pairs) nc then
 pw_index_odd present kc gap ((gi*nc+2*pairs)*kc) (gi*nc+2*pairs)
 ((gi*(nc-pairs)+pairs)*(2+(2*kc+gap))) otot W BIAS PAIRS
 else PAIRS.
Fixpoint pw_groups_nat (n:nat)(present:bool)(nc kc gap pairs otot:Z)(W BIAS OLD:list Z):list Z :=
 match n with
 | O=>OLD
 | S k=>pw_group present nc kc gap pairs (Z.of_nat k) otot W BIAS
 (pw_groups_nat k present nc kc gap pairs otot W BIAS OLD)
 end.
Definition pw_groups_prefix (n:Z) := pw_groups_nat(Z.to_nat n).
Lemma pw_nc_zero : forall present nc kc gap pairs gi otot W BIAS OLD,pw_nc_prefix 0 present nc kc gap pairs gi otot W BIAS OLD=OLD.
Proof. reflexivity. Qed.
Lemma pw_nc_step : forall n present nc kc gap pairs gi otot W BIAS OLD,0<=n ->
 pw_nc_prefix(n+1) present nc kc gap pairs gi otot W BIAS OLD=
 pw_index_pair present kc gap ((gi*nc+2*n)*kc)(gi*nc+2*n)((gi*(nc-pairs)+n)*(2+(2*kc+gap)))otot W BIAS(pw_nc_prefix n present nc kc gap pairs gi otot W BIAS OLD).
Proof. intros;unfold pw_nc_prefix;rewrite Z2Nat.inj_add by lia;cbn [Z.to_nat];rewrite Nat.add_1_r;cbn [pw_nc_nat];rewrite Z2Nat.id by lia;reflexivity. Qed.
Lemma pw_groups_zero : forall present nc kc gap pairs otot W BIAS OLD,pw_groups_prefix 0 present nc kc gap pairs otot W BIAS OLD=OLD.
Proof. reflexivity. Qed.
Lemma pw_groups_step : forall n present nc kc gap pairs otot W BIAS OLD,0<=n ->
 pw_groups_prefix(n+1) present nc kc gap pairs otot W BIAS OLD=
 pw_group present nc kc gap pairs n otot W BIAS(pw_groups_prefix n present nc kc gap pairs otot W BIAS OLD).
Proof. intros;unfold pw_groups_prefix;rewrite Z2Nat.inj_add by lia;cbn [Z.to_nat];rewrite Nat.add_1_r;cbn [pw_groups_nat];rewrite Z2Nat.id by lia;reflexivity. Qed.
Print Assumptions pw_nc_zero.
Print Assumptions pw_nc_step.
Print Assumptions pw_groups_zero.
Print Assumptions pw_groups_step.
