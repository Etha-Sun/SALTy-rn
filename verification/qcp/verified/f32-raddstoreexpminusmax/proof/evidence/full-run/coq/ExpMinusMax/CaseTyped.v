From ExpMinusMax Require Import PublicModel RvvExpressionFacts.
Require Import ExpMinusMax.neon_unit_goal ExpMinusMax.NeonKernelChecked.
Module ActualUnit0 : ExpMinusMax.neon_unit_goal.VC_Correct := ExpMinusMax.NeonKernelChecked.CheckedNeonKernel.
Require Import ExpMinusMax.rvv_unit_goal ExpMinusMax.RvvKernelChecked.
Module ActualUnit1 : ExpMinusMax.rvv_unit_goal.VC_Correct := ExpMinusMax.RvvKernelChecked.CheckedRvvKernel.
Require Import ExpMinusMax.scalar_goal ExpMinusMax.ScalarChecked.
Module ActualUnit2 : ExpMinusMax.scalar_goal.VC_Correct := ExpMinusMax.ScalarChecked.CheckedScalar.
Require Import ExpMinusMax.public_caller_goal ExpMinusMax.PublicCallerChecked.
Module ActualUnit3 : ExpMinusMax.public_caller_goal.VC_Correct := ExpMinusMax.PublicCallerChecked.CheckedPublicCaller.
