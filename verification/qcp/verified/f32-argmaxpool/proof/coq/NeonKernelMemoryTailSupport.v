From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export KernelTailFacts NeonKernelPureFacts LaneInsertModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac apkt_update :=
 repeat match goal with
 | H:ap_same_bits ?value(ap_select_f32(ap_gt_mask ?candidate ?old)?candidate ?old)
 |-context[ap_neon_update (?old,?oi)(?candidate,?ci)] =>
 rewrite(app_block_update_pair old oi candidate ci value H);rewrite ?app_block_u32_idem
 end.
Ltac apkt_insert_reduce :=
 cbv beta iota zeta delta [ap_insert_f32 ap_insert_u32 ap_fpack4 ap_ipack4 List.nth Z.to_nat Pos.to_nat Pos.iter_op Nat.add Z.eqb Pos.eqb] in *.
