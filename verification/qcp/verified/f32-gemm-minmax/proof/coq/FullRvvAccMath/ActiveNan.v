From Coq Require Import ZArith Lia.
From FullDomainRvv Require Import FullState ActiveVector.
Local Open Scope Z_scope.
Lemma active_max_nan_result_lane : forall vl lane lo mid out,
 active_value vl lane mid canonical_qnan ->
 active_value vl lane out (fp32_neon_max mid lo) ->
 active_value vl lane out canonical_qnan.
Proof.
 unfold active_value,bit_same;intros vl lane lo mid out Hm Ho Hj.
 specialize(Hm Hj);specialize(Ho Hj);subst mid out;reflexivity.
Qed.
Lemma active8_max_nan_result : forall vl lo mid0 mid1 mid2 mid3 mid4 mid5 mid6 mid7 out0 out1 out2 out3 out4 out5 out6 out7,
 active8 vl mid0 mid1 mid2 mid3 mid4 mid5 mid6 mid7 canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan ->
 active8 vl out0 out1 out2 out3 out4 out5 out6 out7 (fp32_neon_max mid0 lo) (fp32_neon_max mid1 lo) (fp32_neon_max mid2 lo) (fp32_neon_max mid3 lo) (fp32_neon_max mid4 lo) (fp32_neon_max mid5 lo) (fp32_neon_max mid6 lo) (fp32_neon_max mid7 lo) ->
 active8 vl out0 out1 out2 out3 out4 out5 out6 out7 canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan canonical_qnan.
Proof.
 intros vl lo mid0 mid1 mid2 mid3 mid4 mid5 mid6 mid7 out0 out1 out2 out3 out4 out5 out6 out7 Hm Ho.
 unfold active8 in *;destruct Hm as (Hm0&Hm1&Hm2&Hm3&Hm4&Hm5&Hm6&Hm7).
 destruct Ho as (Ho0&Ho1&Ho2&Ho3&Ho4&Ho5&Ho6&Ho7);repeat split.
 - eapply active_max_nan_result_lane;[exact Hm0|exact Ho0].
 - eapply active_max_nan_result_lane;[exact Hm1|exact Ho1].
 - eapply active_max_nan_result_lane;[exact Hm2|exact Ho2].
 - eapply active_max_nan_result_lane;[exact Hm3|exact Ho3].
 - eapply active_max_nan_result_lane;[exact Hm4|exact Ho4].
 - eapply active_max_nan_result_lane;[exact Hm5|exact Ho5].
 - eapply active_max_nan_result_lane;[exact Hm6|exact Ho6].
 - eapply active_max_nan_result_lane;[exact Hm7|exact Ho7].
Qed.
Print Assumptions active_max_nan_result_lane.
Print Assumptions active8_max_nan_result.
