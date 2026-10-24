From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeoninitial03 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_1:test_neon_entail_wit_1.
Proof. unfold test_neon_entail_wit_1;left;intros.
 rewrite ?sizeof_ptr in *;unfold Arch64.ptr_size_Z in *;rvv_normalize;try lia.
 all: ig_extra;ig_full_shape.
 all: sep_apply (ig_empty_output c_pre nc_pre (total_depth (kc_pre/4) Refs) (flat_inputs Blocks Refs (kc_pre/4)) W lo hi);ig_math_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
