From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From AUXLib Require Import ListLib.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma full_bytes_Forall : forall A p n,
 UCharArray.full p n A |-- “ Forall(fun x=>0<=x<=255)A ”.
Proof.
 intro A;induction A as[|a A IH];intros p n.
 - apply derivable1s_coq_prop_r;constructor.
 - rewrite UCharArray.full_unfold.
   sep_apply_l_atomic(UCharArray.seg_to_full p 1 n A).
   unfold StoreUCharAsElement.storeA.
   prop_apply(store_uchar_range(p+0*sizeof(UCHAR))a). Intros_p Ha.
   prop_apply(IH(p+1*StoreUCharAsElement.sizeA)(n-1)). Intros_p Htail.
   apply derivable1s_coq_prop_r;constructor;[exact Ha|exact Htail].
Qed.
Lemma active_input_bounds : forall p vl A,0<=vl<=Zlength A ->
 UCharArray.seg p 0 vl(sublist 0 vl A)|--
 “ forall j,0<=j<vl ->0<=Znth j A 0<=255 ”.
Proof.
 intros p vl A Hvl.
 sep_apply_l_atomic(UCharArray.seg_to_full p 0 vl(sublist 0 vl A)).
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r.
 prop_apply(full_bytes_Forall(sublist 0 vl A)p vl). Intros_p Hbytes.
 apply derivable1s_coq_prop_r;intros j Hj.
 pose proof(proj1(@List.Forall_forall Z(fun x=>0<=x<=255)(sublist 0 vl A))Hbytes)as Hforall.
 assert(Hin:In(Znth j(sublist 0 vl A)0)(sublist 0 vl A)).
 { unfold Znth;apply nth_In;rewrite sublist_length by lia;lia. }
 specialize(Hforall _ Hin);rewrite Znth_sublist0 in Hforall by lia;exact Hforall.
Qed.
Print Assumptions full_bytes_Forall.
Print Assumptions active_input_bounds.
