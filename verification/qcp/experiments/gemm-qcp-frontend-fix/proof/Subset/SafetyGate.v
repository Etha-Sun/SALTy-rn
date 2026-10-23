(* This gate combines only the 78 explicitly named safety obligations.
   Remaining kernel obligations and intrinsic-body contracts stay open. *)
From FullDomainNeonRun Require Import neon_full_goal.
From GemmSubset Require Import SafetyChecked.
Theorem all_named_safety_obligations :
  test_neon_safety_wit_1 /\
  test_neon_safety_wit_2 /\
  test_neon_safety_wit_3 /\
  test_neon_safety_wit_4 /\
  test_neon_safety_wit_5 /\
  test_neon_safety_wit_6 /\
  test_neon_safety_wit_7 /\
  test_neon_safety_wit_8 /\
  test_neon_safety_wit_9 /\
  test_neon_safety_wit_10 /\
  test_neon_safety_wit_11 /\
  test_neon_safety_wit_12 /\
  test_neon_safety_wit_13 /\
  test_neon_safety_wit_14 /\
  test_neon_safety_wit_15 /\
  test_neon_safety_wit_16 /\
  test_neon_safety_wit_17 /\
  test_neon_safety_wit_18 /\
  test_neon_safety_wit_19 /\
  test_neon_safety_wit_20 /\
  test_neon_safety_wit_21 /\
  test_neon_safety_wit_22 /\
  test_neon_safety_wit_23 /\
  test_neon_safety_wit_24 /\
  test_neon_safety_wit_25 /\
  test_neon_safety_wit_26 /\
  test_neon_safety_wit_27 /\
  test_neon_safety_wit_28 /\
  test_neon_safety_wit_29 /\
  test_neon_safety_wit_30 /\
  test_neon_safety_wit_31 /\
  test_neon_safety_wit_32 /\
  test_neon_safety_wit_33 /\
  test_neon_safety_wit_34 /\
  test_neon_safety_wit_35 /\
  test_neon_safety_wit_36 /\
  test_neon_safety_wit_37 /\
  test_neon_safety_wit_38 /\
  test_neon_safety_wit_39 /\
  test_neon_safety_wit_40 /\
  test_neon_safety_wit_41 /\
  test_neon_safety_wit_42 /\
  test_neon_safety_wit_43 /\
  test_neon_safety_wit_44 /\
  test_neon_safety_wit_45 /\
  test_neon_safety_wit_46 /\
  test_neon_safety_wit_47 /\
  test_neon_safety_wit_48 /\
  test_neon_safety_wit_49 /\
  test_neon_safety_wit_50 /\
  test_neon_safety_wit_51 /\
  test_neon_safety_wit_52 /\
  test_neon_safety_wit_53 /\
  test_neon_safety_wit_54 /\
  test_neon_safety_wit_55 /\
  test_neon_safety_wit_56 /\
  test_neon_safety_wit_57 /\
  test_neon_safety_wit_58 /\
  test_neon_safety_wit_59 /\
  test_neon_safety_wit_60 /\
  test_neon_safety_wit_61 /\
  test_neon_safety_wit_62 /\
  test_neon_safety_wit_63 /\
  test_neon_safety_wit_64 /\
  test_neon_safety_wit_65 /\
  test_neon_safety_wit_66 /\
  test_neon_safety_wit_67 /\
  test_neon_safety_wit_68 /\
  test_neon_safety_wit_69 /\
  test_neon_safety_wit_70 /\
  test_neon_safety_wit_71 /\
  test_neon_safety_wit_72 /\
  test_neon_safety_wit_73 /\
  test_neon_safety_wit_74 /\
  test_neon_safety_wit_75 /\
  test_neon_safety_wit_76 /\
  test_neon_safety_wit_77 /\
  test_neon_safety_wit_78.
Proof. exact (conj CheckedSafety.proof_of_test_neon_safety_wit_1 (conj CheckedSafety.proof_of_test_neon_safety_wit_2 (conj CheckedSafety.proof_of_test_neon_safety_wit_3 (conj CheckedSafety.proof_of_test_neon_safety_wit_4 (conj CheckedSafety.proof_of_test_neon_safety_wit_5 (conj CheckedSafety.proof_of_test_neon_safety_wit_6 (conj CheckedSafety.proof_of_test_neon_safety_wit_7 (conj CheckedSafety.proof_of_test_neon_safety_wit_8 (conj CheckedSafety.proof_of_test_neon_safety_wit_9 (conj CheckedSafety.proof_of_test_neon_safety_wit_10 (conj CheckedSafety.proof_of_test_neon_safety_wit_11 (conj CheckedSafety.proof_of_test_neon_safety_wit_12 (conj CheckedSafety.proof_of_test_neon_safety_wit_13 (conj CheckedSafety.proof_of_test_neon_safety_wit_14 (conj CheckedSafety.proof_of_test_neon_safety_wit_15 (conj CheckedSafety.proof_of_test_neon_safety_wit_16 (conj CheckedSafety.proof_of_test_neon_safety_wit_17 (conj CheckedSafety.proof_of_test_neon_safety_wit_18 (conj CheckedSafety.proof_of_test_neon_safety_wit_19 (conj CheckedSafety.proof_of_test_neon_safety_wit_20 (conj CheckedSafety.proof_of_test_neon_safety_wit_21 (conj CheckedSafety.proof_of_test_neon_safety_wit_22 (conj CheckedSafety.proof_of_test_neon_safety_wit_23 (conj CheckedSafety.proof_of_test_neon_safety_wit_24 (conj CheckedSafety.proof_of_test_neon_safety_wit_25 (conj CheckedSafety.proof_of_test_neon_safety_wit_26 (conj CheckedSafety.proof_of_test_neon_safety_wit_27 (conj CheckedSafety.proof_of_test_neon_safety_wit_28 (conj CheckedSafety.proof_of_test_neon_safety_wit_29 (conj CheckedSafety.proof_of_test_neon_safety_wit_30 (conj CheckedSafety.proof_of_test_neon_safety_wit_31 (conj CheckedSafety.proof_of_test_neon_safety_wit_32 (conj CheckedSafety.proof_of_test_neon_safety_wit_33 (conj CheckedSafety.proof_of_test_neon_safety_wit_34 (conj CheckedSafety.proof_of_test_neon_safety_wit_35 (conj CheckedSafety.proof_of_test_neon_safety_wit_36 (conj CheckedSafety.proof_of_test_neon_safety_wit_37 (conj CheckedSafety.proof_of_test_neon_safety_wit_38 (conj CheckedSafety.proof_of_test_neon_safety_wit_39 (conj CheckedSafety.proof_of_test_neon_safety_wit_40 (conj CheckedSafety.proof_of_test_neon_safety_wit_41 (conj CheckedSafety.proof_of_test_neon_safety_wit_42 (conj CheckedSafety.proof_of_test_neon_safety_wit_43 (conj CheckedSafety.proof_of_test_neon_safety_wit_44 (conj CheckedSafety.proof_of_test_neon_safety_wit_45 (conj CheckedSafety.proof_of_test_neon_safety_wit_46 (conj CheckedSafety.proof_of_test_neon_safety_wit_47 (conj CheckedSafety.proof_of_test_neon_safety_wit_48 (conj CheckedSafety.proof_of_test_neon_safety_wit_49 (conj CheckedSafety.proof_of_test_neon_safety_wit_50 (conj CheckedSafety.proof_of_test_neon_safety_wit_51 (conj CheckedSafety.proof_of_test_neon_safety_wit_52 (conj CheckedSafety.proof_of_test_neon_safety_wit_53 (conj CheckedSafety.proof_of_test_neon_safety_wit_54 (conj CheckedSafety.proof_of_test_neon_safety_wit_55 (conj CheckedSafety.proof_of_test_neon_safety_wit_56 (conj CheckedSafety.proof_of_test_neon_safety_wit_57 (conj CheckedSafety.proof_of_test_neon_safety_wit_58 (conj CheckedSafety.proof_of_test_neon_safety_wit_59 (conj CheckedSafety.proof_of_test_neon_safety_wit_60 (conj CheckedSafety.proof_of_test_neon_safety_wit_61 (conj CheckedSafety.proof_of_test_neon_safety_wit_62 (conj CheckedSafety.proof_of_test_neon_safety_wit_63 (conj CheckedSafety.proof_of_test_neon_safety_wit_64 (conj CheckedSafety.proof_of_test_neon_safety_wit_65 (conj CheckedSafety.proof_of_test_neon_safety_wit_66 (conj CheckedSafety.proof_of_test_neon_safety_wit_67 (conj CheckedSafety.proof_of_test_neon_safety_wit_68 (conj CheckedSafety.proof_of_test_neon_safety_wit_69 (conj CheckedSafety.proof_of_test_neon_safety_wit_70 (conj CheckedSafety.proof_of_test_neon_safety_wit_71 (conj CheckedSafety.proof_of_test_neon_safety_wit_72 (conj CheckedSafety.proof_of_test_neon_safety_wit_73 (conj CheckedSafety.proof_of_test_neon_safety_wit_74 (conj CheckedSafety.proof_of_test_neon_safety_wit_75 (conj CheckedSafety.proof_of_test_neon_safety_wit_76 (conj CheckedSafety.proof_of_test_neon_safety_wit_77 (CheckedSafety.proof_of_test_neon_safety_wit_78)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))). Qed.
Print Assumptions all_named_safety_obligations.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_1.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_2.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_3.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_4.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_5.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_6.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_7.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_8.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_9.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_10.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_11.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_12.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_13.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_14.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_15.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_16.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_17.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_18.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_19.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_20.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_21.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_22.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_23.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_24.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_25.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_26.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_27.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_28.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_29.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_30.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_31.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_32.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_33.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_34.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_35.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_36.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_37.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_38.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_39.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_40.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_41.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_42.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_43.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_44.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_45.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_46.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_47.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_48.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_49.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_50.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_51.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_52.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_53.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_54.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_55.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_56.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_57.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_58.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_59.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_60.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_61.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_62.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_63.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_64.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_65.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_66.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_67.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_68.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_69.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_70.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_71.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_72.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_73.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_74.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_75.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_76.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_77.
Print Assumptions CheckedSafety.proof_of_test_neon_safety_wit_78.
