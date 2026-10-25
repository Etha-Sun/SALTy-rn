From Coq Require Import ZArith Lia List.
From X32Packw Require Import PackwModel PackwFacts HeaderModel.
From AUXLib Require Import ListLib.
Open Scope Z_scope.
Definition pw_data_old (kc gap:Z)(OLD:list Z) := sublist 0 (2*kc) (sublist 2 (2+2*kc+gap) OLD).
Definition pw_gap_old (kc gap:Z)(OLD:list Z) := sublist (2*kc) (2*kc+gap) (sublist 2 (2+2*kc+gap) OLD).
Definition pw_tile_pair (kc gap:Z)(H A B OLD:list Z) := H++(pw_pair_prefix kc A B (pw_data_old kc gap OLD)++pw_gap_old kc gap OLD).
Definition pw_tile_odd (kc gap:Z)(H A OLD:list Z) := H++(pw_stride_prefix kc A (pw_data_old kc gap OLD)++pw_gap_old kc gap OLD).
Lemma pw_data_old_length : forall kc gap OLD,0<=kc ->0<=gap ->Zlength OLD=2+2*kc+gap ->Zlength(pw_data_old kc gap OLD)=2*kc.
Proof. intros;assert(HL:Zlength(sublist 2 (2+2*kc+gap) OLD)=2*kc+gap) by (rewrite Zlength_sublist by lia;lia). unfold pw_data_old;rewrite Zlength_sublist by lia;lia. Qed.
Lemma pw_gap_old_length : forall kc gap OLD,0<=kc ->0<=gap ->Zlength OLD=2+2*kc+gap ->Zlength(pw_gap_old kc gap OLD)=gap.
Proof. intros;assert(HL:Zlength(sublist 2 (2+2*kc+gap) OLD)=2*kc+gap) by (rewrite Zlength_sublist by lia;lia). unfold pw_gap_old;rewrite Zlength_sublist by lia;lia. Qed.
Lemma pw_tile_pair_length : forall kc gap H A B OLD,0<=kc ->0<=gap ->Zlength OLD=2+2*kc+gap ->Zlength H=2 ->Zlength(pw_tile_pair kc gap H A B OLD)=2+2*kc+gap.
Proof. intros;unfold pw_tile_pair,pw_pair_prefix;rewrite !Zlength_app,pw_pair_length,pw_data_old_length,pw_gap_old_length by auto;lia. Qed.
Lemma pw_tile_odd_length : forall kc gap H A OLD,0<=kc ->0<=gap ->Zlength OLD=2+2*kc+gap ->Zlength H=2 ->Zlength(pw_tile_odd kc gap H A OLD)=2+2*kc+gap.
Proof. intros;unfold pw_tile_odd,pw_stride_prefix;rewrite !Zlength_app,pw_stride_length,pw_data_old_length,pw_gap_old_length by auto;lia. Qed.
Print Assumptions pw_data_old_length.
Print Assumptions pw_gap_old_length.
Print Assumptions pw_tile_pair_length.
Print Assumptions pw_tile_odd_length.
