From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Integers.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qu8Add Require Export NeonLaneFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qu_neon_mul_range_all : forall a b,-2147483648<=qu_neon_mul a b<=2147483647.
Proof. intros;unfold qu_neon_mul;apply qu_s32_range. Qed.
Lemma qu_neon_mla_range_all : forall a b c,-2147483648<=qu_neon_mla a b c<=2147483647.
Proof. intros;unfold qu_neon_mla;apply qu_s32_range. Qed.
Lemma qu_neon_shift_range_all : forall a b,-2147483648<=qu_neon_shift a b<=2147483647.
Proof. intros;unfold qu_neon_shift;apply qu_s32_range. Qed.
Lemma qu_neon_add16_range_all : forall a b,-32768<=qu_neon_add16 a b<=32767.
Proof. intros;unfold qu_neon_add16;apply qu_sat16_range. Qed.
Lemma qu_udiff_range_all : forall a b,0<=qu_udiff a b<=65535.
Proof. intros;unfold qu_udiff;apply qu_u16_range. Qed.
Lemma qu_store_array_values : forall xs p lo hi,
 store_array_rec StoreUCharAsElement.storeA p lo hi xs |-- “ Forall (fun x:Z=>0<=x<=255) xs ”.
Proof.
 induction xs as[|x xs IH];intros;cbn[store_array_rec].
 - unfold derivable1,coq_prop;intros;constructor.
 - unfold StoreUCharAsElement.storeA.
   prop_apply(store_uchar_range(p+lo*sizeof(UCHAR))x).
   Intros_p Hx.
   prop_apply(IH p(lo+1)hi).
   Intros_p Hxs.
   change Byte.max_unsigned with 255 in Hx.
   entailer!;constructor;assumption.
Qed.
Lemma qu_full_values : forall p n xs,UCharArray.full p n xs |-- “ Forall (fun x:Z=>0<=x<=255) xs ”.
Proof. intros;unfold UCharArray.full,store_array;apply qu_store_array_values. Qed.
Lemma qu_Forall_Znth_range : forall xs i d,
 Forall (fun x:Z=>0<=x<=255) xs -> 0<=i<Zlength xs -> 0<=Znth i xs d<=255.
Proof. intros xs i d HF Hi;unfold Znth;apply (proj1(@List.Forall_nth Z (fun x:Z=>0<=x<=255) xs)HF (Z.to_nat i)d);rewrite Zlength_correct in Hi;lia. Qed.
