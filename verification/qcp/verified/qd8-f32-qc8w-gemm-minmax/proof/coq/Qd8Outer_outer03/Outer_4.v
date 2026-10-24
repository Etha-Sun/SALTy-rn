From Coq Require Import ZArith List Lia Strings.String.
From Qd8RvvIsnan Require Import rvv_isnan_goal.
From Qd8RvvOutputMath3 Require Import RvvOutputMath.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac output_lane :=
 first[lia|assumption|
 unfold qd8_active_f;let Hj:=fresh "Hlane" in intro Hj;
 unfold qd8_selected_f,qd8_selected_z;
 repeat match goal with |- context[Z.ltb ?j ?vl] =>
  let E:=fresh "Eactive" in assert(E:(j <? vl)=true)by(apply Z.ltb_lt;lia);rewrite E
 end;
 first[apply rvv_final_nan;lia|
 match goal with H:qd8_active_z ?vl ?j ?z ?e |- context[fp32_of_Z ?z] =>
 rewrite (H Hj);apply rvv_final_formula;lia end]].
Module Checked.
Lemma proof_of_test_rvv_entail_wit_4_4:rvv_isnan_goal.test_rvv_entail_wit_4_4.
Proof. unfold rvv_isnan_goal.test_rvv_entail_wit_4_4;intros.
 subst k cn_stride mr_pre bounds_nan.
 (rvv_normalize;try lia).
 rewrite rvv_write_lanes by output_lane.
 pose proof (rvv_extent_covers kc_pre ltac:(lia)) as Hextent.
 match goal with H:data_capacity _ _ _ _ _ |- _ =>
  pose proof H as Hcap;
  unfold data_capacity in Hcap;
  destruct Hcap as (Ha & Hw & Hc & Hwa & Hacap & Hwcap & Hccap)
 end.
 unfold unsigned_last_nbits.
 change (2^64) with 18446744073709551616.
 rewrite (Z.mod_small a0 18446744073709551616) by lia.
 rewrite (Z.mod_small (a0-kc_pre) 18446744073709551616) by lia.
 rewrite (Z.mod_small (nc-vl) 18446744073709551616) by lia.
 replace (a0-kc_pre) with a_pre by lia.
 replace (nc_pre-(nc-vl)) with (nc_pre-nc+vl) by lia.
 destruct (Z.eq_dec nc vl) as [Hend|Hmore].
 - Left;rvv_frame.
 - exfalso;lia.
Qed.
End Checked.
