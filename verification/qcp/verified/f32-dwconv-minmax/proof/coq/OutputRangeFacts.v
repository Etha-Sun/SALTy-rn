From Coq Require Import ZArith List Lia.
From Dwconv Require Export OutputMemory.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Definition dw_owned_addresses_canonical(W:list Z):Prop:=
 forall p,In p W->0<=p<18446744073709551616.

Lemma dw_output_cell_valid : forall p value,
 dw_output_cell p value |-- “ isvalidptr_float p ”.
Proof.
 intros p [v|];cbn[dw_output_cell].
 - apply valid_store_float.
 - unfold undef_store_float;entailer!.
Qed.

Lemma dw_owned_output_address_valid : forall W O p,
 NoDup W -> In p W -> dw_output W O |-- “ isvalidptr_float p ”.
Proof.
 intros W O p Hnd Hp.
 sep_apply(proj1(dw_cells_pop fp32 dw_output_cell W O p Hnd Hp)).
 prop_apply(dw_output_cell_valid p(O p));entailer!.
Qed.

Lemma dw_output_addresses_canonical : forall W O,
 NoDup W -> dw_output W O |-- “ dw_owned_addresses_canonical W ”.
Proof.
 intros W O Hnd;unfold derivable1,coq_prop;intros m Hm p Hp.
 pose proof(dw_owned_output_address_valid W O p Hnd Hp)as Hvalid.
 unfold derivable1,coq_prop in Hvalid;specialize(Hvalid m Hm).
 unfold isvalidptr_float in Hvalid.
 change addr_max_unsigned with 18446744073709551615 in Hvalid;lia.
Qed.
Print Assumptions dw_output_cell_valid.
Print Assumptions dw_owned_output_address_valid.
Print Assumptions dw_output_addresses_canonical.
