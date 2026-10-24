From Coq Require Import ZArith List.
From Qd8IGemm Require Export IGemmModel.
From Qd8API Require Export ApiModel.
Local Open Scope Z_scope.
(* Same vld1_s8 eight-byte load. Input allocation extent and total packed
   depth are separate because an IGEMM entry supplies only one K-window. *)
Definition igemm_i8_address_ok (mode p ab wb K extent tile j:Z) (Ps:list panel_data) : Prop :=
 (mode=0 /\ p=ab+j /\ 0<=j /\ j+8<=extent) \/
 (mode=1 /\ p=wb+tile*FullModel.panel_bytes K+32+j /\
  0<=tile<Zlength Ps /\ 0<=j /\ j+8<=8*K).
Lemma gemm_load_is_special_case : forall mode p ab wb K tile j Ps,
 igemm_i8_address_ok mode p ab wb K (a_read_extent K) tile j Ps <->
 qd8_i8_address_ok mode p ab wb K tile j Ps.
Proof. reflexivity. Qed.
Print Assumptions gemm_load_is_special_case.
