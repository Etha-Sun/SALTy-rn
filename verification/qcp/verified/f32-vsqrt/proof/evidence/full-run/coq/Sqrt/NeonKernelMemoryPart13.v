From Coq Require Import ZArith Lia List Strings.String.
From Sqrt Require Import Borrowed KernelSupport NeonKernelMemorySupport neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque sqrt_arm sqrt_rvv sqrt_core sqrt_lane sqrt_active sqrt_read_at store_float undef_store_float FloatArray.full FloatArray.seg FloatArray.undef_full FloatArray.undef_seg.
Lemma retry_q4:forall x:Z,(4*x) ÷ 4=x. Proof. intro;replace(4*x)with(x*4)by ring;rewrite Z.quot_mul by lia;reflexivity. Qed.
Ltac retry_ground t := first[is_var t;fail 1|lazymatch t with ?f ?x => retry_ground f;retry_ground x|_=>idtac end].
Ltac retry_constants := repeat multimatch goal with |H:context[Z.land ?a ?b]|-_=>retry_ground a;retry_ground b;let v:=eval vm_compute in(Z.land a b)in progress(replace(Z.land a b)with v in * by reflexivity) |H:context[Z.quot ?a ?b]|-_=>retry_ground a;retry_ground b;let v:=eval vm_compute in(Z.quot a b)in progress(replace(Z.quot a b)with v in * by reflexivity)end.
Ltac retry_prepare := sqrt_kernel_prepare;rewrite ?retry_q4 in *;retry_constants;try solve[exfalso;congruence].
Ltac retry_split := lazymatch goal with |-?P |--?Q => multimatch Q with context[FloatArray.undef_full ?p ?m]=>multimatch P with context[FloatArray.undef_full p ?n]=>first[constr_eq n m;fail 1|let Hb:=fresh "Hb"in assert(Hb:0<=m<=n)by lia;let Hm:=fresh "Hm"in pose proof(FloatArray.undef_full_split_to_undef_full p m n Hb)as Hm;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hm;sep_apply Hm]end end end.
Ltac retry_finish := lazymatch goal with |- _ \/ _ => left|_=>idtac end;retry_prepare;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia|first[solve[sqrt_kernel_spatial]|retry_split;repeat multimatch goal with |- context[FloatArray.undef_full ?ptr ?n]=>progress ring_simplify ptr end;sqrt_kernel_spatial]]]|solve[retry_split;repeat multimatch goal with |- context[FloatArray.undef_full ?ptr ?n]=>progress ring_simplify ptr end;sqrt_kernel_spatial]|sqrt_kernel_spatial].
Ltac memory_frame := repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia|sqrt_kernel_spatial]]|sqrt_kernel_spatial].
Ltac memory_choose := lazymatch goal with |-?P |-- ?Q1 || ?Q2=>first[eapply derivable1_trans;[|apply derivable1_orp_intros1];memory_choose|eapply derivable1_trans;[|apply derivable1_orp_intros2];memory_choose]|_=>memory_frame end.
Ltac memory_prepare := lazymatch goal with |- _ \/ _=>left|_=>idtac end;retry_prepare;try solve[exfalso;lia|exfalso;congruence].
Module CheckedNeonKernelMemoryPart13.
Lemma proof_of_test_neon_entail_wit_8_1 : Sqrt.neon_unit_goal.test_neon_entail_wit_8_1.
Proof. unfold Sqrt.neon_unit_goal.test_neon_entail_wit_8_1. memory_prepare. memory_choose. Qed.

End CheckedNeonKernelMemoryPart13.
Print Assumptions CheckedNeonKernelMemoryPart13.proof_of_test_neon_entail_wit_8_1.
