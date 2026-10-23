From Coq Require Import ZArith Lia.
From Qu8Rsum Require Export Types FastFrame.
Import Snaive_C_Rules64.
Local Open Scope sac.
Ltac neon_frame :=
 unfold UndefStructPreduint8x16_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
