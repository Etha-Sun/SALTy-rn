From HwcConv Require Export ClampModel.
Local Open Scope Z_scope.
(* The abstract UInt fields represent logical mask bits on active lanes.
   Inactive mask fields remain arbitrary typed UInt, as the ISA permits. *)
Definition hc_legal_mask(m:Recordvbool32_t)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget m i=0 \/ hc_mget m i=1.
Lemma hc_selfmask_legal:forall m a vl,hc_selfmask m a vl->hc_legal_mask m vl.
Proof. intros m a vl H i Hi;rewrite H by exact Hi;destruct(dw_nan(hc_vget a i));auto. Qed.
Print Assumptions hc_selfmask_legal.
