From Coq Require Import ZArith Lia.
From ArgmaxPool Require Export APBlockMainArithmeticSupport APBlock32Model.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma apma_previous_pair : forall g ob ib done o i ab bi,
 o=app_output_cursor ob done -> i=app_output_cursor ib done ->
 0<o -> 0<i ->
 ab=app_previous_cursor g ob done -> bi=app_previous_cursor g ib done ->
 ap_block32_previous ab bi.
Proof.
 intros g ob ib done o i ab bi Ho Hi Hpo Hpi Ha Hb.
 unfold ap_block32_previous,app_previous_cursor in *.
 unfold app_output_cursor in *.
 destruct (Z.eqb g 0); split; intros; lia.
Qed.
Print Assumptions apma_previous_pair.
