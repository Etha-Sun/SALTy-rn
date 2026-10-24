From Coq Require Import ZArith Lia List.
Require Import SetsClass.SetsClass.
From SimpleC.SL Require Import Mem ConAssertion SeparationLogic.
From Qs8Rdsum Require Export Model.
Import Snaive_C_Rules64.
Import SetsNotation.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope sac.

(* A single precise readonly byte footprint: overlapping reads occur once.
   Byte.eqm identifies exactly the same physical eight bits. *)
Definition RDMap : Type := Z -> option Z.
Definition rd_get (M:RDMap)(p:Z):Z := match M p with Some v=>v |None=>0 end.
Definition rd_present (M:RDMap)(p:Z):Prop := exists v,M p=Some v.
Definition rd_remove (M:RDMap)(p:Z):RDMap :=
 fun q=>if Z.eqb q p then None else M q.
Definition rd_cells (M:RDMap)(h:Mem.mem):Prop := forall p,
 match M p with
 |None=>h p=Mem.Noperm
 |Some v=>isvalidptr_char p /\ -128<=v<=127 /\
          exists b,Byte.eqm v b /\ h p=Mem.value b
 end.
Definition rd_mem (M:RDMap):expr := fun h=>
 h.(s_STS)==Sets.full /\ h.(s_token)==∅ /\ rd_cells M h.(s_mem).
Definition rd_window(M:RDMap)(p n:Z):Prop :=
 forall i:Z,0<=i<n -> rd_present M(p+i).
Definition rd_state_remove(h:model)(p:Z):model :=
 {|s_mem:=Mem.mem_remove h.(s_mem) p;s_STS:=h.(s_STS);s_token:=h.(s_token)|}.
Definition rd_cell_state(p b:Z):model :=
 {|s_mem:=Mem.single_byte_mem p b;s_STS:=Sets.full;s_token:=∅|}.

Lemma rd_remove_same : forall M p,rd_remove M p p=None.
Proof. intros;unfold rd_remove;rewrite Z.eqb_refl;reflexivity. Qed.
Lemma rd_remove_other : forall M p q,p<>q -> rd_remove M p q=M q.
Proof. intros;unfold rd_remove;destruct(Z.eqb q p)eqn:E;[apply Z.eqb_eq in E;lia|reflexivity]. Qed.
Lemma rd_cells_remove : forall M h p,rd_cells M h ->
 rd_cells(rd_remove M p)(Mem.mem_remove h p).
Proof.
 unfold rd_cells,rd_remove,Mem.mem_remove,Mem.addr_eqb.
 intros M h p H q;destruct(Z.eqb q p);[reflexivity|exact(H q)].
Qed.
Lemma rd_join_remove : forall h p b,h p=Mem.value b ->
 Mem.mem_join(Mem.single_byte_mem p b)(Mem.mem_remove h p)h.
Proof.
 intros h p b Hp q;unfold Mem.single_byte_mem,Mem.mem_remove,Mem.addr_eqb.
 destruct(Z.eqb q p)eqn:E.
 - apply Z.eqb_eq in E;subst;right;right;right;right;exists b;auto.
 - destruct(h q)eqn:Hq.
   + left;auto.
   + right;left;auto.
   + right;right;right;left;exists b0;auto.
Qed.
Lemma rd_mem_range : forall M,
 rd_mem M |-- “forall p:Z,rd_present M p -> -128<=rd_get M p<=127”.
Proof.
 unfold derivable1,coq_prop,rd_mem;intros M h[? [? H]]p[v Hp].
 specialize(H p);rewrite Hp in H;unfold rd_get;rewrite Hp;tauto.
Qed.
Lemma rd_mem_extract : forall M p,rd_present M p ->
 rd_mem M |-- p # Char |-> rd_get M p ** rd_mem(rd_remove M p).
Proof.
 intros M p [v Hp] h[Hsts[Htok H]].
 pose proof(H p)as Hv;rewrite Hp in Hv;destruct Hv as[Hvalid[Hrange[b[Heq Hb]]]].
 exists(rd_cell_state p b),(rd_state_remove h p).
 split.
 - unfold join,ConAssertion.state_join,ConAssertion.TokenSet_join,ConAssertion.STS_state_join,rd_cell_state,rd_state_remove;cbn.
   split;[apply rd_join_remove;assumption|]. sets_unfold;tauto.
 - split.
   + unfold store_char,andp,coq_prop,store_byte,mstore,rd_cell_state;cbn.
     split.
     * unfold rd_get;rewrite Hp;split;[assumption|]. change(v<=127 /\ v>= -128);lia.
     * exists b;split;[unfold rd_get;rewrite Hp;assumption|]. repeat split;try reflexivity;sets_unfold;tauto.
   + unfold rd_mem,rd_state_remove;cbn;split;[assumption|]. split;[assumption|]. apply rd_cells_remove;assumption.
Qed.
Lemma rd_mem_restore : forall M p,rd_present M p ->
 p # Char |-> rd_get M p ** rd_mem(rd_remove M p) |-- rd_mem M.
Proof.
 intros M p [v Hp] h[h1[h2[Hjoin[Hcell[Hsts2[Htok2 Hrest]]]]]].
 unfold store_char,andp,coq_prop,store_byte,mstore in Hcell.
 destruct Hcell as[Hrange[b[Hb[Hh1[Hsts1 Htok1]]]]].
 unfold rd_get in Hb,Hrange;rewrite Hp in Hb,Hrange.
 unfold join,ConAssertion.state_join,ConAssertion.TokenSet_join,ConAssertion.STS_state_join in Hjoin.
 destruct Hjoin as[Hmem[[Htok Hdisj]Hsts]].
 unfold rd_mem;split;[clear Hrange Hb Hh1 Hmem Hrest Hp;sets_unfold in Hsts;sets_unfold in Hsts1;sets_unfold in Hsts2;sets_unfold in Htok;sets_unfold in Htok1;sets_unfold in Htok2;sets_unfold;firstorder|]. split;[clear Hrange Hb Hh1 Hmem Hrest Hp;sets_unfold in Hsts;sets_unfold in Hsts1;sets_unfold in Hsts2;sets_unfold in Htok;sets_unfold in Htok1;sets_unfold in Htok2;sets_unfold;firstorder|].
 unfold rd_cells in *;intro q.
 specialize(Hmem q);rewrite Hh1 in Hmem;unfold Mem.single_byte_mem,Mem.addr_eqb in Hmem.
 destruct(Z.eqb q p)eqn:E.
 - apply Z.eqb_eq in E;subst q;rewrite Hp.
   specialize(Hrest p);rewrite rd_remove_same in Hrest.
   destruct Hrange as[Hvalid[Hhi Hlo]].
   split;[assumption|]. split;[change(v<=127)in Hhi;change(v>= -128)in Hlo;lia|].
   exists b;split;[assumption|].
   destruct Hmem as[[?[]]|[[?[]]|[[?[]]|[[a[?[]]]|[a[Ha[? Hout]]]]]]];try discriminate;congruence.
 - assert(Hneq:p<>q)by(apply Z.eqb_neq in E;lia).
   specialize(Hrest q);rewrite rd_remove_other in Hrest by assumption.
   assert(Hsame:(s_mem h)q=(s_mem h2)q).
   { destruct Hmem as [Hcase|[Hcase|[Hcase|[Hcase|Hcase]]]];
     [destruct Hcase as [? [? ?]]|destruct Hcase as [? [? ?]]|destruct Hcase as [? [? ?]]|destruct Hcase as [a [? [? ?]]]|destruct Hcase as [a [? [? ?]]]];congruence. }
   rewrite Hsame;exact Hrest.
Qed.
Print Assumptions rd_mem_extract.
Print Assumptions rd_mem_restore.
Print Assumptions rd_mem_range.

Lemma rd_mem_witness : forall M,
 (forall p v,M p=Some v -> isvalidptr_char p /\ -128<=v<=127) ->
 exists h,rd_mem M h.
Proof.
 intros M H;exists {|s_mem:=fun p=>match M p with Some v=>Mem.value v|None=>Mem.Noperm end;s_STS:=Sets.full;s_token:=∅|}.
 unfold rd_mem;cbn;split;[reflexivity|]. split;[reflexivity|].
 unfold rd_cells;intro p;destruct(M p)as[v|]eqn:E;[|reflexivity].
 specialize(H p v E);destruct H as[Hv Hr];split;[assumption|]. split;[assumption|].
 exists v;split;[apply Byte.eqm_refl|reflexivity].
Qed.
Print Assumptions rd_mem_witness.
