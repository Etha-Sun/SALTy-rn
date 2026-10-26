From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export OutputMemory IntrinsicSemantics.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition ap_owned_addresses(W:list Z):Prop:=NoDup W.
Definition ap_has_address(W:list Z)(p:Z):Prop:=In p W.
Definition ap_remove_addr(W:list Z)(p:Z):list Z:=remove Z.eq_dec p W.
Fixpoint ap_state_write_n{A:Type}(O:APState A)(p:Z)(count:nat)(value:Z->A):APState A:=
 match count with O=>O|S n=>ap_put(ap_state_write_n O p n value)(p+4*Z.of_nat n)(value(Z.of_nat n))end.
Definition ap_output_write(O:APOutput)(p count:Z)(value:Z->fp32):APOutput:=ap_state_write_n O p(Z.to_nat count)value.
Definition ap_index_write(O:APIndex)(p count:Z)(value:Z->Z):APIndex:=ap_state_write_n O p(Z.to_nat count)value.
Definition ap_read_active(j vl:Z)(F:APMap)(p:Z)(inactive:fp32):fp32:=
 if Z.ltb j vl then ap_load_lane F p j else inactive.
Definition ap_float_active(j vl:Z)(x inactive:fp32):fp32:=if Z.ltb j vl then x else inactive.
Definition ap_int_active(j vl x inactive:Z):Z:=if Z.ltb j vl then x else inactive.
Definition ap_output_active_loaded(j vl:Z)(O:APOutput)(p:Z)(v:fp32):Prop:=j<vl->ap_output_loaded_lane O p j v.
Definition ap_index_active_loaded(j vl:Z)(O:APIndex)(p v:Z):Prop:=j<vl->ap_index_loaded_lane O p j v.
Definition ap_rvv_mask_active(j vl m:Z):Prop:=vl<=j \/ m=0 \/ m=1.
Definition ap_fpack2 (x0 x1:fp32)(j:Z):fp32:=nth(Z.to_nat j)[x0;x1]ap_zero.
Definition ap_fpack4 (x0 x1 x2 x3:fp32)(j:Z):fp32:=nth(Z.to_nat j)[x0;x1;x2;x3]ap_zero.
Definition ap_fpack32 (x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:fp32)(j:Z):fp32:=nth(Z.to_nat j)[x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31]ap_zero.
Definition ap_ipack2 (x0 x1:Z)(j:Z):Z:=nth(Z.to_nat j)[x0;x1]0.
Definition ap_ipack4 (x0 x1 x2 x3:Z)(j:Z):Z:=nth(Z.to_nat j)[x0;x1;x2;x3]0.
Definition ap_ipack32 (x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31:Z)(j:Z):Z:=nth(Z.to_nat j)[x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31]0.
Lemma ap_read_active_in:forall j vl F p t,j<vl->ap_read_active j vl F p t=ap_load_lane F p j.
Proof. intros;unfold ap_read_active;destruct(Z.ltb_spec j vl);[reflexivity|lia]. Qed.
Lemma ap_float_active_in:forall j vl x t,j<vl->ap_float_active j vl x t=x.
Proof. intros;unfold ap_float_active;destruct(Z.ltb_spec j vl);[reflexivity|lia]. Qed.
Lemma ap_int_active_in:forall j vl x t,j<vl->ap_int_active j vl x t=x.
Proof. intros;unfold ap_int_active;destruct(Z.ltb_spec j vl);[reflexivity|lia]. Qed.
Lemma ap_state_write_zero:forall A(O:APState A)p value,ap_state_write_n O p 0 value=O.
Proof. reflexivity. Qed.
Lemma ap_output_read_initialized:forall j vl O p x v,0<=j<vl->O(p+4*j)=Some x->ap_output_active_loaded j vl O p v->v=x.
Proof. intros;unfold ap_output_active_loaded,ap_output_loaded_lane in H1;specialize(H1 ltac:(lia));apply(ap_loaded_initialized O(p+4*j)x v H0 H1). Qed.
Print Assumptions ap_read_active_in.
Print Assumptions ap_float_active_in.
Print Assumptions ap_int_active_in.
Print Assumptions ap_state_write_zero.
Print Assumptions ap_output_read_initialized.
