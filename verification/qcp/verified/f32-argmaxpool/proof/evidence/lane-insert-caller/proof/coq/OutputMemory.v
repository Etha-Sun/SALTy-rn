From Coq Require Import ZArith Bool List Lia.
From ArgmaxPool Require Export MemoryFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* The list enumerates distinct owned addresses once. Pixel write windows may
   overlap or repeat; None remains possibly-uninitialized storage. *)
Definition APState(A:Type):Type:=Z->option A.
Definition ap_put{A:Type}(O:APState A)(p:Z)(v:A):APState A:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint ap_cells{A:Type}(cell:Z->option A->Assertion)(W:list Z)(O:APState A):Assertion:=
 match W with []=>emp|p::rest=>cell p(O p)**ap_cells cell rest O end.
Definition APOutput:=APState fp32.
Definition APIndex:=APState Z.
Definition ap_output_cell(p:Z)(v:option fp32):Assertion:=
 match v with Some x=>p # Float |-> x|None=>p # Float |->_ end.
Definition ap_index_cell(p:Z)(v:option Z):Assertion:=
 match v with Some x=>p # UInt |-> x|None=>p # UInt |->_ end.
Definition ap_output(W:list Z)(O:APOutput):Assertion:=ap_cells ap_output_cell W O.
Definition ap_index(W:list Z)(O:APIndex):Assertion:=ap_cells ap_index_cell W O.
Definition ap_output_put(O:APOutput)(p:Z)(v:fp32):APOutput:=ap_put O p v.
Definition ap_index_put(O:APIndex)(p v:Z):APIndex:=ap_put O p v.
Definition ap_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition ap_output_loaded(O:APOutput)(p:Z)(v:fp32):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition ap_index_loaded(O:APIndex)(p v:Z):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition ap_output_loaded_lane(O:APOutput)(p j:Z)(v:fp32):Prop:=
 ap_output_loaded O(p+4*j)v.
Definition ap_index_loaded_lane(O:APIndex)(p j v:Z):Prop:=
 ap_index_loaded O(p+4*j)v.

Lemma ap_put_same:forall A(O:APState A)p v,ap_put O p v p=Some v.
Proof. intros;unfold ap_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma ap_put_other:forall A(O:APState A)p q v,p<>q->ap_put O p v q=O q.
Proof. intros;unfold ap_put;destruct(Z.eqb_spec q p);[congruence|reflexivity]. Qed.
Lemma ap_cells_put_away:forall A(cell:Z->option A->Assertion)W O p v,
 ~In p W->ap_cells cell W(ap_put O p v)=ap_cells cell W O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p v H;cbn[ap_cells];[reflexivity|].
 rewrite ap_put_other by(intro E;apply H;left;congruence).
 rewrite IH by(intro Hbad;apply H;right;exact Hbad);reflexivity.
Qed.
Lemma ap_cells_pop:forall A(cell:Z->option A->Assertion)W O p,
 NoDup W->In p W->
 ap_cells cell W O --||--cell p(O p)**ap_cells cell(remove Z.eq_dec p W)O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p Hnodup Hin.
 - contradiction.
 - inversion Hnodup as[|q' W' Hq Htail];subst q' W'.
   cbn[ap_cells remove].
   destruct(Z.eq_dec p q)as[Heq|Hneq].
   + subst p;rewrite notin_remove by exact Hq;split;entailer!.
   + assert(HinW:In p W)by(destruct Hin;[congruence|assumption]).
     specialize(IH O p Htail HinW);destruct IH as[Hforward Hback].
     cbn[ap_cells];split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma ap_cells_writeback:forall A(cell:Z->option A->Assertion)W O p v,
 NoDup W->In p W->
 cell p(Some v)**ap_cells cell(remove Z.eq_dec p W)O |--
 ap_cells cell W(ap_put O p v).
Proof.
 intros A cell W O p v Hnd Hin.
 pose proof(proj2(ap_cells_pop A cell W(ap_put O p v)p Hnd Hin))as Hback.
 rewrite ap_put_same in Hback.
 rewrite ap_cells_put_away in Hback.
 - exact Hback.
 - intro Hbad;apply in_remove in Hbad;tauto.
Qed.
Lemma ap_output_writeback:forall W O p v,NoDup W->In p W->
 p # Float |-> v**ap_output(remove Z.eq_dec p W)O |--
 ap_output W(ap_output_put O p v).
Proof. intros;exact(ap_cells_writeback fp32 ap_output_cell W O p v H H0). Qed.
Lemma ap_index_writeback:forall W O p v,NoDup W->In p W->
 p # UInt |-> v**ap_index(remove Z.eq_dec p W)O |--
 ap_index W(ap_index_put O p v).
Proof. intros;exact(ap_cells_writeback Z ap_index_cell W O p v H H0). Qed.
Lemma ap_output_forget_cell:forall p v,ap_output_cell p v |--p # Float |->_ .
Proof. intros p[v|];cbn[ap_output_cell];[apply store_float_undef_store_float|entailer!]. Qed.
Lemma ap_index_forget_cell:forall p v,ap_index_cell p v |--p # UInt |->_ .
Proof. intros p[v|];cbn[ap_index_cell];[apply store_uint_undef_store_uint|entailer!]. Qed.
Lemma ap_loaded_initialized:forall O p x v,O p=Some x->ap_output_loaded O p v->v=x.
Proof. unfold ap_output_loaded;intros;rewrite H in H0;exact H0. Qed.
Print Assumptions ap_put_same.
Print Assumptions ap_put_other.
Print Assumptions ap_cells_put_away.
Print Assumptions ap_cells_pop.
Print Assumptions ap_cells_writeback.
Print Assumptions ap_output_writeback.
Print Assumptions ap_index_writeback.
Print Assumptions ap_output_forget_cell.
Print Assumptions ap_index_forget_cell.
Print Assumptions ap_loaded_initialized.
