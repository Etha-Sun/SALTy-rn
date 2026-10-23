Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import Rndne.Types.
Require Import Rndne.Bits.
Require Import Rndne.Model.
Require Import Rndne.VectorModel.
Local Open Scope sac.

(*----- Function qcp_rnd_active___riscv_vfabs_v_f32m8 -----*)

Definition qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) )
.

Definition qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_abs (a_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_abs (a_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_abs (a_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfabs_v_f32m8 (i_pre) (vl_pre) (a_pre)) )
.

Definition qcp_rnd_active___riscv_vfabs_v_f32m8_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_rnd_active___riscv_vfabs_v_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_rnd_active___riscv_vfadd_vf_f32m8 -----*)

Definition qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfadd_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfadd_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfadd_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_rvv_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfadd_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_rvv_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfadd_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_rvv_add (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfadd_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rnd_active___riscv_vfadd_vf_f32m8_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_rnd_active___riscv_vfadd_vf_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_rnd_active___riscv_vfsub_vf_f32m8 -----*)

Definition qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsub_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsub_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfsub_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_rvv_sub (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsub_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_rvv_sub (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsub_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_rvv_sub (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfsub_vf_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rnd_active___riscv_vfsub_vf_f32m8_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_rnd_active___riscv_vfsub_vf_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_rnd_active___riscv_vfsgnj_vv_f32m8 -----*)

Definition qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsgnj_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsgnj_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfsgnj_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_sign (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsgnj_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_sign (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vfsgnj_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (rndne_same_bits retval (rndne_sign (a_pre) (b_pre)) )) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vfsgnj_vv_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre)) )
.

Definition qcp_rnd_active___riscv_vfsgnj_vv_f32m8_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Definition qcp_rnd_active___riscv_vfsgnj_vv_f32m8_partial_solve_wit_2 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4 -----*)

Definition qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (rndne_gt (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (rndne_gt (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (rndne_gt (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (rndne_active___riscv_vmfgt_vf_f32m8_b4 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_rnd_active___riscv_vor_vx_u32m8 -----*)

Definition qcp_rnd_active___riscv_vor_vx_u32m8_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (rndne_active___riscv_vor_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (rndne_active___riscv_vor_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (rndne_active___riscv_vor_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((Z.lor a_pre b_pre) = (rndne_active___riscv_vor_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((Z.lor a_pre b_pre) = (rndne_active___riscv_vor_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((Z.lor a_pre b_pre) = (rndne_active___riscv_vor_vx_u32m8 (i_pre) (vl_pre) (a_pre) (b_pre)))
.

(*----- Function qcp_rnd_active___riscv_vmerge_vvm_f32m8 -----*)

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits retval (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: fp32) (PreH1 : (same_bits retval (fp32_of_bits (0)) )) (PreH2 : (i_pre >= vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits retval (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) )
.

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (mask_pre <> 0)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits b_pre (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (mask_pre <> 0)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits b_pre (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (mask_pre <> 0)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits b_pre (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) )
.

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_3 := 
(
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (mask_pre = 0)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits a_pre (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (mask_pre)) ) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (mask_pre = 0)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (rndne_same_bits a_pre (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (0)) ) ”
  &&  emp
).

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_3_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (mask_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (mask_pre = 0)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (rndne_same_bits a_pre (rndne_active___riscv_vmerge_vvm_f32m8 (i_pre) (vl_pre) (a_pre) (b_pre) (0)) )
.

Definition qcp_rnd_active___riscv_vmerge_vvm_f32m8_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre >= vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

(*----- Function qcp_rnd_active_ne -----*)

Definition qcp_rnd_active_ne_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((( &( "a" ) )) # Float  |-> a_pre)
  **  ((( &( "b" ) )) # Float  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_rnd_active_ne_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (rndne_active_ne (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (0 = (rndne_active_ne (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_rnd_active_ne_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (0 = (rndne_active_ne (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_rnd_active_ne_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (rndne_ne (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (rndne_active_ne (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (rndne_ne (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (retval = (rndne_active_ne (i_pre) (vl_pre) (a_pre) (b_pre))) ”
  &&  emp
).

Definition qcp_rnd_active_ne_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: fp32) (a_pre: fp32) (retval: Z) (PreH1 : (retval = (rndne_ne (a_pre) (b_pre)))) (PreH2 : (i_pre < vl_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) ,
  (retval = (rndne_active_ne (i_pre) (vl_pre) (a_pre) (b_pre)))
.

Definition qcp_rnd_active_ne_partial_solve_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_1 : qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_2 : qcp_rnd_active___riscv_vfabs_v_f32m8_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfabs_v_f32m8_partial_solve_wit_1 : qcp_rnd_active___riscv_vfabs_v_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfabs_v_f32m8_partial_solve_wit_2 : qcp_rnd_active___riscv_vfabs_v_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_1 : qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_2 : qcp_rnd_active___riscv_vfadd_vf_f32m8_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfadd_vf_f32m8_partial_solve_wit_1 : qcp_rnd_active___riscv_vfadd_vf_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfadd_vf_f32m8_partial_solve_wit_2 : qcp_rnd_active___riscv_vfadd_vf_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_1 : qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_2 : qcp_rnd_active___riscv_vfsub_vf_f32m8_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfsub_vf_f32m8_partial_solve_wit_1 : qcp_rnd_active___riscv_vfsub_vf_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfsub_vf_f32m8_partial_solve_wit_2 : qcp_rnd_active___riscv_vfsub_vf_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_1 : qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_2 : qcp_rnd_active___riscv_vfsgnj_vv_f32m8_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vfsgnj_vv_f32m8_partial_solve_wit_1 : qcp_rnd_active___riscv_vfsgnj_vv_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vfsgnj_vv_f32m8_partial_solve_wit_2 : qcp_rnd_active___riscv_vfsgnj_vv_f32m8_partial_solve_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_safety_wit_1 : qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_safety_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_1 : qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_2 : qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_partial_solve_wit_1 : qcp_rnd_active___riscv_vmfgt_vf_f32m8_b4_partial_solve_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vor_vx_u32m8_safety_wit_1 : qcp_rnd_active___riscv_vor_vx_u32m8_safety_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_1 : qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_2 : qcp_rnd_active___riscv_vor_vx_u32m8_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_1 : qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_1.
Axiom proof_of_qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_2 : qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_2.
Axiom proof_of_qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_3 : qcp_rnd_active___riscv_vmerge_vvm_f32m8_return_wit_3.
Axiom proof_of_qcp_rnd_active___riscv_vmerge_vvm_f32m8_partial_solve_wit_1 : qcp_rnd_active___riscv_vmerge_vvm_f32m8_partial_solve_wit_1.
Axiom proof_of_qcp_rnd_active_ne_safety_wit_1 : qcp_rnd_active_ne_safety_wit_1.
Axiom proof_of_qcp_rnd_active_ne_return_wit_1 : qcp_rnd_active_ne_return_wit_1.
Axiom proof_of_qcp_rnd_active_ne_return_wit_2 : qcp_rnd_active_ne_return_wit_2.
Axiom proof_of_qcp_rnd_active_ne_partial_solve_wit_1 : qcp_rnd_active_ne_partial_solve_wit_1.

End VC_Correct.
