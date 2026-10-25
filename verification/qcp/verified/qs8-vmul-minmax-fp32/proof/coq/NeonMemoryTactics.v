From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export KernelTactics neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac qm_nm_intro:=lazymatch goal with|-?P|--?Q=>idtac| |-forall _,_=>intro;qm_nm_intro end.
Ltac qm_nm_start:=qm_nm_intro;
 change(sizeof(CHAR))with 1 in *;
 rewrite ?Z.mul_1_r,?Z.add_0_r,?qm_magic_decimal in *;
 try unfold UndefStructPredint8x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t;
 rewrite ?qm_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 subst;autorewrite with qm_ext qm_vector in *.
Ltac qm_nm_pick:=first[solve[qm_k_finish]
 |solve[apply derivable1_orp_intros1;qm_nm_pick]
 |solve[apply derivable1_orp_intros2;qm_nm_pick]].
