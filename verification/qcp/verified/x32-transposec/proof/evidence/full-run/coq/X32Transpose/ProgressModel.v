From Coq Require Import ZArith List Lia.
From X32Transpose Require Export Geometry.
Local Open Scope Z_scope.
Definition xt_matrix(G:XTLayout)(r c:Z):Prop:=
 0<=r<xt_height G /\ 0<=c<xt_cols G.
Definition xt_done(F:XTMap)(G:XTLayout)(old current:XTOutput)
 (P:Z->Z->Prop):Prop:=
 (forall r c,xt_matrix G r c->P r c->
  current(xt_output_address G r c)=Some(xt_get F(xt_input_address G r c))) /\
 (forall q,(forall r c,xt_matrix G r c->P r c->q<>xt_output_address G r c)->current q=old q).
Definition xt_region(k b rows r c:Z):Prop:=c<k \/ (k<=c<k+b /\ r<rows).
Definition xt_progress(F:XTMap)(G:XTLayout)(old current:XTOutput)(k b rows:Z):Prop:=
 xt_done F G old current(xt_region k b rows).
Definition xt_injective(G:XTLayout):Prop:=forall r c s d,
 xt_matrix G r c->xt_matrix G s d->
 xt_output_address G r c=xt_output_address G s d->r=s /\ c=d.
