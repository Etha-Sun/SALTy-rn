From Coq Require Import ZArith FunctionalExtensionality Classical_Prop.
From ArgmaxPool Require Import APBlockMainRootSecond BorrowedConsumerSupport.
Import Snaive_C_Rules64.
Check (eq_refl : classic = Classical_Prop.classic).
Check (eq_refl : @functional_extensionality_dep = @FunctionalExtensionality.functional_extensionality_dep).
Check (eq_refl : sizeof_alias_type = CNotation.sizeof_alias_type).
Check (eq_refl : sizeof_enum_type = CNotation.sizeof_enum_type).
Check (eq_refl : sizeof_struct_type = CNotation.sizeof_struct_type).
Check (eq_refl : sizeof_union_type = CNotation.sizeof_union_type).
