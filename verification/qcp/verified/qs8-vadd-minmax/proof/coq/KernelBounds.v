From Coq Require Import ZArith Lia List.
From compcert.lib Require Import Integers.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qs8Add Require Export NeonLaneFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_neon_mul_range_all : forall a b,-2147483648<=qa_neon_mul a b<=2147483647.
Proof. intros;unfold qa_neon_mul;apply qa_s32_range. Qed.
Lemma qa_neon_mla_range_all : forall a b c,-2147483648<=qa_neon_mla a b c<=2147483647.
Proof. intros;unfold qa_neon_mla;apply qa_s32_range. Qed.
Lemma qa_neon_shift_range_all : forall a b,-2147483648<=qa_neon_shift a b<=2147483647.
Proof. intros;unfold qa_neon_shift;apply qa_s32_range. Qed.
Lemma qa_neon_add16_range_all : forall a b,-32768<=qa_neon_add16 a b<=32767.
Proof. intros;unfold qa_neon_add16;apply qa_sat16_range. Qed.
Lemma qa_store_array_values : forall xs p lo hi,
 store_array_rec StoreCharAsElement.storeA p lo hi xs |-- “ Forall (fun x:Z=>-128<=x<=127) xs ”.
Proof.
 induction xs as[|x xs IH];intros;cbn[store_array_rec].
 - unfold derivable1,coq_prop;intros;constructor.
 - unfold StoreCharAsElement.storeA.
   prop_apply(store_char_range(p+lo*sizeof(CHAR))x).
   Intros_p Hx.
   prop_apply(IH p(lo+1)hi).
   Intros_p Hxs.
   change Byte.min_signed with(-128)in Hx;change Byte.max_signed with 127 in Hx.
   entailer!;constructor;assumption.
Qed.
Lemma qa_full_values : forall p n xs,CharArray.full p n xs |-- “ Forall (fun x:Z=>-128<=x<=127) xs ”.
Proof. intros;unfold CharArray.full,store_array;apply qa_store_array_values. Qed.
Lemma qa_Forall_Znth_range : forall xs i d,
 Forall (fun x:Z=>-128<=x<=127) xs -> 0<=i<Zlength xs -> -128<=Znth i xs d<=127.
Proof. intros xs i d HF Hi;unfold Znth;apply (proj1(@List.Forall_nth Z (fun x:Z=>-128<=x<=127) xs)HF (Z.to_nat i)d);rewrite Zlength_correct in Hi;lia. Qed.
