From ExpMinusMax Require Import CaseTyped CaseAssumptions0 CaseAssumptions1 CaseAssumptions2 CaseAssumptions3 CaseAssumptions4 CaseAssumptions5 CaseAssumptions6 CaseAssumptions7 CaseAssumptions8 CaseAssumptions9 CaseAssumptions10 CaseAssumptions11 CaseAssumptions12 CaseAssumptions13 CaseAssumptions14 CaseAssumptions15.
From ExpMinusMax Require Import PublicModel RvvExpressionFacts.
Require Import ExpMinusMax.neon_unit_goal ExpMinusMax.NeonKernelChecked.
Module ActualUnit0 : ExpMinusMax.neon_unit_goal.VC_Correct := ExpMinusMax.NeonKernelChecked.CheckedNeonKernel.
Require Import ExpMinusMax.rvv_unit_goal ExpMinusMax.RvvKernelChecked.
Module ActualUnit1 : ExpMinusMax.rvv_unit_goal.VC_Correct := ExpMinusMax.RvvKernelChecked.CheckedRvvKernel.
Require Import ExpMinusMax.scalar_goal ExpMinusMax.ScalarChecked.
Module ActualUnit2 : ExpMinusMax.scalar_goal.VC_Correct := ExpMinusMax.ScalarChecked.CheckedScalar.
Require Import ExpMinusMax.public_caller_goal ExpMinusMax.PublicCallerChecked.
Module ActualUnit3 : ExpMinusMax.public_caller_goal.VC_Correct := ExpMinusMax.PublicCallerChecked.CheckedPublicCaller.
