From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Export CallerCaps LoopResourceFacts OutputModel FastFrame ControlLoopFacts NeonJoinModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac rd_neon_loop_prepare :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?local_field_address;
 try change UINT64_MAX with 18446744073709551615 in *.
Ltac rd_neon_loop_frame :=
 rd_neon_loop_prepare;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
