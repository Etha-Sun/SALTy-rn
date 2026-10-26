From Coq Require Import ZArith Bool List Lia.
From HwcConv Require Export MemoryFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

(* The list enumerates distinct owned addresses once. Pixel write windows may
   overlap or repeat; None remains possibly-uninitialized storage. *)
Definition HwcState(A:Type):Type:=Z->option A.
Definition hc_put{A:Type}(O:HwcState A)(p:Z)(v:A):HwcState A:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint hc_cells{A:Type}(cell:Z->option A->Assertion)(W:list Z)(O:HwcState A):Assertion:=
 match W with []=>emp|p::rest=>cell p(O p)**hc_cells cell rest O end.
Definition HwcOutput:=HwcState fp32.
Definition hc_output_cell(p:Z)(v:option fp32):Assertion:=
 match v with Some x=>p # Float |-> x|None=>p # Float |->_ end.
Definition hc_output(W:list Z)(O:HwcOutput):Assertion:=hc_cells hc_output_cell W O.
Definition hc_output_put(O:HwcOutput)(p:Z)(v:fp32):HwcOutput:=hc_put O p v.
Definition hc_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition hc_output_loaded(O:HwcOutput)(p:Z)(v:fp32):Prop:=
 match O p with Some x=>v=x|None=>True end.
Definition hc_output_loaded_lane(O:HwcOutput)(p j:Z)(v:fp32):Prop:=
 hc_output_loaded O(p+4*j)v.

Lemma hc_put_same:forall A(O:HwcState A)p v,hc_put O p v p=Some v.
Proof. intros;unfold hc_put;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma hc_put_other:forall A(O:HwcState A)p q v,p<>q->hc_put O p v q=O q.
Proof. intros;unfold hc_put;destruct(Z.eqb_spec q p);[congruence|reflexivity]. Qed.
Lemma hc_cells_put_away:forall A(cell:Z->option A->Assertion)W O p v,
 ~In p W->hc_cells cell W(hc_put O p v)=hc_cells cell W O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p v H;cbn[hc_cells];[reflexivity|].
 rewrite hc_put_other by(intro E;apply H;left;congruence).
 rewrite IH by(intro Hbad;apply H;right;exact Hbad);reflexivity.
Qed.
Lemma hc_cells_pop:forall A(cell:Z->option A->Assertion)W O p,
 NoDup W->In p W->
 hc_cells cell W O --||--cell p(O p)**hc_cells cell(remove Z.eq_dec p W)O.
Proof.
 intros A cell W;induction W as[|q W IH];intros O p Hnodup Hin.
 - contradiction.
 - inversion Hnodup as[|q' W' Hq Htail];subst q' W'.
   cbn[hc_cells remove].
   destruct(Z.eq_dec p q)as[Heq|Hneq].
   + subst p;rewrite notin_remove by exact Hq;split;entailer!.
   + assert(HinW:In p W)by(destruct Hin;[congruence|assumption]).
     specialize(IH O p Htail HinW);destruct IH as[Hforward Hback].
     cbn[hc_cells];split.
     * sep_apply Hforward;entailer!.
     * sep_apply Hback;entailer!.
Qed.
Lemma hc_cells_writeback:forall A(cell:Z->option A->Assertion)W O p v,
 NoDup W->In p W->
 cell p(Some v)**hc_cells cell(remove Z.eq_dec p W)O |--
 hc_cells cell W(hc_put O p v).
Proof.
 intros A cell W O p v Hnd Hin.
 pose proof(proj2(hc_cells_pop A cell W(hc_put O p v)p Hnd Hin))as Hback.
 rewrite hc_put_same in Hback.
 rewrite hc_cells_put_away in Hback.
 - exact Hback.
 - intro Hbad;apply in_remove in Hbad;tauto.
Qed.
Lemma hc_output_writeback:forall W O p v,NoDup W->In p W->
 p # Float |-> v**hc_output(remove Z.eq_dec p W)O |--
 hc_output W(hc_output_put O p v).
Proof. intros;exact(hc_cells_writeback fp32 hc_output_cell W O p v H H0). Qed.
Lemma hc_output_forget_cell:forall p v,hc_output_cell p v |--p # Float |->_ .
Proof. intros p[v|];cbn[hc_output_cell];[apply store_float_undef_store_float|entailer!]. Qed.
Lemma hc_loaded_initialized:forall O p x v,O p=Some x->hc_output_loaded O p v->v=x.
Proof. unfold hc_output_loaded;intros;rewrite H in H0;exact H0. Qed.
Print Assumptions hc_put_same.
Print Assumptions hc_put_other.
Print Assumptions hc_cells_put_away.
Print Assumptions hc_cells_pop.
Print Assumptions hc_cells_writeback.
Print Assumptions hc_output_writeback.
Print Assumptions hc_output_forget_cell.
Print Assumptions hc_loaded_initialized.
