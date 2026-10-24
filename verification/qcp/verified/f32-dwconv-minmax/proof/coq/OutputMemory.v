From Coq Require Import ZArith Bool List Lia.
From Dwconv Require Export MemoryFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* The list enumerates distinct owned addresses once. Pixel write windows may
   overlap or repeat; None remains possibly-uninitialized storage. *)
Definition DwState(A:Type):Type:=Z->option A.
Definition dw_put{A:Type}(O:DwState A)(p:Z)(v:A):DwState A:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint dw_cells{A:Type}(cell:Z->option A->Assertion)(W:list Z)(O:DwState A):Assertion:=
 match W with []=>emp|p::rest=>cell p(O p)**dw_cells cell rest O end.
Definition DwOutput:=DwState fp32.
Definition dw_output_cell(p:Z)(v:option fp32):Assertion:=
 match v with Some x=>p # Float |-> x|None=>p # Float |->_ end.
Definition dw_output(W:list Z)(O:DwOutput):Assertion:=dw_cells dw_output_cell W O.
Definition dw_output_put(O:DwOutput)(p:Z)(v:fp32):DwOutput:=dw_put O p v.
Definition dw_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition dw_output_loaded(O:DwOutput)(p:Z)(v:fp32):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition dw_output_loaded_lane(O:DwOutput)(p j:Z)(v:fp32):Prop:=
 dw_output_loaded O(p+4*j)v.

Lemma dw_put_same:forall A(O:DwState A)p v,dw_put O p v p=Some v.
Proof. intros;unfold dw_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma dw_put_other:forall A(O:DwState A)p q v,p<>q->dw_put O p v q=O q.
Proof. intros;unfold dw_put;destruct(Z.eqb_spec q p);[congruence|reflexivity]. Qed.
Lemma dw_cells_put_away:forall A(cell:Z->option A->Assertion)W O p v,
 ~In p W->dw_cells cell W(dw_put O p v)=dw_cells cell W O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p v H;cbn[dw_cells];[reflexivity|].
 rewrite dw_put_other by(intro E;apply H;left;congruence).
 rewrite IH by(intro Hbad;apply H;right;exact Hbad);reflexivity.
Qed.
Lemma dw_cells_pop:forall A(cell:Z->option A->Assertion)W O p,
 NoDup W->In p W->
 dw_cells cell W O --||--cell p(O p)**dw_cells cell(remove Z.eq_dec p W)O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p Hnodup Hin.
 - contradiction.
 - inversion Hnodup as[|q' W' Hq Htail];subst q' W'.
   cbn[dw_cells remove].
   destruct(Z.eq_dec p q)as[Heq|Hneq].
   + subst p;rewrite notin_remove by exact Hq;split;entailer!.
   + assert(HinW:In p W)by(destruct Hin;[congruence|assumption]).
     specialize(IH O p Htail HinW);destruct IH as[Hforward Hback].
     cbn[dw_cells];split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma dw_cells_writeback:forall A(cell:Z->option A->Assertion)W O p v,
 NoDup W->In p W->
 cell p(Some v)**dw_cells cell(remove Z.eq_dec p W)O |--
 dw_cells cell W(dw_put O p v).
Proof.
 intros A cell W O p v Hnd Hin.
 pose proof(proj2(dw_cells_pop A cell W(dw_put O p v)p Hnd Hin))as Hback.
 rewrite dw_put_same in Hback.
 rewrite dw_cells_put_away in Hback.
 - exact Hback.
 - intro Hbad;apply in_remove in Hbad;tauto.
Qed.
Lemma dw_output_writeback:forall W O p v,NoDup W->In p W->
 p # Float |-> v**dw_output(remove Z.eq_dec p W)O |--
 dw_output W(dw_output_put O p v).
Proof. intros;exact(dw_cells_writeback fp32 dw_output_cell W O p v H H0). Qed.
Lemma dw_output_forget_cell:forall p v,dw_output_cell p v |--p # Float |->_ .
Proof. intros p[v|];cbn[dw_output_cell];[apply store_float_undef_store_float|entailer!]. Qed.
Lemma dw_loaded_initialized:forall O p x v,O p=Some x->dw_output_loaded O p v->v=x.
Proof. unfold dw_output_loaded;intros;rewrite H in H0;exact H0. Qed.
Print Assumptions dw_put_same.
Print Assumptions dw_put_other.
Print Assumptions dw_cells_put_away.
Print Assumptions dw_cells_pop.
Print Assumptions dw_cells_writeback.
Print Assumptions dw_output_writeback.
Print Assumptions dw_output_forget_cell.
Print Assumptions dw_loaded_initialized.
