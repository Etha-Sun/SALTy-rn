From Qs8Cvt Require Import cast_goal CastChecked.
Module FinalCast : Qs8Cvt.cast_goal.VC_Correct := Qs8Cvt.CastChecked.CheckedCast.
Print Assumptions FinalCast.proof_of_cast_short_return_wit_1.
Print Assumptions FinalCast.proof_of_cast_int_return_wit_1.
Print Assumptions FinalCast.proof_of_cast_implicit_return_wit_1.
