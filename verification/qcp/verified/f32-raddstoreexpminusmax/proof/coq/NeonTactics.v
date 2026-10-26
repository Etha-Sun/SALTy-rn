From Coq Require Import ZArith Lia Ring List.
From ExpMinusMax Require Export Frame VectorIntNormalization LiteralConstants ZeroLiteral CNegativeLiteralFacts RecordIntStageFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac emk_literal:=rewrite ?em_log2e_literal,?em_magic_bias_literal,?em_c5_literal,?em_c4_literal,?em_c3_literal,?em_c2_literal,?em_c1_literal,?em_denorm_cutoff_C_literal,?em_minus_ln2_C_literal,?em_zero_literal.
Ltac emk_prepare:=try change(INT_MAX)with 2147483647 in *;try change(INT_MIN)with(-2147483648)in *;try change(UINT64_MAX)with 18446744073709551615 in *;
 rewrite ?em_record_eta4,?em_record_eta2,?em_record_eta_i4,?em_record_eta_u4.
Ltac emk_props:=repeat first[assumption|reflexivity|lia|split].
Ltac emk_pure:=lazymatch goal with
 | |-?P|--coq_prop ?Q=>apply em_pure_right;emk_literal;emk_props
 | |-?P|--andp ?Q ?R=>apply _derivable1_andp_intros;[emk_pure|emk_pure]
 | |-?P|--truep=>unfold derivable1,truep;intros;exact I end.
Ltac emk_pure_goal:=first[solve[em_intro;emk_prepare;emk_pure]|solve[left;em_intro;emk_prepare;emk_pure]|right;em_intro;emk_prepare;emk_pure].
Ltac emk_frame:=emk_prepare;
 first[solve[emk_pure]|em_frame].
