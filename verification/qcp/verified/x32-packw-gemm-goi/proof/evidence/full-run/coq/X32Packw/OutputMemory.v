From Coq Require Import ZArith Bool List Lia.
From X32Packw Require Export InputMemory.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* The list enumerates distinct owned addresses once. Pixel write windows may
   overlap or repeat; None remains possibly-uninitialized storage. *)
Definition PWState(A:Type):Type:=Z->option A.
Definition pw_put{A:Type}(O:PWState A)(p:Z)(v:A):PWState A:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint pw_cells{A:Type}(cell:Z->option A->Assertion)(W:list Z)(O:PWState A):Assertion:=
 match W with []=>emp|p::rest=>cell p(O p)**pw_cells cell rest O end.
Definition PWOutput:=PWState Z.
Definition PWIndex:=PWState Z.
Definition pw_output_cell(p:Z)(v:option Z):Assertion:=
 match v with Some x=>p # UInt |-> x|None=>p # UInt |->_ end.
Definition pw_index_cell(p:Z)(v:option Z):Assertion:=
 match v with Some x=>p # UInt |-> x|None=>p # UInt |->_ end.
Definition pw_output(W:list Z)(O:PWOutput):Assertion:=pw_cells pw_output_cell W O.
Definition pw_index(W:list Z)(O:PWIndex):Assertion:=pw_cells pw_index_cell W O.
Definition pw_output_put(O:PWOutput)(p:Z)(v:Z):PWOutput:=pw_put O p v.
Definition pw_index_put(O:PWIndex)(p v:Z):PWIndex:=pw_put O p v.
Definition pw_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition pw_output_loaded(O:PWOutput)(p:Z)(v:Z):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition pw_index_loaded(O:PWIndex)(p v:Z):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition pw_output_loaded_lane(O:PWOutput)(p j:Z)(v:Z):Prop:=
 pw_output_loaded O(p+4*j)v.
Definition pw_index_loaded_lane(O:PWIndex)(p j v:Z):Prop:=
 pw_index_loaded O(p+4*j)v.

Lemma pw_put_same:forall A(O:PWState A)p v,pw_put O p v p=Some v.
Proof. intros;unfold pw_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma pw_put_other:forall A(O:PWState A)p q v,p<>q->pw_put O p v q=O q.
Proof. intros;unfold pw_put;destruct(Z.eqb_spec q p);[congruence|reflexivity]. Qed.
Lemma pw_cells_put_away:forall A(cell:Z->option A->Assertion)W O p v,
 ~In p W->pw_cells cell W(pw_put O p v)=pw_cells cell W O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p v H;cbn[pw_cells];[reflexivity|].
 rewrite pw_put_other by(intro E;apply H;left;congruence).
 rewrite IH by(intro Hbad;apply H;right;exact Hbad);reflexivity.
Qed.
Lemma pw_cells_pop:forall A(cell:Z->option A->Assertion)W O p,
 NoDup W->In p W->
 pw_cells cell W O --||--cell p(O p)**pw_cells cell(remove Z.eq_dec p W)O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p Hnodup Hin.
 - contradiction.
 - inversion Hnodup as[|q' W' Hq Htail];subst q' W'.
   cbn[pw_cells remove].
   destruct(Z.eq_dec p q)as[Heq|Hneq].
   + subst p;rewrite notin_remove by exact Hq;split;entailer!.
   + assert(HinW:In p W)by(destruct Hin;[congruence|assumption]).
     specialize(IH O p Htail HinW);destruct IH as[Hforward Hback].
     cbn[pw_cells];split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma pw_cells_writeback:forall A(cell:Z->option A->Assertion)W O p v,
 NoDup W->In p W->
 cell p(Some v)**pw_cells cell(remove Z.eq_dec p W)O |--
 pw_cells cell W(pw_put O p v).
Proof.
 intros A cell W O p v Hnd Hin.
 pose proof(proj2(pw_cells_pop A cell W(pw_put O p v)p Hnd Hin))as Hback.
 rewrite pw_put_same in Hback.
 rewrite pw_cells_put_away in Hback.
 - exact Hback.
 - intro Hbad;apply in_remove in Hbad;tauto.
Qed.
Lemma pw_output_writeback:forall W O p v,NoDup W->In p W->
 p # UInt |-> v**pw_output(remove Z.eq_dec p W)O |--
 pw_output W(pw_output_put O p v).
Proof. intros;exact(pw_cells_writeback Z pw_output_cell W O p v H H0). Qed.
Lemma pw_index_writeback:forall W O p v,NoDup W->In p W->
 p # UInt |-> v**pw_index(remove Z.eq_dec p W)O |--
 pw_index W(pw_index_put O p v).
Proof. intros;exact(pw_cells_writeback Z pw_index_cell W O p v H H0). Qed.
Lemma pw_output_forget_cell:forall p v,pw_output_cell p v |--p # UInt |->_ .
Proof. intros p[v|];cbn[pw_output_cell];[apply store_uint_undef_store_uint|entailer!]. Qed.
Lemma pw_index_forget_cell:forall p v,pw_index_cell p v |--p # UInt |->_ .
Proof. intros p[v|];cbn[pw_index_cell];[apply store_uint_undef_store_uint|entailer!]. Qed.
Lemma pw_loaded_initialized:forall O p x v,O p=Some x->pw_output_loaded O p v->v=x.
Proof. unfold pw_output_loaded;intros;rewrite H in H0;exact H0. Qed.
Print Assumptions pw_put_same.
Print Assumptions pw_put_other.
Print Assumptions pw_cells_put_away.
Print Assumptions pw_cells_pop.
Print Assumptions pw_cells_writeback.
Print Assumptions pw_output_writeback.
Print Assumptions pw_index_writeback.
Print Assumptions pw_output_forget_cell.
Print Assumptions pw_index_forget_cell.
Print Assumptions pw_loaded_initialized.
