From Coq Require Import ZArith Bool List Lia.
From X32Transpose Require Export InputMemory.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* The list enumerates distinct owned addresses once. Pixel write windows may
   overlap or repeat; None remains possibly-uninitialized storage. *)
Definition XTState(A:Type):Type:=Z->option A.
Definition xt_put{A:Type}(O:XTState A)(p:Z)(v:A):XTState A:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint xt_cells{A:Type}(cell:Z->option A->Assertion)(W:list Z)(O:XTState A):Assertion:=
 match W with []=>emp|p::rest=>cell p(O p)**xt_cells cell rest O end.
Definition XTOutput:=XTState Z.
Definition XTIndex:=XTState Z.
Definition xt_output_cell(p:Z)(v:option Z):Assertion:=
 match v with Some x=>p # UInt |-> x|None=>p # UInt |->_ end.
Definition xt_index_cell(p:Z)(v:option Z):Assertion:=
 match v with Some x=>p # UInt |-> x|None=>p # UInt |->_ end.
Definition xt_output(W:list Z)(O:XTOutput):Assertion:=xt_cells xt_output_cell W O.
Definition xt_index(W:list Z)(O:XTIndex):Assertion:=xt_cells xt_index_cell W O.
Definition xt_output_put(O:XTOutput)(p:Z)(v:Z):XTOutput:=xt_put O p v.
Definition xt_index_put(O:XTIndex)(p v:Z):XTIndex:=xt_put O p v.
Definition xt_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition xt_output_loaded(O:XTOutput)(p:Z)(v:Z):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition xt_index_loaded(O:XTIndex)(p v:Z):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition xt_output_loaded_lane(O:XTOutput)(p j:Z)(v:Z):Prop:=
 xt_output_loaded O(p+4*j)v.
Definition xt_index_loaded_lane(O:XTIndex)(p j v:Z):Prop:=
 xt_index_loaded O(p+4*j)v.

Lemma xt_put_same:forall A(O:XTState A)p v,xt_put O p v p=Some v.
Proof. intros;unfold xt_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma xt_put_other:forall A(O:XTState A)p q v,p<>q->xt_put O p v q=O q.
Proof. intros;unfold xt_put;destruct(Z.eqb_spec q p);[congruence|reflexivity]. Qed.
Lemma xt_cells_put_away:forall A(cell:Z->option A->Assertion)W O p v,
 ~In p W->xt_cells cell W(xt_put O p v)=xt_cells cell W O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p v H;cbn[xt_cells];[reflexivity|].
 rewrite xt_put_other by(intro E;apply H;left;congruence).
 rewrite IH by(intro Hbad;apply H;right;exact Hbad);reflexivity.
Qed.
Lemma xt_cells_pop:forall A(cell:Z->option A->Assertion)W O p,
 NoDup W->In p W->
 xt_cells cell W O --||--cell p(O p)**xt_cells cell(remove Z.eq_dec p W)O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p Hnodup Hin.
 - contradiction.
 - inversion Hnodup as[|q' W' Hq Htail];subst q' W'.
   cbn[xt_cells remove].
   destruct(Z.eq_dec p q)as[Heq|Hneq].
   + subst p;rewrite notin_remove by exact Hq;split;entailer!.
   + assert(HinW:In p W)by(destruct Hin;[congruence|assumption]).
     specialize(IH O p Htail HinW);destruct IH as[Hforward Hback].
     cbn[xt_cells];split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma xt_cells_writeback:forall A(cell:Z->option A->Assertion)W O p v,
 NoDup W->In p W->
 cell p(Some v)**xt_cells cell(remove Z.eq_dec p W)O |--
 xt_cells cell W(xt_put O p v).
Proof.
 intros A cell W O p v Hnd Hin.
 pose proof(proj2(xt_cells_pop A cell W(xt_put O p v)p Hnd Hin))as Hback.
 rewrite xt_put_same in Hback.
 rewrite xt_cells_put_away in Hback.
 - exact Hback.
 - intro Hbad;apply in_remove in Hbad;tauto.
Qed.
Lemma xt_output_writeback:forall W O p v,NoDup W->In p W->
 p # UInt |-> v**xt_output(remove Z.eq_dec p W)O |--
 xt_output W(xt_output_put O p v).
Proof. intros;exact(xt_cells_writeback Z xt_output_cell W O p v H H0). Qed.
Lemma xt_index_writeback:forall W O p v,NoDup W->In p W->
 p # UInt |-> v**xt_index(remove Z.eq_dec p W)O |--
 xt_index W(xt_index_put O p v).
Proof. intros;exact(xt_cells_writeback Z xt_index_cell W O p v H H0). Qed.
Lemma xt_output_forget_cell:forall p v,xt_output_cell p v |--p # UInt |->_ .
Proof. intros p[v|];cbn[xt_output_cell];[apply store_uint_undef_store_uint|entailer!]. Qed.
Lemma xt_index_forget_cell:forall p v,xt_index_cell p v |--p # UInt |->_ .
Proof. intros p[v|];cbn[xt_index_cell];[apply store_uint_undef_store_uint|entailer!]. Qed.
Lemma xt_loaded_initialized:forall O p x v,O p=Some x->xt_output_loaded O p v->v=x.
Proof. unfold xt_output_loaded;intros;rewrite H in H0;exact H0. Qed.
Print Assumptions xt_put_same.
Print Assumptions xt_put_other.
Print Assumptions xt_cells_put_away.
Print Assumptions xt_cells_pop.
Print Assumptions xt_cells_writeback.
Print Assumptions xt_output_writeback.
Print Assumptions xt_index_writeback.
Print Assumptions xt_output_forget_cell.
Print Assumptions xt_index_forget_cell.
Print Assumptions xt_loaded_initialized.
