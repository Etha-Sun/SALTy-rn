From Coq Require Import ZArith List Bool Lia.
From Dwconv Require Export Types MemoryInterface.
Import ListNotations. Local Open Scope Z_scope.
Definition dw_active(vl i:Z)(actual expected:fp32):Prop:=i<vl->actual=expected.
Definition dw_active_mask(vl i actual expected:Z):Prop:=i<vl->actual=expected.
Definition dw_vl_allowed(avl vl:Z):Prop:=
 (0<=avl<=16 /\ vl=avl) \/ (16<avl<32 /\ (avl+1)/2<=vl<=16) \/ (32<=avl /\ vl=16).
Definition dw_list(xs:list fp32)(i:Z):fp32:=nth(Z.to_nat i)xs dw_zero.
Fixpoint dw_write_values(O:DwOutput)(p:Z)(xs:list fp32):DwOutput:=
 match xs with []=>O|v::rest=>dw_write_values(dw_output_put O p v)(p+4)rest end.
Definition dw_window_list(F:DwROMap)(p n:Z):list fp32:=map(fun i=>dw_load_lane F p(Z.of_nat i))(seq 0(Z.to_nat n)).
Definition dw_pack2(x0 x1:fp32):list fp32:= [x0;x1].
Definition dw_pack4(x0 x1 x2 x3:fp32):list fp32:= [x0;x1;x2;x3].
Definition dw_pack16(x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15:fp32):list fp32:= [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15].
Lemma dw_vl_small:forall avl vl,0<=avl<=4->dw_vl_allowed avl vl->vl=avl.
Proof. unfold dw_vl_allowed;intros;tauto || lia. Qed.
Print Assumptions dw_vl_small.
