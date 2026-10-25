From Coq Require Import ZArith List.
From Qs8Mul Require Export RecordComputeModel.
Local Open Scope Z_scope.
Definition qm_record_list32(R:Recordvint8m2_t):list Z:=qm_list32 (vint8m2_t_s0 R) (vint8m2_t_s1 R) (vint8m2_t_s2 R) (vint8m2_t_s3 R) (vint8m2_t_s4 R) (vint8m2_t_s5 R) (vint8m2_t_s6 R) (vint8m2_t_s7 R) (vint8m2_t_s8 R) (vint8m2_t_s9 R) (vint8m2_t_s10 R) (vint8m2_t_s11 R) (vint8m2_t_s12 R) (vint8m2_t_s13 R) (vint8m2_t_s14 R) (vint8m2_t_s15 R) (vint8m2_t_s16 R) (vint8m2_t_s17 R) (vint8m2_t_s18 R) (vint8m2_t_s19 R) (vint8m2_t_s20 R) (vint8m2_t_s21 R) (vint8m2_t_s22 R) (vint8m2_t_s23 R) (vint8m2_t_s24 R) (vint8m2_t_s25 R) (vint8m2_t_s26 R) (vint8m2_t_s27 R) (vint8m2_t_s28 R) (vint8m2_t_s29 R) (vint8m2_t_s30 R) (vint8m2_t_s31 R).
Definition qm_record_prefix(vl:Z)(R:Recordvint8m2_t):list Z:=qm_take32 vl(qm_record_list32 R).
