From Coq Require Import ZArith List Lia.
From X32Transpose Require Export OutputMemory.
Import ListNotations.
Local Open Scope Z_scope.

Record XTLayout:Type:={
 xt_input:Z;xt_output_base:Z;xt_input_stride:Z;xt_output_stride:Z;
 xt_width:Z;xt_height:Z
}.
Definition xt_cols(G:XTLayout):Z:=Z.max 1(xt_width G).
Definition xt_input_address(G:XTLayout)(r c:Z):Z:=
 xt_input G+r*xt_input_stride G+4*c.
Definition xt_output_address(G:XTLayout)(r c:Z):Z:=
 xt_output_base G+c*xt_output_stride G+4*r.
Definition xt_entry(G:XTLayout):Prop:=
 0<=xt_width G<18446744073709551616 /\
 0<=xt_height G<18446744073709551616 /\
 0<=xt_input_stride G<18446744073709551616 /\
 0<=xt_output_stride G<18446744073709551616 /\
 (xt_width G=1 \/ xt_mod64(4*xt_height G)<=xt_output_stride G) /\
 (xt_height G=1 \/ xt_mod64(4*xt_width G)<=xt_input_stride G).
Definition xt_input_map_valid(F:XTMap):Prop:=
 NoDup(map fst F) /\ Forall(fun pv=>xt_u32(snd pv))F.
(* One owner per distinct input address permits RO row/padding overlap.
   Output owners may include padding; None does not grant initialized reads. *)
Definition xt_storage(F:XTMap)(W:list Z)(G:XTLayout):Prop:=
 0<xt_input G /\ 0<xt_output_base G /\
 xt_input G mod 4=0 /\ xt_output_base G mod 4=0 /\
 (1<xt_height G->xt_input_stride G mod 4=0) /\
 (1<xt_cols G->xt_output_stride G mod 4=0) /\
 xt_input G+(xt_height G-1)*xt_input_stride G+4*(xt_cols G+1)<18446744073709551616 /\
 xt_output_base G+(xt_cols G-1)*xt_output_stride G+4*xt_height G<18446744073709551616 /\
 (xt_cols G<=1 \/ 4*xt_height G<=xt_output_stride G) /\
 NoDup W /\
 (forall r c,0<=r<xt_height G->0<=c<xt_cols G+1->
   xt_present F(xt_input_address G r c)) /\
 (forall r c,0<=r<xt_height G->0<=c<xt_cols G->
   In(xt_output_address G r c)W).
Definition xt_valid(F:XTMap)(W:list Z)(G:XTLayout):Prop:=
 xt_entry G /\ xt_input_map_valid F /\
 (0<xt_height G->xt_storage F W G).
Definition xt_written(G:XTLayout)(q:Z):Prop:=
 exists r c,0<=r<xt_height G /\ 0<=c<xt_cols G /\
 q=xt_output_address G r c.
Definition xt_result(F:XTMap)(G:XTLayout)(old current:XTOutput):Prop:=
 (forall r c,0<=r<xt_height G->0<=c<xt_cols G->
   current(xt_output_address G r c)=Some(xt_get F(xt_input_address G r c))) /\
 (forall q,~xt_written G q->current q=old q).

Lemma xt_cols_positive:forall G,1<=xt_cols G.
Proof. intros;unfold xt_cols;apply Z.le_max_l. Qed.
Lemma xt_output_address_injective:forall G r c s d,
 0<xt_height G->0<=r<xt_height G->0<=s<xt_height G->
 0<=c<xt_cols G->0<=d<xt_cols G->
 (xt_cols G<=1 \/ 4*xt_height G<=xt_output_stride G)->
 xt_output_address G r c=xt_output_address G s d->r=s /\ c=d.
Proof.
 intros G r c s d Hh Hr Hs Hc Hd Hstride Heq.
 unfold xt_output_address in Heq.
 destruct Hstride as[Hsingle|Hstride];[assert(c=0 /\ d=0)by lia;destruct H;subst;nia|].
 destruct(Z.lt_trichotomy c d)as[Hlt|[He|Hgt]].
 - assert(xt_output_stride G<=(d-c)*xt_output_stride G)by nia;nia.
 - subst d;nia.
 - assert(xt_output_stride G<=(c-d)*xt_output_stride G)by nia;nia.
Qed.
Lemma xt_zero_height_no_writes:forall G,xt_height G=0->forall q,~xt_written G q.
Proof. intros G H q[r[c[Hr _]]];rewrite H in Hr;lia. Qed.
Lemma xt_result_zero_height_frame:forall F G old current,
 xt_height G=0->xt_result F G old current->forall q,current q=old q.
Proof. intros F G old current H[_ Hframe]q;apply Hframe;apply xt_zero_height_no_writes;assumption. Qed.
Print Assumptions xt_cols_positive.
Print Assumptions xt_output_address_injective.
Print Assumptions xt_zero_height_no_writes.
Print Assumptions xt_result_zero_height_frame.
