From Coq Require Import ZArith Lia List.
From DwChw Require Export MaskFacts AddressFacts FastFrame propagating_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_rvv_merge dw_repaired_max dw_repaired_min fp32_min_number fp32_max_number dw_rvv_nanmask dw_ne_value dw_mask_bit.
Ltac dw_prop_start := try left;intros;subst;
 try unfold UndefStructPredvfloat32m2_t;
 rewrite ?qm_local_field_address;
 autorewrite with dw_fields in *.
Ltac dw_prop_pure := unfold derivable1,andp,coq_prop;intros;autorewrite with dw_fields in *;
 repeat match goal with |- _ /\ _=>split end;
 first[assumption|reflexivity|lia|unfold dw_fp_match;right;reflexivity].
Ltac dw_prop_solve := dw_prop_start;
 first[solve[apply _derivable1_andp_intros;[dw_prop_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[dw_prop_pure]
 |solve[entailer!;lia]].
Ltac dw_prop_lane :=
 lazymatch goal with |- dw_fp_match ?i ?vl ?ret ?expected =>
  destruct(Z_le_dec vl i)as[Htail|Hactive];[left;exact Htail|right];
  let Hi:=fresh "Hi"in assert(Hi:0<=i<vl)by lia;
  repeat match goal with H:dw_fp_match i vl ?x ?y |- _ =>
   let E:=fresh "Efp"in pose proof(dw_fp_match_active i vl x y ltac:(lia)H)as E;clear H;rewrite E in *
  end;
  repeat match goal with H:dw_mask_matches vl ?m ?A ?B |- _ =>
   let E:=fresh "Emask"in pose proof(H i Hi)as E;clear H;
   autorewrite with dw_fields in E;rewrite dw_ne_self_nan in E;rewrite E
  end;
  unfold dw_repaired_max,dw_repaired_min;reflexivity
 end.
