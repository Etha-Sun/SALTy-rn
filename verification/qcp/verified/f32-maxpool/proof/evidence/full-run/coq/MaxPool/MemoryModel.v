From Coq Require Import ZArith Bool List Lia.
From MaxPool Require Export Model.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
(* One resource per distinct address; read-only row windows may overlap or
   repeat. Tables also have one owner even if pixels reuse table addresses. *)
Definition MPFloatMap:Type:=list(Z*fp32).
Definition MPPtrMap:Type:=list(Z*Z).
Definition mp_zero:fp32:=@Binary.B754_zero 24 128 false.
Fixpoint mp_get(F:MPFloatMap)(p:Z):fp32:=
 match F with []=>mp_zero|(q,v)::rest=>if Z.eqb p q then v else mp_get rest p end.
Fixpoint mp_data(F:MPFloatMap):Assertion:=
 match F with []=>emp|(p,v)::rest=>(p # Float |-> v)**mp_data rest end.
Definition mp_present(F:MPFloatMap)(p:Z):Prop:=In(p,mp_get F p)F.
Definition mp_window(F:MPFloatMap)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->mp_present F(p+4*j).
Fixpoint mp_ptr_get(P:MPPtrMap)(p:Z):Z:=
 match P with []=>0|(q,v)::rest=>if Z.eqb p q then v else mp_ptr_get rest p end.
Fixpoint mp_ptr_data(P:MPPtrMap):Assertion:=
 match P with []=>emp|(p,v)::rest=>(p # Ptr |-> v)**mp_ptr_data rest end.
Definition mp_ptr_present(P:MPPtrMap)(p:Z):Prop:=In(p,mp_ptr_get P p)P.
Definition mp_ptr_window(P:MPPtrMap)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->mp_ptr_present P(p+8*j).
(* Writable addresses are owned once; different output pixels may overlap.
   None denotes valid possibly-uninitialized storage, not an invented value.
   No Coq lemma converts None/undef into a fixed initialized float. *)
Definition MPOutput:Type:=Z->option fp32.
Definition mp_out_cell(O:MPOutput)(p:Z):Assertion:=
 match O p with Some v=>p # Float |-> v|None=>p # Float |->_ end.
Fixpoint mp_out(W:list Z)(O:MPOutput):Assertion:=
 match W with []=>emp|p::rest=>mp_out_cell O p**mp_out rest O end.
Definition mp_write_window(W:list Z)(p n:Z):Prop:=
 0<p /\ 0<=n /\ forall j,0<=j<n->In(p+4*j)W.
Definition mp_loaded(O:MPOutput)(p:Z)(r:fp32):Prop:=
 match O p with Some v=>r=v|None=>True end.
Definition mp_put(O:MPOutput)(p:Z)(v:fp32):MPOutput:=
 fun q=>if Z.eqb q p then Some v else O q.
Fixpoint mp_write_n(O:MPOutput)(p:Z)(count:nat)(value:Z->fp32):MPOutput:=
 match count with O=>O|S n=>mp_put(mp_write_n O p n value)(p+4*Z.of_nat n)(value(Z.of_nat n))end.
Definition mp_write(O:MPOutput)(p count:Z)(value:Z->fp32):MPOutput:=
 mp_write_n O p(Z.to_nat count)value.
Fixpoint mp_ptr_pop(P:MPPtrMap)(p:Z):MPPtrMap:=
 match P with []=>[]|(q,v)::rest=>if Z.eqb p q then rest else(q,v)::mp_ptr_pop rest p end.
