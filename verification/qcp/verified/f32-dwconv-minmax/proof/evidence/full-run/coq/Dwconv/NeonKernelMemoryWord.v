From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma dwm_unsigned64_word:forall x,unsigned_last_nbits x 64=dw_word x.
Proof. intro x;reflexivity. Qed.
Lemma dwm_word_add_r:forall x y,dw_word(x+dw_word y)=dw_word(x+y).
Proof. intros;unfold dw_word;apply Z.add_mod_idemp_r;lia. Qed.
Print Assumptions dwm_unsigned64_word.
Print Assumptions dwm_word_add_r.
Ltac dwm_setup_rows :=
 dwm_prepare;change Arch64.ptr_size_Z with 8 in *;rewrite ?Z.sub_diag,?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 rewrite ?dwm_unsigned64_word,?dw_word_add_l,?dwm_word_add_r;
 rewrite dw_table_step by lia;
 unfold dw_input_row,dw_raw_row;
 rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 change(1*8)with 8 in *;change(8*1)with 8 in *;
 change(2*8)with 16 in *;change(8*2)with 16 in *;
 repeat match goal with|-context[if Z.eqb ?x ?y then _ else _]=>
 destruct(Z.eqb_spec x y);try congruence end;
 dwm_frame.
