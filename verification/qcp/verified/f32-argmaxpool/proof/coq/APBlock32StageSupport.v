From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export block32_goal APBlock32LoadedFacts RvvUpdateIntoProbeSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac apbc_lane_cases:=
 intros lane HL;
 let HC:=fresh "Hlane"in assert(HC:lane=0 \/ lane=1 \/ lane=2 \/ lane=3 \/ lane=4 \/ lane=5 \/ lane=6 \/ lane=7 \/ lane=8 \/ lane=9 \/ lane=10 \/ lane=11 \/ lane=12 \/ lane=13 \/ lane=14 \/ lane=15 \/ lane=16 \/ lane=17 \/ lane=18 \/ lane=19 \/ lane=20 \/ lane=21 \/ lane=22 \/ lane=23 \/ lane=24 \/ lane=25 \/ lane=26 \/ lane=27 \/ lane=28 \/ lane=29 \/ lane=30 \/ lane=31)by lia;
 repeat match goal with H:_\/_|-_=>destruct H end;subst lane;
 cbv beta iota zeta delta [apup_float apup_int ap_fpack32 ap_ipack32 List.nth Z.to_nat Pos.to_nat Pos.iter_op Nat.add vfloat32m8_t_s0 vfloat32m8_t_s1 vfloat32m8_t_s2 vfloat32m8_t_s3 vfloat32m8_t_s4 vfloat32m8_t_s5 vfloat32m8_t_s6 vfloat32m8_t_s7 vfloat32m8_t_s8 vfloat32m8_t_s9 vfloat32m8_t_s10 vfloat32m8_t_s11 vfloat32m8_t_s12 vfloat32m8_t_s13 vfloat32m8_t_s14 vfloat32m8_t_s15 vfloat32m8_t_s16 vfloat32m8_t_s17 vfloat32m8_t_s18 vfloat32m8_t_s19 vfloat32m8_t_s20 vfloat32m8_t_s21 vfloat32m8_t_s22 vfloat32m8_t_s23 vfloat32m8_t_s24 vfloat32m8_t_s25 vfloat32m8_t_s26 vfloat32m8_t_s27 vfloat32m8_t_s28 vfloat32m8_t_s29 vfloat32m8_t_s30 vfloat32m8_t_s31 vuint32m8_t_s0 vuint32m8_t_s1 vuint32m8_t_s2 vuint32m8_t_s3 vuint32m8_t_s4 vuint32m8_t_s5 vuint32m8_t_s6 vuint32m8_t_s7 vuint32m8_t_s8 vuint32m8_t_s9 vuint32m8_t_s10 vuint32m8_t_s11 vuint32m8_t_s12 vuint32m8_t_s13 vuint32m8_t_s14 vuint32m8_t_s15 vuint32m8_t_s16 vuint32m8_t_s17 vuint32m8_t_s18 vuint32m8_t_s19 vuint32m8_t_s20 vuint32m8_t_s21 vuint32m8_t_s22 vuint32m8_t_s23 vuint32m8_t_s24 vuint32m8_t_s25 vuint32m8_t_s26 vuint32m8_t_s27 vuint32m8_t_s28 vuint32m8_t_s29 vuint32m8_t_s30 vuint32m8_t_s31].
Ltac apbc_read_float:=apbc_lane_cases;
 lazymatch goal with |- ?a = ?b=>match goal with H:apr_float_lane ?j ?vl a b|-_=>apply H;lia end end.
Ltac apbc_dup_int:=apbc_lane_cases;
 lazymatch goal with |- ?a = ?b=>match goal with H:apr_int_lane ?j ?vl a b|-_=>apply H;lia end end.
Ltac apbc_read_previous:=apbc_lane_cases;eapply apbc_previous_pair;eauto;lia.
