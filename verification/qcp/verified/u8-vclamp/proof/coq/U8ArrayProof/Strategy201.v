From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From U8ArrayProof Require Import FrameWand.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy201_correctness : arrays_strategy201.
Proof. pre_process_default; do 2 (rewrite UCharArray.undef_seg_unfold by lia); unfold StoreUCharAsElement.undefstoreA; rewrite !sizeof_uchar; entailer!; rewrite ?Z.mul_1_r, ?Z.add_0_r; replace (0 + 1 + 1 + 1 + 1)%Z with 4%Z by lia; replace (0 + 1 + 1 + 1)%Z with 3%Z by lia; replace (0 + 1 + 1)%Z with 2%Z by lia; replace (0 + 1)%Z with 1%Z by lia; cancel. all: first [apply frame_self_wand | apply_sepcon_adjoint; entailer!]. Qed.
Print Assumptions arrays_strategy201_correctness.
