From Coq Require Import ZArith Bool.
From MaxPool Require Import Model Bits VectorModel AdapterModel.
Local Open Scope Z_scope.
Lemma mp_propagate_pipeline_correct:forall a b numeric,
 mp_propagate_pipeline a b numeric=mp_restore_float a b numeric.
Proof.
 intros a b numeric.
 unfold mp_propagate_pipeline,mp_restore_float,mp_restore_bits,mp_snan_bits,
 mp_merge_bits,mp_land,mp_lor,mp_bit_gt,mp_bit_eq,mp_mask_and,mp_float_merge,
 mp_nan_bits,mp_abs_bits,mp_quiet_clear,mp_quiet_bits.
 destruct(Z.ltb 2139095040(Z.land(bits_of_fp32 a)2147483647));
 destruct(Z.ltb 2139095040(Z.land(bits_of_fp32 b)2147483647));
 destruct(Z.eqb(Z.land(bits_of_fp32 a)4194304)0);
 destruct(Z.eqb(Z.land(bits_of_fp32 b)4194304)0);simpl;
 try reflexivity;rewrite mp_fp32_of_bits_of_fp32;reflexivity.
Qed.
