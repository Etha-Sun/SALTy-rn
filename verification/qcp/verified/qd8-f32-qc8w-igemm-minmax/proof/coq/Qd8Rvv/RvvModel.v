From Coq Require Import ZArith List Bool Lia.
From Qd8API Require Export ApiModel Layouts.
From Qd8FullKernel Require Export FullModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition qd8_bounds_flag (lo hi:fp32) : Z :=
 if orb (Binary.is_nan 24 128 lo) (Binary.is_nan 24 128 hi) then 1 else 0.
Definition qd8_rvv_output_cell (K col zp:Z) (A:list Z) (Ps:list panel_data)
 (inv lo hi:fp32) :=
 qd8_rvv_clamp (raw_output K (col mod 8) zp A (panel_at Ps (col/8)) inv) lo hi.
Definition qd8_rvv_completed (K count zp:Z) (A:list Z) (Ps:list panel_data)
 (inv lo hi:fp32) :=
 map (fun i => qd8_rvv_output_cell K (Z.of_nat i) zp A Ps inv lo hi)
     (seq 0 (Z.to_nat count)).
Definition qd8_rvv_prefix (c N done K zp:Z) (A:list Z) (Ps:list panel_data)
 (inv lo hi:fp32) : Assertion :=
 qd8_write_state c N done (qd8_rvv_completed K done zp A Ps inv lo hi).

(* Concrete C-shim choice for unobserved inactive slots. This is not an
   assertion that hardware must zero tail-agnostic lanes. The old active-only
   contracts follow, and every load/store still touches only active lanes. *)
Definition qd8_selected_f (vl lane:Z) (active:fp32) : fp32 :=
 if Z.ltb lane vl then active else fp32_zero.
Definition qd8_selected_z (vl lane active:Z) : Z :=
 if Z.ltb lane vl then active else 0.
Lemma qd8_selected_f_active : forall vl lane x,
 qd8_active_f vl lane (qd8_selected_f vl lane x) x.
Proof. intros vl lane x H;unfold qd8_selected_f.
 destruct (lane <? vl) eqn:E;[reflexivity|apply Z.ltb_ge in E;lia]. Qed.
Lemma qd8_selected_z_active : forall vl lane x,
 qd8_active_z vl lane (qd8_selected_z vl lane x) x.
Proof. intros vl lane x H;unfold qd8_selected_z.
 destruct (lane <? vl) eqn:E;[reflexivity|apply Z.ltb_ge in E;lia]. Qed.
Print Assumptions qd8_selected_f_active.
Print Assumptions qd8_selected_z_active.
