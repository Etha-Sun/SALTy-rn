From Coq Require Import ZArith Bool List Lia.
From SimpleC.SL Require Export Mem SeparationLogic FloatLib IntLib.
From Flocq.IEEE754 Require Import Binary.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

(* Ordered IEEE comparison. NaN compares false; both signed zeros compare equal.
   The program observes value bits and indices, not floating exception flags. *)
Definition ap_gt_mask (a b:fp32):Z :=
 match fp32_compare a b with Some Datatypes.Gt=>4294967295 | _=>0 end.
Definition ap_bool_mask(m:Z):Prop:=m=0 \/ m=4294967295.
Definition ap_same_bits(a b:fp32):Prop:=a=b.
Definition ap_u32(x:Z):Z:=unsigned_last_nbits x 32.
Definition ap_vl(n:Z):Z:=Z.min n 32.
(* These selectors are used only for the all-zero/all-one masks from ordered
   comparison. The public intrinsic contract must retain that mask premise. *)
Definition ap_select_f32(m:Z)(a b:fp32):fp32:=if Z.eqb m 4294967295 then a else b.
Definition ap_select_u32(m a b:Z):Z:=if Z.eqb m 4294967295 then a else b.
Definition ap_add_u32(a b:Z):Z:=ap_u32(a+b).
Definition ap_step(old candidate:fp32*Z):fp32*Z:=
 if Z.eqb(ap_gt_mask(fst candidate)(fst old))4294967295
 then(fst candidate,ap_u32(snd candidate)) else old.
Fixpoint ap_scan(values:list(fp32*Z))(old:fp32*Z):fp32*Z:=
 match values with []=>old |v::rest=>ap_scan rest(ap_step old v)end.

Lemma ap_gt_mask_cases:forall a b,ap_bool_mask(ap_gt_mask a b).
Proof.
 intros;unfold ap_bool_mask,ap_gt_mask;
 destruct(fp32_compare a b)as[c|];[destruct c|];auto.
Qed.
Lemma ap_gt_mask_correct:forall a b,
 ap_gt_mask a b=4294967295 <-> fp32_gt a b.
Proof.
 intros;unfold ap_gt_mask,fp32_gt;
 destruct(fp32_compare a b)as[c|];[destruct c|];simpl;
 split;intro H;try discriminate;reflexivity.
Qed.
Lemma ap_gt_mask_self:forall a,ap_gt_mask a a=0.
Proof.
 intro a;pose proof(@Binary.Bcompare_swap 24 128 a a)as H.
 unfold ap_gt_mask,fp32_compare in *.
 destruct(Binary.Bcompare 24 128 a a)as[c|];[destruct c|];
 simpl in *;try reflexivity;discriminate.
Qed.
Lemma ap_step_same_value:forall v old_index new_index,
 ap_step(v,old_index)(v,new_index)=(v,old_index).
Proof. intros;unfold ap_step;simpl;rewrite ap_gt_mask_self;reflexivity. Qed.
Lemma ap_scan_app:forall left right old,
 ap_scan(left++right)old=ap_scan right(ap_scan left old).
Proof. induction left;intros;simpl;[reflexivity|apply IHleft]. Qed.
Lemma ap_scan_uniform:forall indices v old_index,
 ap_scan(map(fun i=>(v,i))indices)(v,old_index)=(v,old_index).
Proof.
 induction indices;intros;simpl;[reflexivity|].
 rewrite ap_step_same_value;apply IHindices.
Qed.
Print Assumptions ap_gt_mask_cases.
Print Assumptions ap_gt_mask_correct.
Print Assumptions ap_gt_mask_self.
Print Assumptions ap_step_same_value.
Print Assumptions ap_scan_app.
Print Assumptions ap_scan_uniform.
