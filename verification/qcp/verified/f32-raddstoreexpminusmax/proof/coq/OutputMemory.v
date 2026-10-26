From Coq Require Import ZArith Bool List Lia.
From ExpMinusMax Require Export MemoryFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* The list enumerates distinct owned addresses once. Pixel write windows may
   overlap or repeat; None remains possibly-uninitialized storage. *)
Definition EMState(A:Type):Type:=Z->option A.
Definition em_put{A:Type}(O:EMState A)(p:Z)(v:A):EMState A:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint em_cells{A:Type}(cell:Z->option A->Assertion)(W:list Z)(O:EMState A):Assertion:=
 match W with []=>emp|p::rest=>cell p(O p)**em_cells cell rest O end.
Definition EMOutput:=EMState fp32.
Definition EMIndex:=EMState Z.
Definition em_output_cell(p:Z)(v:option fp32):Assertion:=
 match v with Some x=>p # Float |-> x|None=>p # Float |->_ end.
Definition em_index_cell(p:Z)(v:option Z):Assertion:=
 match v with Some x=>p # UInt |-> x|None=>p # UInt |->_ end.
Definition em_output(W:list Z)(O:EMOutput):Assertion:=em_cells em_output_cell W O.
Definition em_index(W:list Z)(O:EMIndex):Assertion:=em_cells em_index_cell W O.
Definition em_output_put(O:EMOutput)(p:Z)(v:fp32):EMOutput:=em_put O p v.
Definition em_index_put(O:EMIndex)(p v:Z):EMIndex:=em_put O p v.
Definition em_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition em_output_loaded(O:EMOutput)(p:Z)(v:fp32):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition em_index_loaded(O:EMIndex)(p v:Z):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition em_output_loaded_lane(O:EMOutput)(p j:Z)(v:fp32):Prop:=
 em_output_loaded O(p+4*j)v.
Definition em_index_loaded_lane(O:EMIndex)(p j v:Z):Prop:=
 em_index_loaded O(p+4*j)v.

Lemma em_put_same:forall A(O:EMState A)p v,em_put O p v p=Some v.
Proof. intros;unfold em_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma em_put_other:forall A(O:EMState A)p q v,p<>q->em_put O p v q=O q.
Proof. intros;unfold em_put;destruct(Z.eqb_spec q p);[congruence|reflexivity]. Qed.
Lemma em_cells_put_away:forall A(cell:Z->option A->Assertion)W O p v,
 ~In p W->em_cells cell W(em_put O p v)=em_cells cell W O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p v H;cbn[em_cells];[reflexivity|].
 rewrite em_put_other by(intro E;apply H;left;congruence).
 rewrite IH by(intro Hbad;apply H;right;exact Hbad);reflexivity.
Qed.
Lemma em_cells_pop:forall A(cell:Z->option A->Assertion)W O p,
 NoDup W->In p W->
 em_cells cell W O --||--cell p(O p)**em_cells cell(remove Z.eq_dec p W)O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p Hnodup Hin.
 - contradiction.
 - inversion Hnodup as[|q' W' Hq Htail];subst q' W'.
   cbn[em_cells remove].
   destruct(Z.eq_dec p q)as[Heq|Hneq].
   + subst p;rewrite notin_remove by exact Hq;split;entailer!.
   + assert(HinW:In p W)by(destruct Hin;[congruence|assumption]).
     specialize(IH O p Htail HinW);destruct IH as[Hforward Hback].
     cbn[em_cells];split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma em_cells_writeback:forall A(cell:Z->option A->Assertion)W O p v,
 NoDup W->In p W->
 cell p(Some v)**em_cells cell(remove Z.eq_dec p W)O |--
 em_cells cell W(em_put O p v).
Proof.
 intros A cell W O p v Hnd Hin.
 pose proof(proj2(em_cells_pop A cell W(em_put O p v)p Hnd Hin))as Hback.
 rewrite em_put_same in Hback.
 rewrite em_cells_put_away in Hback.
 - exact Hback.
 - intro Hbad;apply in_remove in Hbad;tauto.
Qed.
Lemma em_output_writeback:forall W O p v,NoDup W->In p W->
 p # Float |-> v**em_output(remove Z.eq_dec p W)O |--
 em_output W(em_output_put O p v).
Proof. intros;exact(em_cells_writeback fp32 em_output_cell W O p v H H0). Qed.
Lemma em_index_writeback:forall W O p v,NoDup W->In p W->
 p # UInt |-> v**em_index(remove Z.eq_dec p W)O |--
 em_index W(em_index_put O p v).
Proof. intros;exact(em_cells_writeback Z em_index_cell W O p v H H0). Qed.
Lemma em_output_forget_cell:forall p v,em_output_cell p v |--p # Float |->_ .
Proof. intros p[v|];cbn[em_output_cell];[apply store_float_undef_store_float|entailer!]. Qed.
Lemma em_index_forget_cell:forall p v,em_index_cell p v |--p # UInt |->_ .
Proof. intros p[v|];cbn[em_index_cell];[apply store_uint_undef_store_uint|entailer!]. Qed.
Lemma em_loaded_initialized:forall O p x v,O p=Some x->em_output_loaded O p v->v=x.
Proof. unfold em_output_loaded;intros;rewrite H in H0;exact H0. Qed.
Print Assumptions em_put_same.
Print Assumptions em_put_other.
Print Assumptions em_cells_put_away.
Print Assumptions em_cells_pop.
Print Assumptions em_cells_writeback.
Print Assumptions em_output_writeback.
Print Assumptions em_index_writeback.
Print Assumptions em_output_forget_cell.
Print Assumptions em_index_forget_cell.
Print Assumptions em_loaded_initialized.
