From Coq Require Import ZArith List Lia Strings.String.
From Qd8RvvIsnan Require Import rvv_isnan_goal.
From Qd8RvvLoopMath3 Require Import RvvLoopMath.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_1_2:rvv_isnan_goal.test_rvv_entail_wit_1_2.
Proof. unfold rvv_isnan_goal.test_rvv_entail_wit_1_2;intros;subst mr_pre.
Left.
Exists (s7_2) (s6_2) (s5_2) (s4_2) (s3_2) (s2_2) (s1_2) (s0_2) ((qd8_selected_z (vl) (7) ((qd8_mac_signed (z7_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (7) ((qd8_selected_z (vl) (7) ((qd8_zget (((8 * (kc_pre - k ) ) + 7 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (6) ((qd8_mac_signed (z6_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (6) ((qd8_selected_z (vl) (6) ((qd8_zget (((8 * (kc_pre - k ) ) + 6 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (5) ((qd8_mac_signed (z5_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (5) ((qd8_selected_z (vl) (5) ((qd8_zget (((8 * (kc_pre - k ) ) + 5 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (4) ((qd8_mac_signed (z4_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (4) ((qd8_selected_z (vl) (4) ((qd8_zget (((8 * (kc_pre - k ) ) + 4 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (3) ((qd8_mac_signed (z3_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (3) ((qd8_selected_z (vl) (3) ((qd8_zget (((8 * (kc_pre - k ) ) + 3 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (2) ((qd8_mac_signed (z2_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (2) ((qd8_selected_z (vl) (2) ((qd8_zget (((8 * (kc_pre - k ) ) + 2 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (1) ((qd8_mac_signed (z1_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (1) ((qd8_selected_z (vl) (1) ((qd8_zget (((8 * (kc_pre - k ) ) + 1 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))) ((qd8_selected_z (vl) (0) ((qd8_mac_signed (z0_2) ((Znth (kc_pre - k ) A 0)) ((qd8_selected_z (vl) (0) ((qd8_selected_z (vl) (0) ((qd8_zget (((8 * (kc_pre - k ) ) + 0 )) ((weights ((panel_at (Ps) (((nc_pre - nc ) ÷ 8 )))))))))))))))).
(rvv_normalize;try lia).
replace (kc_pre-(k-1)) with (kc_pre-k+1) by ring.
rvv_arithmetic_facts kc_pre.
rvv_loop_frame.
Qed.
End Checked.
